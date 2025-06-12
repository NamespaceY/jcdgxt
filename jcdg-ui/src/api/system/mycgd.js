import request from '@/utils/request'

// 查询采购单列表
export function listJcCg(query) {
  return request({
    url: '/system/jcCg/list',
    method: 'get',
    params: query
  })
}

// 查询采购单详细
export function getJcCg(id) {
  return request({
    url: '/system/jcCg/' + id,
    method: 'get'
  })
}

// 新增采购单
export function addJcCg(data) {
  return request({
    url: '/system/jcCg',
    method: 'post',
    data: data
  })
}

// 修改采购单
export function updateJcCg(data) {
  return request({
    url: '/system/jcCg',
    method: 'put',
    data: data
  })
}

// 删除采购单
export function delJcCg(id) {
  return request({
    url: '/system/jcCg/' + id,
    method: 'delete'
  })
}
