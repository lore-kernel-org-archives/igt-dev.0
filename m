Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775C5D43367
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C7910E31F;
	Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrxDuMop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985B410E12A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501883; x=1797037883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z57IQ7ENC48jQ0tA9AkBe2r0kfWf0CKRURQgML/Rpro=;
 b=VrxDuMop10E5mrf2cW0/nRC8jRm5f5E0p/72fkVyfqO0eKVJIyGxAOo9
 kk0AvRhaK9MqoEUTu+HsxMcV1++KJrnmjMVa0E5dDaRKVVfwq8CPlDPVo
 xJ16oDBW4XIVBc0SLwWg+wda5DOxVlxo/gSb3rHnTY5aOEa2MM9ZwTEAD
 1/LHY1ruYSiZFJa2q8CqoHqPGO4Kj/aqqDE4uEWYv5iQ8cz2Nqx3KKy+i
 ed7lSwwDTolL1sY+YoXhweeyVNushm5MtEc9ItyRYDqIuNFMlJWXhKRsd
 MyIdJB+1hC09pNQXkGP8GIfPIadmNl2+yyQj5XDNSlQdb9iHNgS+RqxMp w==;
X-CSE-ConnectionGUID: HSTGFMJtSbGVkgMAA4invQ==
X-CSE-MsgGUID: M/eAfe69SsOyGLYusU1tVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118041"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
X-CSE-ConnectionGUID: OX+wB1VETJOhM0R7jv3wjw==
X-CSE-MsgGUID: g/1ZeoKWSr2x9yZTAC/wGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031225"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 06/18] tests/intel/xe_exec_multi_queue: Add close-fd tests
Date: Thu, 11 Dec 2025 17:11:18 -0800
Message-ID: <20251212011115.1685703-26-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
References: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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
index 561c1a2c9..972e1ceec 100644
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
@@ -397,6 +407,7 @@ int igt_main()
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
+		{ "close-fd", CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

