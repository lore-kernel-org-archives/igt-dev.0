Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC724CFB44F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946E910E0E7;
	Mon,  7 Oct 2024 17:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUPeysFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F6910E0E7
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728323272; x=1759859272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PtX1qF8AdD7OePFEAGTlQnyGApoPjQvWamnj4y5onZ8=;
 b=lUPeysFlzJVauu9wOGkq2fwfOZnsqCqPSG1YhJ4u7HQH5ddYiIITbpkW
 BAHM2IED8R6t12VUJFGtZHZpHQEuAZpyULVnDm4EjOuEetHdar/nIDOHj
 WuDHDB+w1sfLE/7LyGkWxElxU09DE5krtv+59X5vhHn5l6BgkMvnLB7nN
 DkAJlxdpGLoqhgXSz15IaDBwLtS41JhbF5KkX6RZYx3/uqViIyhH4GAHn
 9vl8Yr9lmNRHQPlkLX0iVdKChDOWVlrx8JDIAP187h9qZ9DSJlo43eEU/
 gXTwyMxfAw3gw/CzuKhq5a51K06kGOun/7g607m5V9UxsEZqPzQLCRR+S Q==;
X-CSE-ConnectionGUID: OWJClYJ+Q0iJEPBu2S83NA==
X-CSE-MsgGUID: +dyvQiWYRAK52n313RtMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27611704"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27611704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:47:52 -0700
X-CSE-ConnectionGUID: NWghGY/XRzq74h4Fv51n2w==
X-CSE-MsgGUID: iOa2wnnOSAidbkpul028qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80340811"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:47:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_wedged: Avoid racy cleanup
Date: Mon,  7 Oct 2024 10:47:47 -0700
Message-ID: <20241007174747.2031623-1-matthew.d.roper@intel.com>
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

v2:
 - Rebase to reconcile conflict with rebind refactor.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2780
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2747
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_wedged.c | 44 +++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index ba790aa8d..88e5d47f2 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -142,7 +142,7 @@ simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
 }
 
 static void
-simple_hang(int fd)
+simple_hang(int fd, struct drm_xe_sync *sync)
 {
 	struct drm_xe_engine_class_instance *eci = &xe_engine(fd, 0)->instance;
 	uint32_t vm;
@@ -163,6 +163,11 @@ simple_hang(int fd)
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
@@ -180,11 +185,6 @@ simple_hang(int fd)
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
@@ -226,19 +226,37 @@ igt_main
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
 		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
@@ -252,7 +270,7 @@ igt_main
 		igt_assert_eq(simple_ioctl(fd), 0);
 		igt_debugfs_write(fd, "wedged_mode", "1");
 		ignore_wedged_in_dmesg();
-		simple_hang(fd);
+		simple_hang(fd, NULL);
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
 
-- 
2.46.2

