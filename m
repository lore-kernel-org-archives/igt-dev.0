Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A8CFA472
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CB710E7FC;
	Fri, 21 Nov 2025 03:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzHgcT8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716B10E7F8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nKjqDJ+20bUJkwoEFGpTuXV8/8LpBWXLXE4vhz2FmQ0=;
 b=SzHgcT8pCPoQHIMVwlknBlt3glamHwhOTap3dkCx+O7t/R8/KFZ5LSMc
 l6VoPdVZvQYaUE9YnkJCR/ii0wfRguo8tmfuu+qD9ouAGrV1E+OUbyAc6
 iNlIwnRYnLDfFfNjfJVQxpuARRCCL8g2pbPIfxB58YPhfuZn0XISNWl+N
 +Yj5d/p3uBq9Qtpk6j8uioLaO0fPvqgi0NNQnmU/fvjy8rGuU1tjAyjaC
 8odukst8wXyiNZEmsl4B9B3kd6WwaA1Veh8Na/vfADStRuTXeMbAp1kn3
 YuPrmJMez0Ek7PufDEvAuyHrqTfnbv91ENRuUkU/ljwIbW337Z1vIFi58 w==;
X-CSE-ConnectionGUID: 7cyQtmgZRImlMuHuHRVVhw==
X-CSE-MsgGUID: 0g8G3nHMQlyDCZHbEz2J8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484675"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: +PA06uFfSxiTCwvc8adLUQ==
X-CSE-MsgGUID: JXwvm3W0S/eV8K/KcOyj0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433500"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 13/19] tests/intel/xe_exec_multi_queue: Add multi queues
 with SMEM
Date: Thu, 20 Nov 2025 19:57:25 -0800
Message-ID: <20251121035715.767226-34-niranjana.vishwanathapura@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Extend multi queue tests with SMEM.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 40 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index da8117d57..df65ccafb 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -32,6 +32,7 @@
 #define DYN_PRIORITY		(0x1 << 4)
 #define INVALIDATE		(0x1 << 5)
 #define FAULT_MODE		(0x1 << 6)
+#define SMEM			(0x1 << 7)
 
 #define MAX_INSTANCE 9
 
@@ -266,8 +267,11 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
 
@@ -428,8 +432,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
 
@@ -578,23 +585,36 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -638,24 +658,36 @@ igt_main
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

