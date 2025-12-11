Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4CBD43341
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 19:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95BF10E891;
	Thu, 11 Dec 2025 19:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBPSjoYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6D710E891
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765482181; x=1797018181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k1H6JtYBuqSLzhNz09klni7m2ve1h6kBSqscS2QC+UE=;
 b=bBPSjoYa5eI6+M0ej8gieGzclSWuP1pqmCkRyTNcuyn+2a2DVIuyKtef
 hP3pTu2Xy4RfVhXKJNvSo9ibhnBY7pFvRNVxIp361fAoYvC3kaB2Yt/ZK
 A13EqHPskwLH//aU6cH8sNbX6/zJthAxExwBndrow9L18oxXfEBZmRx84
 67VlKrxV5cUukVDdwpzFlP2nu2ReP91gxEaC8pNaMogSpXO7+XzZFeXeu
 w21S0zsZSmb1ZyyABueGgh39SJU5ZZ2vKO+dSd39KwsBtSDle1t8yDCac
 XNWAdUkmJDj5OedahYsc849mwI8xrfZ0rSolNzCld9S0HQHCqXiB9EGQi w==;
X-CSE-ConnectionGUID: hmtOVhp0Snm9MQdvV7WHbg==
X-CSE-MsgGUID: VvjAx+TtRze18rcgrhkdTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78937745"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78937745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:43:00 -0800
X-CSE-ConnectionGUID: YLepwWK2QTyiw5SIYvPSbQ==
X-CSE-MsgGUID: pQE+axJJRWeWQ0TrM3FaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196168517"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:42:58 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/hwmon: Check temperature limit in hwmon-read
Date: Fri, 12 Dec 2025 01:12:51 +0530
Message-Id: <20251211194251.16988-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/intel_hwmon.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..b19868440 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,25 @@
 
 IGT_TEST_DESCRIPTION("Tests for intel hwmon");
 
+static void check_if_temp_valid(int hwm, char *sysfs_name, u32 cur_val)
+{
+	char str[32] = {0};
+	uint8_t ch = 0;
+	s32 limit = 0;
+
+	sscanf(sysfs_name, "temp%hhu_%s", &ch, str);
+
+	/* If entry is tempX_input, check if it exceeds tempX_crit. */
+	if (!strncmp(sysfs_name, "temp", 4) && !strncmp(str, "input", 5)) {
+		sprintf(str, "temp%d_crit", ch);
+		if (!faccessat(hwm, str, R_OK, 0)) {
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
+			igt_debug("current value = %d limit = %d\n", cur_val, limit);
+			igt_assert_f(cur_val <= limit, "current temperature exceeds limit!\n");
+		}
+	}
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -43,6 +62,8 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
 		igt_debug("'%s': %s\n", de->d_name, val);
 
+		check_if_temp_valid(hwm, de->d_name, atoi(val));
+
 	}
 	closedir(dir);
 }
-- 
2.25.1

