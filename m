Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35835D3B7E2
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6D10E49D;
	Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsPw2Ohd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCD610E47C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fyQ6kE1enAo/f2i7vgk7RJAKTm0gBZnTWRPrvyWXepQ=;
 b=HsPw2Ohd+R3F57wzY+TGJehixX3tTO3crZoyI2mrQJmqJ3oW2sC7qq9W
 eF69Xj8cOo0NTCLXX7PxovJESU9QEBm9ujbAtskXeheIWDq4N3nwnno+H
 HCot6oq65rY6vbq1BhT9ZG4zKIZ8jf549UbT8rWk3r7wsZrCKt0BMkk4I
 7pEXLxvVJYhJkWlK2zRno3ZulJ9kXCAYWfx5r/Z7aHZhOf2MRxOm9yFNb
 bFt2RoC5YIaHiPo5i7PtiAb4QvZCpl1OR6aBDu1P7T2NoLAd7mDlLkrmd
 CNPFIo4b7aTH5UjyLwA4xmRW2QO7nyHvP0AWNyCge0033gSABZjaQZJkO w==;
X-CSE-ConnectionGUID: BgWDVGSzStauOj3ATln9rQ==
X-CSE-MsgGUID: 6gFfm8YbTHmCjYJCsG1ang==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164326"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: jnyihcHhQIuAQCx4umMf8g==
X-CSE-MsgGUID: G2r16VhKQSK44Y/B3UFFUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570918"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 10/18] tests/intel/xe_exec_multi_queue: Add dynamic
 priority test
Date: Mon,  8 Dec 2025 19:22:16 -0800
Message-ID: <20251209032208.1540217-30-niranjana.vishwanathapura@intel.com>
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
index c81d9b8ab..cfbe46dd3 100644
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
@@ -570,10 +584,12 @@ igt_main
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

