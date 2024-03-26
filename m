Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179E0C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 02:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B4010E45F;
	Tue, 26 Mar 2024 02:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cHoOEznp";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A718010E45F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 02:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr0bH4Tt9xKgzecEZjzE4a5VgAz5zFo4vFikO8yFwO0wHO8BC+S18CXvr5UNFPa9yplRmFb4ka6I5OhXjtJ0k50YthAQ7h3moRToZ0/GRFbI5b02wT2HFJobgDqE7deHKpOpFeegItNKit3dIsxavX03NRnR7VtBrlmaXlqAGk3i+TPDPER4lfXUKuMriW2PtuPE3Y8cf9n4ZkB/jzI9wNdmYZtxecVizw6SrvtBFMnmplDAy/N0orWJHJriSbs0/HNxEVUrH1qeq4jFaBPfQNH4Gjgd1jHEtGJ0lzUaFcACFSHjcvsHzxptcfb7NSJdfGKsUYosaXh4rcCbnYbTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObCv9Yilzt1reg7+68yJs+nHE13GwHHQe8anjsD7dCM=;
 b=Nuxn+t32p5wi6fHLjpPUrDSeaz252uMNDsMFc1zpP3DbqvGBFpg0CQdbfpeGNFBLCMzzRGLGjEM8Lm1X8ZtxoIUF3l+4mcPPk0dXnZgp/ZmkiJhhYB8uBPWd6RkOutRT4/cpGCg7sfycXXNrxvcRDLSY/VSg/1qe4dIGwQq3Zc3f1e2zh3ZMdkN98C5f1rst41oD2FXQW6TbryAvZWF7Jl7F1BD5iakig9sG+QzJ1FeXlbE15jFXcRZvKgwl+tYHurB0HIttcYGaw4Gy7+2lVdBw7Acnq4rjsnD7lhoOHMRdgVMuzaD9fPXzyO3IZzRcn1KPDVQ1uHK4J38/uIr7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObCv9Yilzt1reg7+68yJs+nHE13GwHHQe8anjsD7dCM=;
 b=cHoOEznpMWZICJ19E0fmdl06ZSU45VQuyjdi4WbX6S20Qo11CEcKNZlw90M1rdFlUYKW5oL4PWJok9ow+UHG2KQgwFzVTgq3fiRBfyBpSv4j8FIRLtJKyYwRhQo6Zrkh5EEcPtJiYG0u1gKQ3mCny9DW9mC2BMqGDCCpGeirVZ0=
Received: from BL1PR13CA0306.namprd13.prod.outlook.com (2603:10b6:208:2c1::11)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 02:34:54 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::78) by BL1PR13CA0306.outlook.office365.com
 (2603:10b6:208:2c1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Tue, 26 Mar 2024 02:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 02:34:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 21:34:53 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 21:34:46 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
Date: Tue, 26 Mar 2024 10:34:40 +0800
Message-ID: <20240326023440.2460660-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 76259183-3560-476a-e7ba-08dc4d3d51e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bN6o4Ut0mbjz1HXZugPqTmLd49PPDRzdAyZn7V/R5m02iyeg3L/R+ijbzxyQihBgKHVx58VcxsArcotxGV89pSA75THjNvSRS6D5MzLYgrW8NUp2JyUYBE6RG0EZMsfoH3BkYu2LPajHLSEatcH0ljgy63U2oEz6168i/Yp1p2SQn29wHXP7+2EBx57paNoweA50dRzebLi0DwomG6+EPrAng5a8ZJ1z1mSPATx9vS0dRePGbHpMFDV0rMzm3ybj5sb7fvR/Ztov64BrhT2CarU5l3u1+5dX2mAp83fRkeRTKzGe3uZ5bnL8BwfKuFUGI0ASv3fBCFOSwoQkHcswL2Sp9kA8CYwEPoHDtFfFQVA6qReJuAp4U5MGUJu1EYn9/a0OXh2rKtO3eq6i6UijhZyvKpf9nI3+seyTpueUHSXE+Ci+iiAxTJLgIzs1GSQ5kG0a0kaqHm6h1RLNf6fbikn7voXuzqGUcFkz7KG7SrLEmxM8gOW4H+tZINknVB8McD18N8PtB/bNSCcW8Dh6WMHYJjTzqDkhL4zFgtS2i9pFq45bOtmxoJdJgrmtfF27TadxMn9QBncMr2fLQj9zcIpHI4QXExmbtsUE827MoxBYl+Qv2madVn+kuLvTSSTDVnvHMn0HYaF4Cilz+G1vfZ25MuVoafMiZ4Yg7ZZzD48JEHNATsuPndstxHoiP2LSxXf0N4+Htm/vzE4gDAZHlQGlm7XPdHs9+Pr/qyjbofGj0fflJvFRZKAsKaAONYaR
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 02:34:54.1300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76259183-3560-476a-e7ba-08dc4d3d51e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
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

V3: Provided an example in the code of exactly the numeric number (Vitaly)
    Remove the space and empty line (Kamil)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 70e45649d..8819b9cd4 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -358,6 +358,20 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 				   0, &vram_info);
 	igt_assert_eq(r, 0);
 
+	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
+				   0, &gtt_info);
+	igt_assert_eq(r, 0);
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
@@ -365,10 +379,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
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

