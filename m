Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC1AD26D67
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 15:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683310E8F1;
	Fri,  9 Jan 2026 15:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+ltgX4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943CD10E8F1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767973727; x=1799509727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=75P8JmiiDfuA83BXW1+UOB/vY4GkX0LH2zgE+pZrf6k=;
 b=m+ltgX4NQo3sSAdYIbA4FrcbkHxySM5i51jDH6jOFpuRINdd2gze4Wqr
 WADPHDFLATGnykaHwbTIuGNkwCAxAmsC/9cW80l5QUBfR4wfDWrt4uTQw
 fUgcdBYEdwVI3uho+ovkEAsYuyUHUGKMDlD/dY73IKgsAQ+wM0luQ5FWq
 hRSDJSgO8Z8pTsrHvATUuNpv6XKkh9zeY8x1gM+BEg+WAJOR2YNbR64aq
 g6RXfDAolrdGnq8N7gb9aMCA3e58BaR7zwK+4Anbig5VTtGw/MutfLJII
 +o7Oc+YUOuApptHNUuUJhg8riwOJtns+cEN1T7yh4ug1pNNjTgom220G0 w==;
X-CSE-ConnectionGUID: dZ3+lb6bSOykudwFcBBJhA==
X-CSE-MsgGUID: SclsE3SCTISGLmDbQep4Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94828479"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="94828479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:48:47 -0800
X-CSE-ConnectionGUID: btBPso8HRHaIq3F1XltyNg==
X-CSE-MsgGUID: EUPdcKmbS3CHup+NTVs99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203568839"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:48:45 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, satyanarayana.k.v.p@intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Skip subtests using
 wedged_mode=2 in SR-IOV cases
Date: Fri,  9 Jan 2026 16:48:34 +0100
Message-Id: <20260109154834.24523-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

In upon-any-hang-no-reset (2) wedged mode, engine resets need to be
disabled, which requires changing the GuC reset policy.

VFs are not permitted to modify this policy, so the driver now rejects
attempts to set wedged_mode=2 on a VF.

On the PF, modifying the reset policy is allowed, but the change is
global and affects all VFs. To prevent unintended cross-VF impact, the
driver permits wedged_mode=2 on the PF only when the driver is built
with the debug config. Otherwise, the operation fails with -EPERM.

Update the affected subtests to skip in such cases to avoid false
failures.

Link: https://lore.kernel.org/all/20260107174741.29163-4-lukasz.laguna@intel.com/
Link: https://lore.kernel.org/all/20260107174741.29163-5-lukasz.laguna@intel.com/
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_wedged.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index bcd78b49d7..e1ac629ca7 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -18,6 +18,7 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
+#include "igt_sriov_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 
@@ -247,11 +248,16 @@ int igt_main()
 		int err;
 
 		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+		igt_require(!intel_is_vf_device(fd));
+
+		igt_debugfs_write(fd, "wedged_mode", "2");
+		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
+			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
+
 		ignore_wedged_in_dmesg();
 
 		hang_sync.handle = syncobj_create(fd, 0);
 
-		igt_debugfs_write(fd, "wedged_mode", "2");
 		simple_hang(fd, &hang_sync);
 
 		/*
@@ -282,8 +288,12 @@ int igt_main()
 
 	igt_subtest_f("wedged-mode-toggle") {
 		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+		igt_require(!intel_is_vf_device(fd));
 
 		igt_debugfs_write(fd, "wedged_mode", "2");
+		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
+			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
+
 		igt_assert_eq(simple_ioctl(fd), 0);
 		igt_debugfs_write(fd, "wedged_mode", "1");
 		ignore_wedged_in_dmesg();
-- 
2.40.0

