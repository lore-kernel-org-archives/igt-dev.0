Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED14D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728F010E1AC;
	Tue,  9 Dec 2025 03:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI5JmLSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971710E47C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250544; x=1796786544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+v/9tU8NQtSzAm8+K9S8VAphZOmkLgzSwvJvycMeXg=;
 b=YI5JmLShcAji4TXcPOoCuF3oQnLjOZ2q7atMabz+PvDMNuGfi1MylVd9
 +X2iszK2qpyq92ySuWOqwIrgdvm6GMjcyt1t2YsoF3mmV5nFPIoP3nP6/
 NCRhPSc+m8PNvf325mtUU3UP5/aNA47s4aLHUdwkyJ4uXoTNSCh2aNdyq
 duRIK4v9k57REM252ZZi00+hiLGTCF56cJSlA5O7oYpnl0aT0k2mYZhji
 JICxYSLhr/DYuSyFOmdmKJVUIZgkvkuYy7uSeYM66cpp8YGqJ15dEchy9
 bPLsLttSlFZfPD8BxNVT6VQLd+wFPxFV61kN7zHBOJzAke5lxLu/7ICPU Q==;
X-CSE-ConnectionGUID: Grlppv/PQvS5NJ1GI7I1Og==
X-CSE-MsgGUID: 7hzlWfXYRIqt4j6HKi2ECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164322"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164322"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:23 -0800
X-CSE-ConnectionGUID: 8wO8lLQCSvyHEC7K0QkZlQ==
X-CSE-MsgGUID: +YTjCu5LQ4eRmK4gOKXacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570906"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 06/18] tests/intel/xe_exec_multi_queue: Add close-fd tests
Date: Mon,  8 Dec 2025 19:22:12 -0800
Message-ID: <20251209032208.1540217-26-niranjana.vishwanathapura@intel.com>
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

Validate closing the file handle without destroying exec queues.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 87f7c6dbf..6c1b6616f 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -27,6 +27,7 @@
 
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
+#define CLOSE_FD		(0x1 << 2)
 
 #define MAX_INSTANCE 9
 
@@ -247,6 +248,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	} *data;
 	int i, b;
 
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
@@ -335,7 +339,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (!(flags & CLOSE_FD))
+			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
 	if (bo) {
@@ -346,7 +351,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	}
 
 	syncobj_destroy(fd, bind_syncobj);
-	xe_vm_destroy(fd, vm);
+
+	if (!(flags & CLOSE_FD))
+		xe_vm_destroy(fd, vm);
+	else
+		drm_close_driver(fd);
 }
 
 /**
@@ -379,6 +388,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @basic:					basic
  * @userptr:					userptr
  * @priority:					priority
+ * @close-fd:					close fd without destroying exec queues
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -397,6 +407,7 @@ igt_main
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
+		{ "close-fd", CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

