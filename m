Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B330AD3B7F3
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0D10E4B3;
	Tue,  9 Dec 2025 03:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNXtAtFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8566110E47E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qq0ljdl7zttcmrKluDyFb/zh73wH8urocqIxeIkupYg=;
 b=LNXtAtFM0TV1H9ppNTFC8qg2G5Qx2wo7FUtmf6ETuf3Ryone/G8Z72Fl
 eSQfkKFyxKzSVsQJJXBV+7zjffh79CdTaBzAJtmnI/x75jVPr044L+Tpd
 UHhnCWR3j7sHkYGmawIbuJVVWWtf1PRWUhHFcmsP/T4k8BwZU6nw/1bc9
 wSKVTSFHvGVOg4FUL10vHdRoQXYa/bQV1wNPqzlycrVFwg9M7EbPC/8qG
 SCR9K/hlGImr/mH1NZnOI9qRIdoOd1K2VVgFpzkC8Z8mECqchH7TNGzMy
 CBcWPWucHCiIzH56RAamepdWp+P4xpU3J0WIm1eBU++FH50qCtO/HZ+7L A==;
X-CSE-ConnectionGUID: tlihcrdASjmy8+GlbtOJKA==
X-CSE-MsgGUID: fpge3bKJRoKFKZJgt9ZFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164329"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164329"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: 8NDDkSQIRBSkAG4i1Z2XfA==
X-CSE-MsgGUID: gFJDSvMpT9OxHlgEW6ZUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570928"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 13/18] tests/intel/xe_exec_multi_queue: Add multi queues
 with SMEM
Date: Mon,  8 Dec 2025 19:22:19 -0800
Message-ID: <20251209032208.1540217-33-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Extend multi queue tests with SMEM.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 40 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index f4c23e541..96fb05a72 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -32,6 +32,7 @@
 #define DYN_PRIORITY		(0x1 << 4)
 #define INVALIDATE		(0x1 << 5)
 #define FAULT_MODE		(0x1 << 6)
+#define SMEM			(0x1 << 7)
 
 #define MAX_INSTANCE 9
 
@@ -280,8 +281,11 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		if (flags & SMEM)
+			bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+		else
+			bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -442,8 +446,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		if (flags & SMEM)
+			bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+		else
+			bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -592,23 +599,36 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * arg[1]:
  *
  * @basic:					basic
+ * @basic-smem:					basic smem
  * @userptr:					userptr
  * @userptr-invalidate:				userptr invalidate
  * @priority:					priority
  * @close-fd:					close fd without destroying exec queues
  * @dyn-priority:				dynamic priority
  * @preempt-mode-basic:				preempt-mode basic
+ * @priority-smem:				priority smem
+ * @close-fd-smem:				close fd without destroying exec queues smem
+ * @dyn-priority-smem:				dynamic priority smem
+ * @preempt-mode-basic-smem:			preempt-mode basic smem
  * @preempt-mode-userptr:			preempt-mode userptr
  * @preempt-mode-userptr-invalidate:		preempt-mode userptr invalidate
  * @preempt-mode-priority:			preempt-mode priority
  * @preempt-mode-close-fd:			preempt-mode close fd without destroying exec queues
  * @preempt-mode-dyn-priority:			preempt-mode dynamic priority
  * @preempt-mode-fault-basic:			preempt-mode-fault-mode basic
+ * @preempt-mode-priority-smem:			preempt-mode priority smem
+ * @preempt-mode-close-fd-smem:			preempt-mode close fd without destroying exec queues smem
+ * @preempt-mode-dyn-priority-smem:		preempt-mode dynamic priority smem
+ * @preempt-mode-fault-basic-smem:		preempt-mode-fault-mode basic smem
  * @preempt-mode-fault-userptr:			preempt-mode-fault-mode userptr
  * @preempt-mode-fault-userptr-invalidate:	preempt-mode-fault-mode userptr invalidate
  * @preempt-mode-fault-priority:		preempt-mode-fault-mode priority
  * @preempt-mode-fault-close-fd:		preempt-mode-fault-mode close fd
  * @preempt-mode-fault-dyn-priority:		preempt-mode-fault-mode dynamic priority
+ * @preempt-mode-fault-priority-smem:		preempt-mode-fault-mode priority smem
+ * @preempt-mode-fault-close-fd-smem:		preempt-mode-fault-mode close fd smem
+ * @preempt-mode-fault-dyn-priority-smem:	preempt-mode-fault-mode dynamic priority smem
+ *
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -652,24 +672,36 @@ igt_main
 		unsigned int flags;
 	} sections[] = {
 		{ "basic", 0 },
+		{ "basic-smem", SMEM },
 		{ "userptr", USERPTR },
 		{ "userptr-invalidate", USERPTR | INVALIDATE },
 		{ "priority", PRIORITY },
+		{ "priority-smem", PRIORITY | SMEM },
 		{ "close-fd", CLOSE_FD },
+		{ "close-fd-smem", CLOSE_FD | SMEM },
 		{ "dyn-priority", DYN_PRIORITY },
+		{ "dyn-priority-smem", DYN_PRIORITY | SMEM },
 		{ "preempt-mode-basic", PREEMPT_MODE },
+		{ "preempt-mode-basic-smem", PREEMPT_MODE | SMEM },
 		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
 		{ "preempt-mode-userptr-invalidate", PREEMPT_MODE | USERPTR | INVALIDATE },
 		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
+		{ "preempt-mode-priority-smem", PREEMPT_MODE | PRIORITY | SMEM },
 		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
+		{ "preempt-mode-close-fd-smem", PREEMPT_MODE | CLOSE_FD | SMEM },
 		{ "preempt-mode-dyn-priority", PREEMPT_MODE | DYN_PRIORITY },
+		{ "preempt-mode-dyn-priority-smem", PREEMPT_MODE | DYN_PRIORITY | SMEM },
 		{ "preempt-mode-fault-basic", PREEMPT_MODE | FAULT_MODE },
+		{ "preempt-mode-fault-basic-smem", PREEMPT_MODE | FAULT_MODE | SMEM },
 		{ "preempt-mode-fault-userptr", PREEMPT_MODE | FAULT_MODE | USERPTR },
 		{ "preempt-mode-fault-userptr-invalidate", PREEMPT_MODE | FAULT_MODE |
 			USERPTR | INVALIDATE },
 		{ "preempt-mode-fault-priority", PREEMPT_MODE | FAULT_MODE | PRIORITY },
+		{ "preempt-mode-fault-priority-smem", PREEMPT_MODE | FAULT_MODE | PRIORITY | SMEM },
 		{ "preempt-mode-fault-close-fd", PREEMPT_MODE | FAULT_MODE | CLOSE_FD },
+		{ "preempt-mode-fault-close-fd-smem", PREEMPT_MODE | FAULT_MODE | CLOSE_FD | SMEM },
 		{ "preempt-mode-fault-dyn-priority", PREEMPT_MODE | FAULT_MODE | DYN_PRIORITY },
+		{ "preempt-mode-fault-dyn-priority-smem", PREEMPT_MODE | FAULT_MODE | DYN_PRIORITY | SMEM },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

