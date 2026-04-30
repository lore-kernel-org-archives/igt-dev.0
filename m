Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEEECCFA13
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 20:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CA410F457;
	Thu, 30 Apr 2026 20:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DB70u7M6";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7010F457
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 20:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPiRg7cd7bZYN+NmDPmX3E8pKgFyCy4ByQlSojG5+MvN6JhQy3q+lhIC8WPxFxdBElLsxP6viarJGD2iUUXxk3158eszW3vsOs9uEq54xiAp0Mv1rIC60lZGUuSWJuqlBkkaqWVIMhHXjjjipqTjTc1Q+DxasXOriR+Tso+LUiBUX90G7EFp0LXjqI48OYg+L2XvNCA53Tp6xecPvu6q3VkNw0jsRB+oTghSiIC9g1WsUc1EDeaqG3oeiOyfSm4qb/j7vUF/56mHllsOyR6fzhG7Mw8U0B/LFdEBOQUYI2JIlL7HPaRVpy3hEA6+XUuOptSkPqC5DFpTYmyeBocY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km1EYwGc23jLnhq2+Rj/CTG5cgO0VXOiRehUMOkxEYo=;
 b=poQWO6BcdQQSaiiwdmwee11nCdWDIu5reSnSRYhHI1C3dQxfovNb4k5qNm+tA9TFVQfiwADcMFhNYNt56E30nipkClvS04MjB0EdBYb/Qtzzp23RidlyYrh7B6ebMl4wj0HAEunVxOH72UBugo27iIMyWfbPbjEpN2pyUkmZI9ksL96gWGpeJVIzAd64RqRAwqkQ+UftOq/jlVFzWeM8dvfaJ9JuPJQccsx3HgJSKt9QZpf8krHGTPLoOVDzWgMJzj4kHH5zEl6SximhMibS0C5mGJRb5dzZ+DdQCLhVdS7S78jtmBmm/qA4FTQYrWILszC/nIFjI8AoG2HXsHVqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km1EYwGc23jLnhq2+Rj/CTG5cgO0VXOiRehUMOkxEYo=;
 b=DB70u7M6nQsuP6yQoNEL82siJ3bajFZ7GPh+aSoAuezVQxwUoTrd6uDV4SVQmATAIdi9FRHlzBEp5nGljW3dIDT+EcLGQH6b1nfFZDmac/ipUamdiEUeliZYEBqJ49VR3HPQWPM4qi26amJkI9lxjZfDEGeK2d9wUy8MtB+EUJU=
Received: from SJ0PR03CA0096.namprd03.prod.outlook.com (2603:10b6:a03:333::11)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 20:29:31 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::f0) by SJ0PR03CA0096.outlook.office365.com
 (2603:10b6:a03:333::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 20:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 20:29:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 15:29:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 13:29:27 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 30 Apr 2026 15:29:26 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/3] tests/amdgpu: Add SysFS fuzzing test for power management
 interfaces
Date: Thu, 30 Apr 2026 16:28:01 -0400
Message-ID: <20260430202923.91444-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f23989-4628-42cf-3f9d-08dea6f72d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|18092099006|56012099003;
X-Microsoft-Antispam-Message-Info: FaAmB1E3WPXx/ukfLv5WRw7Lmp8mUI+AG4CDl1WKVnNoOXKRYQ2c5TYrEdr03mwHfibIif4gwllmoSU7kkrKzVZaHItI1RxY4Tfi0rcGHpPUnX2SY71vpc8o9H+m2/QTdmryavuyCHBKAIb3DhWo2MhW8ssVNnqLOMSZd/5jsRKZcCU1Hl46h/F9OwuVAWG+d6Ziyabwvk2R7P3l+RUu4x0NEFGDRyrGztJ9VliCjj5SP81iVnDzkwpS36dqfImcyeMora0LTTWjgWP27ecnPx1+hzAiCJRsL1Da5jd/CxMDaBEv3Iu8myQORyTbfKk3DWKKyYKld25C9J6tkm537aVk3o91V7qpFuG0QXIl2rA8rsIqoTfClFPkX611lWDj3o20zlgvat/z+L1ZQ4jlto8qLcvugjuyiyL13TV/JerXNK4cWq5/SxYJLMx1knIkcfNFe4HYs1V7VFc81JdlpSuEsLBUePd26qF5f1EnlNhpWQi/OSfMzYnfQot0Mo4mGnOW0nYW9DPXjiZJ1B/HSLYYwys7KFacL3nwTGjRUPRE949NICtjO57WJB2fEblAiUbpOT/Q41G5+E0p1dvcoS6hDiKfLb28FrI/LjHmjQIsHQw49znAW1JDH9IDlHs6rUY3ydq274BBX61cLOKrCnAtxYZgXQwwHa/c2gh4thNp4HgOnVlgarFAXz+7rgy4t1RCmOcNTsf+c9m0ESbx99xRuZeFmjBjtiWDWF/v4r4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(18092099006)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Amzb6Zxgxzd8rY+mRXjImZXDhyClCA2lZ2w/7AtXcfyzt14g2rcRg/BcjV4T2aluTsa7iteR322/GhCCIbEERLxu2rvmr5jjb9wD6JcsPlPpnSKjJU1vk/tu92K9MNvg3xpuTQRT4RQfmroYT2koudzBvsMveLdJxMUqq17ryZRuhLTwOeWtXRhGizUQ1CJOWEgd2wrBENvVB4761049/2FB56MTgRh794/RPARMD6KVssq2UdoPXfY8oiQ21kVTHO2LgcWFGR8O3s88s48s4j/1IvF3GI+Usak8cVgllZZomNUR/Yq3J4F2n5x1tqe5G2duB2/9KkNfWX/R/VLnAWSnhoEog/5BYD4ZQYgx4VsezLmBvsJoI5LzzAhrXON6gKxE+hU3pCXcEO8+vqplnBT3LVVr/6AAPG3d2v58T6kNFfXq2XA6DwRM0fmPjGKg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:29:28.2631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f23989-4628-42cf-3f9d-08dea6f72d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
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

Introduce amd_fuzzing_sysfs.c to fuzz AMDGPU kernel sysfs interfaces
that handle user input crossing trust boundaries (user space -> kernel
via sysfs writes).

This test addresses Microsoft secure supply chain requirements for
fuzzing data parsers responsible for handling data that crosses trust
boundaries, specifically focusing on non-admin user mode to kernel
mode communication via sysfs.

Coverage:
- 13 sysfs files across CRITICAL, HIGH, and MEDIUM risk levels
- pp_table binary blob upload (CRITICAL - firmware table corruption)
- Power management parsers (power_dpm_*, pp_dpm_*)
- Integer, string, multi-integer, and binary fuzzing techniques
- ~130+ fuzzing test iterations

Fuzzing methodology:
1. Integer fuzzing (19 cases): overflow, underflow, format strings
2. String fuzzing (13 cases): buffer overflow, injection attacks
3. Multi-int fuzzing (7 cases): invalid indices, malformed lists
4. Binary fuzzing (4 cases): corrupted PowerPlay tables

Files tested:
CRITICAL:
  - pp_table (binary PowerPlay table upload)

HIGH RISK:
  - power_dpm_force_performance_level (performance control)
  - power_dpm_state (power state control)
  - pp_dpm_sclk, pp_dpm_mclk, pp_dpm_fclk (clock controls)
  - pp_dpm_socclk, pp_dpm_pcie (SoC/PCIe controls)
  - pp_power_profile_mode (power profile)
  - pp_features (PowerPlay features)

MEDIUM RISK:
  - pp_force_state, thermal_throttling_logging (integer parsers)
  - reset_method (reset method selection)

Test approach:
- Save original value before fuzzing
- Attempt write with invalid data
- Verify kernel rejects invalid input (expected behavior)
- Restore original value after test
- Assert failure if too many invalid inputs accepted

Expected kernel behavior:
- Invalid inputs should be rejected with appropriate errno
- For pp_table, ALL invalid inputs must be rejected (CRITICAL)
- Failure threshold: <3 for parsers, 0 for binary blobs

Integration with KASAN/UBSAN:
Run with kernel configured with:
  CONFIG_KASAN=y, CONFIG_UBSAN=y, CONFIG_DEBUG_KMEMLEAK=y
to detect buffer overflows, use-after-free, integer overflows,
and memory leaks in sysfs parser functions.

Usage:
  sudo ./build/tests/amdgpu/amd_fuzzing_sysfs
  sudo ./build/tests/amdgpu/amd_fuzzing_sysfs --run-subtest sysfs-binary-pp_table

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Id0f55508c596c36c240b6ab679716acfe9b80c47
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 668 +++++++++++++++++++++++++++++++
 1 file changed, 668 insertions(+)
 create mode 100644 tests/amdgpu/amd_fuzzing_sysfs.c

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sysfs.c
new file mode 100644
index 000000000..e4b584297
--- /dev/null
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -0,0 +1,668 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * AMDGPU SysFS Fuzzing Test
+ *
+ * Fuzz tests for AMDGPU sysfs interfaces that cross trust boundaries
+ * (user space -> kernel via sysfs writes).
+ *
+ * Focus areas:
+ * - Power management interfaces (pp_table, power_dpm_*)
+ * - Performance tuning (pp_dpm_*, pp_od_clk_voltage)
+ * - Integer parsers (overflow, underflow, invalid formats)
+ * - String parsers (overflow, special chars, format strings)
+ * - Binary blob uploads (pp_table corruption)
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#define AMDGPU_SYSFS_BASE "/sys/class/drm"
+#define MAX_SYSFS_PATH 512
+#define MAX_SYSFS_VALUE 4096
+
+/* Sysfs file type classification */
+enum sysfs_file_type {
+	SYSFS_TYPE_UNKNOWN,
+	SYSFS_TYPE_INTEGER,      /* Single integer value */
+	SYSFS_TYPE_STRING,       /* String value (enums, states) */
+	SYSFS_TYPE_MULTI_INT,    /* Multiple integers (pp_dpm_*) */
+	SYSFS_TYPE_BINARY,       /* Binary blob (pp_table) */
+	SYSFS_TYPE_READONLY,     /* Read-only, no fuzzing */
+};
+
+/* Sysfs file risk assessment */
+enum sysfs_risk_level {
+	RISK_LOW,      /* Read-only or low impact */
+	RISK_MEDIUM,   /* Write-only, limited parsing */
+	RISK_HIGH,     /* Complex parser (string, multi-int) */
+	RISK_CRITICAL, /* Binary blob, direct HW control */
+};
+
+/* Sysfs file descriptor */
+struct sysfs_file_info {
+	const char *name;
+	const char *rel_path;  /* Relative to card device dir */
+	enum sysfs_file_type type;
+	enum sysfs_risk_level risk;
+	bool writable;
+	bool test_enabled;     /* Enable/disable specific tests */
+};
+
+/* AMDGPU sysfs files to fuzz */
+static const struct sysfs_file_info amdgpu_sysfs_files[] = {
+	/* CRITICAL RISK - Binary blob upload */
+	{
+		.name = "pp_table",
+		.rel_path = "device/pp_table",
+		.type = SYSFS_TYPE_BINARY,
+		.risk = RISK_CRITICAL,
+		.writable = true,
+		.test_enabled = true,
+	},
+
+	/* HIGH RISK - Complex parsers */
+	{
+		.name = "power_dpm_force_performance_level",
+		.rel_path = "device/power_dpm_force_performance_level",
+		.type = SYSFS_TYPE_STRING,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "power_dpm_state",
+		.rel_path = "device/power_dpm_state",
+		.type = SYSFS_TYPE_STRING,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_dpm_sclk",
+		.rel_path = "device/pp_dpm_sclk",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_dpm_mclk",
+		.rel_path = "device/pp_dpm_mclk",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_dpm_fclk",
+		.rel_path = "device/pp_dpm_fclk",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_dpm_socclk",
+		.rel_path = "device/pp_dpm_socclk",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_dpm_pcie",
+		.rel_path = "device/pp_dpm_pcie",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_power_profile_mode",
+		.rel_path = "device/pp_power_profile_mode",
+		.type = SYSFS_TYPE_STRING,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_features",
+		.rel_path = "device/pp_features",
+		.type = SYSFS_TYPE_MULTI_INT,
+		.risk = RISK_HIGH,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "pp_force_state",
+		.rel_path = "device/pp_force_state",
+		.type = SYSFS_TYPE_INTEGER,
+		.risk = RISK_MEDIUM,
+		.writable = true,
+		.test_enabled = true,
+	},
+
+	/* MEDIUM RISK - Integer parsers */
+	{
+		.name = "thermal_throttling_logging",
+		.rel_path = "device/thermal_throttling_logging",
+		.type = SYSFS_TYPE_INTEGER,
+		.risk = RISK_MEDIUM,
+		.writable = true,
+		.test_enabled = true,
+	},
+	{
+		.name = "reset_method",
+		.rel_path = "device/reset_method",
+		.type = SYSFS_TYPE_STRING,
+		.risk = RISK_MEDIUM,
+		.writable = true,
+		.test_enabled = true,
+	},
+
+	/* LOW RISK - Read-only info disclosure */
+	{
+		.name = "gpu_busy_percent",
+		.rel_path = "device/gpu_busy_percent",
+		.type = SYSFS_TYPE_INTEGER,
+		.risk = RISK_LOW,
+		.writable = false,
+		.test_enabled = false,
+	},
+	{
+		.name = "mem_busy_percent",
+		.rel_path = "device/mem_busy_percent",
+		.type = SYSFS_TYPE_INTEGER,
+		.risk = RISK_LOW,
+		.writable = false,
+		.test_enabled = false,
+	},
+	{
+		.name = "vbios_version",
+		.rel_path = "device/vbios_version",
+		.type = SYSFS_TYPE_STRING,
+		.risk = RISK_LOW,
+		.writable = false,
+		.test_enabled = false,
+	},
+
+	/* Sentinel */
+	{ .name = NULL }
+};
+
+/* Fuzzing test case for integer values */
+struct int_fuzz_case {
+	const char *desc;
+	const char *value_str;
+	int expected_errno;  /* 0 = success expected, -1 = any error OK */
+};
+
+static const struct int_fuzz_case int_fuzz_cases[] = {
+	{ "zero", "0", -1 },
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
+	{ "null_byte", "123\\x00456", -1 },
+	{ "newline", "123\\n456", -1 },
+	{ "whitespace_only", "   ", -1 },
+	{ "empty", "", -1 },
+	{ "hex_notation", "0xFFFFFFFF", -1 },
+	{ "octal_notation", "0777", -1 },
+	{ NULL, NULL, 0 }
+};
+
+/* Fuzzing test case for string values */
+struct string_fuzz_case {
+	const char *desc;
+	const char *value;
+	int expected_errno;
+};
+
+static const struct string_fuzz_case string_fuzz_cases[] = {
+	{ "empty_string", "", -1 },
+	{ "whitespace_only", "     ", -1 },
+	{ "very_long", "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", -1 },
+	{ "format_string_attack", "%s%s%s%s%s%s%s%s", -1 },
+	{ "null_bytes", "auto\\x00manual", -1 },
+	{ "newlines", "auto\\n\\n\\nmanual", -1 },
+	{ "special_chars", "!@#$%^&*()", -1 },
+	{ "unicode", "café", -1 },
+	{ "path_traversal", "../../etc/passwd", -1 },
+	{ "invalid_enum", "INVALID_VALUE_12345", -1 },
+	{ "case_mismatch", "AUTO", -1 },
+	{ "buffer_overflow_attempt",
+	  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
+	  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
+	  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
+	  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", -1 },
+	{ NULL, NULL, 0 }
+};
+
+/* Find DRM card for AMDGPU */
+static int find_amdgpu_card(char *card_path, size_t path_len)
+{
+	DIR *dir;
+	struct dirent *entry;
+	char vendor_path[MAX_SYSFS_PATH];
+	char vendor[16];
+	int fd;
+
+	dir = opendir(AMDGPU_SYSFS_BASE);
+	if (!dir) {
+		igt_warn("Cannot open %s: %s\\n", AMDGPU_SYSFS_BASE, strerror(errno));
+		return -1;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (strncmp(entry->d_name, "card", 4) != 0)
+			continue;
+
+		/* Skip card1-DP-1 etc, only want card0, card1 etc */
+		if (strchr(entry->d_name + 4, '-'))
+			continue;
+
+		/* Check if this is an AMD GPU */
+		snprintf(vendor_path, sizeof(vendor_path),
+		         "%s/%s/device/vendor", AMDGPU_SYSFS_BASE, entry->d_name);
+
+		fd = open(vendor_path, O_RDONLY);
+		if (fd < 0)
+			continue;
+
+		if (read(fd, vendor, sizeof(vendor)) > 0) {
+			/* AMD vendor ID: 0x1002 */
+			if (strstr(vendor, "0x1002")) {
+				snprintf(card_path, path_len, "%s/%s",
+				         AMDGPU_SYSFS_BASE, entry->d_name);
+				close(fd);
+				closedir(dir);
+				igt_info("Found AMDGPU card: %s\\n", card_path);
+				return 0;
+			}
+		}
+		close(fd);
+	}
+
+	closedir(dir);
+	return -1;
+}
+
+/* Read current value from sysfs file */
+static int sysfs_read_value(const char *card_path, const char *rel_path,
+                             char *buf, size_t buf_len)
+{
+	char full_path[MAX_SYSFS_PATH];
+	int fd, ret;
+
+	snprintf(full_path, sizeof(full_path), "%s/%s", card_path, rel_path);
+
+	fd = open(full_path, O_RDONLY);
+	if (fd < 0) {
+		igt_debug("Cannot open %s for read: %s\\n", full_path, strerror(errno));
+		return -errno;
+	}
+
+	ret = read(fd, buf, buf_len - 1);
+	if (ret > 0) {
+		buf[ret] = '\\0';
+		/* Remove trailing newline */
+		if (ret > 0 && buf[ret - 1] == '\\n')
+			buf[ret - 1] = '\\0';
+	} else {
+		buf[0] = '\\0';
+	}
+
+	close(fd);
+	return ret;
+}
+
+/* Write value to sysfs file and check result */
+static int sysfs_write_value(const char *card_path, const char *rel_path,
+                              const char *value, size_t value_len)
+{
+	char full_path[MAX_SYSFS_PATH];
+	int fd, ret;
+
+	snprintf(full_path, sizeof(full_path), "%s/%s", card_path, rel_path);
+
+	fd = open(full_path, O_WRONLY);
+	if (fd < 0) {
+		return -errno;
+	}
+
+	ret = write(fd, value, value_len);
+	close(fd);
+
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+/* Restore original value */
+static void sysfs_restore_value(const char *card_path, const char *rel_path,
+                                const char *original_value)
+{
+	int ret;
+
+	if (!original_value || original_value[0] == '\\0')
+		return;
+
+	ret = sysfs_write_value(card_path, rel_path, original_value,
+	                        strlen(original_value));
+	if (ret < 0) {
+		igt_warn("Failed to restore %s to '%s': %s\\n",
+		         rel_path, original_value, strerror(-ret));
+	}
+}
+
+/* Test integer fuzzing on a sysfs file */
+static void test_sysfs_integer_fuzzing(const char *card_path,
+                                       const struct sysfs_file_info *file)
+{
+	char original_value[MAX_SYSFS_VALUE];
+	const struct int_fuzz_case *test_case;
+	int ret;
+	int pass_count = 0, fail_count = 0;
+
+	igt_info("=== Testing INTEGER fuzzing: %s ===\\n", file->name);
+
+	/* Save original value */
+	ret = sysfs_read_value(card_path, file->rel_path,
+	                       original_value, sizeof(original_value));
+	if (ret < 0) {
+		igt_skip("Cannot read original value from %s\\n", file->name);
+		return;
+	}
+
+	igt_info("  Original value: '%s'\\n", original_value);
+
+	/* Run fuzz test cases */
+	for (test_case = int_fuzz_cases; test_case->desc != NULL; test_case++) {
+		ret = sysfs_write_value(card_path, file->rel_path,
+		                       test_case->value_str,
+		                       strlen(test_case->value_str));
+
+		if (ret < 0) {
+			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\\n",
+			         test_case->desc, strerror(-ret), -ret);
+			pass_count++;
+		} else {
+			/* Write succeeded - check if it was supposed to */
+			if (test_case->expected_errno == 0) {
+				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\\n",
+				         test_case->desc, ret);
+				pass_count++;
+			} else {
+				igt_warn("  [%s] Write succeeded (ret=%d) - UNEXPECTED! "
+				         "Kernel accepted invalid value: '%s'\\n",
+				         test_case->desc, ret, test_case->value_str);
+				fail_count++;
+			}
+		}
+	}
+
+	/* Restore original value */
+	sysfs_restore_value(card_path, file->rel_path, original_value);
+
+	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+
+	/* We expect the kernel to reject most invalid inputs */
+	/* If too many invalid inputs are accepted, that's a bug */
+	igt_assert_f(fail_count < 3,
+	             "Too many invalid inputs accepted for %s (%d failures)",
+	             file->name, fail_count);
+}
+
+/* Test string fuzzing on a sysfs file */
+static void test_sysfs_string_fuzzing(const char *card_path,
+                                      const struct sysfs_file_info *file)
+{
+	char original_value[MAX_SYSFS_VALUE];
+	const struct string_fuzz_case *test_case;
+	int ret;
+	int pass_count = 0, fail_count = 0;
+
+	igt_info("=== Testing STRING fuzzing: %s ===\\n", file->name);
+
+	/* Save original value */
+	ret = sysfs_read_value(card_path, file->rel_path,
+	                       original_value, sizeof(original_value));
+	if (ret < 0) {
+		igt_skip("Cannot read original value from %s\\n", file->name);
+		return;
+	}
+
+	igt_info("  Original value: '%s'\\n", original_value);
+
+	/* Run fuzz test cases */
+	for (test_case = string_fuzz_cases; test_case->desc != NULL; test_case++) {
+		ret = sysfs_write_value(card_path, file->rel_path,
+		                       test_case->value,
+		                       strlen(test_case->value));
+
+		if (ret < 0) {
+			igt_debug("  [%s] Write failed: %s (errno=%d) - EXPECTED\\n",
+			         test_case->desc, strerror(-ret), -ret);
+			pass_count++;
+		} else {
+			if (test_case->expected_errno == 0) {
+				igt_debug("  [%s] Write succeeded (ret=%d) - EXPECTED\\n",
+				         test_case->desc, ret);
+				pass_count++;
+			} else {
+				igt_warn("  [%s] Write succeeded (ret=%d) - UNEXPECTED! "
+				         "Kernel accepted invalid value\\n",
+				         test_case->desc, ret);
+				fail_count++;
+			}
+		}
+	}
+
+	/* Restore original value */
+	sysfs_restore_value(card_path, file->rel_path, original_value);
+
+	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+
+	igt_assert_f(fail_count < 3,
+	             "Too many invalid inputs accepted for %s (%d failures)",
+	             file->name, fail_count);
+}
+
+/* Test multi-integer fuzzing (pp_dpm_* files) */
+static void test_sysfs_multi_int_fuzzing(const char *card_path,
+                                         const struct sysfs_file_info *file)
+{
+	char original_value[MAX_SYSFS_VALUE];
+	int ret;
+	int pass_count = 0, fail_count = 0;
+
+	igt_info("=== Testing MULTI-INT fuzzing: %s ===\\n", file->name);
+
+	/* Save original value */
+	ret = sysfs_read_value(card_path, file->rel_path,
+	                       original_value, sizeof(original_value));
+	if (ret < 0) {
+		igt_skip("Cannot read original value from %s\\n", file->name);
+		return;
+	}
+
+	igt_info("  Original value: '%s'\\n", original_value);
+
+	/* Test cases specific to pp_dpm_* files (bitmask format like "0 1 2 3") */
+	const char *test_cases[] = {
+		"999",           /* Out of range index */
+		"-1",            /* Negative index */
+		"0 1 2 999",     /* Mixed valid/invalid */
+		"a b c",         /* Non-numeric */
+		"",              /* Empty */
+		"0 0 0 0 0 0 0 0 0 0",  /* Many values */
+		"9999999999999999999",  /* Overflow */
+		NULL
+	};
+
+	for (int i = 0; test_cases[i] != NULL; i++) {
+		ret = sysfs_write_value(card_path, file->rel_path,
+		                       test_cases[i], strlen(test_cases[i]));
+
+		if (ret < 0) {
+			igt_debug("  [case %d: '%s'] Write failed: %s - EXPECTED\\n",
+			         i, test_cases[i], strerror(-ret));
+			pass_count++;
+		} else {
+			igt_warn("  [case %d: '%s'] Write succeeded - UNEXPECTED!\\n",
+			         i, test_cases[i]);
+			fail_count++;
+		}
+	}
+
+	/* Restore original value */
+	sysfs_restore_value(card_path, file->rel_path, original_value);
+
+	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+
+	igt_assert_f(fail_count < 2,
+	             "Too many invalid inputs accepted for %s (%d failures)",
+	             file->name, fail_count);
+}
+
+/* Test binary blob fuzzing (pp_table) */
+static void test_sysfs_binary_fuzzing(const char *card_path,
+                                      const struct sysfs_file_info *file)
+{
+	char original_value[MAX_SYSFS_VALUE];
+	unsigned char fuzz_data[4096];
+	int ret;
+	int pass_count = 0, fail_count = 0;
+
+	igt_info("=== Testing BINARY fuzzing: %s ===\\n", file->name);
+
+	/* Save original value if possible */
+	ret = sysfs_read_value(card_path, file->rel_path,
+	                       original_value, sizeof(original_value));
+	if (ret < 0) {
+		igt_info("  Cannot read original binary value (expected for pp_table)\\n");
+		original_value[0] = '\\0';
+	}
+
+	/* Test case 1: All zeros */
+	memset(fuzz_data, 0, sizeof(fuzz_data));
+	ret = sysfs_write_value(card_path, file->rel_path,
+	                       (char *)fuzz_data, 256);
+	if (ret < 0) {
+		igt_debug("  [all_zeros] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		pass_count++;
+	} else {
+		igt_warn("  [all_zeros] Write succeeded - POTENTIAL ISSUE\\n");
+		fail_count++;
+	}
+
+	/* Test case 2: All 0xFF */
+	memset(fuzz_data, 0xFF, sizeof(fuzz_data));
+	ret = sysfs_write_value(card_path, file->rel_path,
+	                       (char *)fuzz_data, 256);
+	if (ret < 0) {
+		igt_debug("  [all_0xFF] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		pass_count++;
+	} else {
+		igt_warn("  [all_0xFF] Write succeeded - POTENTIAL ISSUE\\n");
+		fail_count++;
+	}
+
+	/* Test case 3: Random data */
+	for (int i = 0; i < (int)sizeof(fuzz_data); i++)
+		fuzz_data[i] = rand() & 0xFF;
+	ret = sysfs_write_value(card_path, file->rel_path,
+	                       (char *)fuzz_data, 512);
+	if (ret < 0) {
+		igt_debug("  [random_data] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		pass_count++;
+	} else {
+		igt_warn("  [random_data] Write succeeded - POTENTIAL ISSUE\\n");
+		fail_count++;
+	}
+
+	/* Test case 4: Zero length */
+	ret = sysfs_write_value(card_path, file->rel_path, (char *)fuzz_data, 0);
+	if (ret < 0) {
+		igt_debug("  [zero_length] Write failed: %s - EXPECTED\\n", strerror(-ret));
+		pass_count++;
+	} else {
+		igt_debug("  [zero_length] Write succeeded (ret=%d)\\n", ret);
+		pass_count++;
+	}
+
+	/* Restore is difficult for binary files, skip */
+	igt_info("  Results: %d passed, %d failed\\n", pass_count, fail_count);
+
+	/* For pp_table, we expect ALL invalid inputs to be rejected */
+	igt_assert_f(fail_count == 0,
+	             "Binary blob %s accepted invalid data (%d failures) - CRITICAL BUG!",
+	             file->name, fail_count);
+}
+
+/* Main test: fuzz all sysfs files */
+igt_main
+{
+	char card_path[MAX_SYSFS_PATH];
+	const struct sysfs_file_info *file;
+	int card_found = 0;
+
+	igt_fixture {
+		card_found = (find_amdgpu_card(card_path, sizeof(card_path)) == 0);
+		igt_require_f(card_found, "No AMDGPU card found\\n");
+		igt_require(getuid() == 0);  /* Need root for write access */
+	}
+
+	for (file = amdgpu_sysfs_files; file->name != NULL; file++) {
+		if (!file->test_enabled || !file->writable)
+			continue;
+
+		switch (file->type) {
+		case SYSFS_TYPE_INTEGER:
+			igt_subtest_f("sysfs-integer-%s", file->name)
+				test_sysfs_integer_fuzzing(card_path, file);
+			break;
+
+		case SYSFS_TYPE_STRING:
+			igt_subtest_f("sysfs-string-%s", file->name)
+				test_sysfs_string_fuzzing(card_path, file);
+			break;
+
+		case SYSFS_TYPE_MULTI_INT:
+			igt_subtest_f("sysfs-multiint-%s", file->name)
+				test_sysfs_multi_int_fuzzing(card_path, file);
+			break;
+
+		case SYSFS_TYPE_BINARY:
+			igt_subtest_f("sysfs-binary-%s", file->name)
+				test_sysfs_binary_fuzzing(card_path, file);
+			break;
+
+		default:
+			break;
+		}
+	}
+}
-- 
2.43.0

