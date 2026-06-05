Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A4CCD6E6B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 08:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E6711A5A8;
	Fri,  5 Jun 2026 08:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bC1SMrBH";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BBC112AD7
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 08:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHDdj+0gFLsAnGpEUejaIeon6q+xdOqDxOaGhTvDteGdNMrkI48DLeeoeziBp/t9xTHfRElkCy5bdH//OXyRnJuKwoh+wpcFWmVxidQ+p2h2o6l/NdlBS+Tnub4KDqwWCq4xp4pgXvj+eB4qSLadwqs5ylqXM7eP44sanvz6+SygWKwwdK8jolJfIKYc09FYwRDWdZGMo2+4DCASCj2Udt7MpRQOr4WR2DHZwTYrVD1BRVhrX8PDB31wRfpKFJRYblFwgnPi7ZmjNeQCTtGXKgKdIdL5+gCx9FbZpoCXx4zGyPt4Dcq1SLelo+pRFTKUadwsvfJgNtrEVLdWCN+7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMta6GONN+Q0SeOZa3DjPZykgGy1ZhKaUgqaicQAcUY=;
 b=OBwBt0yWdvzijqHzmf2iOvA3kgm9ahAVcUtnnfBU8+xk2Cir2IHBvNArlD6/Yzi7IYCXgRTLcIztfBWctzhcChs2Muv/hpqTV+aIf0NjCU7KQ7FX8ldDGWjyhY+eZIZOOxOulQkK6tPSBXLSdNfJisT+uC1B9oypO45aRL9xZPCoNvd3YNgODhP+1Mqx6Gvqz9ppwflVyZAk5wYSTO7R8Gv6C9qhocCyz1jOS4X+nXt1fpL6Gr+VqIcevZIhooR1+B2QZc/uWGnRD/Sp+jFe7OTKyYG25hCRagCVx/NKSUgsewAac/4N/YfcKvWgxeb7GNl420VBNxHeXEMY4PQQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMta6GONN+Q0SeOZa3DjPZykgGy1ZhKaUgqaicQAcUY=;
 b=bC1SMrBHpB5/lRcI24/9AXNkBoUSCI9kN+anjMnhQWIhJyQ081ZGaeQbn1ek+wDpjvcrXipegVFYfpgLXmn4aiTslkpO2rLtGRmKTLJjY8FyYV4AI+ocMNfx6Mt3jaJ9LrDIBxC37CbAP3EzWb/JdrtBkHSktQ3laU5pMGGGJLQ=
Received: from PH7PR13CA0007.namprd13.prod.outlook.com (2603:10b6:510:174::17)
 by IA1PR12MB8405.namprd12.prod.outlook.com (2603:10b6:208:3d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:22:13 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::20) by PH7PR13CA0007.outlook.office365.com
 (2603:10b6:510:174::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 08:22:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 03:22:11 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 03:22:05 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: Use correct GFX doorbell offset for userqueues
Date: Fri, 5 Jun 2026 16:21:33 +0800
Message-ID: <20260605082204.2478714-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|IA1PR12MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 50490096-8325-4e00-aa78-08dec2db8b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: M71TNWrzEu8swVXK7MsulL0LM3Gtt+Z71zHSCxtA2l80OmxMA9qFaFcLOKvozYX9F/VEdjE4pRqAhSHv1AvdeOLXUmqXUkjSPIB1jVv7UjdGsGXhSZy8TJI6i6Jx1ZirGxW/LwcVxt7Jgw/OqWCjGpIlBMBZImsllQ/KptXcm6kQgVOfgI1SUdx8JFnA4ZLJc6n8HCrQic8zN6delrb7Z5P4MzrgD8MUTCOAx4o1pKvio4Mea+YiZVt5lbb3Ga3L1+rOlVmC9VhXRZ52ann9X1WVQy/sKJ0VfgH9mLqEyWrZPwjOvoWNuwDzqwm1Gd8fk3VlPSXjch8POyx1s1ZBJM6B3562Z7VC4XGAFvZZ7z0ezj3vc52F9/8Ja7HQYBq303MHJZ6tOWRwcQLvf61IsFRfRqZPVzIrIjAKNcp11fJ+JXJO+xCfMx3u1jYlAucdsnPa7EJCAGpjnzNfGJqucOLuIg8d0e39LlixBrCN89R7Gq4Nc2CA4BxbNoJnZy5mcwdEKz2H16HfDmxXz1wipC/1bmzRr6ym0tD+MaTTx9JtUGSVKq+ugF4jqVeq9Sa+hx7WsTGqJZP4vBPG06laAL9TjWOlveGaCQLgatnF65KmbgWVI7nIMDt3UVok9YmC3Vd87czh2l3FPerBgLYJWarLsiXhrmtQdN/sFgEFN2DrxRLk3FvVSF9diYj+iU7VMij4V6PgkuTpAgqfiLUHSxfaFyGJala2c9aALmVt5oI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 82iARyqH88RFLs1DQjeJdUlRpk/v81TozYlGOPIUGypvz6jACd6Qf2FFCGfIloxGldueOCdGeS5i6/A/n2N+QwwkhBIbXYxyIzAu22SI39AY64DPclyqbgwC97FpQl7GEvRnXGl49j8gQ+IoDSwHfq0WTofV1D2AL9mTbs26VvxvkZW7ErSejhKbqLr44QMCvj7QlArfW0Jp/tAlCk6uAIse2qqaH7Wyka2YmAeMMSB/24AhCRM6d6XprDhK/rsr9R6Kw8K+Ft2QE/jGlImfupbvX/hJCH23NgccVetsQQ0e0AOMkjIVrVJIeGHr0sDD8RkJ9p24Iv7iWKbukwuZ1meSaN2Lu+1GI67eVc8798Boa8ttpijrNCuXd8YodtUJECDEBK57tC+CnJyAYbOMG59YxvgNDGmgClXK1jazWlXNC4qld2tpaA2vaNcRQizK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:22:12.5632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50490096-8325-4e00-aa78-08dec2db8b71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8405
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

GFX UMQ doorbell writes target the per-page sub-aperture starting at
dword 0x11A within any 4K doorbell page (see
AMDGPU_NAVI10_DOORBELL_GFX_USERQUEUE_START in
drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h). In qword units that is
0x08D, the canonical slot for a GFX user-mode queue.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 14 ++++++++++----
 lib/amdgpu/amd_ip_blocks.h |  3 +++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index b44441d0d..b56fb68b8 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -748,11 +748,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
-	if (ip_type == AMD_IP_DMA) {
-		/* Ring the SDMA doorbell at the page-modulo SDMA sub-aperture. */
+	/* Ring at the engine's per-page UMQ sub-aperture (see amd_ip_blocks.h). */
+	switch (ip_type) {
+	case AMD_IP_DMA:
 		ring_context->doorbell_cpu[SDMA_DOORBELL_INDEX] = *ring_context->wptr_cpu;
-	} else {
+		break;
+	case AMD_IP_GFX:
+		ring_context->doorbell_cpu[GFX_DOORBELL_INDEX] = *ring_context->wptr_cpu;
+		break;
+	default:
 		ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+		break;
 	}
 
 	switch (ring_context->submit_mode) {
@@ -994,7 +1000,7 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 	switch (type) {
 	case AMD_IP_GFX:
 		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
-					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->db_handle, GFX_DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
 					    mqd, queue_flags, &ctxt->queue_id);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index e26ee68a9..2adea2f58 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -63,6 +63,9 @@
 /* SDMA per-page sub-aperture starts at dword 0x200 within any 4K page.
  * In qword units (USERQ doorbell_offset is qword-indexed): 0x100. */
 #define SDMA_DOORBELL_INDEX		0x100
+/* GFX UMQ per-page sub-aperture starts at dword 0x11A within any 4K page
+ * (gfx_userqueue_start in amdgpu_doorbell.h). In qword units: 0x08D. */
+#define GFX_DOORBELL_INDEX		0x08D
 #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
 #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
 
-- 
2.49.0

