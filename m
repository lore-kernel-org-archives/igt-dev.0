Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3189C9830C
	for <igt-dev@archiver.kernel.org>; Sun, 18 Jan 2026 20:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4378310E2EA;
	Sun, 18 Jan 2026 20:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUCM90SH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3400410E160
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Jan 2026 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768766457; x=1800302457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15BkEW0hX8NrIbcf7gfjXc8aO+ilTGBZe1WKJRFZCM8=;
 b=bUCM90SHU+IgBGDjDpm8mm0Xp15QhdjpUEnqnejQz7SoQqvCkLM2eWss
 03feo4spEsnLfWYhUVuT7ocjZo3fbWvxSxbhMxaaG6i7NRpUHmo9aeMqF
 E3DYNiAxOxsPUOzAznNagLEFnx0lJr4qPzJHUbBEv3DF1PFq3XDF0X3J/
 GDsIodM8CXgwptO60KixhoKPK33J31x9hgJe1flIunZtojahuHhQL98Qg
 AVXyP7uYo5M5Brlwj2j3ptCWaXrP9IT+oQzRrzlz/G0jOMr0ueWhwd5U3
 lJKpiQsg17nX7U3+vXmLB2rXiSvTbHzMyrAD2N8lW2kPAVrdDJvajM/sc Q==;
X-CSE-ConnectionGUID: e7Kc0JbgSjKVzHLE7iU7hQ==
X-CSE-MsgGUID: aB01JKYtQr2HmqWYMHqWwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87403810"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; d="scan'208";a="87403810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 12:00:57 -0800
X-CSE-ConnectionGUID: 4iMCXsZ0ShOHtJygeRWhJw==
X-CSE-MsgGUID: 9tq5+VY4S+iSFKS5ir9f9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; d="scan'208";a="243255288"
Received: from cdfennel-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.32.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 12:00:56 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/intel/xe_compute: check root-only write
 permission for ccs_mode
Date: Sun, 18 Jan 2026 21:00:10 +0100
Message-ID: <20260118200010.18669-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118200010.18669-1-peter.senna@linux.intel.com>
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
 <20260118200010.18669-1-peter.senna@linux.intel.com>
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

Add a call to igt_fs_check_root_perm() in test_ccs_mode() to verify that
the "ccs_mode" sysfs attribute is writable only by root. This enforces a
security requirement that only root can modify "ccs_mode", preventing
unintended or unauthorized writes by other users.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
Changes from v1:
 - Moved the test to after the existing test
 - Check for file not found and skip when it is the case

 tests/intel/xe_compute.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc5..eb2410a0a 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -14,6 +14,7 @@
 #include <string.h>
 
 #include "igt.h"
+#include "igt_fs.h"
 #include "igt_sysfs.h"
 #include "intel_compute.h"
 #include "xe/xe_ioctl.h"
@@ -88,7 +89,7 @@ test_ccs_mode(void)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, ccs_mode, vm, q, num_slices;
-	int fd, gt_fd, num_gt_with_ccs_mode = 0;
+	int fd, file_perm_res, gt_fd, num_gt_with_ccs_mode = 0;
 	uint64_t gt_mask = get_gt_mask();
 
 	/*
@@ -102,6 +103,20 @@ test_ccs_mode(void)
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
+
+		/* Check if ccs_mode is writeble only by root. Having root only
+		 * write permission is a security requirement.
+		 */
+		file_perm_res = igt_fs_check_root_perm(gt_fd, "ccs_mode");
+		if (file_perm_res == -ENOENT) {
+			igt_skip("ccs_mode sysfs entry not found\n");
+		} else if (file_perm_res < 0) {
+			igt_skip("Cannot stat ccs_mode file\n");
+		} else {
+			igt_assert_f(file_perm_res == 0,
+				     "ccs_mode sysfs entry has incorrect permissions\n");
+		}
+
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
 			if (num_slices % m) {
-- 
2.43.0

