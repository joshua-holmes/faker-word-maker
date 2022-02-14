import { Typography, Grid, Container } from "@mui/material";
import { Link } from "react-router-dom";

import Word from "./Word";

function Home() {
    return (
        <Container>
            <Grid container spacing={12}>
                <Grid item xs={12}>
                    <Typography variant="h1">Faker Word Maker</Typography>
                </Grid>
                <Grid item xs={12}>
                    <Typography variant="p">
                        Welcome to the Faker Word Maker App! This app uses
                        machine learning to generate words that look like real
                        words, but do <em>not</em> already exist in the
                        dictionary. How does it work?{" "}
                        <Link to="/how-it-works">Click here to find out!</Link>{" "}
                        If you want to see it in action, try it out below! ⬇️
                    </Typography>
                </Grid>
                <Grid item xs={12}>
                    <Typography variant="h2">See it in action!</Typography>
                    <Word />
                </Grid>
                <Grid item xs={12}></Grid>
            </Grid>
        </Container>
    );
}

export default Home;
