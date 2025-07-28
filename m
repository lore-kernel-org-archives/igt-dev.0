Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D4DC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 07:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBFE10E485;
	Mon, 28 Jul 2025 07:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DiJYDWeT";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13D10E485
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 07:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kxt4mG4mxdIR3h+aA6CUKiCEBEO8nFM07QVY/Hi5SfqyB9YA3SM9Llyvo6mfnHk42JNhWRbCi3fQgHwnQSO+H/8LJTvtoaIeGv0f4k8BELeDmqLF1TESggI0Lda2SvBi3sifk4z4YMSwG++KF+zwYplySPZKrVxcY9MC81B8tugHx+tIapEiKF4VKOhUu0mOkAen/14H2U6lgKZoaCkJyNv5JUZ7w2rw5Hnoi56ZbgStWKdSXMllw780bF8HIcmwp9k0NeYEnxAvCGNnAhYWhTBMVxNgDfIiJh9Bsx8bABlHjq4+WnlNHZDbpV7rEgLzfbovlGGdydR6hDiRpWxsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSkmFH8YFijzcVaySB8cMQQhTr5w3Tuyn1qamRnfWS8=;
 b=TSQpnWQoFgYxtb9XMzMij3GMDMG4ODmVZ6tPlZWdp/zNOHQAGseKbft1jjWCkPfn3aSss1hdetVv7/K6iukMKrhciThX5QJVBn68PmPBaUGU0odB1wcIDNjJrQ//ajYb1P0XA/fe1pKGXie20bcPx1dgafiJ68MmriCrAqFdO9ccjSGZiyeTJAyJT02IIhG7kde3oK7i/yWOge5sa5m+lD5FchZFBwRUdxxu5nQdpi9y4+VhLY6WgmVoA9Dl4eQysTRzl0DupXe/nHxFEXDtmKzoO6RbPzHG62oTtSMuSKJd7nn2HS6esDdKXvF1p06gMAOJfsEEGh80hRj+Uy7xBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSkmFH8YFijzcVaySB8cMQQhTr5w3Tuyn1qamRnfWS8=;
 b=DiJYDWeTDjLz2SWPJvCJqVjnyM6hU8/+/owyRkTODcLrwbjtLaLaOeUjgIUKYky+I6YT6crXo4L2prlk3LaWJ9wTdOpat5V3lnm6LDxg4BIhzYuQq/Ub/Zm5X3yXRFwlSXiJKVIbJ4rP1en6MH8CvpwuzRF5CRvD6shcuyERpBI=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:07:54 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::7c) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 07:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 07:07:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 02:07:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 02:07:51 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 28 Jul 2025 02:07:44 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.zhang <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Add multi-GPU command submission tests
 with UMQ
Date: Mon, 28 Jul 2025 15:07:32 +0800
Message-ID: <20250728070743.3665749-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cd7368-c14f-4e02-1f76-08ddcda578f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0oboybkTa3ho6v9vSDC7nQJEt9Lj33eABQI1gN9g06/tYxO/512Nx3DPWQ7i?=
 =?us-ascii?Q?/57f+fk1Nwcc5dt/CkbR6Y8STpPt9YpRkSVwMGpVRcoBPZvunCxh/7FHpkUP?=
 =?us-ascii?Q?lNcZB6USTDx1gGyLMjci1rYHLWtmLtDQBnATJyCjBHqQODK6UnCl6hWy3nsC?=
 =?us-ascii?Q?090BEKvpnVYF0BqGs1RUGsYXua3/vWT2+cyEQ76N0x/axwrZFo80BaGHG75V?=
 =?us-ascii?Q?AGWgg+tatLVdv+FkmeVpgPazCEflny5IhOJiwsraTitZjNiNyD4d3pcZGO4Y?=
 =?us-ascii?Q?ycOtHWP1OgfI33PVQH2ve2KvR2k6miy8H0gJXSAZEv8mltG+olMB7U/4fgse?=
 =?us-ascii?Q?hIyoYSYgu9Gx2R343XFrL7jnCXgJDEwqgx5gKZ0lDpYe6PiCtzzzSHB5qlQJ?=
 =?us-ascii?Q?WbR+JMtsejrkR569YbBn1uQnWeDV0DNsx6nTQ3uhKrrz9Vl/m4Rk2aeKnVIj?=
 =?us-ascii?Q?LQu1aARlD4cccav+yacQvFiY5gPt2uh1SrKIX/Y5yze2fxpvdE5TM+lZR8rd?=
 =?us-ascii?Q?VrprR/j6LpR1qzkHBOl3BniZSik96a1iG7h3bZYRkrGtc2HfDqZCIY6t+KCM?=
 =?us-ascii?Q?kz80sUBtdLtBslITsmyFMGdkqSbF4/UvpHDmQOubmyMJDJlGsvmeX6yDfsu1?=
 =?us-ascii?Q?w8CLvFPSBWSAA5vNbGIoEjClq3hab6ZXlI70z9B2FCGhfonvI0r2k/5GISwW?=
 =?us-ascii?Q?Mz7FEX3oAXSEjlLq4fhSQzNzWssLyPWKGXbxib/LV+w9klRPV30WnMxf2bqS?=
 =?us-ascii?Q?EHs7lI938Q7k9Va5ZpH/yNcsjFrhwjmy0lo6Cnwk6O9zDMO4IUEXQDC06BX0?=
 =?us-ascii?Q?W3uTMIysBX3ZeMv93niXNGw2yI/McaT37PqNNknSvfUpxOwvsFrbCTL/HNNj?=
 =?us-ascii?Q?/+NBKJ1VFqFS+MC3DfGgaRPueBO2YgrtHfgJ7Pb578NOkCU+CTy/fLGLQGvV?=
 =?us-ascii?Q?CRNL8C7gn1ItEId3YwLb5M/OX/w/koqxdLy8TZXVqj6xyhy7IQtq5As33KTf?=
 =?us-ascii?Q?pYpjDZlRlgEDGNsjCmV0AfPXLOWouUFfiOpWdfqAHXOjmKVZ1amFNFxkz7a/?=
 =?us-ascii?Q?BWC8YS0Pfwldho0vChE4Izv0DOEnevf8H8ReW9rT4rkrqmvFSQPXXC2GE2i3?=
 =?us-ascii?Q?+qAPh8RRvCgNByelNFqULBJ03sCJXCKo3Km66pZ5ZqS6hAN5SEWw4H8MHGB1?=
 =?us-ascii?Q?dHlyEiGZp00crFw3tBRqWWE+jKR4ruuNNxBJs6mALf1AiMXZGW3qnlDuk2Rw?=
 =?us-ascii?Q?ttyl/snCCD3o6F5L7Ms/zmAQ6Pa+IPRfLhFveduNg8VZVdpCmV/0myMpY3J7?=
 =?us-ascii?Q?fYSfZq0o+rm5khkGONhfj3IrdtrpgHctDVF/wD+sosyZiXA1tn+RQvtZ+5sX?=
 =?us-ascii?Q?cjUaqREjfdlcYQO8MCx+0ajqaQtIJAATI9XpwDdI47rfEJwAiB1ehKQ04bYr?=
 =?us-ascii?Q?yKl48c2mzjHlG0nFS5e/3KvfWzGhx51lK9GAc3FHqqcYGWUd6Fy7vfGlflqp?=
 =?us-ascii?Q?RWCBgOJ4VObczH953HzySzKkbhBCuv/B1TBb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:07:53.7500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cd7368-c14f-4e02-1f76-08ddcda578f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
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

Add new subtests to verify command submission across multiple GPUs
using User Mode Queues (UMQ) for different IP blocks:

1. multi-gpu-cs-gfx-with-IP-GFX-UMQ: Tests GFX command submission
2. multi-gpu-cs-compute-with-IP-COMPUTE-UMQ: Tests COMPUTE command submission
3. multi-gpu-cs-sdma-with-IP-DMA-UMQ: Tests SDMA command submission

Each test:
- Iterates through all AMDGPU devices using igt_multi_fork_foreach_gpu
- Initializes the device and queries GPU info
- Sets up IP blocks and checks UMQ capabilities
- Runs the appropriate command submission test if UMQ is supported
- Includes proper error handling and device cleanup

The tests help validate multi-GPU command submission functionality
and UMQ support across different IP blocks in a multi-GPU system.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 90 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 66f6d45e7..c524e1141 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -13,6 +13,8 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "igt.h"
+#include "igt_multigpu.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -859,6 +861,94 @@ igt_main
 		}
 	}
 
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
+			if (gpu_fd < 0) {
+				igt_warn("Invalid FD for GPU %d\n", gpu_idx);
+				continue;
+			}
+
+			/* Initialize device */
+			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
+			if (res != 0) {
+				igt_warn("Failed to initialize GPU %d (error %d)\n", gpu_idx, res);
+				continue;
+			}
+			//res = amdgpu_device_initialize(gpu_fd, &major, &minor, &devices);
+			//igt_assert_eq(res, 0);
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
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.49.0

