Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F3FCA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 06:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0CF10E184;
	Tue, 26 Aug 2025 06:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uQem13ma";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C0610E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 06:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3PNbur9H6bmuYlAsurP1cgnveOOdgqPSHlNfoz3YfqizwMNO38IiZ+YWa5Hc35qgjgwuGT1vbw2LhncnZv90PfaCIg7ktaYPD2o3/JCKKITbnK6KkzzS7eg0311E9kFfmn3Bgb19/+hH7ryu+zgCZ+nxVE1WxZ0SLnznV3/jMXmeSYoHF40UJrXxiBTM9kriTZ/TZuo4WJHBShb9uJWxyOk0dwLv0T1ngN/k08q/5C1pdxRKV/xMMFH7lC4LlMfdQ5RUG0SaFcceE8cCxmxzdNkDClTM9tN0nwtF1ks6bcUhjEoMhA/1mWjMZBopd6fT+pkkvI4eOGlmaN2e90qPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIJxE6gYgACt0HeDi8tlw2LcUaWq0GVTc0OWYmEwR1o=;
 b=hZmRjRCvBU71fFoBx/kPyN6L80gq6cq93PObxbpWgMrMYako0Dh0rJ0/WzkBMFKou2F9SWivORSO4vKH9enJPhwYLErHxcI61mLabwDfkqJ1MOZn4hYkcJzjgXjaiJd/000K3RuuZNkvxYyc7Vv29b2FL4T7pa4qbSW1C44KMwRkQIwyYeXZLwjtKUWiftDsEORpjUjr1xMMkP52N0/syM7cxkG/nCqaqDSEFb0FDm2Xp/wnZaoj/nlfJ14VmxuhPO3hcXE8LYPzI3uiFIKKrRGYiH5v/Xxez1oym2Z3uyWkKCNvZqk1qTmGlIloTgv78gEP5qb+ChkiZVkE2CIjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIJxE6gYgACt0HeDi8tlw2LcUaWq0GVTc0OWYmEwR1o=;
 b=uQem13mamMkT14QO7DAnFQr+LRnoUq1Lofj789C+EIYhWrvVCmGZpDwljzuzXjLyFvZ5YD/e/IuRJlDtsSY5bmv8W8iDf9UJrFfq/PAuF1UfrbJ/B/3+qE+6PlHOU7OZjvUrS0xfyVVpIQE3oTyoVZfO2WHUEeHslOfKHHWapAM=
Received: from MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Tue, 26 Aug 2025 06:45:41 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::e) by MW3PR06CA0022.outlook.office365.com
 (2603:10b6:303:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 06:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 06:45:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:45:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 23:45:38 -0700
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Aug 2025 01:45:38 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: Add user queue tests for SDMA in deadlock
 tests
Date: Tue, 26 Aug 2025 14:45:12 +0800
Message-ID: <20250826064530.1721892-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250826064530.1721892-1-Jesse.Zhang@amd.com>
References: <20250826064530.1721892-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b83c05-c403-4dfd-bcb9-08dde46c2c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+enSKevxXJ22xMA93nv2/w5PTbAQ8ynX/Mh08kuMYfcm1S1Z1idD0feZ4sxx?=
 =?us-ascii?Q?nZObGJmzBd9g8iAJNe0wUn6mi2ZdnMiaodlzq3JHP5Fqjqq5oaKGr2W9caKQ?=
 =?us-ascii?Q?qq9tQs0NikTaa0eLw/woeAMklNbOmZpTv4yPkVTEaYDbZr7HcVN+yBfHCvyg?=
 =?us-ascii?Q?9gatI7M4eyM/0KD4CEApV1AHcrjDoX81cwzAATOZ+iBaKqL+Oma31iCJcLYp?=
 =?us-ascii?Q?hhDLMC8UEScRv0sDS0Bi/Mc2GID8hUYNMBFSrjIh2+iS5iwsRExjpKfKMVOC?=
 =?us-ascii?Q?71XGMdtO9ex0mUD/roTtC61wEexMVlas4sna8dX5Nug3WOGRM7rb4oOq1dVM?=
 =?us-ascii?Q?yvL6Kg7EQTxW1z5QgRwtPh4egfI2ZBNbDH4Wkm7EkTiveXUZbJCTzTSAt62R?=
 =?us-ascii?Q?0ILnoMANrJtvtoeAiiRdyh2Y0FWkR+To4sfcxuLykJi3jLHqTQJUmph+SWD4?=
 =?us-ascii?Q?cQY7r3Tfvs4tnRQlA2/oHm3aOKLNrFH+5RkOrgUrRF9LWLfn2LEOyU7vnuPx?=
 =?us-ascii?Q?y8jjZ5a5hKY1SFIRHlFlKyjlarjbwb+tJd383msVOCNgTuVHah3VKwUkWBOa?=
 =?us-ascii?Q?JcWGa0Y1OMkdRwq/TsFZmNhPf45c7PhAJpasfZuQZTB17j7IGfNfWj/ry4H4?=
 =?us-ascii?Q?EPmBSZYBOGT7uuOksh0O9URMayy2Wm0ZBOV5IX7QloNlUewm1OmOT0YmiG8X?=
 =?us-ascii?Q?z4h1MBTZPUqQSd4fV3ExZCoPUq0o4QbPJRC4NbxYHdea0j6s1iT6GDdalvaK?=
 =?us-ascii?Q?Px9DJ8rG4WIgTd3T2yo2V3TZJ8rEKMwnkosGSbFy59PCwPWJujB0BjynDnax?=
 =?us-ascii?Q?ULn7WyWqpBaTuHLAJSDumthsPiNtf2gVSlK5zzzVdnCG9AdNysYhnvmBedDD?=
 =?us-ascii?Q?5XSNNCWIdjOeT9rHInS69UQ8+aVmXJ5CcFTsnzvYPAG2p9J39KmR1dBgPWAH?=
 =?us-ascii?Q?HH9LEjUuYqTCm4mk5LyCGbUa88zHJUH5BMzmWMyfrRPfg+VqXtDrzQLdsbao?=
 =?us-ascii?Q?yNd7LdkQvrPNYvQcesUniCD7Ga4efIgGD5DVVXdN0qyrpjjP6XZQjXHQ+h1V?=
 =?us-ascii?Q?+MoKDe9dTrQ5k8KxobfZpMKBRfqR/VYk2wW8NLsVn5XrPBiTH1dlsMNcJEts?=
 =?us-ascii?Q?2SPsMEC8UUz/2oNTscIih+fWJ8CnGfQFs4qnbzB5zkLUyf29+5TrWvNTIeyQ?=
 =?us-ascii?Q?bpWT4bRl/O42byMSzlzFYTiyTjK/ty8rjKOruEePlkS/SSzANwoWmOTrBift?=
 =?us-ascii?Q?Nw0IQs8/s+GQLRJ2Av+eC4nY6DAbW2T+qCnFjTex3Pqow+MvEf+0Oj/xz5UU?=
 =?us-ascii?Q?RGDezIFnIByGgUiSBXE8+Q/mcyIyibMINqC1qZIxxyj0XCVvZZOlhtLI4Gvj?=
 =?us-ascii?Q?I9Fo2lxdO9vlP8TCmDL60L2unXTw+yWMDXJ7Wguvz2lTI+D3v9ZxwhwJweCn?=
 =?us-ascii?Q?XRFsggBC/4DE+cxt+neynGOVVIFZv/5hysOsW20cmAqh1gU6Rs6857w0VrsQ?=
 =?us-ascii?Q?IbvgB10KgodKuHIQW+cUPWwo+O9OON+bustY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:45:40.2131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b83c05-c403-4dfd-bcb9-08dde46c2c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144
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

- Modify existing tests to pass an additional 'false' parameter to the
  amdgpu_wait_memory_helper function to disable the reset functionality.
- Add new tests to cover various GPU reset scenarios triggered by SDMA:
  - Test GPU reset by SDMA with bad opcode
  - Test GPU reset by SDMA with bad memory access
  - Test GPU reset by SDMA with bad register access
  - Test GPU reset by SDMA with bad packet length
  - Test GPU reset by flooding the SDMA ring with jobs
- Update the test descriptions to reflect the new test cases and their purposes.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 3456f42c8..41b3aa15e 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -78,7 +78,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
 
@@ -107,7 +107,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-deadlock-gfx")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci, false);
 		}
 	}
 
@@ -124,7 +124,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-deadlock-compute")
-			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci);
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci, false);
 		}
 	}
 
@@ -196,6 +196,54 @@ igt_main
 					       AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
+
+	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test-umq")
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
+					AMDGPU_HW_IP_DMA, &pci, true);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test-umq")
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_DMA, &pci, true);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test-umq")
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+					AMDGPU_HW_IP_DMA, &pci, true);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test-umq")
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+					AMDGPU_HW_IP_DMA, &pci, true);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-umq")
+			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, true);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.49.0

