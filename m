Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429A8C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 02:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520D210EC20;
	Tue, 26 Mar 2024 02:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jQUVabpE";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3386D10EC20
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 02:10:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMCrSo4cMRhc9exd/yLm8yuHcqXWMrwSZzdG9EUkGwbjnh6l4CBUgGu+OBbPMoFqqaVtitQ4WyUPouscOrE3xB//TiGz1A5NXG22NH2U0KUfEN3eenlkaZZX5SCiQwHaDS8ffUExaFBg/Oot4+bjEYZgXxWc1qs21rcAiM9DReCWMqLJbB7Aa3NzPvObh18h9gvXg7Z+z5yMNuz+OVqeGHVLhHhEKU8+ynbPLCIOwtFYKCH8mPKaPD761zXkMH1qE9oaced6JuEdwSjd925+Ed3+rw/HBm/kP/gQYF1MDTbdA7BgfktVj+NZlVFZQxqDGlGYCHBe4DH/xHhg2erwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsoapxiWC4WL2BW1ku9j34IgoCr4xH2kNo7Cw49dBlE=;
 b=T0wcTaeZrCTVkf59ilVKTgdyq4rS2cI1eY/49vxuRvxtgOBsXuDlCsCMtvFE/xVabfcQ1JARaTJTx6zoUtTuFDZrClt4O3K+uE06qg4CBYjdP1x665jj+bPfIDIovOS3AKWkxSKLM6/IoCI8N8g2DjeVqDZv2jTiEPFv/dC9SGHsxfkD0QNHXpjdARXwEj6NUILpvvUdI6REB/W9jDRM2Ecc62Ss+STfU58g8EL7H1oOS7jbp/RdLQ/pw3qEj7co09nwTFiXWSvpAffk93Jcaf5i7wPNP43xs8CLjT69gaBiZi6I6fJ3t7r2s3/YKe8LBawgs0auKBwhNlW0+x/oaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsoapxiWC4WL2BW1ku9j34IgoCr4xH2kNo7Cw49dBlE=;
 b=jQUVabpEF6FCFbR2IKcVVcJ9DGihT3xZ6AWx3keVCMJOSJTChB0/uqwEFgbSqIQAxC5jYKJ+FU+7o+grK/PBNOrI18GphuX1QHOQkT2KiYoEG2Z2Q9SPYWpzd4rIWPLS4ONe2MhCgLLoo68+5wN+eEjT48gtITCPA604ZYisB2U=
Received: from SJ0PR13CA0090.namprd13.prod.outlook.com (2603:10b6:a03:2c4::35)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 02:10:38 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::27) by SJ0PR13CA0090.outlook.office365.com
 (2603:10b6:a03:2c4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Tue, 26 Mar 2024 02:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 02:10:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 21:10:34 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 21:10:27 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2] tests/amd_basic: WIP fix eviction test failure
Date: Tue, 26 Mar 2024 10:10:27 +0800
Message-ID: <20240326021027.2459760-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bbddca-ff52-4f5d-d2af-08dc4d39ee4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EVe4CUGBtg3nXoSydcEjaVSt2jL6fObI9nKaRpQMSZtPmFObifFQu6Bn37xolVSJQzywl5aLvxPCJGo/D4R0veKWVrlvqtniMZkUcg0FyKtJ6+/Qkqt6reR1merCYNaPmwCqSBzu1iwM29+z8vfzvgntho9F80KMu5B/v0pv+dp2Goey0C7CmmzhpcOVcavgeE9u8NPURLBigp9uIJPwlGWESKYP/GVIFwsUrdmuKJlc9GcEg8E3SESAujlALdsILlCn3tw23PQQy3psHvyUCUJEbUMSaPO4dWG/3QADGYNIRYjhhYJJt6h03LLeGxcYgq1l+5hNFSU2ssSSbtAmuCcQYZYYBwXqNyCr1ZRaY/AsWV5JH4/FH1dtcD3E1QchCQmR1iXrUCs15/drbiuOzEDLWsZHscSdFlw2CsegdAKPGXJUzkJ0mQ89o3zpVAoxTup/VaiOZEiI0iu4Uuz9FoC3U79JlNwRn1H01eSThorselpW2jxZMLMR2P2ipuDTMelRZ4vm+Mad5n7ftZgWJG7D6lndW/ireObrqVNhVCz6/eShZCDWjpU67shCqI9qjDDlJeYNoNnCPmRlQe8L60BhWGOkPHKGoDe5fWCs7T9YAApYPaxltCxlnxEsiyWVRxVuPwQUB7D4MOKFV/4PvD4PibdA7ABs7uw3031HK8TGTLyw9jbfp8oe/QynoIVP5Db8EGc/QF8QlTXbO/puNcFSwGgB+A5grU3/k9fXrUIlkpq4+DUS0cExgnpddMWG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 02:10:38.3845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bbddca-ff52-4f5d-d2af-08dc4d39ee4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
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

Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
Fail error: "Starting subtest: eviction-test-with-IP-DMA
Starting dynamic subtest: eviction_test
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
(amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
Dynamic subtest eviction_test failed.

There is a case where the system size and gtt memory are smaller.
When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.

V2: Added dump to the file to get the values for gtt and vram heaps (Vitaly)
    Remove the space and empty line (Kamil)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 70e45649d..0b4159222 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -336,6 +336,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 	struct amdgpu_heap_info vram_info, gtt_info;
 	int r, loop1, loop2;
 
+	FILE * file = NULL;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
@@ -358,6 +359,36 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 				   0, &vram_info);
 	igt_assert_eq(r, 0);
 
+	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
+				   0, &gtt_info);
+	igt_assert_eq(r, 0);
+
+	file = fopen("gtt_vram.txt", "w");
+
+	fprintf(file, "gtt_info.heap_size %ld, gtt_info.max_allocation %ld  gtt_info.heap_usage %ld\n",
+			gtt_info.heap_size, gtt_info.max_allocation, gtt_info.heap_usage);
+
+	fprintf(file, "gtt_info.heap_size %ld mb, gtt_info.max_allocation %ld mb gtt_info.heap_usage %ld mb\n",
+			gtt_info.heap_size>>20, gtt_info.max_allocation>>20, gtt_info.heap_usage>>20);
+
+	fprintf(file, "vram_info.heap_size %ld, vram_info.max_allocation %ld vram_info.heap_usage %ld\n",
+			vram_info.heap_size, vram_info.max_allocation, vram_info.heap_usage);
+
+	fprintf(file, "vram_info.heap_size %ld mb, vram_info.max_allocation %ld mb vram_info.heap_usage %ld mb\n",
+			vram_info.heap_size>>20, vram_info.max_allocation>>20, vram_info.heap_usage>>20);
+
+	fclose(file);
+
+	/* For smaller gtt memory sizes, reduce gtt usage on initialization
+	 * to satisfy eviction vram requirements. Example:
+	 * gtt_info.heap_size 3036569600, gtt_info.max_allocation 2114244608  gtt_info.heap_usage 12845056
+	 * gtt_info.heap_size 2895 mb, gtt_info.max_allocation 2016 mb gtt_info.heap_usage 12 mb
+	 * vram_info.heap_size 2114244608, vram_info.max_allocation 2114244608 vram_info.heap_usage 26951680
+	 * vram_info.heap_size 2016 mb, vram_info.max_allocation 2016 mb vram_info.heap_usage 25 mb
+	 */
+	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
+		gtt_info.max_allocation /=3;
+
 	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
 				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
 	igt_assert_eq(r, 0);
@@ -365,10 +396,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
-				   0, &gtt_info);
-	igt_assert_eq(r, 0);
-
 	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
 				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
 	igt_assert_eq(r, 0);
-- 
2.25.1

