Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A4EC25B78
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 00:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ADB10E1AE;
	Thu, 23 May 2024 00:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbUmSs+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88910E1AE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716422655; x=1747958655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eD7ynLW/w3gaNbnUTJELWNy7e+haFgSNbCuM/j440wU=;
 b=lbUmSs+JnBImzcuVugXs80TcVys00Y9a8lK75IofMDkc/9Qom6HPCOmB
 pvhlOfZI90J8Tfs8OMfQpnd/7vJLyEVSOPaU4XmbG6hsGggwnJL13/qSI
 0RcTOSQroC+3rxbhS8n3PvPIE49h42uanzDTBaJwzvFum+8cjr9kuooeR
 1Z2XzgL+jzSQoUciVLAMSkTfrJL38pudqIi/xflyDdFAvlHEAHbCSOeeT
 /++1rQY3j9M+OnxiDcrKa3I8MA08ubrRU8zRGc+wUYf8EaprWmhPQc6C/
 gfR0Y001if2o+URgWYkJ8i0CZYYJkVbc2tBLI+YvQESnnXojcbEOo4vQm Q==;
X-CSE-ConnectionGUID: LQydWvLHR+Ksh0XynnDdnw==
X-CSE-MsgGUID: c5BFXjbaT9e+5/J0G50ICw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30242136"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30242136"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 17:04:14 -0700
X-CSE-ConnectionGUID: HWebe+NdSheWo4hCRLNrRQ==
X-CSE-MsgGUID: uptbFq0bSsedQB7oy7i7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33923538"
Received: from kialmah1-mobl1.jf.intel.com ([10.24.14.78])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2024 17:04:14 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Shawn Lee <shawn.c.lee@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: [PATCH i-g-t v2] tests/kms_sysfs_edid_timing: Skip the first detect
Date: Wed, 22 May 2024 17:04:09 -0700
Message-Id: <20240523000409.284668-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.34.1
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

It is observed in some chrome devices that the first detect take a
long time due to PPS. In another device it was found the eDP panel
misbehaving and keep sending multiple long HPD during PPS which
trigger HPD storm warning. This first detect will always exceeds the
THRESHOLD_PER_CONNECTOR and will cause the test to fail.

Avoid that by skipping the measurement for the first detect.
Also adding more debug logs in the test and kernel to be able to
correlate the results.

v2: Add comment summarize why skip first detect (Manasi)
    Fix commit message and check code formatting (Kamil)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Shawn Lee <shawn.c.lee@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index dbc66c876..763d36d32 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -50,7 +50,7 @@
 #define THRESHOLD_PER_CONNECTOR		150
 #define THRESHOLD_PER_CONNECTOR_MEAN	140
 #define THRESHOLD_ALL_CONNECTORS_MEAN	100
-#define CHECK_TIMES			15
+#define CHECK_TIMES			16
 
 IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "connector and fails if either the time it takes for "
@@ -89,15 +89,28 @@ igt_simple_main
 		for (i = 0; i < CHECK_TIMES; i++) {
 			struct timespec ts = {};
 			int fd;
+			uint64_t current;
 
 			if ((fd = open(path, O_WRONLY)) < 0)
 				continue;
 
+			igt_kmsg(KMSG_DEBUG "%s: start detect\n", path);
 			igt_nsec_elapsed(&ts);
 			igt_ignore_warn(write(fd, "detect\n", 7));
-			igt_mean_add(&mean, igt_nsec_elapsed(&ts));
-
+			current = igt_nsec_elapsed(&ts);
+			igt_kmsg(KMSG_DEBUG "%s: end detect\n", path);
 			close(fd);
+
+			/*
+			 * Skip first detect to account for slower PPS or
+			 * misbehaving panel that has non-standard HPDs behavior
+			 */
+			if (i == 0)
+				continue;
+
+			igt_mean_add(&mean, current);
+			igt_debug("%s: i=%d current=%02fdms mean.max=%02fms mean.min=%02fms\n",
+				de->d_name, i, current/1e6,  mean.max/1e6, mean.min/1e6);
 		}
 
 		igt_debug("%s: mean.max %.2fns, %.2fus, %.2fms, "
-- 
2.34.1

