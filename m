Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD16C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 11:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A0510E694;
	Tue, 18 Feb 2025 11:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tvwcUC8G";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBC10E694
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 11:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/oLIwz07tRg5csFvJ3p1v4zPZeBlfC3fqJ/ESh0k9ZOMTdZWSXPQJngjbKtfNC0sLmFeGzRH2ACt43w5gC6MXz3YURrKlVEDxE9566eJfLkeU22F9qdoNY6ilb8Aecn9IFVxtB9kmtHsNqOyiFSTnT+rGdDWlnCGxPLHCkyoXY1OWsFZqLT+rN8tXNaqoMLvhvghADHDi5EGXmx0C2chz9jMQNxPKMXfdH6QBnjl1ohyYiIYKxTuyQaucquCWT/jkY3YKTSlRcl7o/8t2IjiLiV7AiD4qlIVUP8vm+CaDjGDD5mtUYCCAuNhr0PYKBX0Dh7nFQKJWhWg8vBzawIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3UPB+1kQ2yddlce40ej7H9QTnIuBTQebPrMfbL5GJ8=;
 b=k/CUTf4th7IzGY8GcqvWZa2sqm7EwSccPNl/uvHZpITTGQOSl6YSGEXy79G3T6RstZnEfegQEE7YppOtCz7Bd3BqbHwy2z4b4z4URM38XzcXzIZ9jQKmbtBcIUxXIXhp5gHw7rkztYQFL/jXSQv2Y8UpRPPAnv4BnB/kOj6DtxGldycE8rVfyH0vyIe0J0/gFooUdCew40N0CuY5vXJ8BNmNv9WSawHkjeLOYYcG3voO2agWHbxJfnsNSgX1oO8YKpHIqqw58qu2TQ7vuCtV7VTP3InsBxfAzZZA0cU/2aEGfL1eTJU+bXLTClc1//Y4ceWmvL8t8t0RAEYjaVWmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3UPB+1kQ2yddlce40ej7H9QTnIuBTQebPrMfbL5GJ8=;
 b=tvwcUC8GmQs6cRKWSsI8QnjUhRy6V5GfnkYXiLxStbQ4j0EmB44WcM9PCJ38ofO0hqTA+xaAQFL+Yq4lyIofiwK3+ZmOuWP7cpvnBH2CGGASu/bp4kKs4Ouqy1PWrWZX4se3rqTHG7lUqwAIBnvrwXWQ2jxWMPBMJ+Tfnk1Zx84=
Received: from DM6PR05CA0065.namprd05.prod.outlook.com (2603:10b6:5:335::34)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 11:43:47 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::78) by DM6PR05CA0065.outlook.office365.com
 (2603:10b6:5:335::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11 via Frontend Transport; Tue,
 18 Feb 2025 11:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 11:43:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 05:43:44 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 05:43:44 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] lib/amd: add memleak functions
Date: Tue, 18 Feb 2025 06:43:41 -0500
Message-ID: <20250218114341.122653-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: c97f33a6-fa2e-43ae-6527-08dd501180b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6nmjwj1PRnVmHoz8NzFAOgEcccp9AzKqsgMctihvZg7nvejlFyauVJ5c5QLr?=
 =?us-ascii?Q?vuO3TQOXJAqcHidqnR77BRA1UoSXyGij0ceh4LBDyIzuLjF70m7HrFP8roj/?=
 =?us-ascii?Q?t1lszknH3MrbKe+CfJmxNgM3FDX1eQthxDrFCSs49qFnoJwD6juLgo5CakGR?=
 =?us-ascii?Q?rFeRYK6QDIPyHqIzQEvQtjuH+cd5WigI6Lcc67LoRU9YbnLDCEreaQF3A1l9?=
 =?us-ascii?Q?IXjqnGAYGNfuIDG0m+zq2e4jStL/QDS2smS4eZxqxDh5h+JjHhRNugzeA40w?=
 =?us-ascii?Q?yrWLeNYOFd66XXz64In5Y3Evzo2IcPZyytt9JdRDtCClmbEdjG6jOOSVOL5l?=
 =?us-ascii?Q?IrizIaWlsB2e8bvghY6+Y/gPCkAry3Q+VQytp9rX1aI1LhFggu2RCnACYSb7?=
 =?us-ascii?Q?Qisn5lIbgigou/0PF9oewOrpqBJ3TpvvjNMh3QWoK3cvisfv5/cLeKYERbqb?=
 =?us-ascii?Q?GfTkY3vQ+YO2mxvnHE3P0MBy1VvYeLWRr7gi0htQ6stUJSh2YLaD5sHRmp8s?=
 =?us-ascii?Q?f7euIlbgmHGn0GAgVGexPprMHLzG4YlAAeF5Tem+f8JM4UECDblvYOmA4gf1?=
 =?us-ascii?Q?vW3GYtl44A63bFWhzYhmGcQ4QyTpI8+iREusDqiWTDdBJEFSmPdmagd2jbgd?=
 =?us-ascii?Q?60D73lRZzbhhJ6707R1cWLHHfj8IXTT8LlJfrCR7wC3I7WcvL9U2NkAhZ8kR?=
 =?us-ascii?Q?Qw3UYZ2EnL+JjqqyTaei05/pGvniXk3vDQb+sM9jiN0pPQ5xZZ25WcpGN+6Q?=
 =?us-ascii?Q?OTWdmBSvbfCTD5fT+I/L+M11ISj1UwOz9GyB8GlyZ447JNx5oJ6cHQvDCBei?=
 =?us-ascii?Q?ogIa3f1qD87EHkJi2oYlNSsL7ClYbAfzoIjw5PviiubTMUeNUz0uwzSGqfEU?=
 =?us-ascii?Q?COVplqFqomYrjEldD7uleeKOqU9iGjLxiuegii3SV3Ssa/mI3Z1MhHLVytV2?=
 =?us-ascii?Q?qwWEd9JOsAXl0eH45zF92mBxvzoiseWzDA+UQCBQa4guNHE4bH/cYegb3mHJ?=
 =?us-ascii?Q?hhHo5Kiih5pjcFuuVlGdMSlHRONie3eGMk6ojh2+capDv13OEviOmOl+1fDl?=
 =?us-ascii?Q?jAiIqBI1tcmeAlUdlphx9qMsB26bP0Jq5QB854a0Eiu46/Z3oXwRVkcNLPuB?=
 =?us-ascii?Q?/g29ZeNTgPKzbWT/0Vp7ZgxBiWuPfud6zlx6r+31Uni874qKcKv5mY927cTq?=
 =?us-ascii?Q?OyVslz1BRm5Ze36o5QylV+94UN8aY/nqz/j5gRwEqaABUqz5bmrIWJwY75oQ?=
 =?us-ascii?Q?i2HSeWJFJdYVI+xogFrjma8zsrXK9OcYE37xHZRmi06toQnLm0TS+S41kjRN?=
 =?us-ascii?Q?XebwxqMIpDVs9PlMdCmEG5KTe4h6A2o+bdSucemLQZj4jXgIidwafO8Y81J3?=
 =?us-ascii?Q?kNWZMX9gojs1Hmn7Y7E32TwfuZ27lTOh0GQ/5sQJ5w/pMi7IC11RI5OJsQtR?=
 =?us-ascii?Q?Veg+HjZaeHopFCEEIzKIQKZpQzO2o/EPs82E0U6u3lYPNzQr+IRg88TjTqjn?=
 =?us-ascii?Q?G/SBl6izg3lSo+4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 11:43:45.8757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97f33a6-fa2e-43ae-6527-08dd501180b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013
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

refactor memory leak functions and add
them to the library for reuse across different tests.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_mem_leak.h   |  17 ++++++
 lib/meson.build             |   1 +
 tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
 4 files changed, 135 insertions(+), 83 deletions(-)
 create mode 100644 lib/amdgpu/amd_mem_leak.c
 create mode 100644 lib/amdgpu/amd_mem_leak.h

diff --git a/lib/amdgpu/amd_mem_leak.c b/lib/amdgpu/amd_mem_leak.c
new file mode 100644
index 000000000..a367b4eab
--- /dev/null
+++ b/lib/amdgpu/amd_mem_leak.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <fcntl.h>
+#include "igt.h"
+#include "amd_mem_leak.h"
+
+
+enum mem_leak_cmd {
+	CMD_SCAN = 0, /* as index */
+	CMD_CLEAR = 1,
+	CMD_MAX,
+};
+
+/* return non zero fp write successfully or null if failure */
+static
+FILE *mem_leak_cmd(enum mem_leak_cmd cmd)
+{
+	const struct mem_leak_cmd_arr {
+		const char *str_cmd;
+		enum mem_leak_cmd cmd;
+	} memleak_arr[] = {
+		{"scan",	CMD_SCAN	},
+		{"clear",	CMD_CLEAR	},
+		{"",		CMD_MAX		},
+		{NULL, 0}
+	};
+
+	FILE *fp;
+	int len;
+
+	fp = fopen("/sys/kernel/debug/kmemleak", "r+");
+	if (fp) {
+		len = strlen(memleak_arr[cmd].str_cmd);
+		if (fwrite(memleak_arr[cmd].str_cmd, 1, len, fp) != len) {
+			fclose(fp);
+			fp = NULL;
+		}
+	}
+
+	return fp;
+}
+
+/* return True if scan successfully written to kmemleak */
+static
+bool send_scan_memleak(void)
+{
+	FILE *fp;
+
+	fp = mem_leak_cmd(CMD_SCAN);
+	if (fp != NULL) {
+		fclose(fp);
+		return true;
+	}
+	return false;
+}
+
+/* return True if clear successfully sent to kmemleak */
+static
+bool send_clear_memleak(void)
+{
+	FILE *fp;
+
+	fp = mem_leak_cmd(CMD_CLEAR);
+	if (fp != NULL) {
+		fclose(fp);
+		return true;
+	}
+	return false;
+}
+
+/* return true if kmemleak is enabled and then clear earlier leak records */
+bool clear_memleak(bool is_more_than_one)
+{
+	if (!send_scan_memleak() || !send_clear_memleak())
+		return false;
+
+	if (is_more_than_one == true) {
+		if (!send_scan_memleak() || !send_clear_memleak())
+			return false;
+	}
+
+	return true;
+}
+
+/* return true if kmemleak did not pick up any memory leaks */
+bool is_no_memleak(void)
+{
+	FILE *fp;
+	const char *buf[1];
+	char read_buf[1024];
+
+	fp = mem_leak_cmd(CMD_SCAN);
+	if (fp != NULL) {
+		/* read back to see if any leak */
+		if (fread(buf, 1, 1, fp) == 0) {
+			fclose(fp);
+			return true;
+		}
+	}
+
+	/* Dump contents of kmemleak */
+	fseek(fp, 0L, SEEK_SET);
+	while (fgets(read_buf, sizeof(read_buf) - 1, fp) != NULL)
+		igt_info("MEM_LEAK: %s", read_buf);
+
+	fclose(fp);
+	return false;
+}
diff --git a/lib/amdgpu/amd_mem_leak.h b/lib/amdgpu/amd_mem_leak.h
new file mode 100644
index 000000000..5de4045a9
--- /dev/null
+++ b/lib/amdgpu/amd_mem_leak.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+#ifndef AMD_MEM_LEAK_H
+#define AMD_MEM_LEAK_H
+
+#include <stdio.h>
+#include <amdgpu.h>
+#include "amd_ip_blocks.h"
+
+/* return true if kmemleak is enabled and then clear earlier leak records */
+bool clear_memleak(bool is_more_than_one);
+
+/* return true if kmemleak did not pick up any memory leaks */
+bool is_no_memleak(void);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 9fffdd3c6..d01c90df9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,6 +164,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_shared_process.c',
 		'amdgpu/xalloc.h',
 		'amdgpu/amd_cp_dma.c',
+		'amdgpu/amd_mem_leak.c',
 		'amdgpu/amd_mmd_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index e4a4b5c47..74f887bf9 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -23,6 +23,7 @@
 #include "igt.h"
 #include "igt_amd.h"
 #include <fcntl.h>
+#include "lib/amdgpu/amd_mem_leak.h"
 
 IGT_TEST_DESCRIPTION("Test checking memory leaks with suspend-resume and connector hotplug");
 
@@ -78,85 +79,6 @@ static void test_fini(data_t *data)
 	igt_display_reset(&data->display);
 }
 
-/* return True if scan successfully written to kmemleak */
-static bool send_scan_memleak(void)
-{
-	FILE *fp;
-	const char *cmd = "scan";
-
-	fp = fopen("/sys/kernel/debug/kmemleak", "r+");
-	if (!fp) return false;
-
-	if(fwrite(cmd, 1, strlen(cmd), fp) != strlen(cmd))  {
-		fclose(fp);
-		return false;
-	}
-	fclose(fp);
-	return true;
-}
-
-/* return True if clear successfully sent to kmemleak */
-static bool send_clear_memleak(void)
-{
-	FILE *fp;
-	const char *cmd = "clear";
-
-	fp = fopen("/sys/kernel/debug/kmemleak", "r+");
-	if (!fp) return false;
-
-	if(fwrite(cmd, 1, strlen(cmd), fp) != strlen(cmd))  {
-		fclose(fp);
-		return false;
-	}
-	fclose(fp);
-	return true;
-}
-
-/* return true if kmemleak is enabled and then clear earlier leak records */
-static bool clear_memleak(data_t *data)
-{
-	/* Need to scan + clear twice to properly clear buffer or else leaks
-	 * from modprobe or other tests may appear
-	 */
-	if (!send_scan_memleak() | !send_clear_memleak())
-		return false;
-	if (!send_scan_memleak() | !send_clear_memleak())
-		return false;
-
-	return true;
-}
-
-/* return true if kmemleak did not pick up any memory leaks */
-static bool check_memleak(data_t *data)
-{
-	FILE *fp;
-	const char *buf[1];
-	const char *cmd = "scan";
-	char read_buf[1024];
-
-	fp = fopen("/sys/kernel/debug/kmemleak", "r+");
-	igt_assert_f(fp, "cannot open /sys/kernel/debug/kmemleak for reading\n");
-
-	/* trigger an immediate scan on memory leak */
-	igt_assert_f(fwrite(cmd, 1, strlen(cmd), fp) == strlen(cmd),
-			"fail to trigger a scan for memory leak\n");
-
-	/* read back to see if any leak */
-	if (fread(buf, 1, 1, fp) == 0) {
-		fclose(fp);
-		return true;
-	}
-
-	/* Dump contents of kmemleak */
-	fseek(fp, 0L, SEEK_SET);
-	while (fgets(read_buf, sizeof(read_buf), fp) != NULL) {
-		igt_info("%s", read_buf);
-	}
-
-	fclose(fp);
-	return false;
-}
-
 static void test_suspend_resume(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -164,7 +86,7 @@ static void test_suspend_resume(data_t *data)
 
 	test_init(data);
 
-	if(!clear_memleak(data)) {
+	if(!clear_memleak(true)) {
 		igt_skip("kmemleak is not enabled for this kernel\n");
 	}
 
@@ -174,7 +96,7 @@ static void test_suspend_resume(data_t *data)
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
-	igt_assert_f(check_memleak(data), "memory leak detected\n");
+	igt_assert_f(is_no_memleak(), "memory leak detected\n");
 
 	igt_remove_fb(data->fd, &rfb);
 	test_fini(data);
@@ -189,7 +111,7 @@ static void test_hotplug(data_t *data)
 
 	igt_amd_require_hpd(&data->display, data->fd);
 
-	if(!clear_memleak(data)) {
+	if(!clear_memleak(true)) {
 		igt_skip("kmemleak is not enabled for this kernel\n");
 	}
 
@@ -199,7 +121,7 @@ static void test_hotplug(data_t *data)
 
 	igt_amd_trigger_hotplug(data->fd, data->output->name);
 
-	igt_assert_f(check_memleak(data), "memory leak detected\n");
+	igt_assert_f(is_no_memleak(), "memory leak detected\n");
 
 	igt_remove_fb(data->fd, &rfb);
 	test_fini(data);
-- 
2.34.1

