Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9DC61DE8
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 20:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727910E1F4;
	Sun, 30 Aug 2026 20:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i6W4ycnc";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB95810E0F8
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 20:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRlPDbrAMfP4AHENRQksje9pLHCIWPeAbFrjM+9NIkwC0AHmwxiY5g1iZzUQJpOGmZJDGBrXx3GnDfBXeUtFdUerAweWa7EeK4yGAhD/tJyRkPgTycL1hPSFOCPd03VbJ6j/VZkbDPWcl+JNK5QXhLzLKoVBXAnprAAWjc5HcRlA6vO3VsicCjPj3eVkL+MlIwUgWDYNOOsysoSNpVXDFxdbSBciBje2ilQzliSBXvoaFGQKJXUSjQWvtkJefP0BX063FEESadmeQMNUIBTVDwMPJ3rjpuBV+XGtfAylvH0XEjGkqDwCAKIL3k0xyGNBJPj0SZiLXq9DsySES0edQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZVjeKnH8wTcVx7Cmwz+dMga96Jq+0l5UVj6p2hdLyQ=;
 b=dneL+fNggvduDRYbtW5XQZnCP9IIMHbF0wBRvTqhhoWOEx4IqkRSseIh4t3up4ge7JkJLR04+1rZv9PfvycaC7prOSSv4b2mEIaEh5PLupRACutKOzZ/6G/XEbHG1podK1mUJ73kDinEHYMQhgoMK41dvVvdW0cHArjzm38FOgnBzHynnpXAQnHYE7snEbUzCsshWOr4qJfb2+9fMBFWFwCpwlrZbbAVhqgbLqd6iHVllgYUVMQVm5mfhUrec+cwR/f8a1qbSIEGJ1u78s0I3d61hW+om4/3aH8M5WWhxMFGkjOLsS/cBHtdSB1L3w4UqLvwzDRXygHPZzOwNiUhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZVjeKnH8wTcVx7Cmwz+dMga96Jq+0l5UVj6p2hdLyQ=;
 b=i6W4ycncDWG5fUu4/9G2gLTuLV8vv3TehBcyPD6C2M5vj2xo80sSJOC7MnHJEnbjPmXEoDRn3Wx7ypxEK5m9WmDC9YbOyxdfJJaLw1Z2ir3i6vrTG/bAoX4FVULK/vkx8vLRQyfq05JoFpe0KUtR83XC+/8dmoyuc6FULpOxGp8=
Received: from BN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:e6::22)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 20:58:08 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::13) by BN0PR03CA0017.outlook.office365.com
 (2603:10b6:408:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 20:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 20:58:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 15:58:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 15:58:07 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 30 Aug 2026 15:58:06 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: always enable UQ test coverage
Date: Sun, 30 Aug 2026 16:57:33 -0400
Message-ID: <20260830205759.49482-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: cd27516c-8c22-4198-8aa8-08df06d964d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: camJWRlWT97yi0b8xlvr+PMbNyV7OHC8mgNGkChWkBH+9Iy/QVVEtpx+Ueev3eYBRxmi28I0TAZNwoSRlMcZ4Wri3Y0bCkNql/CfybGaxAIvecz9hi7L0AW8H3+9b9KtTtnSsQ26Ci2bqcbd44zWhRtUJgPdimcVrVK5rxNFacvqWFpY/yCRjtRBGpk22lnj0anl9P45XwVX63meMOAWRC9XFEatDAXwMesR7XRaWADvWgR3eGm9cHnhgi+jRk7LxiKNahwsHIxGTVaTVXU/32JhZvLtDvZc0i1j9W9vBExFx+Y2CpffJB9LmRlZvryBWKJWtl9pF0kEdPvtND44lNCjYlZ1KIpW0EJP3RVqemBCGsrUzm883f2hlKiDy1ZsUw1hLqbpvQpI5NNNph4hxWneIHkXp7kXmS+WWotWU+T+qGdM9KZSh2fhJWAONRTsBKDXQraIwYYrUykByG0bF0x6oi/YOsVNO9oXUiXnamI7SICoW8qWMJW9nindq15TgJFa6YHgMUHhPj9MROLu+7bJP068poc8nmoI5/lY5HN03ughTPt5CdtsnwL78+ga/XHQosFqEfImnLumhJPmrQyOJDN3KlTsmhRmpfeaSDSQ4NUq9mv86klWd0uFbhM0iIGbza30pudlyBsBApF2l95ZltAqTB8f/9W2UpDLLLbwFCm/T/aUQZ5FPlzKmhgYklhcEXOK9xorDXPJrjlqeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S5j4yabJ/a/zRIdGt9jNbDYE8YTjEnK3Hpy1imQQcM3ErRvibkOiqn75jfnSbS+7X5b/v3rztH+oMqB8U9R4XvaAYHZFRvsXc1caBT8AHVnnJAFo/jHa8u4gmRYvAVh/umfo9EWjBefl3QdqvIAf7ogKFVffdZmFXNiXOUGXBVd9qCEQV4XKaQoa/7vbL2qE4KujijBWYujbMY4YhPnwj6xY3mwinBZwpbl0j6vAE+qBQm+58woC3EQ+xWo/LKOAMyBpAGZs+NrNDzTymhOpBeTjth3xnQRxKTnVGV93KMFuZZai3Llp4d0qLrEYpastnK78aMlSVFTWlzYiv+X2OPp9YBJqIj8DrZkmwGeuMnJ2Rc1GeRdgmw222vX60oCH4bAHBWpE+PsbyVmBHpoJG17akjH4bjq9fY9DA0xNB0ldP2otR9458tmG4dlGnqmR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 20:58:07.9006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd27516c-8c22-4198-8aa8-08df06d964d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258
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

Enable user-queue test coverage by default for
deadlock, dispatch, security, mult-gpu tests.
This change removes the env-variable toggle path and
keeps execution behavior consistent across the AMDGPU
UQ-focused tests in this patch set.
No functional test intent is changed; this keeps the suite
behavior predictable for regular validation runs.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic.c           | 2 +-
 tests/amdgpu/amd_basic_multi_gpu.c | 9 ++++++---
 tests/amdgpu/amd_cs_nop.c          | 9 ++++++---
 tests/amdgpu/amd_deadlock.c        | 6 +++---
 tests/amdgpu/amd_dispatch.c        | 6 +++---
 tests/amdgpu/amd_security.c        | 6 +++---
 6 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 59ec3880f..418db286f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,7 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
-#include "lib//amdgpu/amd_platform.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
index 187be43fe..30b0da617 100644
--- a/tests/amdgpu/amd_basic_multi_gpu.c
+++ b/tests/amdgpu/amd_basic_multi_gpu.c
@@ -13,6 +13,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "igt.h"
 #include "igt_multigpu.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -162,10 +163,9 @@ int igt_main()
 	amdgpu_device_handle device;
 	int fd = -1;
 	bool enable_test = false;
+	struct amdgpu_gpu_info gpu_info = {0};
 #ifdef AMDGPU_USERQ_ENABLED
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -179,6 +179,9 @@ int igt_main()
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+		err = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(err, 0);
+		amd_platform_filter_init(&gpu_info);
 	}
 
 	igt_subtest("multi-gpu-memeory-alloc") {
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index beab62a54..65f88cf2b 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -12,6 +12,7 @@
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_platform.h"
 
 static void amdgpu_cs_sync(amdgpu_context_handle context,
 			   unsigned int ip_type,
@@ -150,6 +151,7 @@ int igt_main()
 {
 	amdgpu_device_handle device;
 	amdgpu_context_handle context;
+	struct amdgpu_gpu_info gpu_info = {0};
 	const struct phase {
 		const char *name;
 		unsigned int flags;
@@ -174,9 +176,7 @@ int igt_main()
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -192,6 +192,9 @@ int igt_main()
 		igt_assert_eq(err, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		err = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(err, 0);
+		amd_platform_filter_init(&gpu_info);
 	}
 
 	for (p = phase; p->name; p++) {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index d66a58859..b8356af74 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
@@ -46,9 +47,7 @@ int igt_main()
 
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -75,6 +74,7 @@ int igt_main()
 		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
 		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
 				pci.domain, pci.bus, pci.device, pci.function);
+		amd_platform_filter_init(&gpu_info);
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 44aa2d128..5267a742a 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -13,6 +13,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
 
 static void
 amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
@@ -88,9 +89,7 @@ int igt_main()
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
 #ifdef AMDGPU_USERQ_ENABLED
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -113,6 +112,7 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		amd_platform_filter_init(&gpu_info);
 
 	}
 	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index fd976e286..48d49973e 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -10,6 +10,7 @@
 
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_platform.h"
 
 /* --------------------- Secure bounce test ------------------------ *
  *
@@ -319,9 +320,7 @@ int igt_main()
 
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -341,6 +340,7 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
+		amd_platform_filter_init(&gpu_info);
 	}
 
 	igt_describe("amdgpu security alloc buf test");
-- 
2.54.0

