Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3B9D3E79A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 02:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F310E221;
	Thu,  7 Nov 2024 02:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q+GNN+m8";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9572B10E221
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 02:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK4zjfiaVL3Z9lFkcLs8I0s/YnLZmi8XtpmruuQqrvHD2uj+4ubBFjnggGEJxItSw7D7xWlyE2yevKX2p6ApxAwrxaCXijs7qfKdHqWoDhyaLMxb7zWosG59/vHlivEl4D/gIhGVj6XS6/SNhLeIYs4kQFslThJY1v3qprX9NNY/sPFF3WQNgm2F0bY266NZUzawfx6wNiV3qq/r4On7ePKRm7Okr6pEIwNfQOWw2ull3Zys9D9G77NpPoMPPibS3VgV7rTfCo/S/iee82Nhu2qO/yD5a/GyV9YrYMRXgLy+fUY2iIb+4HJYZL2bOQBxjyfUyvagKWtfE+P30JOrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvYwycgKSABOrKZun1eZiuUt346c+LB1igDAzF3UpBQ=;
 b=mCzA4dovX9EZ/yOay33MmmN6K/6pWt+zFdJFHl5+SUCPgkVa27zuZ1d4dGae7bYyljAjNsU7qKAhrZfJeomj/UWTEbfxXHKHUClSd8Dg+MU8i6QZRJ37fg1NRKAloggHMmUT4SKlidChkrw3TxBttAnjcwpRR6Q9HtAo2CVlvpS+uJ5MTn4C3Thtacqw8B+ac0Q6leJGFBn/ISTRcZMgXRqX7SDHGqdvWn9Y+SfeTFiPS5xOEvna1NWhx68NRGAxqIbd3o35VYzCmLDsyKopxl23eATKiPOJcFoIG4dRM+dsdjQlsE3hrcYzbRhF/9aFrsUTgnb10VjY7S7K1PCfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvYwycgKSABOrKZun1eZiuUt346c+LB1igDAzF3UpBQ=;
 b=Q+GNN+m8q0ZrpAS7+X6k/S/aBMARAxPjqcyBpbfZyO2wB7BTZ0Svy6gyovducF9JUtrTBFsyyHDhMU7b63rNWgOYe/mjgwwrhlC8y34+eDY/0zs6v3RD8/Yure/+sFOsxw5ftRrTGLc05aE6cDz+GLgJwxNodLO/5bHHYddG1qE=
Received: from CY8PR12CA0072.namprd12.prod.outlook.com (2603:10b6:930:4c::15)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 02:05:37 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:4c:cafe::d3) by CY8PR12CA0072.outlook.office365.com
 (2603:10b6:930:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 02:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 02:05:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:32 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 6 Nov 2024 20:05:25 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/4] tests/amd_deadlock: add the filter for amd deadlock
Date: Thu, 7 Nov 2024 10:05:09 +0800
Message-ID: <20241107020510.350132-3-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107020510.350132-1-jesse.zhang@amd.com>
References: <20241107020510.350132-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b1ed53-aa36-4e50-d807-08dcfed0ac11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xiylQm5YhAKOrAvmJ5RjersC1ETRkbmwrtSUQgj/PgMZDuBRrFX1YKrxkFuq?=
 =?us-ascii?Q?GWR5e2yXJqt6dG2eADiak8dnk+vZPqESpp2Y8lb2vrBBavhxWFptIla1thOn?=
 =?us-ascii?Q?1wa5MJ6AdR6TeGDRVApkw6BKrPCEsyr2gEGEyvkLyxiKAMihbqU2UaO8+qK1?=
 =?us-ascii?Q?VlFtPXCElxT+Hu98Mjj2nsyPfhhHubPwSf9gWS/NGhctZaJEsbu7p1Sw3Sqz?=
 =?us-ascii?Q?NPnzN6SVg2sIdEPtOHFgSuwzfgIAgBLcNFns6RLo1Cs0NKS2FWvSujKKJpnH?=
 =?us-ascii?Q?8AVzkVQEMZOXoD/xV055aqN0q9lX7fCCEJVNmqXL5DyANuvb+5KyrRX6RPBF?=
 =?us-ascii?Q?1PIyWQAMMAHU7ppe2Fas4um73EfHjPCmZ8brW2RMiQDl2rnXfZPXA3PPPV/l?=
 =?us-ascii?Q?NYPL0owNOKn+aGWyV64VBuS5tSACueX+Yn90HHJXIhg7i133iglw7/ZZ/3zH?=
 =?us-ascii?Q?kTIkworGiYJ0ZpvYZ59/X6TeZlKJj9tLhl+CfNFKEuW9UMe2IPPJXl5bTsg4?=
 =?us-ascii?Q?La/6G9XRRIu4wbLHFZTVVWhfGnUjwgX/kh0u4ATRWhpF0fNaqoNBshrTqPM0?=
 =?us-ascii?Q?4PPahozEmdBjZqcbXFBPbU3grH7Y9Xbkr4/7/dGcgWr96XGTQIz6t1wmtyqz?=
 =?us-ascii?Q?cTQh/mSi5WqFz3Cs6bnh2TEau5/WUrL6WoXe7Q9EHwiZwNW+hg9v2umh81Bj?=
 =?us-ascii?Q?zZcwQuAdQR06FVcEtitWAsOKtYgz7ffo678o9N8AyfBQ9I+AYfdQp6bhBIfc?=
 =?us-ascii?Q?c856+IzfA6a8Qb5vrAYj39Yoi3k3+rGB37q0SVktz6TLnmlBQCuF7MixAj+E?=
 =?us-ascii?Q?9XNV3uuwJn6kMEGVJMCW7mQGKjc4mkL2RC2qdsNqoA+YxXq/O/yTDDbTFHZj?=
 =?us-ascii?Q?MTWnxMQIbArOFuj2+1P5qSu15fXhmcc8TqHFU4FNOacUbWtO61gZesiR3tHk?=
 =?us-ascii?Q?xpqyK6xDRRB/oqsG/t7vJiMfALJ0FTutzHYyTa5MjlsJVW+Ul5ewkHOW566N?=
 =?us-ascii?Q?xOZP3q4uCvX5k1FUe3S5Gn+o53mur7+cciADxsjQHsjVJo6B4rtiHUqDhUe9?=
 =?us-ascii?Q?743NcpYGWHHyo4yVU3sx5bBKllIjX1zuxjrlplL93Arg/zQw+3yESBUAVNPT?=
 =?us-ascii?Q?1BEBDDVbRbhzGiF2rNdyQ/qh6O3QGwB0FzGUA5jHthZ+gN09L5ZtbNty1vFl?=
 =?us-ascii?Q?iMpLkSwaF61gWSOhNkDJGlsF6UIFsI3mO5ZVUwgtEHObOvfWCt8o/42zgw7M?=
 =?us-ascii?Q?+oVxabTguwlY0KjOugaqc/Ijm+9mfSMJCZFy06reF2RyPrU3Yp0EFku3XYkQ?=
 =?us-ascii?Q?qWjdG512DQ76ig9QqdeOEhLfglNooOMmpNsTUc15ncuW5jdt1OotIpVYxsJ6?=
 =?us-ascii?Q?ccKmQmfnPdZgV69XlGkT71a0qQ6I+5S7r9UuuIuKYVsImu2Vgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:05:37.1552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b1ed53-aa36-4e50-d807-08dcfed0ac11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538
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

Check sysfs reset mask before enabling certain subtests.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index b5d053663..b8bb053ca 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -71,7 +71,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
-		if (arr_cap[AMD_IP_GFX]) {
+		if (arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX);
@@ -80,7 +81,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
-		if (arr_cap[AMD_IP_GFX]) {
+		if (arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX);
@@ -98,9 +100,11 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
-		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
+		if (arr_cap[AMD_IP_COMPUTE] &&
+			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE);
+		}
 	}
 
 	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
@@ -113,7 +117,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
 			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
 		}
@@ -121,7 +126,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
 			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
 		}
@@ -129,7 +135,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA);
@@ -138,7 +145,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA);
@@ -147,7 +155,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA);
@@ -156,7 +165,8 @@ igt_main
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
-		if (arr_cap[AMD_IP_DMA]) {
+		if (arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA);
-- 
2.25.1

