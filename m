Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC6EC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B29610E9AB;
	Fri, 28 Mar 2025 08:24:39 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F3210E9AA
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:37 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OXAb1470041; Fri, 28 Mar 2025 13:54:33 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OXMT1470040;
 Fri, 28 Mar 2025 13:54:33 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 14/19] lib/amdgpu: use right API to get the correct size
Date: Fri, 28 Mar 2025 13:54:11 +0530
Message-Id: <20250328082416.1469810-14-sunil.khatri@amd.com>
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

Use amdgpu_query_uq_fw_area_info api to get the
sizes and alignment for shadow and csa.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h  |  2 +-
 lib/amdgpu/amd_user_queue.c | 21 ++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index e085f1618..231098eb8 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -175,7 +175,7 @@ struct amdgpu_ring_context {
 	uint64_t point;
 	bool user_queue;
 
-	struct drm_amdgpu_info_device dev_info;
+	struct drm_amdgpu_info_uq_fw_areas info;
 };
 
 
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 1bfc86949..d1763f5d6 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -189,13 +189,13 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu
 	case AMD_IP_GFX:
 		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
 					    ctxt->csa.va_handle,
-					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
+					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
 					    ctxt->timeline_syncobj_handle, ++ctxt->point,
 					    0, 0);
 
 		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
 					    ctxt->shadow.va_handle,
-					    ctxt->shadow.mc_addr, ctxt->dev_info.shadow_size,
+					    ctxt->shadow.mc_addr, ctxt->info.gfx.shadow_size,
 					    ctxt->timeline_syncobj_handle, ++ctxt->point,
 					    0, 0);
 
@@ -219,7 +219,7 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu
 	case AMD_IP_DMA:
 		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
 					    ctxt->csa.va_handle,
-					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
+					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
 					    ctxt->timeline_syncobj_handle, ++ctxt->point,
 					    0, 0);
 
@@ -268,8 +268,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 		return;
 	}
 
-	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
-			      sizeof(ctxt->dev_info), &ctxt->dev_info);
+	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
@@ -307,8 +306,8 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 
 	switch (type) {
 	case AMD_IP_GFX:
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.shadow_size,
-					       ctxt->dev_info.shadow_alignment,
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
+					       ctxt->info.gfx.shadow_alignment,
 					       AMDGPU_GEM_DOMAIN_GTT,
 					       gtt_flags,
 					       AMDGPU_VM_MTYPE_UC,
@@ -317,8 +316,8 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					       ctxt->timeline_syncobj_handle, ++ctxt->point);
 		igt_assert_eq(r, 0);
 
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
-					       ctxt->dev_info.csa_alignment,
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
+					       ctxt->info.gfx.csa_alignment,
 					       AMDGPU_GEM_DOMAIN_GTT,
 					       gtt_flags,
 					       AMDGPU_VM_MTYPE_UC,
@@ -347,8 +346,8 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 		break;
 
 	case AMD_IP_DMA:
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
-					       ctxt->dev_info.csa_alignment,
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
+					       ctxt->info.gfx.csa_alignment,
 					       AMDGPU_GEM_DOMAIN_GTT,
 					       gtt_flags,
 					       AMDGPU_VM_MTYPE_UC,
-- 
2.43.0

