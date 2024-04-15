Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD29C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 08:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3DA11239C;
	Mon, 15 Apr 2024 08:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdCB2H9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191CF11239C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713170524; x=1744706524;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9m+vAxQpDn2AX1bmsI2ibmmF4hBVObEKhWtz+Qi9idQ=;
 b=XdCB2H9IHqfObSkkqxmeHsV3SCg8MSiAL16uGZCprq1b0h0whLUi+u3W
 YM7AwfoBa6LQZB0eW4dbiNABruOJTlXkPvK5E71HVbwwc4Pgky4xQ0dji
 cS2Kw7Ka2Krk6ux5f53W8RtQAiTXN6py80bs0GLkJuofooVg6xQZL1uB7
 xWP78+iixsP3vjoU8YqaPlZzKVlssEQ/2wUu9GZAW01N+JaLROm3SLXkX
 RyHdS/lUbSnyk07WnKBLsy7Wx/pOiaIOrVAHHQXvckKokXR9HqcFLXnRT
 bX/7iXmHByS6SB73UMBdysIsEC0LEdvKYZnY9avAwhLZhbE0Kld5eAfZ4 A==;
X-CSE-ConnectionGUID: iWNZ20x2Shuu/cIv12QMYA==
X-CSE-MsgGUID: SWZALBptSx+BcsAEVq9RCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12395215"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="12395215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:42:04 -0700
X-CSE-ConnectionGUID: kfuwvF/iRS6tr6eHLr7c+Q==
X-CSE-MsgGUID: 8lC/CV3KQhmsgzNy6wRTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21941402"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 01:42:02 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch flag
 with suspend and resume
Date: Mon, 15 Apr 2024 14:10:34 +0530
Message-Id: <20240415084035.2603-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
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

Test functionality of vm_bind prefetch with S&R.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index fafd7a52e..8857265a9 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -34,6 +34,7 @@
 #define MAGIC_2 0xdeadbeef
 
 #define USERPTR (0x1 << 0)
+#define PREFETCH (0x1 << 2)
 
 typedef struct {
 	int fd_xe;
@@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
  * arg[2]:
  *
  * @usrptr:	usrptr
+ * @prefetch:	prefetch
  */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
@@ -341,9 +343,15 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(device.fd_xe, vm, bo_size,
-				  vram_if_possible(device.fd_xe, eci->gt_id),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
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
 
@@ -362,6 +370,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
 
+	if (flags & PREFETCH)
+		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				     bo_size, sync, 1, 0);
+
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
 
@@ -617,6 +629,7 @@ igt_main
 		unsigned int flags;
 	} vm_op[] = {
 		{ "usrptr", USERPTR },
+		{ "prefetch", PREFETCH },
 		{ NULL },
 	};
 
-- 
2.39.1

