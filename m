Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02B0C04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 00:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9710E081;
	Sat, 18 May 2024 00:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abshsj6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8A10E081
 for <igt-dev@lists.freedesktop.org>; Sat, 18 May 2024 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715992429; x=1747528429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=srbuII9z/eNcN5Cej01QCsVqOgMFuZG7ptxkfI5xmng=;
 b=abshsj6upSQOtk5pmgJRK3WRM+2V3LACgcE4YnBtsxqJjUokT5USPm5z
 KMRk2KAAwHIdXRKu2UNT17qw3ayCYAxFgWiCHgiz2RYrnjcPHhxsahyyw
 xTXJ9/TJgxcDkSiVFO3tTsh5Gk9p5ZRE00gsQjGB79mEiJCmd9MPKdvdN
 pqfOB0lXHlnsr3wPVFDphgz2vLJEK1VWdnPYSLUoxnTCUqK+5z8JsEebi
 wwq4BKN95rU/nVG8to3LQRNFOCI9ZypVMR8suYr2HFPqyEcwuYJPDoqT8
 9uGuB9pWGwwReYtTCizDcu0vHsPw85ZzD7Z0qKKehgbchwRAQA9df/1Km Q==;
X-CSE-ConnectionGUID: QX3GkceASwGr2XOhgnBIJA==
X-CSE-MsgGUID: bL8ERwiHQmqpNPCP/ufvRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11993733"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="11993733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 17:33:48 -0700
X-CSE-ConnectionGUID: DrIOodDOQhi2S+BIapQV/Q==
X-CSE-MsgGUID: DKFPTwpARKeS0OmCbpJL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="31973602"
Received: from kialmah1-mobl1.jf.intel.com ([10.24.14.37])
 by fmviesa006.fm.intel.com with ESMTP; 17 May 2024 17:33:48 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Shawn Lee <shawn.c.lee@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Skip the first detect
Date: Fri, 17 May 2024 17:33:45 -0700
Message-Id: <20240518003345.203255-1-khaled.almahallawy@intel.com>
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

Fixes: VLK-52052, VLK-56861

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Shawn Lee <shawn.c.lee@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index dbc66c876..b7832dd83 100644
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
@@ -89,15 +89,25 @@ igt_simple_main
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
+			/* Skip first detect */
+			if(i == 0)
+				continue;
+
+			igt_mean_add(&mean, current);
+			igt_debug("%s: i=%d current=%02fdms mean.max=%02fms mean.min=%02fms\n",
+				de->d_name, i, current/1e6,  mean.max/1e6, mean.min/1e6);
 		}
 
 		igt_debug("%s: mean.max %.2fns, %.2fus, %.2fms, "
-- 
2.34.1

