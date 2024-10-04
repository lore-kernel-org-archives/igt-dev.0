Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23BCCF34D6
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 00:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F9310E1F9;
	Fri,  4 Oct 2024 00:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YX9AYz5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18510E1F9
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 00:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728001041; x=1759537041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rBjPd7vosO51+e2daN9aEmRVFsOnSzt+GaUCYSS+Wa4=;
 b=YX9AYz5ppulnLClZXGQg5Gf/njz+b/ASGc9BD7cXCjdb+ZW+jPSPVoAB
 QjzM+fwmNqmAT/xaz/KPGjudoSIzeQv89K9coe9mOWLT3aZKONDwE9gKB
 5aQoYv3W0kHvB8gJCKhpA8jtQj4AY+WTw6GfSEXfFGyXivEJz5rbJHPdR
 R0EAtmX6sDSvdmFt+dzH0rBTEqJhavTEd6XauArlmwRPyLv8OQBJu6lt5
 FTZl/D6eRTkWsX5Eh9w4ivG5+LhpJ5dJ2lqals6UnoOsMnIVRvWML2HsT
 g3bvIQ9rEEBaLBv7ZMRSvPEFG+wo7WGtS/U/YrYTcaAtGgu615qj2K3p7 g==;
X-CSE-ConnectionGUID: Ncfta/rgRkiDhkOP0PEQow==
X-CSE-MsgGUID: RxUScdp8RmqBxsTVerFSww==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37878910"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="37878910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 17:17:21 -0700
X-CSE-ConnectionGUID: cOG1uVfeROS4qsLRp4GwhA==
X-CSE-MsgGUID: +oa+Ex7QTsGm2+epeu4enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="79293603"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 17:17:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Avoid racy cleanup
Date: Thu,  3 Oct 2024 17:17:16 -0700
Message-ID: <20241004001716.1323641-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.46.2
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

The wedged-at-any-timeout subtest uses wedged_mode=2 and triggers an
engine hang via IGT spinner, which means the hardware can become wedged
at any time after the spinner batch is submitted to the kernel.  Any
further ioctl submissions from the test are effectively racing with the
GPU and might succeed if they run before the GPU/driver notices the
hang, or might fail with -ECANCELED if the hang has already been
detected.  This is also true for the cleanup at the end of the
simple_hang() function (i.e., execqueue destruction, gem close, etc.).
The IGT wrappers for those cleanup ioctls will terminate the test if
they fail, causing a bogus test failure.

As soon as the spinner batch is submitted to the kernel, we can't
guarantee that we have time to sneak in any more ioctls, so just drop
the cleanup actions; they aren't really needed.  In a similar vein, we
technically shouldn't assume that a 1 second wait will guarantee that
we've reached wedged status (it almost certainly will, but arbitrary
delays of "this is probably long enough" are never good).  Instead, do a
syncobj_wait on the spinner; that might complete normally or might
return ECANCELED, either of which is a signal that we can move on with
the rest of the test.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2780
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2747
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_wedged.c | 44 +++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index a3f7a697f..3678abf13 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -170,7 +170,7 @@ simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
 }
 
 static void
-simple_hang(int fd)
+simple_hang(int fd, struct drm_xe_sync *sync)
 {
 	struct drm_xe_engine_class_instance *eci = &xe_engine(fd, 0)->instance;
 	uint32_t vm;
@@ -191,6 +191,11 @@ simple_hang(int fd)
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	int err;
 
+	if (sync) {
+		exec_hang.syncs = to_user_pointer(sync);
+		exec_hang.num_syncs = 1;
+	}
+
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(*data));
 	bo = xe_bo_create(fd, vm, bo_size,
@@ -208,11 +213,6 @@ simple_hang(int fd)
 	do {
 		err =  igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec_hang);
 	} while (err && errno == ENOMEM);
-
-	xe_exec_queue_destroy(fd, hang_exec_queue);
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-	xe_vm_destroy(fd, vm);
 }
 
 /**
@@ -252,19 +252,37 @@ igt_main
 	}
 
 	igt_subtest_f("wedged-at-any-timeout") {
+		struct drm_xe_sync hang_sync = {
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		};
+		int err;
+
 		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
 		ignore_wedged_in_dmesg();
 
+		hang_sync.handle = syncobj_create(fd, 0);
+
 		igt_debugfs_write(fd, "wedged_mode", "2");
-		simple_hang(fd);
+		simple_hang(fd, &hang_sync);
+
 		/*
-		 * Any ioctl after the first timeout on wedged_mode=2 is blocked
-		 * so we cannot relly on sync objects. Let's wait a bit for
-		 * things to settle before we confirm device as wedged and
-		 * rebind.
+		 * Wait for the hang to be detected.  If the hang has already
+		 * taken place, this will return ECANCELED and we can just move
+		 * on immediately.
 		 */
-		sleep(1);
+		err = syncobj_wait_err(fd, &hang_sync.handle, 1, INT64_MAX, 0);
+		if (err)
+			igt_assert_eq(err, -ECANCELED);
+
+		/* Other ioctls should also be returning ECANCELED now */
 		igt_assert_neq(simple_ioctl(fd), 0);
+		igt_assert_eq(errno, ECANCELED);
+
+		/*
+		 * Rebind the device and ensure proper operation is restored
+		 * for all engines.
+		 */
 		fd = rebind_xe(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
@@ -278,7 +296,7 @@ igt_main
 		igt_assert_eq(simple_ioctl(fd), 0);
 		igt_debugfs_write(fd, "wedged_mode", "1");
 		ignore_wedged_in_dmesg();
-		simple_hang(fd);
+		simple_hang(fd, NULL);
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
 
-- 
2.46.2

