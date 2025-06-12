import request from '@/utils/request'

// 查询教材列表
export function listJc(query) {
  return request({
    url: '/system/jc/list',
    method: 'get',
    params: query
  })
}

// 查询教材详细
export function getJc(id) {
  return request({
    url: '/system/jc/' + id,
    method: 'get'
  })
}

// 新增教材
export function addJc(data) {
  return request({
    url: '/system/jc',
    method: 'post',
    data: data
  })
}

// 修改教材
export function updateJc(data) {
  return request({
    url: '/system/jc',
    method: 'put',
    data: data
  })
}

// 删除教材
export function delJc(id) {
  return request({
    url: '/system/jc/' + id,
    method: 'delete'
  })
}

export function selectJc(id) {
  return request({
    url: '/system/jcSelect/',
    method: 'post',
    data: {"jcId":id}
  })
}

export function listSm(query) {
  return request({
    url: '/system/sm/listSm',
    method: 'get',
    params: query
  })
}

export function uploadFile(data) {
  return request({
    url: '/system/jc/uploadImg',
    method: 'post',
    data: data
  })
}
