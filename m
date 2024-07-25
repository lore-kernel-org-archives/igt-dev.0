Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F3C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 04:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884F10E23C;
	Thu, 25 Jul 2024 04:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDERn2pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982F10E23C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 04:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721881631; x=1753417631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1PJ8bD+4tJ9J6pbkMS08LlBjPk33Eg8Phs2vG9jhFOw=;
 b=IDERn2pWk3IMmBQ4Ai6AN3Nl3ZKDuoG7H9gRP9ucWvDR9RLcVffr3aCb
 Sebp3KeKDfdyE9X1Qt3c61nyMatwJKTDJEAKpHi9wHFT9Gv/+XOu8G5kH
 n4WlS5sz6a5teZ+KQQKl7tx6V2F94ErwSIqXe3NnJ3zc0AFqNFmDtWaIF
 jLfWpih6MDUVfLuNEuhskgWJ8n+9AAW+x3ihhLO+GkAdh5UVOQ6K5jA7V
 pePp8XPZrIVtAbItZIdrNrRZlsG7INcDA9O1w0DCVq0V5bxRbJ02I6fvl
 me8+Exaq2S88SSTN32DcJSmfGmSAolTgW9wsvk138XZCxyNnL0VBm44Yj A==;
X-CSE-ConnectionGUID: AzPEpySTROCXR3klaKq0eQ==
X-CSE-MsgGUID: e1hRbUPjTteUZq6x8klvQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19473122"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19473122"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 21:27:10 -0700
X-CSE-ConnectionGUID: p7jyQ961T3G1U9XJs/ju3Q==
X-CSE-MsgGUID: j29nO/y2TZ6r9evGX7kq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="53401270"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 21:27:07 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [i-g-t V2 1/2] lib/drmtest: Ensure the XE driver is idle before
 starting a test
Date: Thu, 25 Jul 2024 09:48:03 +0530
Message-ID: <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
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

V2:
 - Add some delay after attempting the gt reset
 - Cover drm render device path too

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index f8810da43..90885ec36 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -64,6 +64,7 @@
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 #include "igt_dummyload.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_query.h"
 
 /**
@@ -663,12 +664,17 @@ static void __cancel_work_at_exit(int fd)
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
+		sleep(1);
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
@@ -716,11 +722,11 @@ int drm_open_driver(int chipset)
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
@@ -836,7 +842,7 @@ int drm_open_driver_render(int chipset)
 		return fd;
 
 	at_exit_drm_render_fd = drm_reopen_driver(fd);
-	if (chipset & DRIVER_INTEL) {
+	if (chipset & (DRIVER_INTEL | DRIVER_XE)) {
 		__cancel_work_at_exit(fd);
 		igt_install_exit_handler(cancel_work_at_exit_render);
 	}
-- 
2.43.2

