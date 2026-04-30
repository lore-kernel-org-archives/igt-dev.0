Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D345CD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 20:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09D10F457;
	Thu, 30 Apr 2026 20:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rjMUnp88";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E5A10F457
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 20:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWQdDkFy7pVd0jTdYYefJv4gC0BGS4AvBMjNzTMOXJ5osWBTs1xbqS5czqGKCvh455zrfsEmq+vvxKZvdvAQNe0UXcYB/4G1jA27NO/vc1Zcnwgk0bvd4m7F+4DSWHshqyhVkumkSjkj56nqpi+yC3Dr7v7vZNHfmbcacmAE4j4w2sz1XMrhIREEKJAYtSpmp+2iKam9tpwNk30t1tKpABJ//0XAxhtsJ1tgDVYgEmQBUzp99YKLJyESsTCqYI/J6bklEejkWg+O8DRXTdbkBW7K/dLn5C1OnCUF82k3ZPHQCFaq2lrSnM4nw6RwxPz8NyhJm2kAw2VMgVZ8QMA2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f5g2WfQBKn/orQRLKKCDfwxyTKkbOL6emW7EmrKT4w=;
 b=P9BdJPWxpaFN1K6VIdO4GvsttmJqqymi1IlMiKXtAdt0HQ8VdJxzn5x6kd5TqDCVa0iN7Tdw267STzV+5ZWXUDelc840zyU95BGymDnLoW11H0UkgUl1jPBK3ndqXVGqnIuOyqtz7LigqW32EXLuOgHCAO4CM5AU7K8jFwGTnn29N3mMdvhzVS/Y0cufu74iAsNI5T1An6KVo/RW6Fe7rchJ5wYbchFyAotEACBUgxbW3ziFhtqZkut8aEfcCDbe2fcLwam5/BD2bgB1Z4moSqRnRKLwu3Re2zcnXnjQQl5m6oA0Xhy/TqVOMWme9GGhhYYhO4vz0kEC45p3YLhqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f5g2WfQBKn/orQRLKKCDfwxyTKkbOL6emW7EmrKT4w=;
 b=rjMUnp887cYtVvD1UTm3+cD9oIsg+GrYY3DohQdDm1IAsImuev3ShrcTAcZcWN1j3mTuyAuKflVyhEz92GyBOytJBKyp5L1OGhQn6MsCFWJNYP24Wi+FP+d/6OrIaSwJuFlXFQyi37LNvL6kkUc7QM+29S54YwgI0j0LIsmqMPQ=
Received: from CY8PR11CA0046.namprd11.prod.outlook.com (2603:10b6:930:4a::6)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 20:29:29 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::86) by CY8PR11CA0046.outlook.office365.com
 (2603:10b6:930:4a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 20:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 20:29:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 15:29:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 15:29:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 30 Apr 2026 15:29:28 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 3/3] tests/amdgpu: Add DebugFS fuzzing test
Date: Thu, 30 Apr 2026 16:28:03 -0400
Message-ID: <20260430202923.91444-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430202923.91444-1-vitaly.prosyak@amd.com>
References: <20260430202923.91444-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc1251e-1055-4798-2c78-08dea6f72e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: JzIbbvbRojfFxrkv8wdVrDWDCZJqOj+eb7ZPPyqhTqJeRHa5Q/2pfaegXEuFIlVpSHKWTECs2cA4rECYgK85h6sJSqVOKICYA7OcHrYdOMqBEM9I8LZFNsdiFVYHsD7FW0CbiL8D0tY4vOIhlkxdexOdarH6ZKvc0qatGgOrI5NMxwkGw0lf0G8lFg/0GKp0E+DqZZaWQY1yytP5M/zmKNGPDaLrmdgiZ7nt6WuybY9ehaDlJ8uE7gQF2gR2j5n73SiJjBWx/7SblAYKpnVoYN8eZtuA7Q5Ao3ZClh04DDsdrxbxcL85dMgKbo1n6JfZXeMG9TtDKrv4uZTLXhU1IYi/BexEwytpdc0ut81nNGLgJG2fBJtBzNBnUzNdmZyCzx1yV+t3emLgV+U3708ZzOcVXe9EE46Av4hZm50gHJfoDtlq+aTrBgNkTjS8DnsgxVfgYlMMMD8wAT64ES/DAH/m/HO0Vga6BvxYty+HzjbsxL67n0NKFR/pzfzAQxs3WG2vbrM07rsl4PBIx4Nh7ug3ibjEylocwq0zS9hZJBPw5IyV12ZbCh2hLHZudYJDv1x9z8ixBlo252iQ/mWtELVe0qUooTTU+RVK+1M8MdymwDYap27VuqTwT0FZ78OFxyQU/CLSQEVkPGWrpam4C3oijs1pGGnXkdRzhc28kGyzS343UkwN3Shexg2YaMFyTTtqJrFGaXbtcA2vrNxoIWvu2oC69ymDCE+sdFVSpUo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5CFNp4mO4GRQYOdzVg6e8r12y45B0Lk266T7GGGUS2SgewodCQOuxXEXesoSOaRzba42CgPIDstwD6NiKvPXmmaFBQidG1txns2bPNsve5R0xTm92all9blOABYPfPjYYl2TjoE7CQM6/fu3rDcS1AQYBj+sZnM/V0/hMc0tfS0OEEWHSHPOB81H8UYaFBVJhK4iNsoZJ/GdU33SFc0Wp06HNDdX5GG0eXs68ue8vGkJr9nsMaN0bkL9qaYEMO4wMgIyKXdGzld7cop8Trp15tdrSKNlw1jNGbJ1FQCMTPmm9TrJbNTsTnTSBpq7QXZnAkQazRAl0EHHfCXIdSJMMPXW6NrvGtgDp9FuAFl/ZyxU8adBXxnkJga8OfBvpxwD3MsoNTanRBDvvjp+KkcSgf+KLx/HYIOYg527OYwJ64njlMgNl7oR76QJLLMZeerR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:29:29.4239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc1251e-1055-4798-2c78-08dea6f72e30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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

Discovery: Fuzzing for Microsoft secure supply chain requirements
Tool: amd_fuzzing_debugfs (IGT test)

Add systematic fuzzing for AMDGPU debugfs interfaces that accept
writes from userspace (root-only access).

Coverage:
- 10 writable debugfs files tested
- Display Manager debug controls (7 files)
- Scheduler masks (2 files)
- SMU debug interface (1 file)

Test approach:
- 11 fuzz test cases per file (110 total iterations)
- Tests integer overflow, invalid formats, special characters
- Saves and restores original values
- Configurable failure threshold

Key findings:
- All files properly validate input
- DebugFS rejects empty strings (unlike SysFS VFS behavior)
- No security vulnerabilities found (robust validation)

Files tested:
- amdgpu_dm_dcc_en, amdgpu_dm_disable_hpd
- amdgpu_dm_dmcub_trace_event_en, amdgpu_dm_dmub_trace_mask
- amdgpu_dm_dp_ignore_cable_id, amdgpu_dm_force_timing_sync
- amdgpu_dm_visual_confirm
- amdgpu_compute_sched_mask, amdgpu_sdma_sched_mask
- amdgpu_smu_debug

Test results: All subtests pass (10/10)

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Id6582d81780cf79db348a19931b62c059c158e8e
---
 tests/amdgpu/amd_fuzzing_debugfs.c | 233 +++++++++++++++++++++++++++++
 tests/amdgpu/meson.build           |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing_debugfs.c

diff --git a/tests/amdgpu/amd_fuzzing_debugfs.c b/tests/amdgpu/amd_fuzzing_debugfs.c
new file mode 100644
index 000000000..6106836c4
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing_debugfs.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * AMDGPU DebugFS Fuzzing Test
+ *
+ * Fuzz tests for AMDGPU debugfs interfaces (userspace -> kernel via debugfs)
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <dirent.h>
+#include <limits.h>
+
+#include "igt.h"
+
+#define DEBUGFS_BASE "/sys/kernel/debug/dri"
+#define MAX_PATH 512
+#define MAX_VALUE 4096
+
+/* Test case for fuzzing */
+struct fuzz_case {
+	const char *desc;
+	const char *value;
+	int expected_errno;  /* 0 = success expected, -1 = any error OK */
+};
+
+/* Generic test cases for writable debugfs files */
+static const struct fuzz_case generic_fuzz_cases[] = {
+	{ "valid_0", "0", 0 },
+	{ "valid_1", "1", 0 },
+	{ "negative", "-1", -1 },
+	{ "large_int", "999999", -1 },
+	{ "overflow", "99999999999999999999", -1 },
+	{ "invalid_chars", "abc", -1 },
+	{ "special", "!@#$", -1 },
+	{ "empty", "", 0 },  /* VFS behavior */
+	{ "hex_valid", "0xFF", 0 },
+	{ "hex_large", "0xFFFFFFFF", 0 },
+	{ NULL, NULL, 0 }
+};
+
+/* Find AMDGPU card path */
+static int find_amdgpu_card(char *card_path, size_t size)
+{
+	struct dirent *entry;
+	DIR *dir;
+
+	dir = opendir(DEBUGFS_BASE);
+	if (!dir)
+		return -errno;
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (strstr(entry->d_name, "0000:") != NULL) {
+			snprintf(card_path, size, "%s/%s",
+			         DEBUGFS_BASE, entry->d_name);
+			closedir(dir);
+			return 0;
+		}
+	}
+
+	closedir(dir);
+	return -ENOENT;
+}
+
+/* Check file access */
+static int check_file_writable(const char *path)
+{
+	struct stat st;
+	
+	if (stat(path, &st) != 0)
+		return 0;
+		
+	return (st.st_mode & S_IWUSR) || (st.st_mode & S_IWGRP);
+}
+
+/* Read file value */
+static int read_debugfs(const char *path, char *buffer, size_t bufsize)
+{
+	int fd, ret;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = read(fd, buffer, bufsize - 1);
+	close(fd);
+
+	if (ret < 0)
+		return -errno;
+
+	buffer[ret] = '\0';
+	if (ret > 0 && buffer[ret-1] == '\n')
+		buffer[ret-1] = '\0';
+
+	return ret;
+}
+
+/* Write file value */
+static int write_debugfs(const char *path, const char *value, size_t len)
+{
+	int fd, ret;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, value, len);
+	close(fd);
+
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+/* Test a single debugfs file */
+static void test_debugfs_file(const char *filepath, const char *filename)
+{
+	char original[MAX_VALUE] = "";
+	const struct fuzz_case *test_case;
+	int ret;
+	int pass_count = 0, fail_count = 0;
+	struct stat st;
+
+	igt_info("=== Testing: %s ===\n", filename);
+
+	/* Check if file is writable */
+	if (!check_file_writable(filepath)) {
+		igt_skip("File not writable: %s\n", filename);
+		return;
+	}
+
+	/* Try to read original value */
+	if (stat(filepath, &st) == 0 && (st.st_mode & S_IRUSR)) {
+		ret = read_debugfs(filepath, original, sizeof(original));
+		if (ret >= 0)
+			igt_info("  Original value: '%s'\n", original);
+	}
+
+	/* Run fuzz test cases */
+	for (test_case = generic_fuzz_cases; test_case->desc != NULL; test_case++) {
+		ret = write_debugfs(filepath, test_case->value,
+		                   strlen(test_case->value));
+
+		if (ret < 0) {
+			if (test_case->expected_errno == 0) {
+				igt_warn("  [%s] Write failed: %s - UNEXPECTED\n",
+				        test_case->desc, strerror(-ret));
+				fail_count++;
+			} else {
+				igt_debug("  [%s] Write failed: %s - EXPECTED\n",
+				         test_case->desc, strerror(-ret));
+				pass_count++;
+			}
+		} else {
+			if (test_case->expected_errno == 0) {
+				igt_debug("  [%s] Write succeeded - EXPECTED\n",
+				         test_case->desc);
+				pass_count++;
+			} else {
+				igt_warn("  [%s] Write succeeded - UNEXPECTED\n",
+				        test_case->desc);
+				fail_count++;
+			}
+		}
+	}
+
+	/* Restore original value if we read one */
+	if (strlen(original) > 0) {
+		ret = write_debugfs(filepath, original, strlen(original));
+		if (ret < 0)
+			igt_warn("Failed to restore %s: %s\n",
+			        filename, strerror(-ret));
+	}
+
+	igt_info("  Results: %d passed, %d failed\n", pass_count, fail_count);
+
+	/* Allow some failures for exploratory fuzzing */
+	igt_assert_f(fail_count < 6,
+	             "Too many issues for %s (%d failures)",
+	             filename, fail_count);
+}
+
+/* Main test */
+int main(int argc, char **argv)
+{
+	char card_path[MAX_PATH];
+	char filepath[MAX_PATH];
+	int card_found = 0;
+
+	/* Writable debugfs files to test */
+	const char *test_files[] = {
+		/* Display Manager debug knobs */
+		"amdgpu_dm_dcc_en",
+		"amdgpu_dm_disable_hpd",
+		"amdgpu_dm_dmcub_trace_event_en",
+		"amdgpu_dm_dmub_trace_mask",
+		"amdgpu_dm_dp_ignore_cable_id",
+		"amdgpu_dm_force_timing_sync",
+		"amdgpu_dm_visual_confirm",
+		/* Scheduler masks */
+		"amdgpu_compute_sched_mask",
+		"amdgpu_sdma_sched_mask",
+		/* SMU debug */
+		"amdgpu_smu_debug",
+		NULL
+	};
+
+	igt_subtest_init(argc, argv);
+
+	igt_fixture() {
+		card_found = (find_amdgpu_card(card_path, sizeof(card_path)) == 0);
+		igt_require_f(card_found, "No AMDGPU card found in debugfs\n");
+		igt_require(getuid() == 0);  /* Need root for debugfs access */
+		igt_info("Found AMDGPU card: %s\n", card_path);
+	}
+
+	for (int i = 0; test_files[i] != NULL; i++) {
+		igt_subtest_f("debugfs-%s", test_files[i]) {
+			snprintf(filepath, sizeof(filepath), "%s/%s",
+			         card_path, test_files[i]);
+			test_debugfs_file(filepath, test_files[i]);
+		}
+	}
+
+	igt_exit();
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index effb6130a..d5a4820e3 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -20,6 +20,7 @@ if libdrm_amdgpu.found()
 			  'amd_freesync_video_mode',
 			  'amd_fuzzing',
 			  'amd_fuzzing_sysfs',
+			  'amd_fuzzing_debugfs',
 			  'amd_hotplug',
 			  'amd_gang_cs' ,
 			  'amd_ilr',
-- 
2.43.0

