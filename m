Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B17D68BF6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 09:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C545110E974;
	Thu, 18 Dec 2025 09:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLeMID4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1453E10E974
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766051462; x=1797587462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fr6yE9jweWleF9kZoA+R16tsqU2HWqMmEhkt7c4+RvE=;
 b=aLeMID4s5HM2nA6TPr4eD2DUh/Ud1pRa7OVG9Ll8u4vTf3i23cF9zr1w
 gP2i3dpmFEoikGjURJKM5F6FvoGjoa08I/uwMUBMJdnQEQCx1iLAV0aIQ
 qZCBpdugpvHD4Y4OyuOHWrXgHVzZI1Lst8fC9uqAax6X5wMn3HdErBwIn
 JxVJTCDOjC/D94XDEs4DLAQxn4yVrOiyw9IgE/xBN7+dEXJ5KWCHaqolO
 6TUhJ4oB/7KXtRdEa/G+he3d/BC7rRa3H3AL4stW1K6rUaOX/O5wHSwOI
 GGeA/hBAir6oVArn5/bjVFcgNDWcRKaujN20sXET8i2HBHI42ktIAN5hX A==;
X-CSE-ConnectionGUID: 4Aly8RkvRh22Hyfy8Exjpg==
X-CSE-MsgGUID: ji1szQg2QwWkNNb0lnFNKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="66997051"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="66997051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:51:02 -0800
X-CSE-ConnectionGUID: p58QsgoWRkSYY1RLmTcLBg==
X-CSE-MsgGUID: EqnV59rOSmeRBdCw5JDyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199015298"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2025 01:50:59 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v2 i-g-t] tests/i915_pm_rps: Improve error reporting for sysfs write
 failures
Date: Thu, 18 Dec 2025 15:20:00 +0530
Message-ID: <20251218095000.1232961-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Introduce dump_failure_stats() to provide detailed error logging when
writing to RPS sysfs frequency files fails. The function reports:
 - Which frequency file (min/max/boost) failed to write
 - The attempted frequency value in MHz
 - errno with human-readable description

The filename lookup is encapsulated within the error reporting function,
keeping call sites simple and only performing the lookup on actual failures

v2: Print current state of all RPS frequency files. (Anirban)
  - Original/default values with CHANGED markers for modified entries

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/i915_pm_rps.c | 41 +++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index f97a716be..fc5ca31df 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -201,6 +201,39 @@ static void wait_freq_settle(int gt_id)
 	}
 }
 
+static void dump_failure_stats(int gt_id, FILE *filp, int val)
+{
+	int freqs[NUMFREQ];
+	const char *filename = "unknown";
+
+	/* Find which file name this is */
+	for (int i = 0; i < NUMFREQ; i++) {
+		if (sysfs_files[gt_id][i].filp == filp) {
+			filename = sysfs_files[gt_id][i].name;
+			break;
+		}
+	}
+	igt_warn("========================================\n");
+	igt_warn("GT%d: Write failed to rps_%s_freq_mhz\n", gt_id, filename);
+	igt_warn("  Attempted value: %d MHz\n", val);
+	igt_warn("  errno: %d (%s)\n", errno, strerror(errno));
+	igt_warn("----------------------------------------\n");
+
+	read_freqs(freqs, gt_id);
+	igt_warn("Current sysfs values:\n");
+	for (int i = 0; i < NUMFREQ; i++) {
+		igt_warn("  rps_%s_freq_mhz = %d MHz\n",
+			 sysfs_files[gt_id][i].name, freqs[i]);
+	}
+	igt_warn("Original/Default values:\n");
+	for (int i = 0; i < NUMFREQ; i++) {
+		igt_warn("  rps_%s_freq_mhz = %d MHz%s\n",
+			 sysfs_files[gt_id][i].name, origfreqs[gt_id][i],
+			 (freqs[i] != origfreqs[gt_id][i]) ? " (CHANGED)" : "");
+	}
+	igt_warn("========================================\n");
+}
+
 static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int gt_id)
 {
 	int ret, orig;
@@ -215,12 +248,8 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int
 		if (readback_check)
 			igt_assert_eq(readval(filp), orig);
 	} else {
-		if (ret < 0) {
-			int freqs[NUMFREQ];
-
-			read_freqs(freqs, gt_id);
-			dump(freqs, gt_id);
-		}
+		if (ret < 0)
+			dump_failure_stats(gt_id, filp, val);
 		/* Expecting no error */
 		igt_assert_lt(0, ret);
 		wait_freq_settle(gt_id);
-- 
2.43.0

