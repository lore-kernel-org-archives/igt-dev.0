Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838E7C624A1
	for <igt-dev@archiver.kernel.org>; Sun, 22 Feb 2026 02:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0569010E0D8;
	Sun, 22 Feb 2026 02:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zr0Ifq1C";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165710E0D8
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Feb 2026 02:26:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPVW0FGiK5yUytf1MM4gVvomZYYrtCfteLL3cnnddogExjM032zcqM8THkOU4b+jHbJT25OTbotbltcceCkJ3Jyvuv5EXeQhOhE3ocRwUDEn5zR04nkdQfeIMcstE4OK7YY3tWkqs/z6qEZ7lt0ONiCCPAxatsi8Y/s/QsLj5j6G23qyhuz1PXtx1Ov97TNDgiOipH0AoM6fry4gtRmXz9/i8ndO/BxWYkPn+132zC3NDDfLnZo6tZdNMQ/SAgTOo886kXIvWGQWEGzQNHgIBK/VXoIQ59528mi4++ZnjQ3QWD4imNkfLEcaFig3IkX2bFcyaWa/4AgPR7AS4D+F8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPHUomIwSqc92clf0Qtpzkm6YCSitZzSyoyr/jbKduw=;
 b=r+ig7x9zIzf8Z6lbnylvorLmtgs8D6cMrdsM46ivdbw3zeieUcB2WbiTrpd+8nHJUBpMWqEKIAhLOdLtStJocTtOGny40T1BCIy01AvStOeQqAZ9qXtr5LkQisTqdS/2FAoCH4vgYabh07jJQqroqJ/KwU1FkcNL0vkVXETrqfcC8VQuhmcC/DwurZi3YJN/rx36aRcH//7mzZo/UC0icu1zvBBgOPJf1Ax6fhD4YPdZT57v3jkCzI/tHyaEyk+noQNhZ8ud/Y3q0nMYBXsoamEuf3nfO1/xliTaaHyzpySoal+EMqHS2yLJpYdDmju7akes6u580QILCaqlA6kz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPHUomIwSqc92clf0Qtpzkm6YCSitZzSyoyr/jbKduw=;
 b=Zr0Ifq1C8nRk0GOiNKLNPEMeyaW2Z3+Y+gYnCGe9QF66p3nTk8OUXgfJNv2YUgs7fwtMDiQ8Nr8M/lpSzRkvdlp/SSVxxtQ6W8FiWDRvHgzF95UHF6ipyCUrr/KC+Kan5g9lX9IZfwrGtf0N5k3Vynb53proqdKbkQ9/Y3Z7DLk=
Received: from SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::13)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 22 Feb
 2026 02:26:11 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::ef) by SA1P222CA0192.outlook.office365.com
 (2603:10b6:806:3c4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Sun,
 22 Feb 2026 02:26:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sun, 22 Feb 2026 02:26:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 21 Feb
 2026 20:26:10 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 21 Feb 2026 20:26:09 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 3/4] lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use
 DWORDs
Date: Sat, 21 Feb 2026 21:23:54 -0500
Message-ID: <20260222022606.160188-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260222022606.160188-1-vitaly.prosyak@amd.com>
References: <20260222022606.160188-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7d0c5b-3c46-4bdb-2bc9-08de71b9be43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmtiNzQzbHg3bkdyK1ZWSmRwMlY1YkdSRytoaTZjeStaRGhFV2RVYXhOcHc1?=
 =?utf-8?B?KzZ4V3p3clo5akMyRStJN1dKRVJVWFVTbXBBMlBCNVQ1NWlObUlsT1ZINTB4?=
 =?utf-8?B?aDdOWkdsbTVIcjNJczRTY2FmTkhURyt0cTNHSXJ3UW1DZlRUd294YW4yeGsv?=
 =?utf-8?B?Q05MOGoxNnpJOUZ3cmZsMElWd051eFdQR3kzeE9maHo3OXdSZXhOVXprRkVz?=
 =?utf-8?B?OFNDc00zTHdpMDlhTWU3M1RzOTcyVzhTK0ZDWmcva0cvaWtwTnM0T25ud1M1?=
 =?utf-8?B?Q0poMHJWUkxNTmk1cDkzWDZ1Z2FucTFiOG5oUkJJVUhRVFRxQWE4akE3SmlM?=
 =?utf-8?B?T28xM2pNN3pYdTZSKzl5bU1tOEJ5SURBZzBRTFgwYnVyQ0ZmejF4cTlzZGZP?=
 =?utf-8?B?RkZpcXh0dWozbWIxM2hJcDV3N3prd21SbkprcGhXTjZHa085akdjZHloRUlq?=
 =?utf-8?B?YkFsS1ZjV0tlM29tckozY2diRmlUNXB1bE5PL3JvNXZGSmNpcnhTWGl5VEh2?=
 =?utf-8?B?SUlwajF4dkRNK0hWMG8xTjl5elVQbjBySUxhQmRYeExEK3Bld3l4aVBjSGR4?=
 =?utf-8?B?MythVlAvenV2ODRNNWVzOXN0dEpSbHVkVCtzeWhVcHppT3dGWTZQVmNqOU9s?=
 =?utf-8?B?K3JjVHVnRUczK2tIeFlscnE5Y0x1aGZZQy9vTnJPbVNvelY3SURkZEZRanZ0?=
 =?utf-8?B?blpPRFlvbk45RktSczg0S2JHdG8xYkJRbHNaNHRsQ2EzRTR1QlpLclVDUHhi?=
 =?utf-8?B?T0o5OUp5R1RrQVVhMXBzM0tkek1mOW5NcWx1UnJxbEhES1lWK3pjMkVyZUJ6?=
 =?utf-8?B?L0xzKytaRCs2dU15UHRObXVPbEhwdys5T1dheE8zOWNpUGJmeUhhRFlSSmhz?=
 =?utf-8?B?b0FvWFZyazRBNGVxK0M0bnpNTEdGN0pNV0lGdWhQQVRRNVQwYkEyZFpoT0hh?=
 =?utf-8?B?OWU1elRjV0VKVnF6K3dYcFJDeWdsMU45TU1tYTVmU1NDM1VaN0x1MnNnZDNH?=
 =?utf-8?B?YjlIdDBDeGNVcHloaVd1Zm8yUUh4VGdHU2JuZGxualZpMlMwMmxha0tCaXZU?=
 =?utf-8?B?bi9kK2V2V2F4V3RFYlpwNHVBaDRndFptT2loM2Qrb3RvaDAwZlhadGs3dmdK?=
 =?utf-8?B?WUJ0S0JEYWZEcU5sdVlodXljajFkOTVGK09pTVBOYW40ajBNWVJYczRERXVX?=
 =?utf-8?B?b2pnWTVIR1VkUXpBdWt6MUdRVGplWEY0eVJ6N3NFajQ1YXdDWEFXWGJUdXk4?=
 =?utf-8?B?cTR3M3MvcEFEV05tTnErNFFicTZiZWRacFFIUGd4bU9MMTRodXVwTzJZekYz?=
 =?utf-8?B?ckJoM1lMRG9FZFFBNU82M0pyYkhNblk5WHhUczh3T0N4c3B5THpRcGxiZWJj?=
 =?utf-8?B?MnIxYlpKOW9FUG51OC9YUmhDbGtXY09HWS8ya1dxaWlCbXo5VmUzNWdmRTBB?=
 =?utf-8?B?NFl4VFhxUU1YWjZuVXJJREsxTm15Q0RsWlY5cmM1MkpnWEZBdHlTZzdZVkxV?=
 =?utf-8?B?Z21SUmxMRW5EMExLUzlmNUE3ZFZabmRyTk9ZYWZXcXZsdTU1akU0cll6V1Jz?=
 =?utf-8?B?YlN5QmoxdUJLT1hsQkFsSGg0SlVUSzh2Smt3Y1o4U2p1SjM0M3czRzROanNz?=
 =?utf-8?B?b1QxL05yRy85Z2RmQmd0WVBaTXRHUit3UXlFdjhXZHRsS0dtL0IyQnJQYzJX?=
 =?utf-8?B?c3VFTEF5UnZPTWE5Z0ZyTlFyeVFUK2svWlg1REhPbkhVRGpMdHhONmR1Ylhv?=
 =?utf-8?B?K0pMOXJwRmttSXRucUNvMDkwRzk5czBwVHNDbUxoN1l3ckxzUFJSalJlN01C?=
 =?utf-8?B?MzVqQy9oR3ROSlBHem9aWGd4UHBiR1BXT3I0c1lOVmk5Q1lyN2dsSFE2ZWdC?=
 =?utf-8?B?VFFOaEFGb2JvRUI0QkN1Q1N2U1prK3BLTzVYa01EVGRlaEZNMkdlRm04c2t5?=
 =?utf-8?B?d1B2Sm1heGxydjlBajZtWHdlc0U0T3I0dWtmMHV2RUpZZldFdkswZjZDSGtH?=
 =?utf-8?B?ZFZBN1pZVWw1OWpjZG5xRGNJNGVxMjA0aXZEV3FIYWFPNEtKTG9yREcxd2lC?=
 =?utf-8?B?RE1TdmtSWERaaVpLMmh1aGxsWlZuMkJKQllhVU9oTnBXU2VJSHZiZitWQUlV?=
 =?utf-8?B?LzZMRzR0cUlHRHRlRW1BT1RaaHRwTjZrcW1xN1lzOW1sYzhsU0x2bzdzNkht?=
 =?utf-8?B?YUZEV0VCdGorV3Yzc1poZnYyb0tmTTRmbVNyd29xYjZzSVBkRVQ5elRqdVQy?=
 =?utf-8?B?T09tcXN4RzlhemM3ZHVCUHVsRTJnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jwPZDfxjuXr9S8W9ekodytxAcUgmraWAKU29W6k4CE+1mfPq0meEHaR4X1XsFrqaqG/UjI3EGA5PuEc+RYoleGz9R9ySizYXAKhwhm62uJ2g8ANo2X+1ZpXoyamM0QlcW0WWqKG02A2LZ0FgCIs4L0WLpxa8a14qgkWWjlnwXAWfKkbedfCryrLvOxyPRPDzslpmMklmGkjfgBkBT+LTT7O4ZCX1mRicUPCUnZUg+X2qFt4W74RESVB5xDOjLhxMk4A+ODYDc7FCUyGP1TMgoZ51WTyldX9rJbC4OLflkeoY03pseNzrA/ed0IHdcqi83SBOyLnRW0Okw63pZqWsJGhJxTl7lB7jY4y6xWvVN9+NG9jlrKtbw1OSQ0Y8c6DbEPjy17USklvJV76oPFHFzy66xbPV9F4m21ao8t7eyvnDxO7j+dO2Cp6cgs2Y+xM3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 02:26:10.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7d0c5b-3c46-4bdb-2bc9-08de71b9be43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_ip_blocks.c          | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 079670d49..699b8ba6a 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1506,7 +1506,7 @@ get_sdma_max_bytes(amdgpu_device_handle device)
  * is 14 bits in DWORDs (max 16384 DW = 64 KB), but that limit is
  * handled by pm4 buffer sizing, not by this struct.
  */
-#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB, 26-bit byte_count */
+#define GFX_CP_DMA_MAX_BYTES   ((1ULL << 26) - 4)  /* 64 MB, 26-bit byte_count, DWORD-aligned */
 
 /**
  * get_gfx_cp_dma_max_bytes - return max CP DMA (PACKET3_DMA_DATA) transfer size
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 1282154fd..ad8fcd294 100644
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
@@ -81,9 +81,9 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 	j = 0;
 
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
-		stream_length = ring_context->write_length / 16;
+		stream_length = ring_context->write_length / 4 / 16;
 	else
-		stream_length = ring_context->write_length;
+		stream_length = ring_context->write_length / 4;
 
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
 		opcode = 0xf2;
@@ -92,7 +92,7 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 
 	if (func->family_id == AMDGPU_FAMILY_SI)
 		ring_context->pm4[i++] = SDMA_PACKET_SI(opcode, 0, 0, 0,
-					 ring_context->write_length);
+					 ring_context->write_length / 4);
 	else
 		ring_context->pm4[i++] = SDMA_PACKET(opcode,
 					 SDMA_WRITE_SUB_OPCODE_LINEAR,
@@ -108,9 +108,9 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
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

