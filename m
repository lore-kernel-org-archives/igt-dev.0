Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB83A10E8E0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 13:25:35 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Oct 2022 09:25:23 -0400
Message-ID: <20221013132527.6104-2-vitaly.prosyak@amd.com>
In-Reply-To: <20221013132527.6104-1-vitaly.prosyak@amd.com>
References: <20221013132527.6104-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/6] lib/amdgpu: add amdgpu_bo_alloc_and_map_raw
 helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_memory.c | 58 +++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_memory.h |  6 +++++
 2 files changed, 64 insertions(+)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 344551fcc..93e72583b 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -193,6 +193,64 @@ error_va_alloc:
 	return r;
 }
 
+int
+amdgpu_bo_alloc_and_map_raw(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t alloc_flags,
+			uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			uint64_t *mc_address, amdgpu_va_handle *va_handle)
+{
+	struct amdgpu_bo_alloc_request request = {};
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle handle;
+	uint64_t vmc_addr;
+	int r;
+
+	request.alloc_size = size;
+	request.phys_alignment = alignment;
+	request.preferred_heap = heap;
+	request.flags = alloc_flags;
+
+	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(dev,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  &handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op_raw(dev, buf_handle, 0,  ALIGN(size, getpagesize()), vmc_addr,
+				   AMDGPU_VM_PAGE_READABLE |
+				   AMDGPU_VM_PAGE_WRITEABLE |
+				   AMDGPU_VM_PAGE_EXECUTABLE |
+				   mapping_flags,
+				   AMDGPU_VA_OP_MAP);
+	if (r)
+		goto error_va_map;
+
+	r = amdgpu_bo_cpu_map(buf_handle, cpu);
+	if (r)
+		goto error_cpu_map;
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+	*va_handle = handle;
+
+	return 0;
+
+ error_cpu_map:
+	amdgpu_bo_cpu_unmap(buf_handle);
+
+ error_va_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+
+ error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
 /**
  *
  * @param bo
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index 80bf979f4..c84365933 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -55,6 +55,12 @@ amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
 			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
 			amdgpu_va_handle *va_handle);
 
+int
+amdgpu_bo_alloc_and_map_raw(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t alloc_flags,
+			uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			uint64_t *mc_address, amdgpu_va_handle *va_handle);
+
 void
 amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
 			 uint64_t mc_addr, uint64_t size);
-- 
2.25.1
