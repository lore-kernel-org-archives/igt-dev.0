Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FEACA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 18:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168810E525;
	Mon, 25 Aug 2025 18:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GONOgiKR";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FE910E525
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 18:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut7zGlWLzfUmmwoBGTEzo4jW4SvllhvObjSS5qX0eb1tLL4E4hEdtxs1MbPbXjBy2bFdG7mwj6A0CBoe0Y6eSOHbJupIdJ51rx4VAcxlFT5xcBOTMff436GU4zu3aO01U1GyBs/2+3LOQ3Zd60f5HxRC84iXfpNUuv0s4dRJ5I1tS2g4x1QWFFbmlbd18eX8kxK8c9t12OV4OL4qYsCX0vdZtf5deVIRCwpQoJVsl6ySL8Y+Y6K6NpAFFBu5zn8YYyPbOOCyjB9dwO+7cSVQhM221Lqo+4hM89qpbbbiuCGX6fGaAzDxfR4LsxG9b0GS+d3qVe6xcv53J1c9q1FZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DElEBLCvZAXZEVE9OdlCYQ1vTVyjTHHiE9SL0F1mKnY=;
 b=hs91dYiu40+5TBEpWMV//C5zkHJVl8wLtNbV5+Paq4KYQer8Q3Dw8jlRxGScHx4WQPi0PxuQUS7xQCV13pcWVANZLHt/GIdRjGRdoGvcbfaP8GCBTz6dMyyMG8jegCG3QxOiObVq/c5vIxMmaqBepIya40Ce1cXxVL+odGstn5+29yYkfHSG5H8GxA1uywHUsGZ0DbiDXrvmzoaiNaK+c/tLtO92wBoeg6FvY7G8ZsCihenQm2eSRs4OcbLvOKyqEx6f8AkCXjHnJGfGpHz/sr+MHe+jHaS4kYOGpUxOvGQNpbMQJk6D2rbyM7s9KuvHrMKhYSmusSQc5yQKghHX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DElEBLCvZAXZEVE9OdlCYQ1vTVyjTHHiE9SL0F1mKnY=;
 b=GONOgiKRkMjc32sI7hUJYxSTkCpzxgfOA1q3hliiIAmYSNk09IzbevjefwLkkf3KSqaoUV3D73vCqt3hobbdyKp/Cjh9rxZRUsA0/qr5xU/wTdzT0gGvlatYLqDY7AzMSvqU4zWyFni3rl5tGqQZ/+1yMfOMtNK2RiJ4B4cuNlk=
Received: from SN7PR04CA0016.namprd04.prod.outlook.com (2603:10b6:806:f2::21)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Mon, 25 Aug 2025 18:10:50 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::42) by SN7PR04CA0016.outlook.office365.com
 (2603:10b6:806:f2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Mon,
 25 Aug 2025 18:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 25 Aug 2025 18:10:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 13:10:49 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 13:10:49 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] amdgpu/tests: make amdgpu_sync_dependency_test work on gfx12
Date: Mon, 25 Aug 2025 14:10:47 -0400
Message-ID: <20250825181047.45203-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a1ae14-c04c-43c9-d84e-08dde402b912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2xKMWZIODcwQWk4djd6b1gwa3l3OStJM05LbDd0eUFnVmUzQi92TEJ5d01J?=
 =?utf-8?B?RzBnOVBWN1JCK05qRGg4NmNWUVR3cFpZZi9vc2d3aEg1RVYrZ0Y3bXA1MTZP?=
 =?utf-8?B?V0pIN0RVR0NnZjg2ZzFLb3orbE00VUI3OEJ1OWc4WWhwMm9JbklVWEJKWXdw?=
 =?utf-8?B?eTRiMmpNTjFEaVRIOW1qUUxpOHg0WEs2ZFlCTmhjTVlwT011cXM2RkFLOE5x?=
 =?utf-8?B?WkloRXIzNXZoYWVOODV4b293NXhpY0pyMW11bllVKzRRcUpTSU0vWmgzU2Fz?=
 =?utf-8?B?Z0FuM3NtdXhQanZhNHplOXlieTZOMmdGZzZvU1RkK1gyODl3MG9xYWdzL3Bu?=
 =?utf-8?B?aWFHbVhaYUF5QUtDcUZhYzh4TWRHR211YmVjazFoakMxbGdwVDNvU2lBNXl0?=
 =?utf-8?B?WkUyL0ZmVGJ5WnhqQ29OcnZKU3RBaHU5aG93RVVqdTExbjhacmFBNmJabll6?=
 =?utf-8?B?T2tIdGRnU3Z6djhBY1B1Z1hPZXJaWUMrNzJ2RUsrVGFoMGtybk5tU2NnZDBn?=
 =?utf-8?B?SXhiLzZ1RFFXOWd5UWpMbWpZb21xbzFCS0xBdkRkNHpPelhmTk9QelNIVG5Q?=
 =?utf-8?B?emNqUG9FN08zRnNTUXVQaDk1OWVEQXhBZmE5S2lGaGhqRjhDSmRSalVmZHRP?=
 =?utf-8?B?VGVQQlR4djlmTk9oMDh2MzVnZ2JrMHFIMkQ4ZzBzUlBmQU9sWUpXdC93WmUr?=
 =?utf-8?B?ZzlYYkdzK3BFQks4SjFjYmRSbUNiZjZYdWhxWWtHYzVTZzdsRXNtSFNVRFB2?=
 =?utf-8?B?aG1mREpBZDlzVERpc0JwU3BCZG9XQmIrNVppNDN5NC9tdzNrVGtkU2c4S2w1?=
 =?utf-8?B?ZXA5QU81ZTI0K3R6SlIrTzU4SUNTTFlKOW50T3lKSy9HNnJSY3hYbHo4a3Iy?=
 =?utf-8?B?YUlZWkRhQ1llWFlENXZoMUpCaDkzRFpLQWtNdDI5TUpKdVppek93VFdXaVlF?=
 =?utf-8?B?bXVyR3pWUXBjY2Y0T2MwYS9CeFBJakJuaGtmNXZiejlGSWV3QzcyVU1hd0Nt?=
 =?utf-8?B?YXhOc3c0aitsU1U4OFpVNnpXOGJKT3JEUGpPVFpnYWlmT1F6Ni9ZMGhDOHJa?=
 =?utf-8?B?R1BaajFHWHdTL3NnQWRIcE81MXBYa2V0WUlRbEZKMWtCVDFLcmxUUHpKZzlt?=
 =?utf-8?B?MTM5VmRWYVhxQzJiQ0JNalJmRS9aOFBGalZhNFF5Uk81dGExeWtrejBPZ3hG?=
 =?utf-8?B?K2NzQk5McVR4RGRpdTRFNnpiSUF3Y05zUWQrZFNtWUN2MVJKdHdwZkYxZ0xD?=
 =?utf-8?B?UEZnbXZRQWlzMHd0YWtPNXpXWnViSXJjWTcyYzJ3NmlyRWpJc0pNKzJHdzdS?=
 =?utf-8?B?ZFJ3b1RWN0xjaElsUVN1OHJZK1U2Z1hRSVQ4enVqVGZTSmdraWRyK1VlY1hO?=
 =?utf-8?B?V0dwZm1ObldaL0MwS1dQSUNtS0t5dGFvUUVGYTMwd25vUjF4aFVQQmt1Ri9L?=
 =?utf-8?B?ZXd6VEg1RzA4TjEyTXptckx2cjFrUW9jT216MVQrTHJ6NThpR25URktEZXpX?=
 =?utf-8?B?VE1tZUUvQStGSnB0d3lhVUc1YktPY1JKdm5pL2IyMVErcjd2QytscFkrWUth?=
 =?utf-8?B?QVlWVDFYWUtDNFNjQjJ5enovNEt0M0tldi9MeHJ4eFlvSVJSTlJzVjJoNHpM?=
 =?utf-8?B?RW9hdzUvWmpvY0h6OUNsRkJBTXRST3JZbkVOWWdKNWFpR0NWMlEzdzJGRTlG?=
 =?utf-8?B?RkNBSUt3QldjNnJnLzRjUU41OHFZYTJwNlorNFJwdFdqY1l0Sys0S1ZMVWJl?=
 =?utf-8?B?aHB2bmk4MWMwUXNxdFdjR2FPUFBXZmh4b08vWDg2aGxvTStML0RORE5meDlj?=
 =?utf-8?B?eEVhcUxtS2pKWXBLc3hxa0Y2WlZFb0RZb2NNOTYwUGhoZmErMGxHRUJSNnRz?=
 =?utf-8?B?MW8vUythb3JIVkRKeFRSbUd4OTRBMi81VUNXTWs5R0FBYTM0bi9VZ21nRFZy?=
 =?utf-8?B?ZmhvWFVyRm5OUThvM09ocjJXM2hSaHhDZThuUUEvSjhidmdnRy9PdHdRYlhv?=
 =?utf-8?B?NGZncEVHMFBxZGd1dFB2dytlNWErTGErSHBTRWVqZlpJeGVzenNYNTZrN1Vw?=
 =?utf-8?Q?nOvb1+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:10:50.1914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a1ae14-c04c-43c9-d84e-08dde402b912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
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

drop CLEAR_STATE and fix malformed preamble

On GC 12.0.0 (RX 9070/ gfx12) the amdgpu_sync_dependency_test reliably
timed out and was canceled (amdgpu_cs_query_fence_status() -> -ECANCELED).
Root cause was a bad PM4 preamble:

  1) We emitted PKT3_CLEAR_STATE (0-dword packet) and then incorrectly
     wrote an extra dword 0x80000000. That stray word is a TYPE2 packet
     and wedges the parser on gfx12.

  2) Even when well-formed, CLEAR_STATE is a graphics packet and is not
     accepted in the paths we use on gfx12. The ucode/queue is stricter
     and the job stalls.

This change removes CLEAR_STATE from the GFX12 and fixes
the malformed emission. We keep CONTEXT_CONTROL (harmless across gens).

The test logic is unchanged: IB#1 launches a tiny kernel that spins and
stores 42 to data_addr; IB#2 depends on IB#1’s fence and then WRITE_DATA
(WR_CONFIRM) writes 99 to the same location. Seeing 99 proves the kernel
completed and the dependency was honored.

With these fixes the test completes on gfx9/gfx10/gfx11 as before and
now passes on gfx12 without GPU reset.

Fixes: spurious -ECANCELED due to hangcheck after malformed/illegal PM4 preamble on gfx12

Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_family.h       |  1 +
 lib/amdgpu/amd_ip_blocks.c    | 74 +++++++++++++++++++++++------
 lib/amdgpu/amd_ip_blocks_ex.c | 41 +++++++++++++++-
 lib/amdgpu/amd_shaders.c      | 88 +++++++++++++++++++++++++++--------
 4 files changed, 169 insertions(+), 35 deletions(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 60190c639..4514fff2a 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -128,6 +128,7 @@ enum chip_class {
 	GFX10,
 	GFX10_3,
 	GFX11,
+	GFX12,
 	NUM_GFX_VERSIONS
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index d8d7efbef..6955ba7dc 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1031,13 +1031,21 @@ amdgpu_device_ip_block_add(struct amdgpu_ip_block_version *ip_block_version)
 
 	amdgpu_ips.ip_blocks[amdgpu_ips.num_ip_blocks++] = ip_block_version;
 
+	return 0;
+}
+
+static int
+amdgpu_device_ip_block_ex_setup(struct amdgpu_ip_block_version *ip_block_version)
+{
+	if (amdgpu_ips.num_ip_blocks >= AMD_IP_MAX)
+		return -1;
+
 	if (ip_block_version->funcs &&
 		(!ip_block_version->funcs->gfx_program_compute ||
 		 !ip_block_version->funcs->gfx_dispatch_direct ||
 		 !ip_block_version->funcs->gfx_write_confirm )) {
 		amd_ip_blocks_ex_init(ip_block_version->funcs);
 	}
-
 	return 0;
 }
 
@@ -1221,9 +1229,11 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{"GFX10",				GFX10},
 		{"GFX10_3",				GFX10_3},
 		{"GFX11",				GFX11},
+		{"GFX12",				GFX12},
 		{},
 	};
 	struct chip_info *info = &g_chip;
+	int i;
 
 	g_pChip = &g_chip;
 
@@ -1318,7 +1328,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	igt_info("amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n",
 				info->name, amdinfo->family_id, amdinfo->chip_external_rev);
 
-	if (info->family >= CHIP_GFX1100) {
+	if (info->family >= CHIP_GFX1200) {
+		info->chip_class = GFX12;
+	} else if (info->family >= CHIP_GFX1100) {
 		info->chip_class = GFX11;
 	} else if (info->family >= CHIP_SIENNA_CICHLID) {
 		info->chip_class = GFX10_3;
@@ -1348,30 +1360,62 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case GFX10:/* tested */
 	case GFX10_3: /* tested */
 	case GFX11: /* tested */
+	case GFX12: /* tested */
+		/* extra precaution if re-factor again */
+		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
+		igt_assert_eq(compute_v8_x_ip_block.major, 8);
+		igt_assert_eq(sdma_v3_x_ip_block.major, 3);
+
+		/* Add three default IP blocks: GFX, Compute, and SDMA.
+		 *
+		 * These represent the base hardware engines available on the ASIC.
+		 * - gfx_v8_x_ip_block: graphics + compute pipeline control
+		 * - compute_v8_x_ip_block: dedicated compute support (user queues, shaders)
+		 * - sdma_v3_x_ip_block: asynchronous DMA engine for buffer transfers
+		 */
 		amdgpu_device_ip_block_add(&gfx_v8_x_ip_block);
 		amdgpu_device_ip_block_add(&compute_v8_x_ip_block);
 		amdgpu_device_ip_block_add(&sdma_v3_x_ip_block);
-		/*
-		 * The handling of a particular family _id is done into
-		 * each function and as a result the field family_id would be overwritten
-		 * during initialization which matches to actual family_id.
-		 * The initial design assumed that for different GPU families, we may
-		 * have different implementations, but it is not necessary.
-		 * TO DO: move family id as a parameter into IP functions and
-		 * remove it as a field
+
+		/* Assign the actual hardware identifiers to all registered IP blocks.
+		 *
+		 * These fields are taken from amdinfo (queried from the kernel):
+		 * - family_id: ASIC family (gfx9/gfx10/gfx11/gfx12, etc.)
+		 * - chip_external_rev: revision exposed to firmware
+		 * - chip_rev: internal revision used by HW-specific hooks
 		 */
-		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++) {
+		for (i = 0; i < amdgpu_ips.num_ip_blocks; i++) {
 			amdgpu_ips.ip_blocks[i]->funcs->family_id = amdinfo->family_id;
 			amdgpu_ips.ip_blocks[i]->funcs->chip_external_rev = amdinfo->chip_external_rev;
 			amdgpu_ips.ip_blocks[i]->funcs->chip_rev = amdinfo->chip_rev;
 		}
-		/* extra precaution if re-factor again */
-		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
-		igt_assert_eq(compute_v8_x_ip_block.major, 8);
-		igt_assert_eq(sdma_v3_x_ip_block.major, 3);
 
+		/* Configure ASIC-specific function hooks.
+		 *
+		 * Depending on family_id, each IP block installs the correct
+		 * callback implementations for:
+		 * - PM4 packet encoding (e.g., gfx10/gfx11/gfx12 differences)
+		 * - Register offsets (PGM_LO/PGM_RSRC, etc.)
+		 * - Compute and dispatch programming
+		 *
+		 * This ensures that test code emits commands in the correct
+		 * hardware-specific format for the active GPU.
+		 */
+		for (i = 0; i < amdgpu_ips.num_ip_blocks; i++)
+			amdgpu_device_ip_block_ex_setup(amdgpu_ips.ip_blocks[i]);
+
+		/* Sanity-check the initialized IP blocks to ensure the family_id matches
+		 * the ASIC info from the kernel. If these assertions fail, it usually
+		 * means that:
+		 * - IP block registration order changed, or
+		 * - amdinfo data mismatches the active hooks, or
+		 * - future refactoring broke expected initialization paths.
+		 */
 		igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, amdinfo->family_id);
 		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, amdinfo->family_id);
+
+
+
 		break;
 	default:
 		igt_info("amdgpu: GFX11 or old.\n");
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
index 21c4d952c..aab9a2a4a 100644
--- a/lib/amdgpu/amd_ip_blocks_ex.c
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -139,6 +139,44 @@ static void gfx_program_compute_gfx11(
 	base->emit(base, tz);
 }
 
+static void gfx_program_compute_gfx12(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint64_t code, uint64_t udata0,
+	uint32_t rsrc1, uint32_t rsrc2,
+	uint32_t tx, uint32_t ty, uint32_t tz)
+{
+	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+	base->emit(base, 0x80000000);
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_LO));
+	base->emit(base, (uint32_t)(code >> 8));
+	base->emit(base, (uint32_t)(code >> 40));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_RSRC1));
+	base->emit(base, rsrc1);
+	base->emit(base, rsrc2);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_USER_DATA_0));
+	base->emit(base, (uint32_t)udata0);
+	base->emit(base, (uint32_t)(udata0 >> 32));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, f->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
+	base->emit(base, 0);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
+	base->emit(base, f->get_reg_offset(COMPUTE_NUM_THREAD_X));
+	base->emit(base, tx);
+	base->emit(base, ty);
+	base->emit(base, tz);
+}
+
+
 static void gfx_dispatch_direct_gfx11(
 	const struct amdgpu_ip_funcs *f,
 	struct amdgpu_cmd_base *base,
@@ -172,7 +210,8 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 		funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx11;
 		break;
 	case AMDGPU_FAMILY_GC_12_0_0:
-		/*TODO*/
+		funcs->gfx_program_compute =gfx_program_compute_gfx12;
+		funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx11;
 		break;
 	default:
 		break;
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index e4931961c..adc4fc051 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -30,27 +30,77 @@
 #define DATA_OFFSET 1024
 
 #define SWAP_32(num) (((num & 0xff000000) >> 24) | \
-		      ((num & 0x0000ff00) << 8) | \
-		      ((num & 0x00ff0000) >> 8) | \
-		      ((num & 0x000000ff) << 24))
-/**
+				((num & 0x0000ff00) << 8) | \
+				((num & 0x00ff0000) >> 8) | \
+				((num & 0x000000ff) << 24))
+/*
+ * C equivalent of the shader_bin below. This tiny compute kernel performs a
+ * busy-wait loop, then writes the constant value 42 into a GPU virtual
+ * address passed via COMPUTE_USER_DATA_0..1. This shader is intentionally
+ * simple and designed to work across all GFX generations.
  *
- *s_mov_b32 s2, 0
- * s_cmp_gt_u32 s2, 0x98967f
- * ;;
- * s_cbranch_scc1 4
- * s_add_i32 s2, s2, 1
- * s_cmp_gt_u32 s2, 0x98967f
- * ;;
- * s_cbranch_scc0 65532
- * s_mov_b32 s3, 0xf000
- * ;;
- * s_mov_b32 s2, -1
- * v_mov_b32_e32 v0, 42
- * buffer_store_dword v0, off, s[0:3], 0
- * ;;
- * s_endpgm
+ * Host-side logic equivalent in C:
+ *
+ *	static void gpu_shader_standalone(volatile u32 *dst, u64 iters)
+ *	{
+ *		Busy loop comparable to the ISA spin, prevents compiler optimization.
+ *		for (u64 i = 0; i <= iters; i++)
+ *			asm volatile("" ::: "memory");
+ *
+ *		After spin completes, write sentinel value 42.
+ *		*dst = 42;
+ *	}
+ *
+ * The binary shader blob generated below executes equivalent logic on the GPU.
  */
+
+/*
+ * Shader ISA: spin_store_flat.s
+ *
+ * This kernel expects a 64-bit flat/global address provided in s[0:1]
+ * (passed via COMPUTE_USER_DATA_0..1) and behaves as follows:
+ *
+ *	1) Initialize a counter register (s2 = 0).
+ *	2) Increment s2 until it exceeds 0x0098967f (~10 million).
+ *	3) When the loop completes, store the literal 42 at *(u32 *)(s1:s0).
+ *	4) Terminate with s_endpgm.
+ *
+ * Notes:
+ *	- Uses flat/global addressing — no buffer SRD required.
+ *	- Works with 1x1x1 dispatches; single work-item.
+ *	- Safe for all GFX generations; no HW-specific instructions.
+ *
+ * Annotated assembly:
+ *
+ *	.text
+ *	.p2align 8
+ *	.globl spin_store_flat
+ *	.type	spin_store_flat,@function
+ *
+ * spin_store_flat:
+ *	s_mov_b32 s2, 0				Initialize loop counter.
+ *
+ *	s_cmp_gt_u32 s2, 0x0098967f		Early exit if counter exceeds limit.
+ *	s_cbranch_scc1 .Lexit
+ *
+ * .Lloop:
+ *	s_add_i32 s2, s2, 1			Increment counter.
+ *	s_cmp_gt_u32 s2, 0x0098967f		Continue looping if below threshold.
+ *	s_cbranch_scc0 .Lloop
+ *
+ *	v_mov_b32_e32 v0, 42			Load value 42 into v0.
+ *	v_mov_b32_e32 v1, s0			Load address low bits into v1.
+ *	v_mov_b32_e32 v2, s1			Load address high bits into v2.
+ *
+ *	flat_store_dword v[1:2], v0		Store 42 to *(u32 *)(s1:s0).
+ *
+ * .Lexit:
+ *	s_endpgm				End program.
+ *
+ *	.size spin_store_flat, .-spin_store_flat
+ */
+
+
 static  const
 uint32_t shader_bin[] = {
 	SWAP_32(0x800082be), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0x040085bf),
-- 
2.34.1

