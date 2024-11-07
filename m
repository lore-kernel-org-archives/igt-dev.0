Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C812D29FA5
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 02:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4138C10E21B;
	Thu,  7 Nov 2024 02:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IOHBiD26";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522FD10E21B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 02:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcEZ6aVr3ok3p5lQT8Mx76XgeU8UeIPR1O057aopvukhoz4uy45V8VGbjIArfzLE7QleMly1bVUs6BH2I6bWloiyTc5h5wK0kf2iM2JbVFJbWg2lAVJ5JQxVjfd4/yFeKylS13lSrrMtQSkrqgHa/6PFFBrJgdfx/k/Hgt2eb3R8f0UvxXqPfb7qebX9maqTexs9UOlMIBahqQWgzjKtveA2VXjoz6Vphcp5AZnk/rOZX5YD1c2ynVR2M5BVikvwcOKFms/LRMSHQsEZOvoAy9jB1UpFklZAOCsU32wkvJm8loRj9Zlw60ZSNLbbnaBe7hB1Hg/RR106sT8hNUG3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZohEJA/7WzZXcwEXHI56i+wilSO13UhR4714fpFYpuw=;
 b=lXx/IIaSf7oVB796PE5BhRR/7mDjlA6cBOIBh4Wqxxabucb+K8uZZ/BbeRy0z0kTdEXNm6rIa3aLvFzVR8kr74/wL5+VJJLb7lw2bPRfx2AzUIuslIeExnf884RadGuCBnSxkp7dkRyRedc7dW14p56W42SIfn7dmiLl8okQLfbQNfXycIqARIisijXEH8hQInxc8z/78EqXuZMOM6GMI91gZttEyBtaYWrcXtzHk9uqPnQ3GvSkTjjOwgZdTot2gqXuNwJloAxjbTSqCcbFTTYVRjbU6h+daVodmGZw+JrHVIOgBCaXZx2Te9U7pyH0Jf7EQv2QWcivfe47zJ8z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZohEJA/7WzZXcwEXHI56i+wilSO13UhR4714fpFYpuw=;
 b=IOHBiD261zCLt88B0xONgc7wGSWopoOSo4aYb7eNhj7vBDHnaXYfs7C3OjfoVCEN9gUJaTFExAEQKxgihhVZIiYlOo6oV+XgCsQe5OPWQbkOztgLE0yfkRDEez3IbqwBquyXXZMASR3FoXAUzeaadQnl+Sjg1a6u1fBevrsSDp0=
Received: from DM5PR07CA0086.namprd07.prod.outlook.com (2603:10b6:4:ae::15) by
 LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 02:05:38 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::56) by DM5PR07CA0086.outlook.office365.com
 (2603:10b6:4:ae::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 02:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 02:05:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:25 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 6 Nov 2024 20:05:18 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/4] tests/amd_queue_reset: modify the asic filter
Date: Thu, 7 Nov 2024 10:05:08 +0800
Message-ID: <20241107020510.350132-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107020510.350132-1-jesse.zhang@amd.com>
References: <20241107020510.350132-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: ca234e61-9a4c-4eff-52ef-08dcfed0ac51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lz7mKe9MO44v+YirerWSSqADjS/wkjMm8lYNm/hRAj16x+cOHUjkOSbtaqnL?=
 =?us-ascii?Q?MQV6ejyIQBbYRPksl2Uhku8bGPYWDbdk7eFHlU9WqFidb7dAY2/bTGbx3dkz?=
 =?us-ascii?Q?KedLqrvZsksbDsXx+Fk9g/tDrwJGZxyHRnAtWjWx5+5mvRakjdXuAB/lmTo5?=
 =?us-ascii?Q?1MiP6J/mmtLNb9L7raAz6QU6do1EyHrkuPm98HwdlcXKEmp5b31bSIP5afXD?=
 =?us-ascii?Q?ATrgiqkA6whuk5auvYYfpRxs4URIRpM4NdmS++lGHTf3zAFMvQt3H3gh70RC?=
 =?us-ascii?Q?NT0eU12yTVL5mU/yvbCmG0HIS0NktWpoBh9GviS0XXKgtiUZKZcSVam/NHvR?=
 =?us-ascii?Q?oCrJqOhStuRQFv4ks+sDpPZaq/OlNpYotrQEmA7SsoyjTvT+M6Uc4fO79qw6?=
 =?us-ascii?Q?jmeedy1GSU2tK1FlkKtdAI9j4+8hT9q/+7WRP9PNKrerHGt3EkNTY1EqTPfR?=
 =?us-ascii?Q?UvP3AXbo094/LnnjM+vI2UVwmD2IgXi+z4Nd1v4LTk56ysRWXMkdltGrUBT1?=
 =?us-ascii?Q?p3bjcNGXDsLxiT+2MuhwUZhGw8w5KVU7f5Hqg4Dqhstuc5EnOp9tbXeCi4qC?=
 =?us-ascii?Q?zfoFvMEKEk8KDqQS1hKkWsMTA9pU2/2vzt8lASXGWydXgbmZ4mzCaylADN7e?=
 =?us-ascii?Q?qatmm+Feovw0fTA14FP8l2r/aDVZjqyUUE3pHyvylbuhoX53UjGYIa8otJmw?=
 =?us-ascii?Q?RAVTdabPYv4N2nBtXg+CPqgnpC+5N2akhVhyPjAz1oDQL72+l+whyLPe/EAJ?=
 =?us-ascii?Q?TvXc2P8j+lF4r89hov3fFU9DmKsBf96cOe9mjME9s7No14goNYITcqlspDli?=
 =?us-ascii?Q?KHl6XdSkeXdZMDeYgnhw8NsFlYBgZ1/lxvIypsYHIt4J3hMN4tbeGATbWi0a?=
 =?us-ascii?Q?6sVYz10+iNFTKs35e+GKo48ebZzdVJlL2YhjmPBI1xk7Kt6wkANUOolSwGqg?=
 =?us-ascii?Q?kl+23P2aQY5FP+mfo4xKuZj7O0njCS2ZCrt1Wz2DxaETtzPM+lq72Hgfspk8?=
 =?us-ascii?Q?+BSHMdBJkHgJ/TyWx/pdiPGTKk2vcsq2i4iR9Fmo/OUddBusIQocoBnoUyJn?=
 =?us-ascii?Q?kDTzx3B6hQWXcWly+1yM3IB1NS86XAXgLZ4RYePRfs1x0YpCeWTVnqZeQvw1?=
 =?us-ascii?Q?LIKapt8lxpTQ8r5fldx27m61oVC9ADFf8BizLaYpZ3wbtWMjvxSlSEsIV6QU?=
 =?us-ascii?Q?MCbrNvKgDQIa7Z8tyPH7u7cZllVz8NtpeE/Lq9TJtn9WJ6DZ+Y2BMVP1hTlw?=
 =?us-ascii?Q?8/luc0KnycLXAb7AN1PIveZuVHEg4z0BnooKHlzB4ssiY+CxDDgF6N4pN1x4?=
 =?us-ascii?Q?3FC3bB2EbcwIejZLOxY2g2xFuZDzpJ25xxAju+VIycRzLFr+mmyGPIZt3rc2?=
 =?us-ascii?Q?fTWiaDJJIw/ZMmyTG1Etq8cdSId99/VAE6Rqj7pC9+9v81UrXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:05:37.5712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca234e61-9a4c-4eff-52ef-08dcfed0ac51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Replace the original ASIC filter with the sysfs reset mask. Check
if a specific reset type is supported before running the subtest.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 47 ++++++++--------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 67570251d..87cf665f3 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -504,37 +504,6 @@ is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t ver
 	return enable;
 }
 
-static bool
-is_sub_test_queue_reset_enable(const struct amdgpu_gpu_info *gpu_info,
-		struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER],
-		const struct dynamic_test *it)
-{
-	int i;
-	bool enable = true;
-	int chip_id;
-	char error_str[128];
-	bool is_dispatch;
-
-	for (i = 0; i < _MAX_NUM_ASIC_ID_EXCLUDE_FILTER; i++) {
-		if (gpu_info->family_id == exclude_filter[i].family_id) {
-			chip_id = gpu_info->chip_external_rev - gpu_info->chip_rev;
-			if (chip_id >= exclude_filter[i].chip_id_begin &&
-				chip_id < exclude_filter[i].chip_id_end) {
-				enable = false;
-				is_dispatch_shader_test(it->test, error_str, &is_dispatch);
-				igt_info("PID %d SKIP subtest %s CHIP family (%s) %d chip %d, begin end [%d %d] excluded\n",
-						getpid(), error_str, g_pChip->name,
-						gpu_info->family_id, chip_id,
-						exclude_filter[i].chip_id_begin,
-						exclude_filter[i].chip_id_end);
-				break;
-			}
-		}
-	}
-
-	return enable;
-}
-
 static int
 amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
 		const struct amdgpu_ip_block_version *ip_block,
@@ -1151,6 +1120,7 @@ igt_main
 	int r;
 	char shm_name[256] = {0};
 	bool arr_cap[AMD_IP_MAX] = {0};
+	uint32_t reset;
 	unsigned int ring_id_good;
 	unsigned int ring_id_bad;
 	unsigned int ring_id_job_good;
@@ -1164,10 +1134,10 @@ igt_main
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED }, true},
+				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true},
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
+				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1176,16 +1146,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{}
 	};
 
@@ -1263,7 +1233,10 @@ igt_main
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
 					ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA", it->name) {
-				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
+				reset = (ip_tests[i] != AMD_IP_DMA) && (it->test == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
+					AMDGPU_RESET_TYPE_PER_QUEUE : AMDGPU_RESET_TYPE_PER_PIPE;
+
+				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-- 
2.25.1

