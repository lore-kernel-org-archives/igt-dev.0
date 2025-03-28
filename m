Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90CC36013
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C67510E9A0;
	Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920810E9B3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OZZs1470073; Fri, 28 Mar 2025 13:54:35 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OZPR1470072;
 Fri, 28 Mar 2025 13:54:35 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 18/19] lib/amdgpu: enable UMQ function under macro
Date: Fri, 28 Mar 2025 13:54:15 +0530
Message-Id: <20250328082416.1469810-18-sunil.khatri@amd.com>
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

Till the firmware and libdrm code is upstreamed
we disable the Usermode queue code by default
under a macro.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_user_queue.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 5812a1be3..361f5acc6 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -8,6 +8,7 @@
 #include "amd_PM4.h"
 #include "ioctl_wrappers.h"
 
+#ifdef AMDGPU_USERQ_ENABLED
 static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
 				  struct amdgpu_userq_bo *doorbell_bo,
 				  unsigned int size, unsigned int domain)
@@ -429,3 +430,36 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 
 	}
 }
+#else
+int
+amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			   uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	return 0;
+}
+
+int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+	uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	return 0;
+}
+
+void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+	unsigned int ip_type, uint64_t mc_address)
+{
+}
+
+void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+	unsigned int type)
+{
+}
+
+void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+	unsigned int type)
+{
+}
+
+#endif
-- 
2.43.0

