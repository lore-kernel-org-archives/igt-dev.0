Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED0CEBF8A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 09:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A710E0AD;
	Fri, 27 Sep 2024 09:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rfQ/VVSV";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEBE10E0AD
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 09:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtY4J6TtderEfeih8Q1LshYlzvaSBJFakVaqzEvDaKVaBBwqrsLhfSseTzcjJC9ZcxyYvgN7sVY6Tn7N+sF2jSGq+ZZsWHfG9XorK8kiCn9v4sgOOPdO4YrbaxEAskz83hzy6viewOkqz+P5t1sik3Cfv1x6IvDqptsBKpvS01K0kfgH4KNqZEEy3jDzebW0ksluo6pFfwtyj+Uc/f/DQLVUP3TXPKvZ9PRARrBwHYR0nvl7n7MBpqKxzt3AuaLOhHhbHzAKyKS2yk2N9wN+rVjyyfGALEhoHJ6l6j//Zq+9VIrdnOIgGSN0addErbjNgnlwWPUDQGQU2S4CtKG1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIJ8HRxiw5MpjI3rLGC2pZNtwdlS4Mi8jpFdmuU8Mbs=;
 b=Wk9E/Aq3JVgO1Oh/sxlZlASf6I7HvgL2WqAV7uvtUAIPxDVCsNkBIegzo7g2pfgmcGhBztCwYo7EVkbcbdxgWOJkC878y1HuRx56uxQA4jyYzmWA027NwLgm9ZrwghkX8JifpGbTDW+Qfz4dZvUqJKmMx5no98l/z7JY39SH42SnPoUEeWbOt93eFKO0vwmj/GTFuKf0A3mdPJIJqqXEXxJ3Ax7gJGordKipAiBrCOa6Li/v3ro5XnfE9l6QH1rVA6caD87jxPnkqXuBPNMOAEjTQV06bR8BwjhUskOB7hGUi6GMfTp7hunICEUiulcfnd2WwzMvRmr/44ZO8WEbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIJ8HRxiw5MpjI3rLGC2pZNtwdlS4Mi8jpFdmuU8Mbs=;
 b=rfQ/VVSVmAvUjNeqsDzcovGrGEHOQdZZNM6tqqlriX5+IsEtYiU42FIy/dcOHQndITOwSIiqPJdOx+kF3ef+IwNLmKhYLAC6ZpLwahTqgLB04QPgEyOZVN7YqT8jXOE7N/2o+vZxl7/1C7Ma9Ep6SULUenrh7DdMO9No7kd9YQ8=
Received: from SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 09:09:54 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::a0) by SN1PR12CA0044.outlook.office365.com
 (2603:10b6:802:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Fri, 27 Sep 2024 09:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 09:09:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 04:09:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 04:09:53 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 27 Sep 2024 04:09:52 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: enhance sdma test
Date: Fri, 27 Sep 2024 17:09:51 +0800
Message-ID: <20240927090951.3761844-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: cb15322e-42ad-41b7-3a12-08dcded426b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5YDayAeoGb6OVWLoSvLG/mwz4nd8d8SVRDU9KZcFLU3YLJREo8j8dONtFjrT?=
 =?us-ascii?Q?61kWyTWc0ZHKv+S8gb/CsEPzGWZYF72YZrgT+hR4DgXtUrz3vknPKX252AYb?=
 =?us-ascii?Q?9M5FxWoJ1z1tZGP9YC/wTFfLyjUY76JeBV83mkNIJssCVVCZL8r6pTSyA67I?=
 =?us-ascii?Q?677rsywfz7S21kXoB6+dILutaQMTdHcD9qRdijE2v9XCdoSvl17RXG1vr/zb?=
 =?us-ascii?Q?Tt3trdQyKDITGqY5XT0uY21j4zTDqQjlI1h6Pfhc04tLvOYbA8+zwpFfxaoz?=
 =?us-ascii?Q?l6qLUD/H2gY1cInwOicfjldsUQbA+hVQbHi89oLrD+/IyARi1c4vM6eibI7N?=
 =?us-ascii?Q?zWpw+HBkpNy1zzqf6pH9R8ymKuXusajftIYO476eCmSV6mp//8dRThVWe31q?=
 =?us-ascii?Q?tQkkJWFJKwHx6N96eXx8fIF/OjDzAp7Coc2qWG4ZXcHUdFEW6QxRdpPYPGEX?=
 =?us-ascii?Q?w7FVJvgWodHcHSiVMi/+Yj5eK7f5RlSTT5JKmhkALALIjWbIex2bEnYNLk3k?=
 =?us-ascii?Q?/uekICElK+wndUbjvAvffRyeu2dubu62auBD5IuhwtDhY4SgYynD8JcNJQai?=
 =?us-ascii?Q?kEIkN1eP5j5Nq9sI+LRL5Uo3cTRiouPgjQJ/MjtT/B9m4tEBNOnUmFX2BbFE?=
 =?us-ascii?Q?PNS4MwSWDtcCQ6VV0y+k3w5h50MDakRJT3osTgTLN/u3FdCvdiLkCskg4o24?=
 =?us-ascii?Q?Sqq7k+wSNnHO+/BDJVu12bYmX89hTCOPIoDbbpKT1Z16RAtreRA8c8LhW0bp?=
 =?us-ascii?Q?Hc61DdZDDI30M+e/KL+ClCe3rIaSCJ5UwB6ZFmqiL/eDW9oMMc0bCq8nW+9S?=
 =?us-ascii?Q?ZLLHYZ+F72zumzkDXdMsdzrA7tFgdPZxvSIjJqxtNGqVD0Un+fCIDFn5O7qc?=
 =?us-ascii?Q?bS95zsrxui/M/lyXPwQTvwNX8Zgfd2/N1h5l6h3ZtYo+3+hAT1r4/2zjC7dy?=
 =?us-ascii?Q?UtS4pOjHRpOhCGdfB2GsvRCOq4KYc0fYoeNkyZVjpvnmA5TkcjB5Gskltkd/?=
 =?us-ascii?Q?BL//2VqGJJmY56IZN4D7RF3/G6XiULsxUYJdIIchW6Vj5ATjacUrsBl3WvBl?=
 =?us-ascii?Q?HneDXRqvnBUbxsZj14OITsRywCP52SmRL77QJdrCee1MFHa1J6D+EcYpfvHI?=
 =?us-ascii?Q?2Gqtr7wthyqI3tQarhI14d/l4rXfECxyNidj3WGm2r4UP/9tg10/OF1KCqGa?=
 =?us-ascii?Q?sN109NIu32ECj1JT/XBC2KcIN96j5Ak8/FTlMlI5Z5OqlIKDBgHaslkymO5u?=
 =?us-ascii?Q?HbCvSybFU+YJayEzncVJ8D513saVD3G79oxCmObv6HuyrOaIoj/wE7bIeI2S?=
 =?us-ascii?Q?BZI0BrqH7JZ5ilN20CfHJev+UPiT+E992jL3NDw3XP3XRxc/6Tw7n/4CaK5G?=
 =?us-ascii?Q?qkLgBME=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 09:09:54.2346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb15322e-42ad-41b7-3a12-08dcded426b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170
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

The sdma may have multiple rings,
each of which should be tested.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 45 +++++++++++++++++++++++++++----
 lib/amdgpu/amd_deadlock_helpers.h |  5 ++--
 tests/amdgpu/amd_deadlock.c       | 18 ++++++-------
 3 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c71272e58..851f096b9 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -169,8 +169,8 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	free_cmd_base(base_cmd);
 }
 
-void
-bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+static void
+bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, unsigned int ring_id)
 {
 
 	const struct amdgpu_ip_block_version *ip_block = NULL;
@@ -190,7 +190,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
-	ring_context->ring_id = 0;
+	ring_context->ring_id = ring_id;
 	igt_assert(ring_context->pm4);
 	ip_block = get_ip_block(device_handle, ip_type);
 	r = amdgpu_bo_alloc_and_map(device_handle,
@@ -216,11 +216,27 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	free(ring_context);
 }
 
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id;
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		bad_access_helper(device_handle, cmd_error, ip_type, ring_id);
+	}
+}
+
 #define MAX_DMABUF_COUNT 0x20000
 #define MAX_DWORD_COUNT 256
 
-void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+static void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, unsigned int ring_id)
 {
 	int j, r;
 	uint32_t *ptr, offset;
@@ -240,6 +256,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	}
 	ring_context->secure = false;
 	ring_context->res_cnt = 2;
+	ring_context->ring_id = ring_id;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
@@ -309,3 +326,21 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	igt_assert_eq(r, 0);
 	free_cmd_base(base_cmd);
 }
+
+void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for the sdma\n");
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		printf("%s[%d] ring_id:%d ######## \n",__func__,__LINE__,ring_id);
+		amdgpu_hang_sdma_helper(device_handle, hang_type, ring_id);
+	}
+}
+
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 165ffb98d..7f8419280 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -26,11 +26,10 @@
 
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
-
 void
-bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
+bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
 
 void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
+amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
 #endif
 
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 696fac2eb..b5d053663 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -73,7 +73,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX);
 		}
 	}
@@ -82,7 +82,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX);
 		}
 	}
@@ -99,7 +99,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
 		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
-		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE);
 	}
 
@@ -115,7 +115,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
-			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
 		}
 	}
 
@@ -123,7 +123,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
-			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
 		}
 	}
 
@@ -131,7 +131,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
-			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -140,7 +140,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -149,7 +149,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -158,7 +158,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
-			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
-- 
2.25.1

