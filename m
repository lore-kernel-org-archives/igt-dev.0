Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CBACAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 21:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0797E10E66F;
	Tue, 23 Sep 2025 21:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCJrodGo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5799F10E1CD
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 21:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662019; x=1790198019;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8xkmWrrGxFPHkEb9DaAWHWOfoIp6P3DYrUL5CT59eCo=;
 b=DCJrodGogR8Lujga5JkLB3fi4cZZfCTsu5mTFajwMCjRh8wx1u45Jr9N
 gC8NuybXE98w+/QwPPj+MmZTALVErfJ/9s2pWeluiCnJLQau5toHooLSX
 96UqHksokBUdmmp841ICfBQKJ25g6GtpFjD2EFdjtjaC9YCztQ/yy0x2g
 N6QzBb+hQBJPcgDC6eyxRR7lT1bPKvezDCuZz9fXrdUdd40rj4nETAS6/
 YxzP5TzSYSIUmwVDmX7QYA9x8LAyStajkq7REnnhwhnx6BZY/5gkC4p7A
 YUD5yp0gIxOG+1b4F0MCgLIlXiar1aRUYOASu37MstOU0vLHtDk7T92pS Q==;
X-CSE-ConnectionGUID: +YivyS2dQxKGr301FkJi6g==
X-CSE-MsgGUID: HSnScIt2Rbe30/MoTeRZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71624705"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="71624705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:13:39 -0700
X-CSE-ConnectionGUID: ncaRfy81RRm+j09HOGls/A==
X-CSE-MsgGUID: 1r+sFakbRlaAH00hdqHDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207616536"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:13:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 4/5] tests/intel/xe_exec_reset: Add
 long-spin-sys-reuse-many-preempt-threads
Date: Tue, 23 Sep 2025 14:13:32 -0700
Message-Id: <20250923211333.766147-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923211333.766147-1-matthew.brost@intel.com>
References: <20250923211333.766147-1-matthew.brost@intel.com>
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

Add long-spin-sys-reuse-many-preempt-threads which verifies system
memory can be used during this test. Useful to test VF migration.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_legacy.c          | 3 +++
 tests/intel/xe_exec_reset.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index c0c0c4605c..cb53a8cfc8 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -12,6 +12,7 @@
 
 /* Batch buffer element count, in number of dwords(u32) */
 #define BATCH_DW_COUNT			16
+#define SYSTEM				(0x1 << 12)
 #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
 #define LONG_SPIN			(0x1 << 8)
 #define CANCEL				(0x1 << 7)
@@ -79,6 +80,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
+			  flags & SYSTEM ?
+			  system_memory(fd) :
 			  vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 8685b84270..113ceb2178 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -122,6 +122,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define GT0				(0x1 << 9)
 #define GT1				(0x1 << 10)
 #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
+#define SYSTEM				(0x1 << 12)
 
 /**
  * SUBTEST: %s-cat-error
@@ -698,6 +699,9 @@ static void *thread(void *data)
  * SUBTEST: long-spin-reuse-many-preempt-threads
  * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs
  *
+ * SUBTEST: long-spin-sys-reuse-many-preempt-threads
+ * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
+ *
  * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
  * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
  *
@@ -870,6 +874,10 @@ igt_main
 		threads(fd, 2, 16, LONG_SPIN | PREEMPT |
 			LONG_SPIN_REUSE_QUEUE);
 
+	igt_subtest("long-spin-sys-reuse-many-preempt-threads")
+		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
+			LONG_SPIN_REUSE_QUEUE);
+
 	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
 		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
 			LONG_SPIN_REUSE_QUEUE);
-- 
2.34.1

