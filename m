Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98541E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474A510E67F;
	Thu, 19 Feb 2026 05:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rlj77k7k";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643C310E130
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmaFRBXjisOMcBg7UjfdY1syE12eQdL9m3xP1IpjH2z2N/UWESM3ZxLb7oJXr8VoilEI+BG49Bn9bwEb2qJP0vEZ4grcKOPoxlibkc+MYXgWysifywK8zF0CI1Lpt1FyTK0045z6ArzBmbiSzo1dxS5nTwE5qtmF/Yfc5PJ7VYXoTww9McBH2YlxOf7rMAa198rmVrMIhdrQ0tCpKrUHPT0EeQ2ZTVKLhdf012V9ujlnsTOar1SnKy8p6Z75858GbLl0YIi0BdhmgsIRQG4IBHehuNm/zKU+zSl/HSE5K1qF3tXUR+wyPP8M0RneTWia/J1086upDlnaOXnOGm7PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUr3MeIxauUmK1MimKSkv7x6HU1pGGqQ+QbcFVy6bfQ=;
 b=dw+Kl4RcQMs3s0tRVGL6poah2hJnWodFMkPfK51q5nVV/kRLohsdzTWZ5HoI8XFXLoqRAmX6SVwXfPkh+20tvjbmhqlQ71a3vCtU/IeM9xfU4sSe4no8/u2yY+oJHDBhen4NK+R8T5W/2t7RaPBL9gXMGjXOoCACt2yTcVwwlJhWYiap87aIGafh8LEVg1hv5iu2VfW1I1GFDnk/Wl5EbfySr4vlUDT7eJpQzcrgkgg76hGToNcKfGQLsje49xC5MABXcJourmeRPOP0QvcMkoh6PfeAIWkT0n/LxjzP7qDtZYklL+e4sIJBAcmKOVFGttBHpbRL6b4KmMga63sHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUr3MeIxauUmK1MimKSkv7x6HU1pGGqQ+QbcFVy6bfQ=;
 b=Rlj77k7knO1lRD2chbMfNeeB+biBapI3I02jzVzHK21IwnTWMi5HZrtwSPFKouubLk2/5HjneaWRP5bwiLTJAfwSopjOXfg9fqt4QY/ElnPvCoCxD6yi7eFrT1jfYLMWnT1Ngx3cvJItfYvXGCYswi8EW/a/Zhk92BJn9YoiN7s=
Received: from CH2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:52::15)
 by DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 05:16:37 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::dc) by CH2PR04CA0005.outlook.office365.com
 (2603:10b6:610:52::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 05:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 05:16:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 23:16:36 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 23:16:35 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 3/4] lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use
 DWORDs
Date: Thu, 19 Feb 2026 00:14:18 -0500
Message-ID: <20260219051630.127667-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219051630.127667-1-vitaly.prosyak@amd.com>
References: <20260219051630.127667-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DS0PR12MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a91c1e-a792-45a8-1a82-08de6f760e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWxYbU1PTEFUWTB2SnhjM1JZcTV3SGxTRGp2V3ZpVW5PTmRmNFJiTGlQSzVl?=
 =?utf-8?B?MXNpVUp6UVo4c0ZPUndxUTh4Q1F6K3NlTlhmcWpIY0dyWkFaa25HMVhUZ0RW?=
 =?utf-8?B?QktEd1FLVGZVanVhOVg0UlpkL3ZpM0xweHdoYVBzK1QrbXpLTzJ4c3Q0ZG0w?=
 =?utf-8?B?M0tacEs5blRrVEtFZUZ2RVZvaklZejhDMXlqZmhGc0hBRXQxMTJENWxmenYv?=
 =?utf-8?B?ZmNNR2NxSy9TNVFibXJlSW9SOE4zbHQ0T2dJdXU3bGhjcnI2TUdQekxiTU02?=
 =?utf-8?B?aXA0Y0NxSFFQSmwxVW9oTEQ2czhIZmlLMTA1V1NMSDIyNVpZdk45K1hyWGdu?=
 =?utf-8?B?VTdaUzJ0eCtnTE9Rc1NoMUlpTDVlTm9HVUFtQWk0SUVsYkoxL0dUVkFXdmFy?=
 =?utf-8?B?cElKVXZYZEZZUllwM1FHUXZTbUdwVUNLV0xYQ0JMQ3htUk5PQ3c0UlNUWG81?=
 =?utf-8?B?R0FwVVlaUzNtaHVoSFdaVS9zVVlvaWJZMWZ5RURHTlphR1NYQ2JsZVFlaThG?=
 =?utf-8?B?S2lPZ0xVTjBycXJnamxmQnVCUi96MDdOb0VIK1ZOaFhBQnJDNTZYWThrQlZN?=
 =?utf-8?B?Yk9KV0I4ZjcvMm5vMWJkd2dUZVVPTXc0SVpuaExicnoxSytEdTh5ZTFicUdh?=
 =?utf-8?B?SGFjc3Rsb1hxY0FIOUpmT3VvUjNrL1pOQnNrbFMzb0pSL2xJY21XWldXdFRv?=
 =?utf-8?B?dWg1SG1LRWtsNjBMdnFtZCtUaEdxZnU0SHBMMEwxVFVNdWRabyszazJjR0pH?=
 =?utf-8?B?ZlIzdk52VjhReWR4a1JCWVFKb2pPTC9XcXZ3WlRrK0ZjZEhGODZDV3lhSUVz?=
 =?utf-8?B?aE9VcjMwdGJoVmxNSlJBcGdkMGlUMUl5NW4vZTVLZU9ZMTFrNGpVWjkrVmFQ?=
 =?utf-8?B?OG96WnZmNEVoVHNxdWozS0NDNzllSTFiMlhzZW51aTRNL2VHem5Nd1Y2WTZP?=
 =?utf-8?B?UmV5MGR5ZEZ6ZWE2L0NYVDRJanlhUXNEelJOcnA1eU9VY3lDREIra09veXBZ?=
 =?utf-8?B?dXNkUGVjVGVDRVc0eUIxSEsxdkY1cW5PVkJJVnFBODBMeWtoRExRRC82bnQ1?=
 =?utf-8?B?VXVzYjZ5VFFVVUxzcHIxL3JSZGk3N0RHc3Zmb1dkeXVNbWdBYU56OUNsRWwz?=
 =?utf-8?B?QVh3bWpPY0V2SkRIR3lRU3UzTkV5WS9mazV4RVNSRGVEWGNBZnVJTHJzNnZT?=
 =?utf-8?B?OWwvZm8zUFFtdUdjMGxhK1FJQURVT0Mxdy9qWU9hVTJkei85aHlGK2J6TTRL?=
 =?utf-8?B?MEs1K1VnaThKUkNlM1BqNGx1TlZLeElpaGdDalNZR2E1aUlaREJzYmZVaWFR?=
 =?utf-8?B?VWh4SnAyblhlVnBUYnRZdG44ZzY5a1d4R1c1T0tCa2lhT2VGUXVnd0U3YUw4?=
 =?utf-8?B?cWIxWXY3d09OY0VUc0JtRDJ5WGNjRURBQWYramplUStQb3N4cDB1b3pQM2lG?=
 =?utf-8?B?djNBU1FGeDhIRFhsdXZ4aEswajV4eEYwbW52N1NUdHIvQkVnYmxQQW96NVYz?=
 =?utf-8?B?OG84SzAwRktueFdteVJXV3czTzI5SnlkWXdKMmFTRklNQ2hBL0pvNTVrVERW?=
 =?utf-8?B?SWF2ckFnQmlwaGNsUlB1bU1Pa241dy9rVFdHNmdLQTlqR2xoYU5Gc0Y2UlpP?=
 =?utf-8?B?eWZ2ZTVoQ296TnV1S1NjcGhRbnFiMTI3bnBVZExJcTJ5RUxYQlVmd0xoU2w1?=
 =?utf-8?B?SDVDUlJpZjdFaE93UjVRTm9TbURTVndHSE9CMFRYcHlGOERHNUYrczV3RWp4?=
 =?utf-8?B?TDlBZ3dubERlSzNDblpxdzdFTlRSNWphb3VUZ2llUXJpQVVYOHo3cXN2c3p3?=
 =?utf-8?B?OTMyWU9VeVdFam9UUGJQRXJocVkzS1lodmtTT0FSU0VTblFCSllTQzVsQ3BF?=
 =?utf-8?B?SXJkTVBYTGl0WEVCSjhEUjJBeHlwelBxSGgzWEJreEFSZktRalhNOWk4eWFr?=
 =?utf-8?B?Q0tvZTdDV05GSTY2TmJvSythbjlhdlhLOUR4THdJeU1NTVpIcGtmVk1Ub2hS?=
 =?utf-8?B?bGo5dlFKZDZqbm8xMjBSOEVzSHRNQ2N0cWFPVTEyRFljSVpHSjE2SU5heXht?=
 =?utf-8?B?UWRVenBVRGxUQ0ZJUEdONUJTeS9vSndWNFk2YTVuR296a2hnRXJLb0x2T08r?=
 =?utf-8?B?VzNERG1EdlZCT2VncjhxREM1ZW4rUU9SMk1ZTklBRlJVVDM4ZEFLamc1N1JS?=
 =?utf-8?B?QVRZQ1ZYd1QzeWp1VnBwS0orNjU0VGxHVktBN1JLWS9WMWtDL09WQVk1TXlo?=
 =?utf-8?B?bGl5eTBSMm1sTytDL1p6eEROR2F3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mn7Hu+Riis+MRiyZ5NbNEYeyD8Yhlh06gWm0kRvBo0MY/NMAV401O8aZbkOkSuFS7qS0yKGMTpGPbkLR1IeYqscc4jJq3NnBzZBvMquks+SQ+5foRlTs9ijnLOwVK2S8a2pMbEgUkROI6rnBgmKRr8Cp1zZoMKOpF4jv+NoaUOxVe58dMQvcJryGSsl6Gick3ZOlM39ocWq7xjqCFwM2Nz9dyjFHWfRa9oUGC65a3HgPbePlNm0trm8n8Os2acEUqApv1MGQK0rfFWqQng0FpCHihNbm/P7Q9cRDB8bnlJ5bay+ogfAHK6GaUMzqi/suZjHigu8YrfBIrm65O6fHQWwANtF2s/rUZTNPchBdYdt62WHQTOTJUh7r4CmPcHE0tcz/3wyseoVlbFo4dFxzjp1q/OebcHRlsF3ZWzaRs9fiPWBDWCLGeaSNQFLW98Yf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 05:16:37.1286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a91c1e-a792-45a8-1a82-08de6f760e6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
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

The SDMA WRITE_LINEAR packet COUNT field specifies the number of
DWORDs of inline data (minus 1 for AI+), not bytes. After the
write_length normalization to bytes in the previous patch, the COUNT
was incorrectly set to the byte value causing the SDMA engine to
read past the inline data into garbage memory, leading to GPU hangs
and -63 (ETIME) timeouts (e.g. in amdgpu_userptr_test).

Fix by dividing write_length by 4 when setting the COUNT field in
sdma_ring_write_linear and sdma_ring_bad_write_linear. Also fix the
SI (Southern Islands) SDMA_PACKET_SI header and the stream_length
computation in the bad_write_linear error injection path.

Note: SDMA CONST_FILL and COPY_LINEAR COUNT fields are in bytes,
so those remain unchanged.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ibe462d8a41cc5196edb889dd87977a9c0982194d
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_ip_blocks.c          | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 877ea8ecd..c14b2cb75 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1502,7 +1502,7 @@ get_sdma_max_bytes(amdgpu_device_handle device)
  * is 14 bits in DWORDs (max 16384 DW = 64 KB), but that limit is
  * handled by pm4 buffer sizing, not by this struct.
  */
-#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB */
+#define GFX_CP_DMA_MAX_BYTES   ((1ULL << 26) - 4)  /* max for 26-bit PACKET3_DMA_DATA byte_count */
 
 void
 amdgpu_dma_limits_query(amdgpu_device_handle device,
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index ec03babda..f993a6caa 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -42,7 +42,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		     (unsigned long)ring_context->write_length);
 	if (func->family_id == AMDGPU_FAMILY_SI)
 		ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
-					 ring_context->write_length);
+					 ring_context->write_length / 4);
 	else
 		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
 					 SDMA_WRITE_SUB_OPCODE_LINEAR,
@@ -51,9 +51,9 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
 	if (func->family_id >= AMDGPU_FAMILY_AI)
-		ring_context->pm4[i++] = ring_context->write_length - 1;
+		ring_context->pm4[i++] = ring_context->write_length / 4 - 1;
 	else
-		ring_context->pm4[i++] = ring_context->write_length;
+		ring_context->pm4[i++] = ring_context->write_length / 4;
 
 	while (j++ < ring_context->write_length / 4)
 		ring_context->pm4[i++] = func->deadbeaf;
@@ -80,9 +80,9 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 	j = 0;
 
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
-		stream_length = ring_context->write_length / 16;
+		stream_length = ring_context->write_length / 4 / 16;
 	else
-		stream_length = ring_context->write_length;
+		stream_length = ring_context->write_length / 4;
 
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
 		opcode = 0xf2;
@@ -91,7 +91,7 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 
 	if (func->family_id == AMDGPU_FAMILY_SI)
 		ring_context->pm4[i++] = SDMA_PACKET_SI(opcode, 0, 0, 0,
-					 ring_context->write_length);
+					 ring_context->write_length / 4);
 	else
 		ring_context->pm4[i++] = SDMA_PACKET(opcode,
 					 SDMA_WRITE_SUB_OPCODE_LINEAR,
@@ -107,9 +107,9 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
 	}
 	if (func->family_id >= AMDGPU_FAMILY_AI)
-		ring_context->pm4[i++] = ring_context->write_length - 1;
+		ring_context->pm4[i++] = ring_context->write_length / 4 - 1;
 	else
-		ring_context->pm4[i++] = ring_context->write_length;
+		ring_context->pm4[i++] = ring_context->write_length / 4;
 
 	while (j++ < stream_length)
 		ring_context->pm4[i++] = func->deadbeaf;
-- 
2.52.0

