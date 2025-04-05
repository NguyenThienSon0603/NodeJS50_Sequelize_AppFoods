import { responseError } from "./response.helpers";

export const handleError = (err, req, res, next) => {
  const response = responseError(err.message, err.statusCode, err.stack);
  res.status(response.statusCode).json(response);
};
