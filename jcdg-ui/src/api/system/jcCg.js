import request from '@/utils/request'

// 查询教材选择列表
export function listJcSelect(query) {
  return request({
    url: '/system/jcSelect/listAudit',
    method: 'get',
    params: query
  })
}

// 查询教材选择详细
export function getJcSelect(id) {
  return request({
    url: '/system/jcSelect/' + id,
    method: 'get'
  })
}

// 新增教材选择
export function addJcSelect(data) {
  return request({
    url: '/system/jcSelect',
    method: 'post',
    data: data
  })
}

// 修改教材选择
export function updateJcSelect(data) {
  return request({
    url: '/system/jcSelect',
    method: 'put',
    data: data
  })
}

// 删除教材选择
export function delJcSelect(id) {
  return request({
    url: '/system/jcSelect/' + id,
    method: 'delete'
  })
}

export function cg(data) {
  return request({
    url: '/system/jcCg',
    method: 'post',
    data: data
  })
}
