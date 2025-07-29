Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1809C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 07:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5327F10E5D8;
	Tue, 29 Jul 2025 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hRGEMiT4";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9E410E5D8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 07:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgjJ1xPEBrz4QOxW2BzuAV8U9S5why+fNm0upTeOzR9dhd0bL3PuzrvxYJv2TAlyzFv/A+gn4lqHkbnyi6zN1gppyPNnh9dfgKQRimefYVrQOWi9LxiGZCQ+774p7T6MvVihWwKhdwE7+RTL/R8FgdXu1Y+tBWWXHnisufXDZZqRFNskWNSQFu7ObN8FNvo0mojpAxUmmKU8UVvO6O76w/jspzeX78RHYEYr2wRAV6qFtYTAC0N9E6LlD5yTn0sDxJKJrvH2sLnc6rbV8tvztMF3nFI8jIjUmnrvKSbaw0KJA+djuY8kTiFSOuVAl8MYdNGcJe8292HZYshW7hzCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45E33IOv9rfpJdwdQZM3MicnLk6u3MQKCh0VKRObqYo=;
 b=B6/neG93KtFfE2CCD6q5+J4USSyEtk96eDJJPbgmD37AEg8rrltrWkr2noPV66258Lv315oscrMoTvdtW8a1BYMdlQTNLI0vkGdobfRVFch22w20OPXHQw3gjBZohaKotl5bmtX4YsoM+BYHxObHAPACB6EgE5RkHO6A82BUf0H1lWQelcyez2YVWDUwdMqd8gqfTKV73xpCDt6BP/oaWlHPx7hH+EbUlJ+tXqhNyHsx8Yn8NuuUZuBByXMs1uoDOWrIs2IPB/qfhVIDsEvpxIq73jB+T8TZ83QsD3wf6iZEGfFAvdl2oUDXBY8o02SL3zL0EBuD+TzdpgEfMQPkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45E33IOv9rfpJdwdQZM3MicnLk6u3MQKCh0VKRObqYo=;
 b=hRGEMiT4P+eHHhy73IzOXY27YOjk1MjTW6jfgfia7hTCDfvMsiTRcrDDIHDVQotsp+Bke6WoH1ijz/CkPcpseg7skUJnt+4zhNiWDA3pC4tsykfFfBg35E0+Bmixfi/FmAQEJVFCujTg2LZZj7kuhiv548331tzA7gcnAiM8Jxc=
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Tue, 29 Jul
 2025 07:22:31 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::23) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.27 via Frontend Transport; Tue,
 29 Jul 2025 07:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 07:22:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 02:22:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 02:22:28 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 29 Jul 2025 02:22:21 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.zhang <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: Add multi-GPU test cases for AMDGPU
 basic functionality
Date: Tue, 29 Jul 2025 15:22:04 +0800
Message-ID: <20250729072221.3717641-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: e41b7e71-33db-4e94-b9d6-08ddce70ae2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cp1sl4wWMrRPTKi+DuoOQI5rXfJpsMkt+yaG19CeXuVulN7uNKvaLyjPMQiv?=
 =?us-ascii?Q?8bXUBCClU9gFxN8f3/5ZmqMD8wfbSyT5XiUmicHkqFVW6yodNBIFStePOhO3?=
 =?us-ascii?Q?HQSLMfYr8cHV1gy+eO27hC6NJy7o5uG5w62PrRxuytCPD0lB6ZDF00RpMwl+?=
 =?us-ascii?Q?UD1elX0QpYJ0cTZaIbZQzhd4IK6EGcL8Jc2EZaPRQN99OIbtNhSPmVg+u0JI?=
 =?us-ascii?Q?yRY35bNpmgDw1swVbN912N9nZPND8wQghGL3xqGT8x/DS6CdkjcA6418mtvf?=
 =?us-ascii?Q?KxRYVNKlN7S1amWY56ICnKfcUr6FGqVot4z5rcTBCcdCCktoDYEMmJiBU8Sd?=
 =?us-ascii?Q?wrDYk8WXtq4ytvfxN5M4DuwNbsuPPbgXznCXFY4wht0csG+DQZzYKvPOcyw2?=
 =?us-ascii?Q?hM6jeYB3zI/aXM2wMjQdMBUSlt4J41REwdgTtr5Tz9SANKfmB/SvQX+Dc8S9?=
 =?us-ascii?Q?2HlpV6GoWGydO1aykum6YpBE+QMRA4W7Ukg/APyfd6Z4EB9MSeDI6ngjYCiC?=
 =?us-ascii?Q?zDI4SA9tS99yDCjhXiTnb8y4WrjTMSqPh3uyVBV5LURJ/YKkq5d/XseU1pE7?=
 =?us-ascii?Q?vKNe9nNfTFwYJ9eIekP3aUWYN51kFvFjJThVnKk8H2eG2BXEOeWdeNPPl3mO?=
 =?us-ascii?Q?fc7qCczQ/u+IGc20wLVBeVHHv/srzwN7VLKZ9CM1AjGQWE4pFDT+RcxhNpZ5?=
 =?us-ascii?Q?b6fLtonB/GPIXA6fTmDvRjp6tMaHiOYmey2JbwNIeL5ETVBoSPU1hI8N1pDy?=
 =?us-ascii?Q?R8l8w4RYyEOa+LM5m74qNeX3N/gMSrtzO8rKnznGcIbHJ94gHsCbAs/5D5IO?=
 =?us-ascii?Q?IcWTiHYgtkYGKpEXASFC/EKD9aOS9WwmqaR+V2og16kgRLchjPJ68CU13avd?=
 =?us-ascii?Q?OVUYn6sJnu++D8iGwLs+b1kEORr8tEKCJ8Z6hXZq0d1b8S+0fNUweoSU1N/Q?=
 =?us-ascii?Q?l89SBDqx5vq8ynYWm+JufoumGXwWZp1GtsC02e8EULXVKuAXpyFgWiNHjK7r?=
 =?us-ascii?Q?vDr5oX1w4lnVXbZgWhRxC/zb4oBg9069cdPyMO4XAI7r8JuJDj4varx3tBYU?=
 =?us-ascii?Q?+PNeAbke8vA9kHn3vEQjURJ+n41WWQxL9oClGZmttP3P7FFJEbFkuhhsCOQR?=
 =?us-ascii?Q?8X76r/3yieD4wj4caCV8aW1KkcsFq3hNlV9z3Glcljnyma2q9Rvpiee8ozYF?=
 =?us-ascii?Q?Qs17T+Df6wK512G9T/2is8+mT+VEh/pqRPIgtnCgrhfewgWb1DYRL7kVSSXL?=
 =?us-ascii?Q?FvzR3B/8V0ny7vuZy2L12lgGMTsByzfzhGEu/yBVsat8+XaDJp2kQd/3B2tK?=
 =?us-ascii?Q?7UG4iIatn1LpCFAv3L2Cs8Bd9MHtJDyP5P5aaHLCTXYvAMJ7bA11v9psV1n8?=
 =?us-ascii?Q?uCpkLVzl0Swx7k6QBBEKZKl3pYBTKX7m3dPCb62YGzvt6+USjEuxeKV+lAK5?=
 =?us-ascii?Q?1gJ5bfo9GPuvUpi4P33NmvcE1jpmezQ0cV+1QJNPPKSGycuHNvnoZQSAG6Nk?=
 =?us-ascii?Q?gF7oKRtWCnYZ+Xm4u4jfkWRpBahkiw3Hwnq5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:22:30.9331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41b7e71-33db-4e94-b9d6-08ddce70ae2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802
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

From: "Jesse.zhang" <Jesse.zhang@amd.com>

This commit introduces a new test file `amd_basic_multi_gpu.c` that
verifies basic AMDGPU functionality across multiple GPUs. The test
includes:

1. Memory allocation tests for different memory domains (VRAM visible/invisible,
   GART cacheable/USWC)
2. Command submission tests for GFX, COMPUTE and SDMA IP blocks
3. Multi-fence synchronization tests
4. User-mode queue (UMQ) tests when enabled via environment variable
5. Combined queue testing across all IP blocks

The tests leverage the existing helper functions from the AMDGPU library
while adding multi-GPU support through forked processes for each GPU.

v2: move the multi-GPU subtests into a separate file (Vitaly)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic_multi_gpu.c | 425 +++++++++++++++++++++++++++++
 tests/amdgpu/meson.build           |   1 +
 2 files changed, 426 insertions(+)
 create mode 100644 tests/amdgpu/amd_basic_multi_gpu.c

diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
new file mode 100644
index 000000000..22a93ca08
--- /dev/null
+++ b/tests/amdgpu/amd_basic_multi_gpu.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_compute.h"
+#include "lib/amdgpu/amd_gfx.h"
+#include "lib/amdgpu/amd_shaders.h"
+#include "lib/amdgpu/amd_dispatch.h"
+#include "igt.h"
+#include "igt_multigpu.h"
+
+#define BUFFER_SIZE (8 * 1024)
+
+/**
+ * MEM ALLOC TEST
+ * @param device
+ */
+static void amdgpu_memory_alloc(amdgpu_device_handle device)
+{
+	amdgpu_bo_handle bo;
+	amdgpu_va_handle va_handle;
+	uint64_t bo_mc;
+
+	/* Test visible VRAM */
+	bo = gpu_mem_alloc(device,
+			   4096, 4096,
+			   AMDGPU_GEM_DOMAIN_VRAM,
+			   AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+			   &bo_mc, &va_handle);
+
+	gpu_mem_free(bo, va_handle, bo_mc, 4096);
+
+	/* Test invisible VRAM */
+	bo = gpu_mem_alloc(device,
+			   4096, 4096,
+			   AMDGPU_GEM_DOMAIN_VRAM,
+			   AMDGPU_GEM_CREATE_NO_CPU_ACCESS,
+			   &bo_mc, &va_handle);
+
+	gpu_mem_free(bo, va_handle, bo_mc, 4096);
+
+	/* Test GART Cacheable */
+	bo = gpu_mem_alloc(device,
+			   4096, 4096,
+			   AMDGPU_GEM_DOMAIN_GTT,
+			   0, &bo_mc, &va_handle);
+
+	gpu_mem_free(bo, va_handle, bo_mc, 4096);
+
+	/* Test GART USWC */
+	bo = gpu_mem_alloc(device,
+			   4096, 4096,
+			   AMDGPU_GEM_DOMAIN_GTT,
+			   AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+			   &bo_mc, &va_handle);
+
+	gpu_mem_free(bo, va_handle, bo_mc, 4096);
+}
+
+
+/**
+ * AMDGPU_HW_IP_GFX
+ * @param device
+ */
+static void amdgpu_command_submission_gfx(amdgpu_device_handle device,
+					  bool ce_avails,
+					  bool user_queue)
+{
+
+	/* write data using the CP */
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_GFX),
+						      false, user_queue);
+
+	/* const fill using the CP */
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_GFX),
+						    user_queue);
+
+	/* copy data using the CP */
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_GFX),
+						     user_queue);
+	if (ce_avails) {
+		/* separate IB buffers for multi-IB submission */
+		amdgpu_command_submission_gfx_separate_ibs(device);
+		/* shared IB buffer for multi-IB submission */
+		amdgpu_command_submission_gfx_shared_ib(device);
+	} else {
+		igt_info("separate and shared IB buffers for multi IB submisison testes are skipped due to GFX11\n");
+	}
+}
+
+/**
+ * AMDGPU_HW_IP_COMPUTE
+ * @param device
+ */
+static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool user_queue)
+{
+	/* write data using the CP */
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						      false, user_queue);
+	/* const fill using the CP */
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						    user_queue);
+	/* copy data using the CP */
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						     user_queue);
+	/* nop test */
+	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_COMPUTE, user_queue);
+}
+
+/**
+ * AMDGPU_HW_IP_DMA
+ * @param device
+ */
+static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool user_queue)
+{
+	amdgpu_command_submission_write_linear_helper(device,
+						      get_ip_block(device, AMDGPU_HW_IP_DMA),
+						      false, user_queue);
+
+	amdgpu_command_submission_const_fill_helper(device,
+						    get_ip_block(device, AMDGPU_HW_IP_DMA),
+						    user_queue);
+
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_DMA),
+						     user_queue);
+	/* nop test */
+	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
+}
+
+static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
+{
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX | AMDGPU_HW_IP_COMPUTE |
+							AMDGPU_HW_IP_DMA, false, user_queue);
+}
+/**
+ * MULTI FENCE
+ * @param device
+ */
+static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
+{
+	amdgpu_command_submission_multi_fence_wait_all(device, true);
+	amdgpu_command_submission_multi_fence_wait_all(device, false);
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	int fd = -1;
+	bool enable_test = false;
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
+#endif
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+	}
+
+	igt_subtest("multi-gpu-memeory-alloc") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			/* Run test */
+			amdgpu_memory_alloc(dev);
+
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("cs-gfx-with-IP-GFX") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool arr_caps[AMD_IP_MAX] = {0};
+			struct drm_amdgpu_info_hw_ip info = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+			res = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
+			igt_assert_eq(res, 0);
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_rings_readness(dev, 1, arr_caps);
+			/* Run test */
+			if (arr_caps[AMD_IP_GFX])
+				amdgpu_command_submission_gfx(dev, info.hw_ip_version_major < 11, false);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("cs-compute-with-IP-COMPUTE") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_rings_readness(dev, 1, arr_caps);
+			/* Run test */
+			if (arr_caps[AMD_IP_COMPUTE])
+				amdgpu_command_submission_compute(dev, false);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("cs-multi-fence-with-IP-GFX") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			struct drm_amdgpu_info_hw_ip info = {0};
+			bool arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+			res = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
+			igt_assert_eq(res, 0);
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_rings_readness(dev, 1, arr_caps);
+			/* Run test */
+			if (arr_caps[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
+				amdgpu_command_submission_multi_fence(dev);
+			} else {
+				igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
+			}
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("cs-sdma-with-IP-DMA") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_rings_readness(dev, 1, arr_caps);
+			/* Run test */
+			if (arr_caps[AMD_IP_DMA])
+				amdgpu_command_submission_sdma(dev, false);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("multi-gpu-cs-gfx-with-IP-GFX-UMQ") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool userq_arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_userq_readiness(device, userq_arr_caps);
+			/* Run test */
+			if (enable_test && userq_arr_caps[AMD_IP_GFX])
+				amdgpu_command_submission_gfx(dev, false, true);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("multi-gpu-cs-compute-with-IP-COMPUTE-UMQ") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool userq_arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_userq_readiness(device, userq_arr_caps);
+			/* Run test */
+			if (enable_test && userq_arr_caps[AMD_IP_COMPUTE])
+				amdgpu_command_submission_compute(dev, true);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("multi-gpu-cs-sdma-with-IP-DMA-UMQ") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool userq_arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_userq_readiness(dev, userq_arr_caps);
+			/* Run test */
+			if (enable_test && userq_arr_caps[AMD_IP_DMA])
+				amdgpu_command_submission_sdma(dev, true);
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("multi-gpu-all-queues-test-with-UMQ") {
+		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
+			amdgpu_device_handle dev;
+			uint32_t major, minor;
+			struct amdgpu_gpu_info gpus_info = {0};
+			bool userq_arr_caps[AMD_IP_MAX] = {0};
+			int res;
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			igt_assert_eq(res, 0);
+
+			res = amdgpu_query_gpu_info(dev, &gpus_info);
+			igt_assert_eq(res, 0);
+
+			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
+			igt_assert_eq(res, 0);
+			asic_userq_readiness(dev, userq_arr_caps);
+			/* Run test */
+			if (enable_test && userq_arr_caps[AMD_IP_GFX] &&
+				userq_arr_caps[AMD_IP_COMPUTE] &&
+				userq_arr_caps[AMD_IP_DMA])
+			amdgpu_test_all_queues(dev, true);
+
+			amdgpu_device_deinitialize(dev);
+		}
+		igt_waitchildren();
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index a8f85bbd8..7cb1c0f57 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -5,6 +5,7 @@ if libdrm_amdgpu.found()
 	amdgpu_progs += [ 'amd_abm',
 			  'amd_assr',
 			  'amd_basic',
+			  'amd_basic_multi_gpu',
 			  'amd_bo',
 			  'amd_bypass',
 			  'amd_color',
-- 
2.49.0

