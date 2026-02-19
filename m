Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE85E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDFA10E67E;
	Thu, 19 Feb 2026 05:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Agto7FQg";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F118910E67F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXS9MSkZN+DiZtEF/g6jE5MMvfFvBQOIyNf9UvMj2N5JNX3LrvFx6q/Uox4+NgnednPGxvCzFCniGrhISPnwH7ygJOJOzuW6S4GABLkIsguBsO46lAncKD/TmiWH1L8NFsHpxaOIsf7aUaCoLulpy0cyJ+/P40NYEWOkfQ4xEljg7TFsnwGyXChqoXB6Kg6mLXQ+A8ZIdMpx/1YIPeuX9AsLBeWRB0r820NmXf7Cs7VeatVQ514l1fnrVB/EBKIzRJdQQGA6IaW0y1l5oWmfYbKApPJCrHeKcewhVcRGB0AloMtSFK4TAgzwLuC9o8WgSmHtPrjZinJnqpZ6L5Bhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIhuJoUgm1RaQRz7KPC1aX8f+86YYeDggdhEH2AEDXY=;
 b=E4r9375qGBiDUy3xVm30Rxn4TMJljrVnnhNvc93oE62qw0M7nufPkoI1XZFCqPczMz6cD6ovU44TaqW0DWGlACmFUp4Ys0yaGLepBcxEmdF+euGmHQWC81Bh76Hef+1PSfl/yekT6WsVkA4Xv2RCOa75aAsmbe5xFftqxcYdWhlLeTz5H1HFgsyBlsQ6A3UWiXape/q2U7jmboYmmJklLPvSL46g1qr6eblpRC9DMIRQKdMVtBGGtm2qYuEtR94q3Feebbbm/plontf8OrwGmhda7DxaAVh9ETHKuNgRiI9ejcZgu2KI0Evzq4Lba1BuxSL+j8huAvgoWf3iHxCZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIhuJoUgm1RaQRz7KPC1aX8f+86YYeDggdhEH2AEDXY=;
 b=Agto7FQg3lkiq1ULUiFwS5Pad8bIGLRfiQvr5ZAuZSbiCCuL3g2vsMV+71u+12qb1PqhmtLTOKqfJ4Drz5GmAJ+rOsyKFTbBLYFVT7vMcyWb8ZRnlZWSkwHdE2z/pz0xNyOMwQK7pf0ooEgPTglnRJy0kNctW+VTJNUxZpZm5VQ=
Received: from CH2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:52::15)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 05:16:36 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::c8) by CH2PR04CA0005.outlook.office365.com
 (2603:10b6:610:52::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 05:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 05:16:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 18 Feb
 2026 23:16:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Feb
 2026 23:16:35 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 23:16:34 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/4] lib/amdgpu: normalize write_length to bytes and use DMA
 limits API
Date: Thu, 19 Feb 2026 00:14:17 -0500
Message-ID: <20260219051630.127667-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219051630.127667-1-vitaly.prosyak@amd.com>
References: <20260219051630.127667-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 1464962f-d8c0-4b0d-383d-08de6f760de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDZSdDNmRnlFZTNqL003aHhod00vU2o5cWFmelljVTFadVR4d0YrWHd2RGl5?=
 =?utf-8?B?OE9wWm96ejlCcGJac3dUN1dsUnowTTZabVJNNVk3MWtRNU11SVA5YnlFdGZX?=
 =?utf-8?B?ZG1FcGFiOWNJU01jNkdHM1pYL01yS3RiTDZOQk44YXJmYUVDYkRDZC9aRWdi?=
 =?utf-8?B?VFhmQnRaM3lRcVRpMmpXbysvNGhyVVNXQUtjZGF2SHFldnVuWGZjVUgyR2Jj?=
 =?utf-8?B?Y2dPUEdvNVFYQUEyTVVjc1BveG5WTnpkWkt3cnVWamtyK3hiZU10Q2d5VndJ?=
 =?utf-8?B?Ti85V1g0OVdIL3kybkUxeXRNSnlpMThHTXVlUnhPKzZ4a1I4Q05FKzZoNEgv?=
 =?utf-8?B?Szh6OFY0Qk1ZZVFWbkZ1ZDB0OFMvVUFQek5oejV3S3cxL091SEI3dW16TXZK?=
 =?utf-8?B?dnRhUEpxWEQ5aUZDSzZWcTA0eStySENxY0hjbWJyaVBzcEJlSTJLZk43STMz?=
 =?utf-8?B?bEFaeWI2N1NxNisyeTJkTlNxdm83RjF0Ty9oUzhjOEw1R1IzTzJOZVNReTNR?=
 =?utf-8?B?SjZhVWwvTkkxd3hVZEl4RFNkT3k4Qmt3YlM3K2lWWjZjVnh6eitiU0VBMEp5?=
 =?utf-8?B?amIyd2VBMy9pTFRGU0Z3MnZXNkhtaWVILzhDbGhZNTVSdWFuT2VqTnFRQmJm?=
 =?utf-8?B?NW9FMjlNYW01Yk9xTXN6UC8reGJ3cGhsMkFYVnJ0ZDVrQVNpSzYyM2NGZVdt?=
 =?utf-8?B?TzFJczdtYXFvK3FTb3RNbG1pRmtHN21yZmU2NWpMQ09tM2VPOTJHV1d3KzdZ?=
 =?utf-8?B?OGYwM0x0MHd3K3V3WVFqaTl4RXBqLzlJYjZldDQ4SEZ4RngxUVV0TkltMnlV?=
 =?utf-8?B?ZmFQck4rK0c2MmpXUHVEMEJXSE1kamhXSDR0Q0tTMmo2MVBKRGFUSXdWQjFy?=
 =?utf-8?B?eE9mckxKUy9iMlNQSUVjUVRQV1VZN25BUEplenVnUkxXdHZwWUtiSkMxRWZO?=
 =?utf-8?B?bHp3V0Ivek1uaU9aeWVuSmZ0TkN3YkJFb2F0MFU1eTFiN0R1Z3VTUVZBVVlS?=
 =?utf-8?B?M0dpSEVlVEF2ZGt3QlhKcWhSY1h1ZzgwSXVNMC82WHlQN2xLQmMwajkxaVov?=
 =?utf-8?B?YmZFMHlVdnR4aEJPZFk5VDkwNHlCam1UMVhFVytXN1BIS0d5UEFXREowbUtn?=
 =?utf-8?B?eFRxenZKK1piL2xrcXFVWVhvSWxDM01yVUM0dy84dUc0TmtWVXFHdDhwT1M0?=
 =?utf-8?B?Z2NVeG9YWFBpY2lwbnRFd0dldWdYTUpBL1ZTMGI1Ly9vL2hUenFvV011YURl?=
 =?utf-8?B?MTFHOVIxZVR3ejVQWS9OVDJDUmJlOXBVL2ZQRjNiT2pnOUJsczh0Q216L0kr?=
 =?utf-8?B?alJHSUtaN21yWWwwV2l2RGdJNGVTZU42WXdGR2FkUFVyMGM3ZDNBK1B5UCs1?=
 =?utf-8?B?MDR0dmllVTVMbFdLN3cxUFhybXR2N3pZVm9WT1M0MjI2TDlGdWJuQ1IvSFdV?=
 =?utf-8?B?MFJhS09VS2JQNk1BbkUzNlA2cUgrREdtc1JVNUdUakR3RDdkZjB5bG5ZZlM2?=
 =?utf-8?B?NURyVk9NMGZIVDRCUng0ZTZ6Yy81a1pZdmhXL290QzRFdXhtU3pDVE04Yi81?=
 =?utf-8?B?OTRIdVYrdVRtN0IzYllRaW1yRGRJK1Z3K0xyaDgzS2hid084OTBwVWRSRXFn?=
 =?utf-8?B?UldUZEFZRHNhcjNNanViWFlKYkVlUnF2eUREdVVBR0lFeUtna3lCY1dHNzBq?=
 =?utf-8?B?cGhuTlU4OTI4bEp6aTR3OWhCOHh6bVN5bkhoYlpaYXlUMk9BYi9ONytXbXBv?=
 =?utf-8?B?c1FreVhldE83dSsxZEVRYjRBbHJ4MDkveUxYRGxVcUpkczZYMTZHc0ZweHpS?=
 =?utf-8?B?Wi9LWUdKdjdXUFZWRkVsTVFVRzRMMTVGK0NPbm94dEpwQ0FqRmx6dkhRTUtL?=
 =?utf-8?B?bVRudUlyaWk1Q1ZoSkQxNW9sUmxZNmpYSk1NeEFpb1h0Rnd2Tkh2TVJYVHVZ?=
 =?utf-8?B?Q0M1ODR5TG5qblRZeXEzcm4vZ1NTVHZLUTF3cFBRRGpqb3FFdWU2S3k4WWkx?=
 =?utf-8?B?VDhmYjNiVDBRampVOHN3WHczY2JDcU9GWXJWVFhYTTJOeC9SZXdjZ0s2WHU5?=
 =?utf-8?B?UklGYUZJZEVSV3RSeTg3a1ZXYmRwV0ZNdVJPZC95clN2Uko1MUgxRzlqc3pq?=
 =?utf-8?B?N09TdnF0TC93blZ6c3NvdnM5QXpmSlVnZ3V2MGZqaGJ4K3ArckQxVlZCNDZG?=
 =?utf-8?B?WmtBakZ0MlpSV3MvSmRHU1RmNGU3OU1vQzBQMzBJNzhNWjcwQ2FiU3h5RUdX?=
 =?utf-8?B?K2Z5RnQzWWVlWkVGczd4M1N3RnBnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jzr5MVfDUkcAWYmlrPWxEZKNgA/pY3X7n7vV6dFonqmIPJxGrMz0Xh1GDnuRsUE9aIiM8g0BLmIMaU9FGO9KrqfB4DI4X7wpQ8d1v5z4Kw/rXx9mqzkgoU8R8a5VfHfASc+pPYld1LpVUKInOtlGNYcfw3b5ASEUsENgnQSokRfkBydJrtHsqYLjcME0U8ZQP1CvS5A1/mjYvoxVlqhIx+b6JwWHpe8jF3uryW/EcvegBp1W2gXpBEZI5RHmctTV+wlg2wDW55aCuFNOY25F0ss5fSrFYhsJS9R7VYY6z25OW66wgIHwxCCMKIWDx2zYi71YH7CIs+vXnPgSbp3U/+KSjrWNvsD2t7CiSJ6Nhq2ZwlBw02FfnYX9AKAYQeGgpb/QXEoxnlmltB1prqPSr6LkjEYdQN0jiVcC13Kl8YZklZvRT0tp0YAH7cN8P5ZU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 05:16:36.2807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1464962f-d8c0-4b0d-383d-08de6f760de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
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

Replace all hardcoded transfer sizes with dynamic queries via
amdgpu_dma_limits_query(). Each helper now calls this internally:

 - const_fill_helper / copy_linear_helper: ring_id == 0 uses
   amdgpu_dma_max_bytes() (HW maximum), ring_id > 0 uses
   amdgpu_dma_default_bytes() for fast iteration.
 - write_linear_helper: uses amdgpu_dma_default_bytes() for all
   rings (inline PM4 data limits the practical transfer size).
 - create_ip_queues (helper2 path): same default_bytes per ring.

Change write_length/write_length2 from uint32_t to uint64_t with
byte semantics everywhere:

Packet builders (amd_ip_blocks.c):
 - sdma_ring_write_linear: inline data = write_length/4 DWORDs
 - gfx_ring_write_linear: PACKET3 n = 2 + write_length/4, data /4

Helpers (amd_command_submission.c):
 - Remove all write_length * sizeof(uint32_t) conversions
 - Compare with div=4 (write_length is bytes, bo_cpu is uint32_t*)
 - Extended API: params->size stored directly (no /sizeof conversion)

No helper signature changes - test callers unchanged.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ia4c97573ba34a3fb8dd11fea395bec466703a155
---
 lib/amdgpu/amd_command_submission.c | 80 +++++++++++++++++------------
 lib/amdgpu/amd_ip_blocks.c          | 28 ++++++++--
 lib/amdgpu/amd_ip_blocks.h          |  4 +-
 tests/amdgpu/amd_basic.c            |  5 +-
 4 files changed, 78 insertions(+), 39 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 84f4d01d6..877ea8ecd 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -146,11 +146,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
                          struct amdgpu_ring_context **ring_context_out,
                          int *available_rings_out)
 {
-	const int sdma_write_length = 128;
-	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 	struct amdgpu_ring_context *ring_context = NULL;
 	int available_rings = 0;
-	int r, ring_id;
+	int r, ring_id, pm4_dw;
 
 	/* Get number of available queues */
 	struct drm_amdgpu_info_hw_ip hw_ip_info;
@@ -160,6 +159,9 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &hw_ip_info);
 	igt_assert_eq(r, 0);
 
+
+	amdgpu_dma_limits_query(device, &limits);
+
 	if (user_queue)
 		available_rings = ring_context->hw_ip_info.num_userq_slots ?
 			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
@@ -179,7 +181,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		memset(&ring_context[ring_id], 0, sizeof(ring_context[ring_id]));
-		ring_context[ring_id].write_length = sdma_write_length;
+		ring_context[ring_id].write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
+		pm4_dw = ring_context[ring_id].write_length / 4 + 16;
 		ring_context[ring_id].pm4 = calloc(pm4_dw, sizeof(*ring_context[ring_id].pm4));
 		ring_context[ring_id].secure = secure;
 		ring_context[ring_id].pm4_size = pm4_dw;
@@ -222,7 +225,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		/* Allocate buffer for this ring_id */
 		r = amdgpu_bo_alloc_and_map_sync(device,
-			ring_context[ring_id].write_length * sizeof(uint32_t),
+			ring_context[ring_id].write_length,
 			4096, AMDGPU_GEM_DOMAIN_GTT,
 			gtt_flags[0],
 			AMDGPU_VM_MTYPE_UC,
@@ -243,7 +246,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 
 		/* Clear buffer */
 		memset((void *)ring_context[ring_id].bo_cpu, 0,
-		       ring_context[ring_id].write_length * sizeof(uint32_t));
+		       ring_context[ring_id].write_length);
 
 		ring_context[ring_id].resources[0] = ring_context[ring_id].bo;
 
@@ -255,7 +258,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 
 		/* Verification */
 		if (!secure) {
-			r = ip_block->funcs->compare(ip_block->funcs, &ring_context[ring_id], 1);
+			r = ip_block->funcs->compare(ip_block->funcs, &ring_context[ring_id], 4);
 			igt_assert_eq(r, 0);
 		} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
 			ip_block->funcs->write_linear_atomic(ip_block->funcs, &ring_context[ring_id], &ring_context[ring_id].pm4_dw);
@@ -275,7 +278,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 		/* Clean up buffer */
 		amdgpu_bo_unmap_and_free(ring_context[ring_id].bo, ring_context[ring_id].va_handle,
 		ring_context[ring_id].bo_mc,
-		ring_context[ring_id].write_length * sizeof(uint32_t));
+		ring_context[ring_id].write_length);
 	}
 }
 
@@ -356,19 +359,22 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   bool secure, bool user_queue)
 
 {
-	const int sdma_write_length = 128;
-	const int pm4_dw = 256;
-
+	struct amdgpu_dma_limits limits;
 	struct amdgpu_ring_context *ring_context;
-	int i, r, loop, ring_id;
+	int i, r, loop, ring_id, pm4_dw;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 	uint32_t available_rings = 0;
 
+	amdgpu_dma_limits_query(device, &limits);
+
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
-	/* setup parameters */
-	ring_context->write_length =  sdma_write_length;
+	/* setup parameters — write_linear embeds inline data in PM4,
+	 * so pm4 buffer must hold header (max 10 DWORDs) + write_length/4 DWORDs.
+	 */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
+	pm4_dw = ring_context->write_length / 4 + 16;
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = secure;
 	ring_context->pm4_size = pm4_dw;
@@ -403,8 +409,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
 			r = amdgpu_bo_alloc_and_map_sync(device,
-							 ring_context->write_length *
-							 sizeof(uint32_t),
+							 ring_context->write_length,
 							 4096, AMDGPU_GEM_DOMAIN_GTT,
 							 gtt_flags[loop],
 							 AMDGPU_VM_MTYPE_UC,
@@ -426,7 +431,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 			/* clear bo */
 			memset((void *)ring_context->bo_cpu, 0,
-			       ring_context->write_length * sizeof(uint32_t));
+			       ring_context->write_length);
 
 			ring_context->resources[0] = ring_context->bo;
 
@@ -440,7 +445,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 			/* verify if SDMA test result meets with expected */
 			i = 0;
 			if (!secure) {
-				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
+				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
 				igt_assert_eq(r, 0);
 			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
 				ip_block->funcs->write_linear_atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
@@ -463,7 +468,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 			}
 
 			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
-						 ring_context->write_length * sizeof(uint32_t));
+						 ring_context->write_length);
 			loop++;
 		}
 	}
@@ -491,16 +496,19 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 						 const struct amdgpu_ip_block_version *ip_block,
 						 bool user_queue)
 {
-	const int sdma_write_length = 1024 * 1024;
 	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop, ring_id;
 	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
+	amdgpu_dma_limits_query(device, &limits);
+
 	ring_context = calloc(1, sizeof(*ring_context));
-	ring_context->write_length =  sdma_write_length;
+	/* const_fill/copy packets have no inline data — pm4_dw=256 is ample */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
@@ -527,9 +535,12 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 		/* prepare resource */
 		loop = 0;
 		ring_context->ring_id = ring_id;
-		while (loop < 2) {
-			/* allocate UC bo for sDMA use */
-			r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
+			ring_context->write_length = (ring_id == 0) ?
+				amdgpu_dma_max_bytes(&limits, ip_block->type) :
+				amdgpu_dma_default_bytes(&limits, ip_block->type);
+			while (loop < 2) {
+				/* allocate UC bo for sDMA use */
+				r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
 							 4096, AMDGPU_GEM_DOMAIN_GTT,
 							 gtt_flags[loop],
 							 AMDGPU_VM_MTYPE_UC,
@@ -590,17 +601,19 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 						  const struct amdgpu_ip_block_version *ip_block,
 						  bool user_queue)
 {
-	const int sdma_write_length = 1024;
 	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop1, loop2, ring_id;
 	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
+	amdgpu_dma_limits_query(device, &limits);
 
 	ring_context = calloc(1, sizeof(*ring_context));
-	ring_context->write_length =  sdma_write_length;
+	/* copy_linear packets have no inline data — pm4_dw=256 is ample */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
@@ -625,7 +638,10 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		loop1 = loop2 = 0;
-		ring_context->ring_id = ring_id;
+			ring_context->ring_id = ring_id;
+			ring_context->write_length = (ring_id == 0) ?
+				amdgpu_dma_max_bytes(&limits, ip_block->type) :
+				amdgpu_dma_default_bytes(&limits, ip_block->type);
 	/* run 9 circle to test all mapping combination */
 		while (loop1 < 2) {
 			while (loop2 < 2) {
@@ -972,7 +988,7 @@ cmd_context_t* cmd_context_create(amdgpu_device_handle device,
 	} else {
 		/* Allocate internal BO for command operations */
 		r = amdgpu_bo_alloc_and_map(device,
-				   ctx->ring_ctx->write_length * sizeof(uint32_t),
+				   ctx->ring_ctx->write_length,
 				   4096,
 				   AMDGPU_GEM_DOMAIN_GTT,
 				   0,
@@ -1036,7 +1052,7 @@ void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
 				    /* Internal BO with VA handle - full cleanup */
 				    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
 							   ctx->ring_ctx->bo_mc,
-							   ctx->ring_ctx->write_length * sizeof(uint32_t));
+							   ctx->ring_ctx->write_length);
 				} else if (destroy_external_bo) {
 				    /* External BO without VA handle - just free the BO */
 				    amdgpu_bo_free(ctx->ring_ctx->bo);
@@ -1211,7 +1227,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 
 	/* Clear the buffer before operation */
 	memset((void *)ctx->ring_ctx->bo_cpu, 0,
-	ctx->ring_ctx->write_length * sizeof(uint32_t));
+	ctx->ring_ctx->write_length);
 
 
 	/* Build the command packet based on type */
@@ -1222,7 +1238,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 
 		/* TODO: allow user set the dst and data */
 		//ctx->ring_ctx->bo_mc = params->dst_addr;
-		ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+		ctx->ring_ctx->write_length = params->size;
 
 		/* Build PM4 packet */
 		result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
@@ -1264,7 +1280,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 	    /* For copy operations, we need both source and destination addresses */
 	    /* This would require extending the API to pass both addresses */
 	    /* For now, use the internal buffer as source */
-	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+	    ctx->ring_ctx->write_length = params->size;
 
 	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
 						      ctx->ring_ctx,
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 12f92a1d5..ec03babda 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -35,6 +35,11 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 
 	i = 0;
 	j = 0;
+
+	/* Guard: write_length must be DWORD-aligned (bytes) */
+	igt_assert_f(ring_context->write_length % 4 == 0,
+		     "SDMA write_linear: write_length %lu not DWORD-aligned\n",
+		     (unsigned long)ring_context->write_length);
 	if (func->family_id == AMDGPU_FAMILY_SI)
 		ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
 					 ring_context->write_length);
@@ -50,11 +55,16 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	else
 		ring_context->pm4[i++] = ring_context->write_length;
 
-	while (j++ < ring_context->write_length)
+	while (j++ < ring_context->write_length / 4)
 		ring_context->pm4[i++] = func->deadbeaf;
 
 	*pm4_dw = i;
 
+	/* Guard: ensure PM4 packet fits in allocated buffer */
+	igt_assert_f(*pm4_dw <= ring_context->pm4_size,
+		     "SDMA write_linear: pm4_dw %u exceeds buffer %u\n",
+		     *pm4_dw, ring_context->pm4_size);
+
 	return 0;
 }
 
@@ -232,14 +242,26 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	i = 0;
 	j = 0;
 
-	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+	/* Guard: write_length must be DWORD-aligned (bytes) */
+	igt_assert_f(ring_context->write_length % 4 == 0,
+		     "GFX write_linear: write_length %lu not DWORD-aligned\n",
+		     (unsigned long)ring_context->write_length);
+	igt_assert_f(ring_context->write_length / 4 + 4 <= ring_context->pm4_size,
+		     "GFX write_linear: %lu DWORDs + 4 header > pm4 buffer %u\n",
+		     (unsigned long)(ring_context->write_length / 4),
+		     ring_context->pm4_size);
+
+	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 + ring_context->write_length / 4);
 	ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
 	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
-	while (j++ < ring_context->write_length)
+	while (j++ < ring_context->write_length / 4)
 		ring_context->pm4[i++] = func->deadbeaf;
 
 	*pm4_dw = i;
+	igt_assert_f(*pm4_dw <= ring_context->pm4_size,
+		     "GFX write_linear: pm4_dw %u exceeds buffer %u\n",
+		     *pm4_dw, ring_context->pm4_size);
 	return 0;
 }
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index bb10a9a0e..66c88b85f 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -263,8 +263,8 @@ struct amdgpu_ring_context {
 	int ring_id; /* ring_id from amdgpu_query_hw_ip_info */
 	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
 
-	uint32_t write_length;  /* length of data */
-	uint32_t write_length2; /* length of data for second packet */
+	uint64_t write_length;  /* transfer size in bytes */
+	uint64_t write_length2; /* transfer size in bytes, second packet */
 	uint32_t *pm4;		/* data of the packet */
 	uint32_t pm4_size;	/* max allocated packet size */
 	bool secure;		/* secure or not */
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e57eb7969..d524b41f0 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -294,7 +294,7 @@ static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
 static void amdgpu_userptr_test(amdgpu_device_handle device)
 {
 	const int pm4_dw = 256;
-	const int sdma_write_length = 4;
+	const int sdma_write_length = 16;	/* 4 DWORDs in bytes */
 
 	struct amdgpu_ring_context *ring_context;
 	int r;
@@ -344,7 +344,8 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 
 	 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
-	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
+	/* div=4: write_length is bytes, bo_cpu is uint32_t* */
+	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_va_op(ring_context->bo, 0, BUFFER_SIZE, ring_context->bo_mc, 0, AMDGPU_VA_OP_UNMAP);
-- 
2.52.0

