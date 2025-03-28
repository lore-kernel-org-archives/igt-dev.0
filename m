Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25EEC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FDE10E9A1;
	Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783EB10E9AF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OZu11470068; Fri, 28 Mar 2025 13:54:35 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OZaf1470067;
 Fri, 28 Mar 2025 13:54:35 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 17/19] lib/amdgpu: make the local functions as static
Date: Fri, 28 Mar 2025 13:54:14 +0530
Message-Id: <20250328082416.1469810-17-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

functions like amdgpu_alloc_doorbell and
amdgpu_bo_unmap_and_free_uq are internal function
only hence making then static and removing from
amd_user_queue.h

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_user_queue.c | 15 +++++++++------
 lib/amdgpu/amd_user_queue.h |  8 --------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 0235b07ac..5812a1be3 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -8,8 +8,9 @@
 #include "amd_PM4.h"
 #include "ioctl_wrappers.h"
 
-void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
-			   unsigned int size, unsigned int domain)
+static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
+				  struct amdgpu_userq_bo *doorbell_bo,
+				  unsigned int size, unsigned int domain)
 {
 	struct amdgpu_bo_alloc_request req = {0};
 	amdgpu_bo_handle buf_handle;
@@ -88,10 +89,12 @@ error_va_alloc:
 	return r;
 }
 
-void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
-			    amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
-			    uint32_t timeline_syncobj_handle, uint64_t point,
-			    uint64_t syncobj_handles_array, uint32_t num_syncobj_handles)
+static void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle,
+					amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+					uint64_t mc_addr, uint64_t size,
+					uint32_t timeline_syncobj_handle,
+					uint64_t point, uint64_t syncobj_handles_array,
+					uint32_t num_syncobj_handles)
 {
 	amdgpu_bo_cpu_unmap(bo);
 	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_user_queue.h
index 539a78819..b29e97ccf 100644
--- a/lib/amdgpu/amd_user_queue.h
+++ b/lib/amdgpu/amd_user_queue.h
@@ -34,20 +34,12 @@
 #define amdgpu_pkt_end() \
 	*ring_context->wptr_cpu += __num_dw_written
 
-void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
-			   unsigned int size, unsigned int domain);
-
 int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
 			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
 			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
 			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
 			       uint32_t timeline_syncobj_handle, uint64_t point);
 
-void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
-				 amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
-				 uint32_t timeline_syncobj_handle, uint64_t point,
-				 uint64_t syncobj_handles_array, uint32_t num_syncobj_handles);
-
 int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 				 uint32_t timeline_syncobj_handle, uint64_t point);
 
-- 
2.43.0

