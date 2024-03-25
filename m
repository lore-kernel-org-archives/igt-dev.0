Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD41CD11DB
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 20:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4910E851;
	Mon, 25 Mar 2024 20:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjforjFa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9EE10E851
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 20:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711397510; x=1742933510;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kRxkSgTpt47HEMUuxxg9B6m1jjvxeI1obham6JPGSYQ=;
 b=GjforjFavPGktR0FeKhrsV2IZGPOiO6IP/NJr2oG9Bq72mQfB2gEuUFl
 +5uua67E/Zv72H7mqVl/J6ppGLW5Ji2ebbozGFVZqA3XbrAxqmS8a8qMG
 iJPMXlafvcyK3s1YFsSBR/+8uiFJQT01ZlYMzAzeWe33f/lQAV8YarIt3
 u5M/ivlT/8cBfhvriIq4oYfsRWFUzE1T+SB0Ks/42M9dWRaN6TekBtEZ/
 wTmLgY8e+0UkGSTAFRAkezotigw/VIrdhUahJ/usi2G9e91Jw8SbRik4Y
 oIdCJDSYqcYKjy02ou61X9H1wcFKKVf1HPD4P3VAOs6sHlWnWdG2x3ozy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6289293"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6289293"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16400508"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 13:11:48 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch flag
 with suspend and resume
Date: Tue, 26 Mar 2024 01:40:44 +0530
Message-Id: <20240325201045.25805-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
References: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test functionality of vm_bind prefetch with S&R

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 8659e87cc..e016f2bca 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -34,6 +34,7 @@
 #define MAGIC_2 0xdeadbeef
 
 #define USERPTR         (0x1 << 0)
+#define PREFETCH        (0x1 << 5)
 
 typedef struct {
 	int fd_xe;
@@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
  * arg[2]:
  *
  * @usrptr:     usrptr
+ * @prefetch:  prefetch
  */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
@@ -340,9 +342,16 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 	} else {
-		bo = xe_bo_create(device.fd_xe, vm, bo_size,
-				  vram_if_possible(device.fd_xe, eci->gt_id),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+		if (flags & PREFETCH)
+			bo = xe_bo_create(device.fd_xe, 0, bo_size,
+					  all_memory_regions(device.fd_xe) |
+					  vram_if_possible(device.fd_xe, 0),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		else
+			bo = xe_bo_create(device.fd_xe, vm, bo_size,
+					  vram_if_possible(device.fd_xe, eci->gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(device.fd_xe, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -362,6 +371,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
 
+	if (flags & PREFETCH)
+		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				     bo_size, sync, 1, 0);
+
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
 
@@ -615,6 +628,7 @@ igt_main
 		unsigned int flags;
 	} vm_op[] = {
 		{ "usrptr", USERPTR },
+		{ "prefetch", PREFETCH },
 		{ NULL },
 	};
 
-- 
2.39.1

