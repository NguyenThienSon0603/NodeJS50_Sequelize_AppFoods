export const responseSuccess = (
  data = null,
  message = "OK",
  statusCode = 200
) => {
  return {
    status: "Success",
    statusCode: statusCode,
    message: message,
    data: data,
    doc: "domain.com/doc-api",
  };
};

export const responseError = (
  message = "Internal Server Error",
  statusCode = 500,
  stack
) => {
  return {
    status: "Error",
    statusCode: statusCode,
    message: message,
    stack: stack,
  };
};
