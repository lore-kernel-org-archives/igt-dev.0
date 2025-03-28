Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82319C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3282210E9A7;
	Fri, 28 Mar 2025 08:24:35 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E310E9A5
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:33 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OTEq1469979; Fri, 28 Mar 2025 13:54:29 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OTnE1469978;
 Fri, 28 Mar 2025 13:54:29 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 09/19] tests/amdgpu: use memory API's from amd_memory.h
Date: Fri, 28 Mar 2025 13:54:06 +0530
Message-Id: <20250328082416.1469810-9-sunil.khatri@amd.com>
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

Use memory allocation API's from memory.h library
header instead of using a local definition.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c | 65 +--------------------------------------
 1 file changed, 1 insertion(+), 64 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 5f7acb497..720b276df 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -11,70 +11,7 @@
 #include <amdgpu_drm.h>
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
-
-
-static int
-amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned int size,
-			unsigned int alignment, unsigned int heap, uint64_t flags,
-			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
-			amdgpu_va_handle *va_handle)
-{
-	struct amdgpu_bo_alloc_request request = {
-		.alloc_size = size,
-		.phys_alignment = alignment,
-		.preferred_heap = heap,
-		.flags = flags,
-	};
-	amdgpu_bo_handle buf_handle;
-	amdgpu_va_handle handle;
-	uint64_t vmc_addr;
-	int r;
-
-	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
-	if (r)
-		return r;
-
-	r = amdgpu_va_range_alloc(dev,
-				  amdgpu_gpu_va_range_general,
-				  size, alignment, 0, &vmc_addr,
-				  &handle, 0);
-	if (r)
-		goto error_va_alloc;
-
-	r = amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_MAP);
-	if (r)
-		goto error_va_map;
-
-	r = amdgpu_bo_cpu_map(buf_handle, cpu);
-	if (r)
-		goto error_cpu_map;
-
-	*bo = buf_handle;
-	*mc_address = vmc_addr;
-	*va_handle = handle;
-
-	return 0;
-
-error_cpu_map:
-	amdgpu_bo_cpu_unmap(buf_handle);
-
-error_va_map:
-	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
-
-error_va_alloc:
-	amdgpu_bo_free(buf_handle);
-	return r;
-}
-
-static void
-amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
-			 uint64_t mc_addr, uint64_t size)
-{
-	amdgpu_bo_cpu_unmap(bo);
-	amdgpu_bo_va_op(bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
-	amdgpu_va_range_free(va_handle);
-	amdgpu_bo_free(bo);
-}
+#include "lib/amdgpu/amd_memory.h"
 
 static void amdgpu_cs_sync(amdgpu_context_handle context,
 			   unsigned int ip_type,
-- 
2.43.0

