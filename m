Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DE6D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CCC10E965;
	Fri, 30 Jan 2026 10:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBsiF0Zx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09EE10E965
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769768986; x=1801304986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L3XPM5H4uKAz5wKdIMzopef2SSiUmQEAi7yN4No+99M=;
 b=EBsiF0ZxfD8oC/EftpehJEBDISdd0dtLKCcVs48sa19DxCkRSeJPdHYL
 O1O4w8SlmXtToeohaVeHdtin8Pt4InS0RSx2LBmHoTiFEtIGlLKnAMnmy
 kEsuJKinYdO+bEv+CwpUL5f23+d0IueFA7SZm75kxHbomA7de+JjctiCl
 tCzlHH9roN/FDaog7vJipWedxf1J0jTij2Zk6Oo/4yhAKDKJpeW1q+fLS
 dAkSUk39iaG9Ra5QlhZAs5N0uDtTiEET89k6Q+jEen+m4yQ4QvkBqDkip
 Na0YbTjj3jRjrMqcARTUtU9pzWSehPgWJsoLm5CLA8qW4dt7h6eDgwLEP A==;
X-CSE-ConnectionGUID: LJ4BXHS+TB+LE730Y9LHIA==
X-CSE-MsgGUID: IOFlBqxyQROfrrT79ohI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71055167"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71055167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:29:46 -0800
X-CSE-ConnectionGUID: Hq3QaZGiQiaKMVy+jcF/tg==
X-CSE-MsgGUID: QLaQFqmGSja/BRV/VQzgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="246446994"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:29:44 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/hwmon: Check temperature limit in
 hwmon-read
Date: Fri, 30 Jan 2026 16:05:53 +0530
Message-Id: <20260130103553.1935825-1-karthik.poosa@intel.com>
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
 - Call check_if_temp_valid() only for temperature hwmon entries.

v3:
 - Correct the API name check_if_temp_valid() referenced
   in the v2 commit message. (Mallesh)
 - Use int32_t for temperature values in check_if_temp_valid().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/intel_hwmon.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..f185c1ca3 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,27 @@
 
 IGT_TEST_DESCRIPTION("Tests for intel hwmon");
 
+static void check_if_temp_valid(int hwm, char *sysfs_name)
+{
+	int32_t cur_temp = 0, limit = 0;
+	char str[32] = {0};
+	uint8_t ch = 0;
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
@@ -43,6 +64,9 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
 		igt_debug("'%s': %s\n", de->d_name, val);
 
+		if (!strncmp(de->d_name, "temp", 4))
+			check_if_temp_valid(hwm, de->d_name);
+
 	}
 	closedir(dir);
 }
-- 
2.43.0

