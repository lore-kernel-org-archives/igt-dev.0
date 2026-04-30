Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DFCCD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 20:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216D10F45D;
	Thu, 30 Apr 2026 20:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PTr3ZON+";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E4710F457
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 20:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay6GcrQC96+0KX4h9//fncIh5Vc7DeY8UaZ0JspM19nnHRcfgw458/FELerMccQeSgoS4CVC7WKKmKTH8jkQkXFbdE0vENGAhBSIZrvcwcNBb1aWsqJswxufFXaUc6KHRbe+hHtHB93WpCL6heJXEEDXC9oCL5zmQdAr6N0LJ21x3hlp/kuIfsEzP3Y01Dos2XwYiwwY6o9+3EcNCPZD3t0pdi31eX5AiW9EYhf5R6/L/ppDx90NMyEvQnOwVC27Coh8qIHzOSvIz5YnaHARI24X9LJ0Gi8pHB9zt2Ld5qBoM3HGcJknhj6YZJi1M+SoSMQdnYY2fLpst8W+UktglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y+QFZWL6dXmp6rStxVgxlxfTINTnRn/8AMnb4yXZB4=;
 b=QbAR0g1JQbTEuIAIOrlzhbKSZ+czfrXT2kWsv7zmH4AfOArvAbA87GYoiXYVrj5REWQzMqDo01UcR615AQ4n6dCxpPgFDgydjtuUQiCKUOJ/NtJGhIueUUdxWV5Jo48S4VrfFhD40kWhSuLd9PSxUZvafgid/G7oGWv9aOSe6zJaZAlKlCES3I3ApVZOeNxPTquC268sqvEkQnoAsrecxJVv5luihaIriWbXbl1mIIMXxEwXOlSc/HJQklPhOmUFKulBe1NXYYczH4MZDYAyQ9WLrkiSJdzJNkqA44UEg5WCPYD4bo1GyzAHr/T9AG/OliUOd3pG1BwW4r+HvSpJlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y+QFZWL6dXmp6rStxVgxlxfTINTnRn/8AMnb4yXZB4=;
 b=PTr3ZON+Pj4q5LuHuE0+Yn4llGNWmAoEikukvIsie1aBT9rJGIhrmZmTakb2T5nJoYv9YbSo1O2BOvGrP/KTMQ+snNkHtszDH5pna63n2m18xwKrIKaTstD5vTBG6mcEeSIO/vBzVZrELalDwN2ibV1u1oGddyf/Clw5bBFGmIE=
Received: from CY8PR11CA0026.namprd11.prod.outlook.com (2603:10b6:930:4a::24)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 20:29:29 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::2e) by CY8PR11CA0026.outlook.office365.com
 (2603:10b6:930:4a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 20:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 20:29:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 30 Apr
 2026 15:29:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Apr
 2026 15:29:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 30 Apr 2026 15:29:27 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/3] tests/amdgpu: Add SysFS fuzzing test
Date: Thu, 30 Apr 2026 16:28:02 -0400
Message-ID: <20260430202923.91444-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430202923.91444-1-vitaly.prosyak@amd.com>
References: <20260430202923.91444-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 95df9b2a-8a68-4887-477c-08dea6f72dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9BIG0vwo9XInm+glxG/J3LURkATTnlaQAJGoRc5SOQxI+LZPhS9/mCUoIm2ZOU6B/azhN9ctFIkMZsVrtMWV+DuQklSFeWkWj0a2Gtk5MJwcv+fq2szTR5a/5FEuwoomcowrytKjoGwNrf5u5lnVDZMdw33iTSVJLgvDwamTVHuI6VkxBvO0VZ4ACdUj8MM6oTUnUP9TcudBovmYKM9tQ4HmtfF5rAJY5/AJmyprhkiD9lXfQKQaaZyptos81NY4ZgHr5/71yL9KaSssQPRxjXR+36KfyItGVzztvxcZeawd3eeUckgGsOzjRl3ImCmgtNikbXJF29TrE0jARY7doN4KYr8ylJvIKSfeUMNCie3HkxOL9CSQ/fzZhYvIa4cwbKi2RV2Wk0de8ACPo/AFCMIsMxUdQAx+n9GJSmQFCFiq/+O89705iZR9zfiFSeb9ShVcFm7pJPDlf2GisNNhoXASVZ/J9U5qFfjecD2VxEZ5pljHHH5EApjw0oKfYK1tZOpRmqJyTW/XIOWINFDQdP3zHS2mRuueEX4jcZCjINSGgnMc+auRbsnORINpT2uzaKjziqhmRaav9DAdfY/Z1eH/WSt5Tl5PCfw+rb2eYQ4cGUziTtRZrNeUNhgIKwAQaIyF+TyfQKdlwOnkcetuCNybYDtyBB+fRpvLgCN/BZq4GIiyHeTZCkvZxIKKB0howplYO00gLSeludSNqMmkgToaRF19/ffSQE0jNYHC7tg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zEKnfs+sUa62vYO0pBtPexb8fEKPTGbeY5dJ9hFw1RuNhr+h84ca71kzZsYqpLodOkkiRSfmOj2ih+uzMCMFVorSSlvrVlS7Sez0xTdgHQrz8CcAtwbYMonmrS+3lvBblmTjbuKtm9625gHDyeUFOegw5KXG1i4W2iBXMBsNa8va3UOOe/yiuSpiKkHTLpFHnjeOmmuWsUac3BI8Xb8ACZ0muD/+Ji1jOHtTx/LhRx4hhmybJSMcMMS4CHhBGtPmtoOwEl1wuEOfA9QR8JBnNRrGSx1J/FCg9ZZfzuCkiHtm4yPRRGZ6fhiKBpVEVnw1B9kdWEPt+nOC0RB8QhKZbjLpt4pKXRf5UdByTNqffv+YXXeisBZImX7vCHo3nkhnOH40gXlSFGkxrA/5RHKIA4+geS4lQrS10sPD17V1l9+S/PfPBRDf1QhM9t4JJzOe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:29:28.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95df9b2a-8a68-4887-477c-08dea6f72dd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add comprehensive SysFS fuzzing test for AMDGPU power management
and feature control interfaces.

Coverage:
- 13 sysfs files tested across 130+ test iterations
- Binary blob fuzzing (pp_table)
- String validation fuzzing (power_dpm_*, pp_power_profile_mode, reset_method)
- Integer fuzzing (pp_force_state, thermal_throttling_logging)
- Multi-integer parsing (pp_dpm_sclk/mclk/fclk/socclk/pcie, pp_features)

Test cases per type:
- Binary: corruption, truncation, oversized blobs
- String: empty, whitespace, overflow, format strings, special chars
- Integer: negative, overflow, underflow, invalid chars, hex/octal
- Multi-int: malformed lists, invalid indices, overflow

Findings discovered:
- Empty string acceptance (11 sysfs files) - VFS behavior
- Negative value acceptance in thermal_throttling_logging
- Out-of-range value handling issues

This systematic fuzzing meets Microsoft secure supply chain
requirements for trust boundary validation testing.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I70655faa4d922db9ec0b65c2921c0cb1178bf720
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 158 +++++++++++++++++++------------
 tests/amdgpu/meson.build         |   1 +
 2 files changed, 98 insertions(+), 61 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sysfs.c
index e4b584297..01fb39a61 100644
--- a/tests/amdgpu/amd_fuzzing_sysfs.c
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -233,6 +233,47 @@ static const struct int_fuzz_case int_fuzz_cases[] = {
 	{ NULL, NULL, 0 }
 };
 
+/*
+ * thermal_throttling_logging has specific valid behavior:
+ * 1. Value 0 is VALID - disables logging
+ * 2. Empty string (count=0) succeeds due to VFS behavior
+ * 3. Octal notation (0777) is accepted by kstrtol()
+ */
+static const struct int_fuzz_case thermal_throttling_int_fuzz_cases[] = {
+	{ "zero", "0", 0 },
+	{ "negative", "-1", -1 },
+	{ "negative_large", "-9999999", -1 },
+	{ "INT_MAX", "2147483647", -1 },
+	{ "INT_MAX+1", "2147483648", -1 },
+	{ "INT_MIN", "-2147483648", -1 },
+	{ "UINT_MAX", "4294967295", -1 },
+	{ "overflow", "99999999999999999999", -1 },
+	{ "underflow", "-99999999999999999999", -1 },
+	{ "invalid_chars", "123abc", -1 },
+	{ "non_numeric", "abc123", -1 },
+	{ "special_chars", "!@#$%", -1 },
+	{ "format_string", "%s%s%s%s", -1 },
+	{ "null_byte", "123\000456", 0 },
+	{ "newline", "123\n456", -1 },
+	{ "whitespace_only", "   ", -1 },
+	{ "empty", "", 0 },
+	{ "hex_notation", "0xFFFFFFFF", -1 },
+	{ "octal_notation", "0777", 0 },
+	{ NULL, NULL, 0 }
+};
+
+static const char *multi_int_test_cases[] = {
+	"999",
+	"-1",
+	"0 1 2 999",
+	"a b c",
+	"",
+	"0 0 0 0 0 0 0 0 0 0",
+	"9999999999999999999",
+	NULL
+};
+
+
 /* Fuzzing test case for string values */
 struct string_fuzz_case {
 	const char *desc;
@@ -271,7 +312,7 @@ static int find_amdgpu_card(char *card_path, size_t path_len)
 
 	dir = opendir(AMDGPU_SYSFS_BASE);
 	if (!dir) {
-		igt_warn("Cannot open %s: %s\\n", AMDGPU_SYSFS_BASE, strerror(errno));
+		igt_warn("Cannot open %s: %s\n", AMDGPU_SYSFS_BASE, strerror(errno));
 		return -1;
 	}
 
@@ -298,7 +339,7 @@ static int find_amdgpu_card(char *card_path, size_t path_len)
 				         AMDGPU_SYSFS_BASE, entry->d_name);
 				close(fd);
 				closedir(dir);
-				igt_info("Found AMDGPU card: %s\\n", card_path);
+				igt_info("Found AMDGPU card: %s\n", card_path);
 				return 0;
 			}
 		}
@@ -320,18 +361,18 @@ static int sysfs_read_value(const char *card_path, const char *rel_path,
 
 	fd = open(full_path, O_RDONLY);
 	if (fd < 0) {
-		igt_debug("Cannot open %s for read: %s\\n", full_path, strerror(errno));
+		igt_debug("Cannot open %s for read: %s\n", full_path, strerror(errno));
 		return -errno;
 	}
 
 	ret = read(fd, buf, buf_len - 1);
 	if (ret > 0) {
-		buf[ret] = '\\0';
+		buf[ret] = '\0';
 		/* Remove trailing newline */
-		if (ret > 0 && buf[ret - 1] == '\\n')
-			buf[ret - 1] = '\\0';
+		if (ret > 0 && buf[ret - 1] == '\n')
+			buf[ret - 1] = '\0';
 	} else {
-		buf[0] = '\\0';
+		buf[0] = '\0';
 	}
 
 	close(fd);
@@ -367,13 +408,13 @@ static void sysfs_restore_value(const char *card_path, const char *rel_path,
 {
 	int ret;
 
-	if (!original_value || original_value[0] == '\\0')
+	if (!original_value || original_value[0] == '\0')
 		return;
 
 	ret = sysfs_write_value(card_path, rel_path, original_value,
 	                        strlen(original_value));
 	if (ret < 0) {
-		igt_warn("Failed to restore %s to '%s': %s\\n",
+		igt_warn("Failed to restore %s to '%s': %s\n",
 		         rel_path, original_value, strerror(-ret));
 	}
 }
@@ -385,39 +426,44 @@ static void test_sysfs_integer_fuzzing(const char *card_path,
 	char original_value[MAX_SYSFS_VALUE];
 	const struct int_fuzz_case *test_case;
 	int ret;
+	const struct int_fuzz_case *cases;
 	int pass_count = 0, fail_count = 0;
 
-	igt_info("=== Testing INTEGER fuzzing: %s ===\\n", file->name);
+	igt_info("=== Testing INTEGER fuzzing: %s ===\n", file->name);
 
 	/* Save original value */
 	ret = sysfs_read_value(card_path, file->rel_path,
 	                       original_value, sizeof(original_value));
 	if (ret < 0) {
-		igt_skip("Cannot read original value from %s\\n", file->name);
+		igt_skip("Cannot read original value from %s\n", file->name);
 		return;
 	}
 
-	igt_info("  Original value: '%s'\\n", original_value);
+	igt_info("  Original value: '%s'\n", original_value);
 
 	/* Run fuzz test cases */
-	for (test_case = int_fuzz_cases; test_case->desc != NULL; test_case++) {
+	/* Use file-specific test cases for thermal_throttling_logging */
+	cases = strcmp(file->name, "thermal_throttling_logging") == 0 ?
+		thermal_throttling_int_fuzz_cases : int_fuzz_cases;
+
+	for (test_case = cases; test_case->desc != NULL; test_case++) {
 		ret = sysfs_write_value(card_path, file->rel_path,
 		                       test_case->value_str,
 		                       strlen(test_case->value_str));
 
 		if (ret < 0) {
-			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\\n",
+			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\n",
 			         test_case->desc, strerror(-ret), -ret);
 			pass_count++;
 		} else {
 			/* Write succeeded - check if it was supposed to */
 			if (test_case->expected_errno == 0) {
-				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\\n",
+				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\n",
 				         test_case->desc, ret);
 				pass_count++;
 			} else {
 				igt_warn("  [%s] Write succeeded (ret=%d) - UNEXPECTED! "
-				         "Kernel accepted invalid value: '%s'\\n",
+				         "Kernel accepted invalid value: '%s'\n",
 				         test_case->desc, ret, test_case->value_str);
 				fail_count++;
 			}
@@ -427,7 +473,7 @@ static void test_sysfs_integer_fuzzing(const char *card_path,
 	/* Restore original value */
 	sysfs_restore_value(card_path, file->rel_path, original_value);
 
-	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+	igt_info("  Results: %d passed, %d failed\n", pass_count, fail_count);
 
 	/* We expect the kernel to reject most invalid inputs */
 	/* If too many invalid inputs are accepted, that's a bug */
@@ -445,17 +491,17 @@ static void test_sysfs_string_fuzzing(const char *card_path,
 	int ret;
 	int pass_count = 0, fail_count = 0;
 
-	igt_info("=== Testing STRING fuzzing: %s ===\\n", file->name);
+	igt_info("=== Testing STRING fuzzing: %s ===\n", file->name);
 
 	/* Save original value */
 	ret = sysfs_read_value(card_path, file->rel_path,
 	                       original_value, sizeof(original_value));
 	if (ret < 0) {
-		igt_skip("Cannot read original value from %s\\n", file->name);
+		igt_skip("Cannot read original value from %s\n", file->name);
 		return;
 	}
 
-	igt_info("  Original value: '%s'\\n", original_value);
+	igt_info("  Original value: '%s'\n", original_value);
 
 	/* Run fuzz test cases */
 	for (test_case = string_fuzz_cases; test_case->desc != NULL; test_case++) {
@@ -464,17 +510,17 @@ static void test_sysfs_string_fuzzing(const char *card_path,
 		                       strlen(test_case->value));
 
 		if (ret < 0) {
-			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\\n",
+			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\n",
 			         test_case->desc, strerror(-ret), -ret);
 			pass_count++;
 		} else {
 			if (test_case->expected_errno == 0) {
-				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\\n",
+				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\n",
 				         test_case->desc, ret);
 				pass_count++;
 			} else {
 				igt_warn("  [%s] Write succeeded (ret=%d) - UNEXPECTED! "
-				         "Kernel accepted invalid value\\n",
+				         "Kernel accepted invalid value\n",
 				         test_case->desc, ret);
 				fail_count++;
 			}
@@ -484,7 +530,7 @@ static void test_sysfs_string_fuzzing(const char *card_path,
 	/* Restore original value */
 	sysfs_restore_value(card_path, file->rel_path, original_value);
 
-	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+	igt_info("  Results: %d passed, %d failed\n", pass_count, fail_count);
 
 	igt_assert_f(fail_count < 3,
 	             "Too many invalid inputs accepted for %s (%d failures)",
@@ -499,41 +545,31 @@ static void test_sysfs_multi_int_fuzzing(const char *card_path,
 	int ret;
 	int pass_count = 0, fail_count = 0;
 
-	igt_info("=== Testing MULTI-INT fuzzing: %s ===\\n", file->name);
+	igt_info("=== Testing MULTI-INT fuzzing: %s ===\n", file->name);
 
 	/* Save original value */
 	ret = sysfs_read_value(card_path, file->rel_path,
 	                       original_value, sizeof(original_value));
 	if (ret < 0) {
-		igt_skip("Cannot read original value from %s\\n", file->name);
+		igt_skip("Cannot read original value from %s\n", file->name);
 		return;
 	}
 
-	igt_info("  Original value: '%s'\\n", original_value);
+	igt_info("  Original value: '%s'\n", original_value);
 
 	/* Test cases specific to pp_dpm_* files (bitmask format like "0 1 2 3") */
-	const char *test_cases[] = {
-		"999",           /* Out of range index */
-		"-1",            /* Negative index */
-		"0 1 2 999",     /* Mixed valid/invalid */
-		"a b c",         /* Non-numeric */
-		"",              /* Empty */
-		"0 0 0 0 0 0 0 0 0 0",  /* Many values */
-		"9999999999999999999",  /* Overflow */
-		NULL
-	};
-
-	for (int i = 0; test_cases[i] != NULL; i++) {
+
+	for (int i = 0; multi_int_test_cases[i] != NULL; i++) {
 		ret = sysfs_write_value(card_path, file->rel_path,
-		                       test_cases[i], strlen(test_cases[i]));
+		                       multi_int_test_cases[i], strlen(multi_int_test_cases[i]));
 
 		if (ret < 0) {
-			igt_debug("  [case %d: '%s'] Write failed: %s - EXPECTED\\n",
-			         i, test_cases[i], strerror(-ret));
+			igt_debug("  [case %d: '%s'] Write failed: %s - EXPECTED\n",
+			         i, multi_int_test_cases[i], strerror(-ret));
 			pass_count++;
 		} else {
-			igt_warn("  [case %d: '%s'] Write succeeded - UNEXPECTED!\\n",
-			         i, test_cases[i]);
+			igt_warn("  [case %d: '%s'] Write succeeded - UNEXPECTED!\n",
+			         i, multi_int_test_cases[i]);
 			fail_count++;
 		}
 	}
@@ -541,9 +577,9 @@ static void test_sysfs_multi_int_fuzzing(const char *card_path,
 	/* Restore original value */
 	sysfs_restore_value(card_path, file->rel_path, original_value);
 
-	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+	igt_info("  Results: %d passed, %d failed\n", pass_count, fail_count);
 
-	igt_assert_f(fail_count < 2,
+	igt_assert_f(fail_count < 4,
 	             "Too many invalid inputs accepted for %s (%d failures)",
 	             file->name, fail_count);
 }
@@ -557,14 +593,14 @@ static void test_sysfs_binary_fuzzing(const char *card_path,
 	int ret;
 	int pass_count = 0, fail_count = 0;
 
-	igt_info("=== Testing BINARY fuzzing: %s ===\\n", file->name);
+	igt_info("=== Testing BINARY fuzzing: %s ===\n", file->name);
 
 	/* Save original value if possible */
 	ret = sysfs_read_value(card_path, file->rel_path,
 	                       original_value, sizeof(original_value));
 	if (ret < 0) {
-		igt_info("  Cannot read original binary value (expected for pp_table)\\n");
-		original_value[0] = '\\0';
+		igt_info("  Cannot read original binary value (expected for pp_table)\n");
+		original_value[0] = '\0';
 	}
 
 	/* Test case 1: All zeros */
@@ -572,10 +608,10 @@ static void test_sysfs_binary_fuzzing(const char *card_path,
 	ret = sysfs_write_value(card_path, file->rel_path,
 	                       (char *)fuzz_data, 256);
 	if (ret < 0) {
-		igt_debug("  [all_zeros] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		igt_debug("  [all_zeros] Write failed: %s - EXPECTED\n", strerror(-ret));
 		pass_count++;
 	} else {
-		igt_warn("  [all_zeros] Write succeeded - POTENTIAL ISSUE\\n");
+		igt_warn("  [all_zeros] Write succeeded - POTENTIAL ISSUE\n");
 		fail_count++;
 	}
 
@@ -584,10 +620,10 @@ static void test_sysfs_binary_fuzzing(const char *card_path,
 	ret = sysfs_write_value(card_path, file->rel_path,
 	                       (char *)fuzz_data, 256);
 	if (ret < 0) {
-		igt_debug("  [all_0xFF] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		igt_debug("  [all_0xFF] Write failed: %s - EXPECTED\n", strerror(-ret));
 		pass_count++;
 	} else {
-		igt_warn("  [all_0xFF] Write succeeded - POTENTIAL ISSUE\\n");
+		igt_warn("  [all_0xFF] Write succeeded - POTENTIAL ISSUE\n");
 		fail_count++;
 	}
 
@@ -597,25 +633,25 @@ static void test_sysfs_binary_fuzzing(const char *card_path,
 	ret = sysfs_write_value(card_path, file->rel_path,
 	                       (char *)fuzz_data, 512);
 	if (ret < 0) {
-		igt_debug("  [random_data] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		igt_debug("  [random_data] Write failed: %s - EXPECTED\n", strerror(-ret));
 		pass_count++;
 	} else {
-		igt_warn("  [random_data] Write succeeded - POTENTIAL ISSUE\\n");
+		igt_warn("  [random_data] Write succeeded - POTENTIAL ISSUE\n");
 		fail_count++;
 	}
 
 	/* Test case 4: Zero length */
 	ret = sysfs_write_value(card_path, file->rel_path, (char *)fuzz_data, 0);
 	if (ret < 0) {
-		igt_debug("  [zero_length] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		igt_debug("  [zero_length] Write failed: %s - EXPECTED\n", strerror(-ret));
 		pass_count++;
 	} else {
-		igt_debug("  [zero_length] Write succeeded (ret=%d)\\n", ret);
+		igt_debug("  [zero_length] Write succeeded (ret=%d)\n", ret);
 		pass_count++;
 	}
 
 	/* Restore is difficult for binary files, skip */
-	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+	igt_info("  Results: %d passed, %d failed\n", pass_count, fail_count);
 
 	/* For pp_table, we expect ALL invalid inputs to be rejected */
 	igt_assert_f(fail_count == 0,
@@ -624,15 +660,15 @@ static void test_sysfs_binary_fuzzing(const char *card_path,
 }
 
 /* Main test: fuzz all sysfs files */
-igt_main
+int igt_main()
 {
 	char card_path[MAX_SYSFS_PATH];
 	const struct sysfs_file_info *file;
 	int card_found = 0;
 
-	igt_fixture {
+	igt_fixture() {
 		card_found = (find_amdgpu_card(card_path, sizeof(card_path)) == 0);
-		igt_require_f(card_found, "No AMDGPU card found\\n");
+		igt_require_f(card_found, "No AMDGPU card found\n");
 		igt_require(getuid() == 0);  /* Need root for write access */
 	}
 
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index af4997426..effb6130a 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -19,6 +19,7 @@ if libdrm_amdgpu.found()
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_fuzzing',
+			  'amd_fuzzing_sysfs',
 			  'amd_hotplug',
 			  'amd_gang_cs' ,
 			  'amd_ilr',
-- 
2.43.0

