Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEECD3B9B7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E68D10E651;
	Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+wRCVyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697910E646
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327185; x=1796863185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ll6DCUAVE3fEQJOk/QKzRDpifo35b6L36k4W853sYwY=;
 b=Z+wRCVypx6HcaL+5ksYIjAWeL50n59cVCh3cCIIHosXFoOx/zDlJghfb
 LXFVrI2VA23qkv4eKNkWB3TAGUdW11vKbsqJ+JI2FoNlpPABwEiRHr2e6
 yWNJ4EP5BMhfk2QcJTVf3oTuH+GZVt+DPLjVxMRNoyXtyFhPdQWgGUXMt
 9B4tHECR5T88nlOHjB1pNNn/oyxWGMIkq5pt7988z5tHltSWIeWj3PKtm
 8OXAnCmLCNH8eafT0i4Oef9CXg37QDXAiHB0T7rwOmveepzg59COOY6gR
 hSVf5Ux5tDPL06mwn9eTNGazwlq+Jm1JKBQPWsYvCHG0Er/IiHHAqLiBk A==;
X-CSE-ConnectionGUID: MfU07hA2Te27nyzJrwnxwA==
X-CSE-MsgGUID: LZkzgqWaQgK+2T5qIsDXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180404"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
X-CSE-ConnectionGUID: dFoWVtp+RQmQRqQsp5+N5g==
X-CSE-MsgGUID: X72ahi1DQJeiXIMNw0Aq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421625"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 10/18] tests/intel/xe_exec_multi_queue: Add dynamic
 priority test
Date: Tue,  9 Dec 2025 16:39:45 -0800
Message-ID: <20251210003936.1613078-30-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 01e3a4539..459c44d31 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -29,6 +29,7 @@
 #define PRIORITY		(0x1 << 1)
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
+#define DYN_PRIORITY		(0x1 << 4)
 
 #define MAX_INSTANCE 9
 
@@ -320,6 +321,12 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 
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
 
@@ -453,6 +460,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 		if (e != i)
 			syncobj_reset(fd, &syncobjs[e], 1);
 
+		if (flags & DYN_PRIORITY)
+			xe_exec_queue_set_property(fd, exec_queues[e],
+						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
+
 		xe_exec(fd, &exec);
 	}
 
@@ -520,10 +532,12 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -570,10 +584,12 @@ int igt_main()
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

