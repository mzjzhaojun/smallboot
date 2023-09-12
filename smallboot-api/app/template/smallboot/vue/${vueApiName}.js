import request from '@/utils/request';

const BASE_API = "/api/${moduleName}/${entityNameLower}";

export default {
  page(query, headers) {
    return request({
      url: BASE_API + "/page",
      method: "get",
      params: query,
      headers
    });
  },
  add(data) {
    return request({
      url: BASE_API + "/add",
      method: "post",
      data: data
    });
  },
  update(data) {
    return request({
      url: BASE_API + "/update",
      method: "put",
      data: data
    });
  },
  delete(params) {
    return request({
      url: BASE_API + "/delete",
      method: "delete",
      params: params
    });
  }
};
