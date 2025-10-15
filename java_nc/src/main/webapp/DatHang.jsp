<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Giỏ hàng</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body class="container mt-3">
  <h2 class="text-center mb-4">🛒 Giỏ Hàng</h2>

  <div class="mb-3">
    <a href="TCController" class="btn btn-secondary">
      <i class="fas fa-arrow-left"></i> Quay lại trang chủ
    </a>
  </div>

  <c:set var="giohang" value="${sessionScope.GioHang}" />
  
  <c:choose>
    <c:when test="${giohang != null && !empty giohang.ds}">
      
      <!-- Desktop Table View -->
      <div class="d-none d-lg-block">
        <div class="row mb-3">
          <div class="col-12">
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-outline-primary" onclick="selectAll()">
                <i class="bi bi-check-square"></i> Chọn tất cả
              </button>
              <button type="button" class="btn btn-outline-danger" onclick="deleteSelected()">
                <i class="bi bi-trash"></i> Xóa đã chọn
              </button>
            </div>
          </div>
        </div>
        
        <div class="table-responsive">
          <table class="table table-hover table-striped">
    <thead class="table-dark">
      <tr>
                <th class="text-center" style="width: 5%;">
                  <input type="checkbox" id="selectAll" class="form-check-input" onchange="toggleAll()">
                </th>
                <th class="text-center" style="width: 10%;">Hình ảnh</th>
                <th>Tên sách</th>
                <th class="text-end" style="width: 12%;">Giá</th>
                <th class="text-center" style="width: 15%;">Số lượng</th>
                <th class="text-end" style="width: 12%;">Thành tiền</th>
                <th class="text-center" style="width: 10%;">Hành động</th>
      </tr>
    </thead>
    <tbody>
              <c:forEach var="item" items="${giohang.ds}">
                <tr>
                  <td class="text-center">
                    <input type="checkbox" class="item-checkbox form-check-input" value="${item.maSach}">
                  </td>
                  <td class="text-center">
                    <img src="${item.anh}" alt="${item.tenSach}" 
                         class="img-thumbnail" style="width: 50px; height: 50px; object-fit: cover;">
                  </td>
                  <td>
                    <strong class="text-dark">${item.tenSach}</strong>
                    <br><small class="text-muted">Mã: ${item.maSach}</small>
                  </td>
                  <td class="text-end">
                    <span class="badge bg-secondary">${item.gia} ₫</span>
                  </td>
                  <td class="text-center">
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-outline-secondary btn-sm" 
                              onclick="updateQuantity('${item.maSach}', -1)">-</button>
                      <span class="btn btn-outline-primary btn-sm disabled">${item.soLuong}</span>
                      <button type="button" class="btn btn-outline-secondary btn-sm" 
                              onclick="updateQuantity('${item.maSach}', 1)">+</button>
                    </div>
                  </td>
                  <td class="text-end">
                    <strong class="text-success">${item.thanhTien} ₫</strong>
                  </td>
                  <td class="text-center">
                    <a href="GioHangController?action=xoa&maSach=${item.maSach}" 
                       class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">
                      <i class="bi bi-trash"></i>
                    </a>
        </td>
      </tr>
              </c:forEach>
    </tbody>
  </table>
        </div>
      </div>

      <!-- Tablet View -->
      <div class="d-none d-md-block d-lg-none">
        <div class="row mb-3">
          <div class="col-12">
            <div class="btn-group w-100" role="group">
              <button type="button" class="btn btn-outline-primary" onclick="selectAll()">
                <i class="bi bi-check-square"></i> Chọn tất cả
              </button>
              <button type="button" class="btn btn-outline-danger" onclick="deleteSelected()">
                <i class="bi bi-trash"></i> Xóa đã chọn
              </button>
            </div>
          </div>
        </div>
        
        <c:forEach var="item" items="${giohang.ds}">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-auto">
                  <input type="checkbox" class="item-checkbox form-check-input" value="${item.maSach}">
                </div>
                <div class="col-auto">
                  <img src="${item.anh}" alt="${item.tenSach}" 
                       class="img-thumbnail" style="width: 80px; height: 80px; object-fit: cover;">
                </div>
                <div class="col">
                  <h6 class="card-title mb-1">${item.tenSach}</h6>
                  <p class="card-text">
                    <small class="text-muted">Mã: ${item.maSach}</small>
                  </p>
                  <div class="row">
                    <div class="col-6">
                      <span class="badge bg-secondary">${item.gia} ₫</span>
                    </div>
                    <div class="col-6 text-end">
                      <strong class="text-success">${item.thanhTien} ₫</strong>
                    </div>
                  </div>
                </div>
                <div class="col-auto">
                  <div class="btn-group-vertical" role="group">
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-outline-secondary btn-sm" 
                              onclick="updateQuantity('${item.maSach}', -1)">-</button>
                      <span class="btn btn-outline-primary btn-sm disabled">${item.soLuong}</span>
                      <button type="button" class="btn btn-outline-secondary btn-sm" 
                              onclick="updateQuantity('${item.maSach}', 1)">+</button>
                    </div>
                    <a href="GioHangController?action=xoa&maSach=${item.maSach}" 
                       class="btn btn-danger btn-sm mt-2" onclick="return confirm('Bạn có chắc muốn xóa?')">
                      <i class="bi bi-trash"></i> Xóa
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <!-- Mobile Card View -->
      <div class="d-md-none">
        <c:forEach var="item" items="${giohang.ds}">
          <div class="card mb-3">
            <div class="card-body">
              <div class="d-flex align-items-start">
                <input type="checkbox" class="item-checkbox form-check-input me-3 mt-1" value="${item.maSach}">
                <img src="${item.anh}" alt="${item.tenSach}" 
                     class="img-thumbnail me-3" style="width: 70px; height: 70px; object-fit: cover;">
                <div class="flex-grow-1">
                  <h6 class="card-title mb-1">${item.tenSach}</h6>
                  <p class="card-text">
                    <small class="text-muted">Mã: ${item.maSach}</small>
                  </p>
                  <div class="row mb-2">
                    <div class="col-6">
                      <span class="badge bg-secondary">${item.gia} ₫</span>
                    </div>
                    <div class="col-6 text-end">
                      <strong class="text-success">${item.thanhTien} ₫</strong>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-8">
                      <div class="btn-group w-100" role="group">
                        <button type="button" class="btn btn-outline-secondary btn-sm" 
                                onclick="updateQuantity('${item.maSach}', -1)">-</button>
                        <span class="btn btn-outline-primary btn-sm disabled">${item.soLuong}</span>
                        <button type="button" class="btn btn-outline-secondary btn-sm" 
                                onclick="updateQuantity('${item.maSach}', 1)">+</button>
                      </div>
                    </div>
                    <div class="col-4">
                      <a href="GioHangController?action=xoa&maSach=${item.maSach}" 
                         class="btn btn-danger btn-sm w-100" onclick="return confirm('Bạn có chắc muốn xóa?')">
                        <i class="bi bi-trash"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
  </div>

      <!-- Summary -->
      <div class="card mt-4 border-primary">
        <div class="card-header bg-primary text-white">
          <h5 class="mb-0"><i class="bi bi-calculator"></i> Tổng kết giỏ hàng</h5>
        </div>
        <div class="card-body">
          <div class="row align-items-center">
            <div class="col-md-6">
              <h4 class="text-primary mb-0">
                <i class="bi bi-currency-dollar"></i> Tổng tiền: <strong>${giohang.tong} ₫</strong>
              </h4>
              <small class="text-muted">Đã bao gồm thuế VAT</small>
            </div>
            <div class="col-md-6">
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="btn-group d-none d-lg-flex" role="group">
                  <button type="button" class="btn btn-outline-primary" onclick="selectAll()">
                    <i class="bi bi-check-square"></i> Chọn tất cả
                  </button>
                  <button type="button" class="btn btn-outline-danger" onclick="deleteSelected()">
                    <i class="bi bi-trash"></i> Xóa đã chọn
                  </button>
                </div>
                <a href="GioHangController?action=xoahet" class="btn btn-outline-danger"
                   onclick="return confirm('Bạn có chắc muốn xóa tất cả?')">
                  <i class="bi bi-trash-fill"></i> Xóa tất cả
                </a>
              </div>
            </div>
          </div>
          <hr>
          <div class="text-center">
            <button class="btn btn-success btn-lg px-5">
              <i class="bi bi-credit-card-2-front"></i> Thanh toán ngay
            </button>
            <div class="mt-2">
              <small class="text-muted">Miễn phí vận chuyển cho đơn hàng trên 500,000 ₫</small>
            </div>
          </div>
        </div>
  </div>

    </c:when>
    <c:otherwise>
      <div class="text-center py-5">
        <div class="card border-0">
          <div class="card-body">
            <div class="mb-4">
              <i class="bi bi-cart-x display-1 text-muted"></i>
            </div>
            <h4 class="text-muted mb-3">Giỏ hàng trống</h4>
            <p class="text-muted mb-4">Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm!</p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
              <a href="TCController" class="btn btn-primary btn-lg">
                <i class="bi bi-bag"></i> Tiếp tục mua sắm
              </a>
              <a href="TCController" class="btn btn-outline-primary btn-lg">
                <i class="bi bi-house"></i> Về trang chủ
              </a>
            </div>
          </div>
        </div>
      </div>
    </c:otherwise>
  </c:choose>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <script>
    function toggleAll() {
      const selectAllCheckbox = document.getElementById('selectAll');
      const checkboxes = document.querySelectorAll('.item-checkbox');
      checkboxes.forEach(checkbox => {
        checkbox.checked = selectAllCheckbox.checked;
      });
    }

    function selectAll() {
      const checkboxes = document.querySelectorAll('.item-checkbox');
      checkboxes.forEach(checkbox => {
        checkbox.checked = true;
      });
      const selectAllCheckbox = document.getElementById('selectAll');
      if (selectAllCheckbox) selectAllCheckbox.checked = true;
    }

    function deleteSelected() {
      const selectedItems = document.querySelectorAll('.item-checkbox:checked');
      if (selectedItems.length === 0) {
        alert('Vui lòng chọn sản phẩm cần xóa!');
        return;
      }
      
      // Debug: log các items được chọn
      const selectedValues = [];
      selectedItems.forEach(checkbox => {
        selectedValues.push(checkbox.value);
      });
      console.log('Items được chọn để xóa:', selectedValues);
      
      if (confirm(`Bạn có chắc muốn xóa ${selectedItems.length} sản phẩm đã chọn?\n\nSản phẩm: ${selectedValues.join(', ')}`)) {
        // Tạo form để gửi multiple values
        const form = document.createElement('form');
        form.method = 'GET';
        form.action = 'GioHangController';
        
        // Thêm action parameter
        const actionInput = document.createElement('input');
        actionInput.type = 'hidden';
        actionInput.name = 'action';
        actionInput.value = 'xoaSelected';
        form.appendChild(actionInput);
        
        // Thêm các selected items
        selectedItems.forEach(checkbox => {
          const input = document.createElement('input');
          input.type = 'hidden';
          input.name = 'selectedItems';
          input.value = checkbox.value;
          form.appendChild(input);
        });
        
        console.log('Form sẽ gửi:', form);
        
        // Gửi form
        document.body.appendChild(form);
        form.submit();
      }
    }

    function updateQuantity(maSach, change) {
      // Có thể implement AJAX call ở đây để update quantity mà không reload page
      // Hiện tại reload page để đơn giản
      window.location.href = `GioHangController?action=update&maSach=${maSach}&change=${change}`;
    }
  </script>
</body>
</html>