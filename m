Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C83CFA475
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DA210E7FF;
	Fri, 21 Nov 2025 03:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4fIn+HJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94B10E7F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rltDueR/NGxls2BEMRdynGUwxdvPkkhyiSeTtS2xHX8=;
 b=F4fIn+HJl/htsndy1o7WH2liUgeUWUGtQtAxzltqqFrBIsiduIbmIPzg
 qZ3ErqaJC5atQbUyCGe9KKHkLWEtRxJC84yeqyI47kMNoLRXJv1pbDX2M
 V6laQiZrvlsFqF9BLtyfU1eSRFIvaqy55MU3RGAtzCXwS/L28G6u4V56q
 QtLbBsXl1SMydeZzIX8B/mbO8HH1yJ0FR4b+Ia+RAnzo+uUCEFvkuNAw2
 CVUrZtBcNh7IdMby6xPSJBBQieoTGjHKhf8FCQkClCXQRViRfe/5m+9pk
 5yMDCMD9UPSsvOF4MIGP4z9IO8yQymCHYBXPKFe7pRGPo95kH6mOCvAhd w==;
X-CSE-ConnectionGUID: Vl2q59XET72z5b60MBFgOA==
X-CSE-MsgGUID: MXH742PBTLmmYSvq3jejXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484672"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:26 -0800
X-CSE-ConnectionGUID: DaHuS42wT0K/VCOA7EIDnA==
X-CSE-MsgGUID: 92mWPdjUSs+LboYwfYxVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433491"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 10/19] tests/intel/xe_exec_multi_queue: Add dynamic
 priority test
Date: Thu, 20 Nov 2025 19:57:22 -0800
Message-ID: <20251121035715.767226-31-niranjana.vishwanathapura@intel.com>
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

Add subtest for basic functionality of dynamic priority
change using set_property ioctl.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 1e33c5db8..5d3a209e5 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -29,6 +29,7 @@
 #define PRIORITY		(0x1 << 1)
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
+#define DYN_PRIORITY		(0x1 << 4)
 
 #define MAX_INSTANCE 9
 
@@ -306,6 +307,12 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = batch_addr;
+
+		if (flags & DYN_PRIORITY)
+			xe_exec_queue_set_property(fd, exec_queues[e],
+						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
+
 		xe_exec(fd, &exec);
 	}
 
@@ -439,6 +446,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 		if (e != i)
 			syncobj_reset(fd, &syncobjs[e], 1);
 
+		if (flags & DYN_PRIORITY)
+			xe_exec_queue_set_property(fd, exec_queues[e],
+						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
+
 		xe_exec(fd, &exec);
 	}
 
@@ -506,10 +518,12 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @userptr:					userptr
  * @priority:					priority
  * @close-fd:					close fd without destroying exec queues
+ * @dyn-priority:				dynamic priority
  * @preempt-mode-basic:				preempt-mode basic
  * @preempt-mode-userptr:			preempt-mode userptr
  * @preempt-mode-priority:			preempt-mode priority
  * @preempt-mode-close-fd:			preempt-mode close fd without destroying exec queues
+ * @preempt-mode-dyn-priority:			preempt-mode dynamic priority
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -556,10 +570,12 @@ igt_main
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
 		{ "close-fd", CLOSE_FD },
+		{ "dyn-priority", DYN_PRIORITY },
 		{ "preempt-mode-basic", PREEMPT_MODE },
 		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
 		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
 		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
+		{ "preempt-mode-dyn-priority", PREEMPT_MODE | DYN_PRIORITY },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

