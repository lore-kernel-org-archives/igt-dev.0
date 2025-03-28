Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF75C36018
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8190510E9AA;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC1D10E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8ORYK1469947; Fri, 28 Mar 2025 13:54:27 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OR4t1469946;
 Fri, 28 Mar 2025 13:54:27 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 05/19] lib/amdgpu: add func amdgpu_bo_alloc_and_map_sync
Date: Fri, 28 Mar 2025 13:54:02 +0530
Message-Id: <20250328082416.1469810-5-sunil.khatri@amd.com>
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

Add amdgpu_bo_alloc_and_map_sync func which
is synchronised version of amdgpu_bo_alloc_and_map.
It wait till the timeline is signaled and page tables
are updated for the bo.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_memory.c | 19 +++++++++++++++++++
 lib/amdgpu/amd_memory.h |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 92ddc9fe2..d1ff57085 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -25,6 +25,8 @@
 
 #include "amd_memory.h"
 #include "amd_PM4.h"
+#include "amd_user_queue.h"
+
 /**
  *
  * @param device_handle
@@ -193,6 +195,23 @@ error_va_alloc:
 	return r;
 }
 
+int
+amdgpu_bo_alloc_and_map_sync(amdgpu_device_handle dev, unsigned int size,
+			     unsigned int alignment, unsigned int heap, uint64_t flags,
+			     uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			     uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			     uint32_t timeline_syncobj_handle, uint64_t point, bool sync)
+{
+	if (sync)
+		return amdgpu_bo_alloc_and_map_uq(dev, size, alignment, heap, flags,
+						  mapping_flags, bo, cpu,
+						  mc_address, va_handle,
+						  timeline_syncobj_handle, point);
+	else
+		return amdgpu_bo_alloc_and_map(dev, size, alignment, heap, flags,
+					       bo, cpu, mc_address, va_handle);
+}
+
 int
 amdgpu_bo_alloc_and_map_raw(amdgpu_device_handle dev, unsigned size,
 			unsigned alignment, unsigned heap, uint64_t alloc_flags,
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index a06f88923..9b0e3f392 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -55,6 +55,14 @@ amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
 			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
 			amdgpu_va_handle *va_handle);
 
+int
+amdgpu_bo_alloc_and_map_sync(amdgpu_device_handle dev, unsigned int size,
+			     unsigned int alignment, unsigned int heap, uint64_t flags,
+			     uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			     uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			     uint32_t timeline_syncobj_handle, uint64_t point,
+			     bool sync);
+
 int
 amdgpu_bo_alloc_and_map_raw(amdgpu_device_handle dev, unsigned size,
 			unsigned alignment, unsigned heap, uint64_t alloc_flags,
-- 
2.43.0

