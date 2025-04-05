import express from "express";
import rootRouter from "./src/routers/root.router";
import { handleError } from "./src/helpers/error.helper";

const app = express();

// Middleware của express để chuyển dữ liệu dạng json từ Postman về thì req.body mới có dữ liệu
app.use(express.json());

app.use(rootRouter);
app.use(handleError);

app.listen(3070, () => {
  console.log("Server is starting ...!");
});
