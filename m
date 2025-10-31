Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFD0CCFA09
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB4E10E34B;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHnQO6YO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E66110E320
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YJkv785Iy6zVip4GKU3ZgL4ykutaXMawpF+V9t+Zrzs=;
 b=lHnQO6YO3sADlpa4Aepb2bdSw0w1KEYDVWzsYk3UFiQfb3DLVFyx1XZU
 KDat5K4rU7px/0CD5AL3RNozuW71vL1Kzzjsy8Sc85RAkjA5kxJNKzxgd
 rxWV/QFaPmJxbzpOgln705lx/8dSMOFvd1Zs0Tt9Cogg0/VV46ah5S4PI
 vCooNKpe5uCpAW2oY0tIekRgDf04pUdpiAJbxXQ3ONGHgs9HDizPKl+pH
 T4ZZpMME2gRCOEOGKFkJZT+3Hm8g6PhvE9N8/NY8tI4z+cTwKUe6u3rLf
 CKc2lGUL/YEex/EAOpuYVsamlLMa9YKZ8+IA+7sSy0uswWNMwbr/s4oQA g==;
X-CSE-ConnectionGUID: U77ZFgL1TNu/AaIwpjNNww==
X-CSE-MsgGUID: DIgw1d6uRZ+O5OwHEw9qkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144733"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: 9j4QOJqxTzOrlrdugtUqHA==
X-CSE-MsgGUID: n0kNuGBJT/6PWMAktNRAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650027"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 10/18] tests/xe_exec_multi_queue: Add dynamic priority test
Date: Fri, 31 Oct 2025 11:35:47 -0700
Message-ID: <20251031183555.1882721-11-niranjana.vishwanathapura@intel.com>
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

Add subtest for basic functionality of dynamic priority
change using set_property ioctl.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 191c55fdd..016979337 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -29,6 +29,7 @@
 #define PRIORITY		(0x1 << 1)
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
+#define DYN_PRIORITY		(0x1 << 4)
 
 #define MAX_INSTANCE 9
 
@@ -305,6 +306,12 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 
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
 
@@ -438,6 +445,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 		if (e != i)
 			syncobj_reset(fd, &syncobjs[e], 1);
 
+		if (flags & DYN_PRIORITY)
+			xe_exec_queue_set_property(fd, exec_queues[e],
+						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
+
 		xe_exec(fd, &exec);
 	}
 
@@ -505,10 +517,12 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -557,10 +571,12 @@ igt_main
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

