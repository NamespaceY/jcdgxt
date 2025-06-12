import request from '@/utils/request'

// 查询书目列表
export function listSm(query) {
  return request({
    url: '/system/sm/list',
    method: 'get',
    params: query
  })
}

// 查询书目详细
export function getSm(id) {
  return request({
    url: '/system/sm/' + id,
    method: 'get'
  })
}

// 新增书目
export function addSm(data) {
  return request({
    url: '/system/sm',
    method: 'post',
    data: data
  })
}

// 修改书目
export function updateSm(data) {
  return request({
    url: '/system/sm',
    method: 'put',
    data: data
  })
}

// 删除书目
export function delSm(id) {
  return request({
    url: '/system/sm/' + id,
    method: 'delete'
  })
}
