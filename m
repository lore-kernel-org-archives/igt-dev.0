Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D2AC55ABA
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 13:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F208010EE95;
	Wed,  5 Aug 2026 13:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaijbONB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE3710EEA8
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785937764; x=1817473764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FoKjG1tu0iuDR/p7Lm4na/l3TePVOTK6NBEcOraFpqw=;
 b=YaijbONBKIEmvNR+LitiU88ffa/llrjXf8QrwW8quzFAFSagKkl2x3Nm
 hdMzRV7RDj2K1Y0aOtOA6B4xUrT/k0G4OhsU5iS8DY6dmBFmSvI/E8rgD
 CmC6RMhSxr+Xj/G1Blogrcit6xgP7ELLkWCM7dDZYFvnYAO/pROMNV9mB
 oSXEuuhU99yn6ZBZgMQqij2m+9wkn+KxHrSXpdXUVSKiMYPto08v/Buhb
 HCTb7KJGNpyjro5dwvgVeBls2/CDnXI3c7rE7UjUWJFRkZprjOXK3tE4V
 W0xC93HeCboGDhbANfZTpJdERTvPbmVJbGiR8M4dW7cT3D+bRMnFi4Y/t Q==;
X-CSE-ConnectionGUID: EVd7Jtg3RDOzvLmYqF+cDw==
X-CSE-MsgGUID: lv4cS1lRS3GeVHjvWqabaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97158238"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97158238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 06:49:24 -0700
X-CSE-ConnectionGUID: mUsb6KMCR76+8X+UmZMKZA==
X-CSE-MsgGUID: pgbE0Ht1RByXjDXhzeH1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266940892"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 06:49:21 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/intel_hwmon: Warn on zero-valued numeric
 attributes
Date: Wed,  5 Aug 2026 19:28:42 +0530
Message-Id: <20260805135842.34736-1-karthik.poosa@intel.com>
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

Add a check for numeric hwmon attribute values and emit a warning when a
valid numeric attribute reports 0.
This acts as a sanity check for valid telemetry data reported via hwmon.

Exclude *_label attributes from this validation to avoid false warnings on
non-numeric label entries.

Also include the necessary headers required for numeric parsing helpers.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: GitHub-Copilot:GPT-5.3-Codex
---
 tests/intel/intel_hwmon.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index f185c1ca3..6fe57a334 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -4,6 +4,8 @@
  */
 
 #include <dirent.h>
+#include <errno.h>
+#include <stdlib.h>
 #include <sys/stat.h>
 #include "igt.h"
 #include "igt_hwmon.h"
@@ -26,6 +28,31 @@
 
 IGT_TEST_DESCRIPTION("Tests for intel hwmon");
 
+static bool value_is_numeric_zero(const char *val)
+{
+	char *end;
+	long long num;
+
+	errno = 0;
+	num = strtoll(val, &end, 10);
+	if (errno || *val == '\0' || *end != '\0')
+		return false;
+
+	return num == 0;
+}
+
+static bool is_hmwon_label(const char *name)
+{
+	const char *suffix = "_label";
+	size_t name_len = strlen(name);
+	size_t suffix_len = strlen(suffix);
+
+	if (name_len < suffix_len)
+		return false;
+
+	return !strcmp(name + name_len - suffix_len, suffix);
+}
+
 static void check_if_temp_valid(int hwm, char *sysfs_name)
 {
 	int32_t cur_temp = 0, limit = 0;
@@ -64,9 +91,11 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
 		igt_debug("'%s': %s\n", de->d_name, val);
 
+		if (!is_hmwon_label(de->d_name) && value_is_numeric_zero(val))
+			igt_warn("hwmon sysfs entry '%s' has zero value\n", de->d_name);
+
 		if (!strncmp(de->d_name, "temp", 4))
 			check_if_temp_valid(hwm, de->d_name);
-
 	}
 	closedir(dir);
 }
-- 
2.25.1

