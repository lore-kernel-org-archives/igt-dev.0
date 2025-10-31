Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1EFCCFA08
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5B10E338;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/mzR6kC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0FA10E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YlCEpFu25k6mgcuEBvx0tJLErPGgKMryNd4W7Lqp9VI=;
 b=l/mzR6kC1gENPgNWVkDKy1P6RPDtm8Rnb8io4bQXK54WlQRf7xhNBUbq
 vAILCnHA2lbGR5+X7+u6qA1BT/GJSGq6BFUjVZ63azyR49I1DbM+Vufea
 E/yzVs85GyvLxoHwEd38JwRiubjRcabxEQmyUQ5DULQVRXNMPVIU7M8IK
 qXuWAlQWcS0/HWIymnbUxeM4VuVWYOOMbx424+qisjyIUVflYpy3hhJK5
 pMaqZLX0m/tDSZb5ALkPElIJc6np2SWI8O0jtm4NOsiK2VduyHLaepUKb
 t4LngbCSSIHTQsMoutxFIm23UZz2pqtfFTHu/a8Ltx1T4GR2niuJbORcA Q==;
X-CSE-ConnectionGUID: I/bNvQd4TUet16I7+cxNlQ==
X-CSE-MsgGUID: NrECT07pTJa94iBBpX/agA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144735"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144735"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: TDaaN5MnToyuHeB1e8VkMA==
X-CSE-MsgGUID: jplH7p21QyiWCSoSWsinOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650031"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 12/18] tests/intel/xe_exec_multi_queue: Add fault mode test
Date: Fri, 31 Oct 2025 11:35:49 -0700
Message-ID: <20251031183555.1882721-13-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Test multiq functionality with fault mode. Adding a flag check for
xe_vm_create for fault mode test cases.

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index f819482ba..412cd177c 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -31,6 +31,7 @@
 #define PREEMPT_MODE		(0x1 << 3)
 #define DYN_PRIORITY		(0x1 << 4)
 #define INVALIDATE		(0x1 << 5)
+#define FAULT_MODE		(0x1 << 6)
 
 #define MAX_INSTANCE 9
 
@@ -242,7 +243,12 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	if (flags & FAULT_MODE)
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	else
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
 
 	if (flags & USERPTR) {
@@ -582,6 +588,12 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @preempt-mode-priority:			preempt-mode priority
  * @preempt-mode-close-fd:			preempt-mode close fd without destroying exec queues
  * @preempt-mode-dyn-priority:			preempt-mode dynamic priority
+ * @preempt-mode-fault-basic:			preempt-mode-fault-mode basic
+ * @preempt-mode-fault-userptr:			preempt-mode-fault-mode userptr
+ * @preempt-mode-fault-userptr-invalidate:	preempt-mode-fault-mode userptr invalidate
+ * @preempt-mode-fault-priority:		preempt-mode-fault-mode priority
+ * @preempt-mode-fault-close-fd:		preempt-mode-fault-mode close fd
+ * @preempt-mode-fault-dyn-priority:		preempt-mode-fault-mode dynamic priority
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -638,6 +650,13 @@ igt_main
 		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
 		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
 		{ "preempt-mode-dyn-priority", PREEMPT_MODE | DYN_PRIORITY },
+		{ "preempt-mode-fault-basic", PREEMPT_MODE | FAULT_MODE },
+		{ "preempt-mode-fault-userptr", PREEMPT_MODE | FAULT_MODE | USERPTR },
+		{ "preempt-mode-fault-userptr-invalidate", PREEMPT_MODE | FAULT_MODE |
+			USERPTR | INVALIDATE },
+		{ "preempt-mode-fault-priority", PREEMPT_MODE | FAULT_MODE | PRIORITY },
+		{ "preempt-mode-fault-close-fd", PREEMPT_MODE | FAULT_MODE | CLOSE_FD },
+		{ "preempt-mode-fault-dyn-priority", PREEMPT_MODE | FAULT_MODE | DYN_PRIORITY },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

