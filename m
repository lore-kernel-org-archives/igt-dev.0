Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F9AC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 07:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1623F10E224;
	Wed, 24 Jul 2024 07:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4oQuAF3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D0F10E151
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721805288; x=1753341288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0P9J/FnyAvd19EMw1+AUWXQgScDN5udT+BagV6IQG5s=;
 b=V4oQuAF3+KTQkQCBXnNWgZn6b+xjqvBeEzgZF2syc/M8k1xbNPoMdWEd
 5G9lNrXXcGhm4Nf9EEhA9W0H+nsXRFIgmjvnXPccPMlbkR/mlpnuWiVmA
 Se8ynKGmHAgmHNmaHu+0rlqgC339XBrnMcr/DiG0erjuumNVhdTIqz55O
 FxyHK7bfve9EAb//JKZcrg37EQBrMSqf5tcEZNJ77KtBiM6ZvnYXXni1v
 w8+mSb63VzQNfv3BJk95MU+RrpLEf99FOBF3oGM3HFxFcnsFInEdWqzAQ
 +WxwOtfTFbcXmxfk54jCZ1lM48mQNxAdcq/aFu7IQEoM2LVCjsQtClPXI A==;
X-CSE-ConnectionGUID: 6TPBWDXtTdelwcjwnG992A==
X-CSE-MsgGUID: FRmSBZRIRsmihoYzES8D4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19600624"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19600624"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:14:48 -0700
X-CSE-ConnectionGUID: NA9DWel1RBaZJEOptGBgFA==
X-CSE-MsgGUID: i5bUTSz1R6afEWPklRnGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52430120"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:14:45 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [i-g-t 1/2] lib/drmtest: Ensure the XE driver is idle before starting
 a test
Date: Wed, 24 Jul 2024 12:35:43 +0530
Message-ID: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Re-use the existing i915's exit handler to make sure that the
XE driver is idle before starting the subtest.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/drmtest.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index f8810da43..8851029a7 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -64,6 +64,7 @@
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 #include "igt_dummyload.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_query.h"
 
 /**
@@ -663,12 +664,16 @@ static void __cancel_work_at_exit(int fd)
 {
 	igt_terminate_spins(); /* for older kernels */
 
-	igt_params_set(fd, "reset", "%u", -1u /* any method */);
-	igt_drop_caches_set(fd,
-			    /* cancel everything */
-			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
-			    /* cleanup */
-			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
+	if (is_xe_device(fd)) {
+		xe_force_gt_reset_all(fd);
+	} else {
+		igt_params_set(fd, "reset", "%u", -1u /* any method */);
+		igt_drop_caches_set(fd,
+				    /* cancel everything */
+				    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
+				    /* cleanup */
+				    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
+	}
 }
 
 static void cancel_work_at_exit(int sig)
@@ -716,11 +721,11 @@ int drm_open_driver(int chipset)
 	igt_skip_on_f(fd<0, "No known gpu found for chipset flags 0x%u (%s)\n",
 		      chipset, chipset_to_str(chipset));
 
-	/* For i915, at least, we ensure that the driver is idle before
+	/* For i915 & xe, at least, we ensure that the driver is idle before
 	 * starting a test and we install an exit handler to wait until
 	 * idle before quitting.
 	 */
-	if (is_i915_device(fd)) {
+	if (is_intel_device(fd)) {
 		if (__sync_fetch_and_add(&open_count, 1) == 0) {
 			__cancel_work_at_exit(fd);
 			at_exit_drm_fd = drm_reopen_driver(fd);
-- 
2.43.2

