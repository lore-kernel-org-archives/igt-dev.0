Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D078CFA474
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426010E7FD;
	Fri, 21 Nov 2025 03:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jChqgokq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6829310E7F9
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpjTPt0b0QrG/7kf0JULjyz9KBuW/0il9VAnzXpUlPc=;
 b=jChqgokqhaXvu7CWLS42BEyWIsoM+aiNFGfUQkOJuuaG2fE98i0JZGbp
 hQ7EZjBNPlB27Q2VGGuMvcPFIIBt2rX4syyfbAwZQYmsfJbuf0Iypj8sx
 yg0JYt//LkVCKlMYHYEzFZpurCp0H6i0baM5UZ53nVf36xdcZDJF1xYan
 0l3k2M2UEDpAkWtRZSDXriWbYlau6jUr44z2Id0yaEkWum92jaz7YjzM1
 P1Eum6rc4LyxsBdqLfmGucLDLN38xKYr1df1RBazWSXDSE/jSg5BOaySc
 wwAxe+lwlPcKBG8pgBBs5pS2vk4Km/8GH2FdA+71DG5UngT5JdUMKo3Qm w==;
X-CSE-ConnectionGUID: 0K/nb/GxQWGCVFb38MLYOg==
X-CSE-MsgGUID: t67UaMLFQGegsnIDArxycA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484674"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: MsWvPAuVQh6pzESNVEqvXg==
X-CSE-MsgGUID: ivwFcpOYT/ettSu9x/59Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433497"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode test
Date: Thu, 20 Nov 2025 19:57:24 -0800
Message-ID: <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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
index aa86f8a38..da8117d57 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -31,6 +31,7 @@
 #define PREEMPT_MODE		(0x1 << 3)
 #define DYN_PRIORITY		(0x1 << 4)
 #define INVALIDATE		(0x1 << 5)
+#define FAULT_MODE		(0x1 << 6)
 
 #define MAX_INSTANCE 9
 
@@ -244,7 +245,12 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
@@ -583,6 +589,12 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -637,6 +649,13 @@ igt_main
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

