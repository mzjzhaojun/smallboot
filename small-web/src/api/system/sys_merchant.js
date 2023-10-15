import request from '@/utils/request';

const BASE_API = '/web/api/system/merchant';

export default {
  page(query, headers) {
    return request({
      url: BASE_API + '/page',
      method: 'get',
      params: query,
      headers,
    });
  },
  list(query) {
    return request({
      url: BASE_API + '/list',
      method: 'get',
      params: query,
    });
  },
  add(data) {
    return request({
      url: BASE_API + '/add',
      method: 'post',
      data: data,
    });
  },
  update(data) {
    return request({
      url: BASE_API + '/update',
      method: 'put',
      data: data,
    });
  },
  delete(params) {
    return request({
      url: BASE_API + '/delete',
      method: 'delete',
      params: params,
    });
  },
  genLink() {
    return request({
      url: BASE_API + '/genLink',
      method: 'get',
    });
  },
  appOperationBatch(data) {
    return request({
      url: BASE_API + '/appOperationBatch',
      method: 'post',
      data: data,
    });
  },
};
