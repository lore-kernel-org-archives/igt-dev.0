Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB91C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 19:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302810FC3C;
	Fri, 25 Sep 2026 19:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wpLN6E6d";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013019.outbound.protection.outlook.com
 [40.93.196.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003DD10FC3C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 19:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MICBlDGD5cCL2zh0LVHUUE262vhLfi1K8KJAgDEd+nRzXXO/ac5M9Yy/OV9nCgriiZ+35sV/DpnZA31MZYoNZyrfDB0bnqWE/Mp22vndLJNhXnZNv9P/JMlqwceZf4ifgnMHm7KmiMywOOgnnP5DSmR2LOjEDL332x1+AKZIwleIWOwvQh1VQrjGNI3XIHiFLZkhwukuX27BXW3Wu9ROlO60dqhYHkFH7mtR91QaniOBX5mo1HRqiwmo0p9wEAWoRJRbNNmJNr0ogeEA4x4kZj3e7Csb9aq8SzAt3HxQV1M8QjGuk/iNraJjetQtCfXWcQdQqE9NnQ7XaUPHbOxrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFCoCvh+Ll0UtBjbOzx9RhSmcZxXRSw+SwQFyrhMVFI=;
 b=cbwNgLf/d51vsWkTJgr3T1jWE6c/zyc7TEuVCBwFJiVB7/p5ydx1McQTQ7qHByo6XQidjUP/oBtt5bOjQc5+adWxIm1TY9aqmeCwUuTowBHxvpQ5afwHLvD+1xbUAUL9HCg6Ym08OdnhA3eY4J6SHV+DW2nYphoSDA2r479YsPHcDHuE7DhOiE+7JToVgX2RI6s5MjlQcomH0dFDr0TfywxzNTxuxRg0REZuNRtdkUjxMFvba80YCiYw8qGCnOaIKuO2IdMEOYVJQ6AWbPHUSt9hzFEOgJBvPpkbWZG16DWOvS7RPsVaQo2n6B+cPz8C3+DG33Ct/nnfWRTn9OmBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFCoCvh+Ll0UtBjbOzx9RhSmcZxXRSw+SwQFyrhMVFI=;
 b=wpLN6E6deQu6ATi2aMRdBx8KaP3iikMxFQPhEynLOJ6kwGrZL4mclsYy/0effjk7CmDaEhbDP4p4XQm5uF0bos7vV/UsBfkQEfsKs92RqWCU76gi26+8zMPL5Z5NupSbejgBXGV44awYsCe9UpLXqa7sCIMNDVlRv9EeOHv8RJU=
Received: from BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19)
 by SADPR12MB034468.namprd12.prod.outlook.com (2603:10b6:802:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:37:10 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::12) by BY5PR03CA0009.outlook.office365.com
 (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 19:37:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 19:37:09 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 14:37:04 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 1/2] lib/tests: Preserve string const qualifiers
Date: Fri, 25 Sep 2026 13:36:41 -0600
Message-ID: <20260925193642.2627600-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925193642.2627600-1-alex.hung@amd.com>
References: <20260925193642.2627600-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SADPR12MB034468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc8ee12-b975-46ba-b091-08df1b3c6385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tiV3nIg7xhQp9rIhhXdNvQSU299NycUuYr0JGhTSpPMe0XEIIZYX4UWVlb5rsuZR0DsxnLpzjiTIqKHx+pLOewfyvtAwUTWf5MsE8QCeL0W6mvMzREmsR1cww9urBaE78mfprN0x2nTNPdU+lE/xG5orXvZwF6GibN/6RzahdkpLuIE1akRhHHKyxK85O4diIsPvQCGI2pvcofTMgAaZoIv7LH44UbrfL6JS29HF6R1wF6dCG60zwMB+JuDyWp0CQHPeFVmlwDC4+dcF/Q/L92TcgutXz/qRDDi7zl5j8HRJNKS+2SpFqxjqxt7tLrV8L6Q0YvG/KIabT+aH/Qu+LOtAchBPu9Nm/m8zLhSdJuBCg1bObSVxpG5YQEtAXn/GniSi656NIrkFPpLllhZCfyeEOSVoO+/s6tC5g5lvcyVG+nKU31dg4c5cRvambQN5drXBQ10+RvKbqzcOkAOm1YPLphOpv6HVBnMNGDluh9szwCXJshnXo6KEmU8xOHH7MvidLU97Aq/NXntL4Mt5bRGToUIy13r5Bosg7pLxn+boyItDvt7Qp6AwTDk5YGZ6fO/5e2bCxNa+Mo6ZXNnq8IZSniIaf7VfRdBsmpFsJ9GhfzgbdiadWyAHefclsfcG0xz9vYAwRbbpRwkGBVEiKaVfPZaR1b/aoQME+p61FysZ3aeyROUfRZKcoOAFqHW9nJsN37cMj8JrZ8O7hwxmUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TDEE0iKPb5mGOe48VaML9vbxsIYxydIXt9t8gUNtHA5WmMYUqNPNROikssLCulj+gmaeSW6LCjj6w/UKH4lzploS635aL+JQRofCLuQC15YbgCH08MtAKZD42O4/fctu75vaAtEGUdizKMx5wtAZs12qaXg8f7BaA6MY1sN8pB19wWrXaiSakmslzUzqbZzyiVIab+o4crnCHWqW/ftxo7lj6swQwFMw23Ba/SnsH7O4ALJSAeqWATIjvgU9GWpAIygQBGXmTDam5LTgIaqThUfbjQ3quUx9gPZ3i76NYplLZTK/yq7f/9UUwW2n7GSQXXkqG/mZeLYvc8ea6MpUFFN3I/wbiV7y0aTzs8qZXxxdLW6UeJ5xkoi40gtnKOVhAFMZzqSRMbo7xvRiTfNkGDi9ZWCMrp9SF4LnwCSXhovO+mbE7PxMBSpCz+mhnI/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:37:09.0328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc8ee12-b975-46ba-b091-08df1b3c6385
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SADPR12MB034468
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

With glibc 2.43, string searches on const input return const pointers.
Storing these results in char * variables causes compiler warnings.
For example, parse_region() reports:

  warning: assignment discards 'const' qualifier
    from pointer target type [-Wdiscarded-qualifiers]

Use const char * for results that are only read. Keep char * in the MSM
test where the buffer is modified. In the fdinfo parser, use a separate
end pointer for strtoull() so the input pointer can remain const.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/i915/i915_dp.c         |  2 +-
 lib/igt_core.c             |  2 +-
 lib/igt_drm_fdinfo.c       |  7 ++++---
 lib/igt_pm.c               | 10 +++++-----
 lib/igt_pm.h               |  2 +-
 tests/intel/i915_pm_sseu.c |  8 ++++----
 tests/msm/msm_mapping.c    |  6 +++---
 7 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 3d570f7cc..595010140 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -49,7 +49,7 @@
  */
 static int i915_dp_parse_marked_value(const char *buf, char marked_char, int *result)
 {
-	char *marked_ptr, *val_ptr;
+	const char *marked_ptr, *val_ptr;
 
 	/*
 	 * Look for the marked character
diff --git a/lib/igt_core.c b/lib/igt_core.c
index d5dc5324d..b1d045161 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1141,7 +1141,7 @@ static int common_init(int *argc, char **argv,
 
 	/* Check for conflicts and calculate space for passed-in extra long options */
 	for  (extra_opt_count = 0; extra_long_opts && extra_long_opts[extra_opt_count].name; extra_opt_count++) {
-		char *conflicting_char;
+		const char *conflicting_char;
 
 		/* check for conflicts with standard long option values */
 		for (i = 0; long_options[i].name; i++) {
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 74a90c437..056eb2ca8 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -114,7 +114,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	char *p;
+	const char *p;
+	char *end;
 	ssize_t name_len;
 	int found = -1;
 	unsigned int i;
@@ -160,8 +161,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
 		goto out;
 
 	p++;
-	*val = strtoull(p, &p, 10);
-	p = (char *)ignore_space(p);
+	*val = strtoull(p, &end, 10);
+	p = ignore_space(end);
 	if (!*p)
 		goto out;
 
diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7905deb8d..1e3cc7757 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1555,7 +1555,7 @@ uint32_t igt_get_dc_counter(const char *dc_data)
 {
 	char *e;
 	long ret;
-	char *s = strchr(dc_data, ':');
+	const char *s = strchr(dc_data, ':');
 
 	igt_assert(s);
 	s++;
@@ -1586,9 +1586,9 @@ bool igt_support_dc6(int debugfs_fd)
  *
  * Searches for DC6 counter information in the DMC info buffer.
  */
-char *igt_get_dc6_counter(const char *buf)
+const char *igt_get_dc6_counter(const char *buf)
 {
-	char *str;
+	const char *str;
 
 	str = strstr(buf, "DC5 -> DC6 count");
 	if (!str)
@@ -1607,7 +1607,7 @@ char *igt_get_dc6_counter(const char *buf)
 uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag)
 {
 	char buf[4096];
-	char *str;
+	const char *str;
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
 
@@ -1669,7 +1669,7 @@ const char *igt_dc_state_name(int dc_flag)
  */
 void igt_require_dc_counter(int debugfs_fd, int dc_flag)
 {
-	char *str;
+	const char *str;
 	char buf[4096];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index cd9dceb1e..328875f9c 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -108,7 +108,7 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 void igt_pm_dpms_toggle(igt_output_t *output);
 uint32_t igt_get_dc_counter(const char *dc_data);
 bool igt_support_dc6(int debugfs_fd);
-char *igt_get_dc6_counter(const char *buf);
+const char *igt_get_dc6_counter(const char *buf);
 uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag);
 bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
 const char *igt_dc_state_name(int dc_flag);
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 5dd571a45..a4b92791c 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -120,7 +120,7 @@ dbg_get_status_section(const char *title, char **first, char **last)
 static bool
 dbg_has_line(const char *first, const char *last, const char *name)
 {
-	char *pos = strstr(first, name);
+	const char *pos = strstr(first, name);
 
 	return pos != NULL && pos < last;
 }
@@ -128,7 +128,7 @@ dbg_has_line(const char *first, const char *last, const char *name)
 static int
 dbg_get_int(const char *first, const char *last, const char *name)
 {
-	char *pos;
+	const char *pos;
 
 	pos = strstr(first, name);
 	igt_assert(pos != NULL);
@@ -137,13 +137,13 @@ dbg_get_int(const char *first, const char *last, const char *name)
 	pos += 2;
 	igt_assert(pos != last);
 
-	return strtol(pos, &pos, 10);
+	return strtol(pos, NULL, 10);
 }
 
 static bool
 dbg_get_bool(const char *first, const char *last, const char *name)
 {
-	char *pos;
+	const char *pos;
 
 	pos = strstr(first, name);
 	igt_assert(pos != NULL);
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 05960627c..52b494abf 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -102,7 +102,7 @@ wait_for_stall_on_fault(int drm_fd)
  * Helper to find named buffer address
  */
 
-static const char *
+static char *
 get_line(char **buf)
 {
 	char *ret, *eol;
@@ -123,7 +123,7 @@ get_line(char **buf)
 }
 
 static bool
-endswith(const char *str, const char *end)
+endswith(char *str, const char *end)
 {
 	char *p = strstr(str, end);
 
@@ -166,7 +166,7 @@ get_bo_addr(int drm_fd, const char *name)
 	 */
 
 	while (*p) {
-		const char *line = get_line(&p);
+		char *line = get_line(&p);
 
 		if (endswith(line, name)) {
 			uint64_t addr, dummy;
-- 
2.43.0

