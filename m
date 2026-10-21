Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3560A2604
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V0ELfhYw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09510E023;
	Wed, 21 Oct 2026 14:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1E210E023
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792592584; x=1824128584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FBKpFzHuPrGiMPRGkURZdQD/7oHG05MyZR/nOd9runA=;
 b=V0ELfhYwIeKrjyCYtiM4xKAupZXUrUd/dFa6ui9cvxx7ruCj9JqSDllM
 Qc+1Adoc71Z0IEbaxNvrWuGK+hkfmesOFINW86Em9dmp61CfjCthln6Xh
 JZohieXS0erYf7+Ldeyzp6EIu3X1Sq6yJzzSiVlaLXjXdVhcf2uArmw/y
 Tohkje8IhplkkKj245aX08f6PjJOn4dpU1pI6HBJK24cZD1Ssw/CAAy08
 0+YyiPX1xCgrxMiClGgs4g38m5hkrE74X8pKIgsBnwWChd+HZtc+nk2DZ
 qKbhnKFiXX7cWlGlnAs5HD87Wvg2AnONQ7sYzq+oZ5PRNAVwmqd9hbtTJ w==;
X-CSE-ConnectionGUID: b2Uk7vhLR0KD/iHIj6vDLw==
X-CSE-MsgGUID: SXASVr5bRgenDQ6bIqZrjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1336777"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1336777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 07:23:03 -0700
X-CSE-ConnectionGUID: PUOEo+ilTeGQtjy4ua8Ltg==
X-CSE-MsgGUID: issOE5zLToeAw5SOQyEBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3499575"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 07:23:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_create: add create-big-bo-interruptible
 subtest
Date: Wed, 21 Oct 2026 15:22:41 +0100
Message-ID: <20261021142240.826942-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a create-big-bo-interruptible subtest that wraps large BO
creation and CPU mmap verification in igt_fork_signal_helper() /
igt_stop_signal_helper() (500 Hz continuous signal interruption) and
also supports non-VRAM (iGPU) platforms using a 512 MiB system memory BO
(roughly matching bug report).

When a large BO creation overflows the migration batchbuffer
suballocation pool (gt->usm.bb_pool), an interruptible suballocator wait
aborts xe_migrate_clear() with -ERESTARTSYS, synchronously drains all
in-flight migration jobs at err_sync:, and restarts
DRM_IOCTL_XE_GEM_CREATE from scratch, livelocking under periodic signals
such as Xorg's SIGALRM smart-scheduler.

Current working theory for user reported bug. Running this locally, it
does indeed run forever on BMG. Patching the intr wait on kernel side,
fixes it.

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_create.c | 47 +++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index fd1993b21..0a1b54ae4 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -411,8 +411,14 @@ static void create_massive_size(int fd)
  * Test category: functionality test
  * Description: Verifies the creation of substantial BO within VRAM,
  *		constituting all available CPU-visible VRAM.
+ *
+ * SUBTEST: create-big-bo-interruptible
+ * Functionality: bo
+ * Test category: functionality test
+ * Description: Verifies the creation of substantial BO while continuously
+ *		interrupted by signals.
  */
-static void create_big_vram(int fd, int gt)
+static void create_big(int fd, int gt, bool interruptible)
 {
 	uint64_t bo_size, size, visible_avail_size, alignment;
 	uint32_t bo_handle;
@@ -422,14 +428,21 @@ static void create_big_vram(int fd, int gt)
 	alignment = xe_get_default_alignment(fd);
 	vm = xe_vm_create(fd, 0, 0);
 
-	visible_avail_size = xe_visible_available_vram_size(fd, gt);
-	igt_require(visible_avail_size);
-
-	bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
-		  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
+	if (xe_has_vram(fd)) {
+		visible_avail_size = xe_visible_available_vram_size(fd, gt);
+		bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
+			  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
+		igt_info("gt%u bo_size=%"PRIu64" visible_available_vram_size=%"PRIu64"\n",
+			 gt, bo_size, visible_avail_size);
+	} else {
+		bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
+			  : SZ_512M;
+		igt_info("system bo_size=%"PRIu64"\n", bo_size);
+	}
 	igt_require(bo_size);
-	igt_info("gt%u bo_size=%"PRIu64" visible_available_vram_size=%"PRIu64"\n",
-		gt, bo_size, visible_avail_size);
+
+	if (interruptible)
+		igt_fork_signal_helper();
 
 	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
 				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -444,6 +457,9 @@ static void create_big_vram(int fd, int gt)
 	}
 	igt_assert_eq(0, bo_ptr[0]);
 
+	if (interruptible)
+		igt_stop_signal_helper();
+
 	munmap(bo_ptr, bo_size);
 	gem_close(fd, bo_handle);
 	xe_vm_destroy(fd, vm);
@@ -588,7 +604,20 @@ int igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 
 		xe_for_each_gt(xe, gt)
 			igt_dynamic_f("gt%u", gt)
-				create_big_vram(xe, gt);
+				create_big(xe, gt, false);
+	}
+
+	igt_subtest_with_dynamic("create-big-bo-interruptible") {
+		int gt;
+
+		if (xe_has_vram(xe)) {
+			xe_for_each_gt(xe, gt)
+				igt_dynamic_f("gt%u", gt)
+					create_big(xe, gt, true);
+		} else {
+			igt_dynamic("system")
+				create_big(xe, 0, true);
+		}
 	}
 
 	igt_subtest("create-contexts") {
-- 
2.56.0

