import LoadingButton from "@mui/lab/LoadingButton";
import Typography from "@mui/material/Typography";
import ShortTextIcon from "@mui/icons-material/ShortText";
import { Grid, Paper, Container, ToggleButton } from "@mui/material";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import ListSubheader from "@mui/material/ListSubheader";
import Select from "@mui/material/Select";
import StarIcon from "@mui/icons-material/Star";
import StarBorderIcon from "@mui/icons-material/StarBorder";

import { useState, useEffect } from "react";

const inputStyle = { backgroundColor: "white" };

function Word({
    lexicons,
    customizable,
    selectionsState,
    handleFaveAdd,
    faveWords = [],
}) {
    const [word, setWord] = useState({
        value: "loading...",
        loading: true,
    });
    const [selections, setSelections] = selectionsState || [
        {
            lexicon: { name: "example" },
            length: "auto",
        },
        null,
    ];
    const [reload, setReload] = useState(0);
    const reloadWord = () => setReload(() => reload + 1);
    const isFavorited = !!faveWords.find((w) => w.word === word.value);

    useEffect(() => {
        if (!word.loading) {
            setWord({
                ...word,
                loading: true,
            });
        }
        const controller = new AbortController();
        const signal = controller.signal;
        const len = selections.length;
        const lengthPath = len === "auto" ? "" : `/${len}`;
        fetch(
            `/random_word/${selections.lexicon.name}${lengthPath}`,
            {
                method: "GET",
                signal: signal,
            }
        )
            .then((r) => r.json())
            .then((data) =>
                setWord({
                    value: data[0],
                    loading: false,
                })
            )
            .catch((error) =>
                console.log("Fetching the word failed... ==>", error)
            );
        return function cleanup() {
            controller.abort();
        };
    }, [reload, selections.lexicon.name, selections.length]);

    const getNameOptions = (lexiconNames) => {
        let prevLetter = "";
        const returnedArr = [];
        lexiconNames.forEach((name) => {
            if (name[0] !== prevLetter) {
                returnedArr.push(
                    <ListSubheader key={name[0]}>{name[0]}</ListSubheader>
                );
                returnedArr.push(
                    <MenuItem key={name} value={name}>
                        {name}
                    </MenuItem>
                );
                prevLetter = name[0];
            } else {
                returnedArr.push(
                    <MenuItem key={name} value={name}>
                        {name}
                    </MenuItem>
                );
            }
        });
        return returnedArr;
    };
    const getLengthOptions = (min, max) => {
        const returnedArr = [
            <MenuItem key={"auto"} value={"auto"}>
                auto
            </MenuItem>,
        ];
        for (let i = min; i <= max; i++) {
            returnedArr.push(
                <MenuItem key={i} value={i}>
                    {i}
                </MenuItem>
            );
        }
        return returnedArr;
    };

    return (
        <Paper
            elevation={3}
            sx={{ minWidth: 275, backgroundColor: "secondary.main" }}
        >
            <Container>
                <Grid container spacing={2}>
                    {customizable && (
                        <>
                            <Grid item xs={12} sm={6}>
                                <InputLabel>Select Lexicon Name</InputLabel>
                                <Select
                                    fullWidth
                                    style={inputStyle}
                                    value={selections.lexicon.name}
                                    onChange={(e) => {
                                        setSelections({
                                            ...selections,
                                            lexicon: lexicons.find(
                                                (l) => l.name === e.target.value
                                            ),
                                        });
                                    }}
                                >
                                    {getNameOptions(
                                        lexicons.map((l) => l.name)
                                    )}
                                </Select>
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <InputLabel>Choose desired length</InputLabel>
                                <Select
                                    fullWidth
                                    style={inputStyle}
                                    value={selections.length}
                                    onChange={(e) =>
                                        setSelections({
                                            ...selections,
                                            length: e.target.value,
                                        })
                                    }
                                >
                                    {getLengthOptions(3, 20)}
                                </Select>
                            </Grid>
                        </>
                    )}
                    <Grid item xs={12}>
                        <Typography variant="h4" component="div">
                            {word.value}
                        </Typography>
                    </Grid>
                    {customizable && (
                        <Grid item xs={12}>
                            <ToggleButton
                                value="check"
                                selected={isFavorited}
                                onChange={() => handleFaveAdd(word.value)}
                                color="primary"
                                style={inputStyle}
                            >
                                {isFavorited ? (
                                    <StarIcon color="primary" />
                                ) : (
                                    <StarBorderIcon />
                                )}
                                Favorite
                            </ToggleButton>
                        </Grid>
                    )}
                    <Grid item xs={12}>
                        <LoadingButton
                            style={inputStyle}
                            loading={word.loading}
                            loadingPosition="start"
                            startIcon={<ShortTextIcon />}
                            variant="outlined"
                            size="large"
                            onClick={() => {
                                setWord(() => ({
                                    ...word,
                                    loading: true,
                                }));
                                reloadWord();
                            }}
                        >
                            Get New Word
                        </LoadingButton>
                    </Grid>
                    <Grid item xs={12}></Grid>
                </Grid>
            </Container>
        </Paper>
    );
}

export default Word;
