Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8E62A2E7
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 00:39:36 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 20 Jul 2022 20:39:17 -0400
Message-ID: <20220721003922.3679-2-vitaly.prosyak@amd.com>
In-Reply-To: <20220721003922.3679-1-vitaly.prosyak@amd.com>
References: <20220721003922.3679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/7] lib/amdgpu: add bo allocation helper function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, marek.olsak@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_memory.c | 33 +++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_memory.h |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index b0fa18c6b..344551fcc 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -69,6 +69,39 @@
 	return buf_handle;
 }
 
+ /**
+  *
+  * @param dev
+  * @param size
+  * @param alignment
+  * @param heap
+  * @param flags
+  * @param bo
+  * @return
+  */
+int
+amdgpu_bo_alloc_wrap(amdgpu_device_handle dev, unsigned size,
+		     unsigned alignment, unsigned heap, uint64_t flags,
+		     amdgpu_bo_handle *bo)
+{
+	amdgpu_bo_handle buf_handle;
+	int r;
+	struct amdgpu_bo_alloc_request req = {
+		.alloc_size = size,
+		.phys_alignment = alignment,
+		.preferred_heap = heap,
+		.flags = flags,
+	};
+
+	r = amdgpu_bo_alloc(dev, &req, &buf_handle);
+	if (r)
+		return r;
+
+	*bo = buf_handle;
+
+	return 0;
+}
+
  /**
   *
   * @param bo
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index d7f32926a..80bf979f4 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -38,6 +38,10 @@ gpu_mem_alloc(amdgpu_device_handle device_handle,
 				      uint64_t flags,
 				      uint64_t *vmc_addr,
 				      amdgpu_va_handle *va_handle);
+int
+amdgpu_bo_alloc_wrap(amdgpu_device_handle dev, unsigned size,
+		     unsigned alignment, unsigned heap, uint64_t flags,
+		     amdgpu_bo_handle *bo);
 
 void
 gpu_mem_free(amdgpu_bo_handle bo,
-- 
2.25.1
