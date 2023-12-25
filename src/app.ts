import cors from 'cors';
import express, { Application, NextFunction, Request, Response } from 'express';


const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));





app.use((req: Request, res: Response, next: NextFunction) => {
    res.status(400).json({
        success: false,
        message: 'Not Found',
        errorMessages: [
            {
                path: req.originalUrl,
                message: 'API Not Found',
            },
        ],
    });
    next();
});

export default app;