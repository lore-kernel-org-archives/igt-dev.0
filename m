Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A45D778AC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 18:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01410E2E4;
	Fri, 23 Jan 2026 18:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUU2hyHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637810E2E4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769192988; x=1800728988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W3/1+m++NwsZ+g6ueFhlnWdDWND87m7XVFiqFRevYn4=;
 b=TUU2hyHyF/LrJAL6Cevw0L63VwETKvnjNTo+/BDdI43wOWhSdB6P1z6W
 kRmD1sXkKeXhsBWVp/WgLPHVpIf27Sq0KLSOMFvcyXt0+tkP0kQc3O0ND
 mV9lj+dZYRQWRD1pZR1mRVeEpnd76lItMylAZBwpbOUehSDM49ncphiYE
 Ou06uSkH2qBaJmV3zCov1Cg46SsIe9M/Tw4LTfKwPWRHf6YL0uTinIKsn
 a4DTIbPhYA+Ra/GVxhjLC5IbLKE5LU2i8JhojEtK+kxkl+OEbKd2OyE2r
 mEAFOyCypJpaRP1hhSbFl/1so6Hm2Ce9pm45/dcej05tP0H7lNRapaAcJ g==;
X-CSE-ConnectionGUID: W3KBCVImSjSH457V7XzYAQ==
X-CSE-MsgGUID: Yy5KT8dOSumxqEmPzrzOOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88026609"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="88026609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:29:48 -0800
X-CSE-ConnectionGUID: dvM0KVW8QZKREm347VffZQ==
X-CSE-MsgGUID: c955FOmlTSir6v1g2SDKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211952114"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:29:46 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/hwmon: Check temperature limit in
 hwmon-read
Date: Sat, 24 Jan 2026 00:05:56 +0530
Message-Id: <20260123183556.1649959-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Improve hwmon-read test to check if current temperature
is above critical temperature limit in hwmon-read test.
This will help identify any thermal issues with the
setups during test runs.

v2:
 - Address review comments. (Mallesh)
 - Call check_temp_is_valid() only for temperature hwmon entries.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..9deb48a00 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,28 @@
 
 IGT_TEST_DESCRIPTION("Tests for intel hwmon");
 
+static void check_if_temp_valid(int hwm, char *sysfs_name)
+{
+	char str[32] = {0};
+	uint32_t cur_temp = 0;
+	uint8_t ch = 0;
+	s32 limit = 0;
+
+	/* Get the channel number and sysfs entry suffix. */
+	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);
+
+	/* If entry is tempX_input, check if it exceeds tempX_crit. */
+	if (!strncmp("input", str, 5)) {
+		sprintf(str, "temp%hhu_crit", ch);
+		if (!faccessat(hwm, str, R_OK, 0)) {
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
+			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);
+			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
+		}
+	}
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
 		igt_debug("'%s': %s\n", de->d_name, val);
 
+		if (!strncmp(de->d_name, "temp", 4))
+			check_if_temp_valid(hwm, de->d_name);
+
 	}
 	closedir(dir);
 }
-- 
2.25.1

