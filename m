Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7AECA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 03:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1850210EC6B;
	Tue, 29 Sep 2026 03:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D2/I2PGK";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013017.outbound.protection.outlook.com
 [40.93.196.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9A10EC69
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 03:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVVB9sdXEzYqPZ+il2sEV/R9aBPDjNHD4ItM9NuYh0c1kAV3JRQQjHEAmRYCmOqM1YTYo3ZEvbC83o/UNRvNW9OW50au4HLOMZfdpG0HEREIAJ08HBQsUVbpmVbzS9kvRjbtOcD1v8Tm/08YhVAB13itKkj1uE9UnbomW8Chc+5zHcyvOx7Zj4dbD3uxakcbjkoo6IK5hYL3CaNlhydzA+AVYQ6CyUfZTJQNBBRI21bp544elOVQIJr0FH4zQ0u24Jkn6U3pPLT8+7IRg5lg+j5p5BPgWBgD9py0dXaqlDWsmEZb3xqcVTf+RdzmtkKFIyxYZFHL/VrdpmZLj57NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYwHt3Kmwbh/hLvBb2qW9yCIsbCBAuFNX/7cxAMdtbo=;
 b=xyWUG2fIv1QCUdT+3NEAkQTqWrD/xHN+AN1Yqa/EYxLDzA9Ym7aWpjngLiFsZ3GM1UPTNEC5RWedtIVT3xaoMw1fBY25mVr7+71MTsGqNxmiTokjpcHYrydjv/zqxA8/66L0y0SbXx7/KIbu+mA3g1VMWlEVjr1OnlKGov8gdmOyhCpO98kzKa+j/2bKCW6G24KxF5/WeE9MZ+XxIQ4vDFLOkn2FvtV/8OM2z1kX3G+q44x8MwW+4kk4/Hlvrsj9HRPjSqCrO45GRucVHZ1Vd69mUbldYOJY5mdJs2F1QfhQLUciTg7zCMJ29YrNRoGsd3FnJH6svUt87tspyW+M1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYwHt3Kmwbh/hLvBb2qW9yCIsbCBAuFNX/7cxAMdtbo=;
 b=D2/I2PGK1X6CVU19sZhe7MEsnlLPVItl9mqdSx7OnCeQUGjstgVYzdRli3wZ04f5wjPkcAV98eTgFfzePNo5B6dF+zJGgt0WY1icHNJGwNU6gr0Kma2o7MCALhXMsO2Ek+iw/944laBaBjStO5cAMJp7jp8zo7cyFbbdbW8Iy5Q=
Received: from MW4PR04CA0125.namprd04.prod.outlook.com (2603:10b6:303:84::10)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 03:01:37 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::3d) by MW4PR04CA0125.outlook.office365.com
 (2603:10b6:303:84::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 03:01:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 03:01:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 22:01:35 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 22:01:34 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] lib/amdgpu: fix checkpatch errors in amd_ip_blocks
Date: Tue, 29 Sep 2026 11:00:47 +0800
Message-ID: <20260929030131.3415475-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
References: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8771aeb3-4938-4460-c893-08df1dd5f9e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jI2apDntP9ZRwRtB4dWaipruGMU6PAen/+pDN01oIM00aiY8uIYcXzd6BSKOHIgkw8MauGh4wRBpLzkyCvqF+i5/ihF3h5rWz3uCzkJ9dHvzx+rjwviXkpdF5go+YxeCChIpcIQBczd9OtMViMiE++/4lx+ssSXHwnRGB68c3xb0SXRKWqyvonAKwaqPjuBGABVp4EdY9r1TcKi8u0R5Qe0K6S1NOpdlSAaq4Hpv1T+XvZKCH7x8KnQVMFi7WlLRGyb9quClcsJqMlM8eRbLZUUNpZuLJgM+s/mpScZApV79mYKckAxfzp9ewV/5w5LGPVlc5Km9fKGyyKYi7WrTjF6FIjn/vOpifMuXyXiSZ/6k99zGGC2v7E5uv4y5TKaNn9K8sy6Uz+XdzznEpR3YVeXwkUQhOqYiAUoELreo9uZi0F6IjuVyNcncr7ZJpITfPsQwq9YDA9rt9ZihLZgJdB+XxfgSAyh1B663QdBNuE1AzuJIkGSF4vTsNz3v5obFEmjRbFXhkIFnvAgv9SPmtsdO6icYrHmkqUPx4R1iOQWEhWeqWtrJj0HHk0dBoPdo3wxNOF26DuMQILaji9vOskQLMCJKpvDT7P0dhPqmPWEyQaVkWz2EPEVPee99LcTwh+AIWEMS9Pp48rONYYJ0nzBQtBZiNNknP+2dA9zxPoMtnzG0DXbH554/bz8t+W0E
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bgI+gtbdQ198vWXKUKYnZRRgQqNsFvneeFCyLYC+DkuCn6TRXZeWkpAyy28cW44qXn6PyqCeMnwbsRf7urZiOm5BSIAzuE1VZ/RTXf30wmZFScaStrAeyRW5ASNb55tk6zsqbCKsGEgvtlzbpYHstnDSVjum4wSehnRTKzBD0f96qUw5XOFyJfgxRUKmVH0iy4rVe6iifTqkkr687krcXWh8ClqsXHzjhL0eMUUHkAgredj69RAy8n1WMl6D5QBTV1NPkCDzV0p2ohY8FEfyuNmCsz5L8qSsfEDMiZ7+c84Ljj8u0uaN+G5a7fzoD9mzGNEpBxMtAixg+B80Pq9eoqwPMr+fNA0zArcQpo1PbfoL5JjHV53jwd3rQT8p+afQFexmx3Bg62aK2ARF66mbFkv9EoE6iGX6oUtnVvUap5B3IaIKE5KZ2N8NrNLgLCbT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 03:01:36.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8771aeb3-4938-4460-c893-08df1dd5f9e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607
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

Fix all checkpatch ERROR-level issues in amd_ip_blocks.{c,h}:
- CODE_INDENT: use tabs for continuation/macro-body indentation
- SPACING: drop stray space before ')', add spaces around ternary ':'
- COMPLEX_MACRO: wrap amdgpu_pkt_end/amdgpu_sdma_pkt_end in do {} while (0)
- OPEN_BRACE: put struct opening brace on the same line
- SPACING: add space after 'for' in for_each_test

No functional change.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c |  8 ++++----
 lib/amdgpu/amd_ip_blocks.h | 23 ++++++++++++-----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index d171a2fe3..3e3adafac 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -627,8 +627,8 @@ int wait_for_packet_consumption(struct amdgpu_ring_context *ring_context)
 
 static
 int create_sync_signal(amdgpu_device_handle device,
-                             struct amdgpu_ring_context *ring_context,
-                             uint64_t timeout)
+			struct amdgpu_ring_context *ring_context,
+			uint64_t timeout)
 {
 	uint32_t syncarray[1];
 	struct drm_amdgpu_userq_signal signal_data;
@@ -1188,7 +1188,7 @@ amdgpu_device_ip_block_ex_setup(struct amdgpu_ip_block_version *ip_block_version
 	if (ip_block_version->funcs &&
 		(!ip_block_version->funcs->gfx_program_compute ||
 		 !ip_block_version->funcs->gfx_dispatch_direct ||
-		 !ip_block_version->funcs->gfx_write_confirm )) {
+		 !ip_block_version->funcs->gfx_write_confirm)) {
 		amd_ip_blocks_ex_init(ip_block_version->funcs);
 	}
 	return 0;
@@ -1784,7 +1784,7 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 		enable = true;
 	else
 		igt_kmsg("***FAILURE mask found 0x%x(%s) requested 0x%x operation %s is not supported LINE %d FILE %s\n",
-				mask, buffer2, reset_type, ip_type == AMD_IP_GFX ? "GFX": ip_type == AMD_IP_COMPUTE ? "COMPUTE" : "SDMA",
+				mask, buffer2, reset_type, ip_type == AMD_IP_GFX ? "GFX" : ip_type == AMD_IP_COMPUTE ? "COMPUTE" : "SDMA",
 						__LINE__, __FILE__);
 
 	pclose(fp);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 6c4424481..4f731bf04 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -89,10 +89,10 @@
 * - __ring_start holds DWORD index of the write pointer
 */
 #define amdgpu_sdma_pkt_begin() \
-    uint32_t __num_dw_written = 0, __ring_start = 0; \
-    if (ring_context->wptr_cpu) \
-        *ring_context->wptr_cpu = (*ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK) >> 2; \
-    __ring_start = *ring_context->wptr_cpu;
+	uint32_t __num_dw_written = 0, __ring_start = 0; \
+	if (ring_context->wptr_cpu) \
+		*ring_context->wptr_cpu = (*ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK) >> 2; \
+	__ring_start = *ring_context->wptr_cpu;
 
 /*
 * amdgpu_pkt_add_dw(value)
@@ -119,8 +119,9 @@
 *
 * The wptr remains in DWORD units (unlike SDMA).
 */
-#define amdgpu_pkt_end() \
-	*ring_context->wptr_cpu = (*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK
+#define amdgpu_pkt_end() do { \
+	*ring_context->wptr_cpu = (*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK; \
+} while (0)
 
 /*
 * amdgpu_sdma_pkt_end()
@@ -130,8 +131,9 @@
 * - Wrap with mask
 * - Convert back to a byte offset (<< 2) because SDMA uses byte-based wptrs.
 */
-#define amdgpu_sdma_pkt_end() \
-	*ring_context->wptr_cpu = (((*ring_context->wptr_cpu + __num_dw_written ) & USERMODE_QUEUE_SIZE_DW_MASK) << 2)
+#define amdgpu_sdma_pkt_end() do { \
+	*ring_context->wptr_cpu = (((*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK) << 2); \
+} while (0)
 
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
@@ -171,8 +173,7 @@ enum  cmd_error_type {
 
 #define _MAX_NUM_ASIC_ID_EXCLUDE_FILTER 3
 
-struct asic_id_filter
-{
+struct asic_id_filter {
 	int family_id;
 	int chip_id_begin;
 	int chip_id_end;
@@ -208,7 +209,7 @@ enum uq_submission_mode {
 	UQ_SUBMIT_NO_SYNC,       /* Skip sync for error injection */
 };
 
-#define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
+#define for_each_test(t, T) for (typeof(*T) *t = T; t->name; t++)
 
 /* set during execution */
 struct amdgpu_cs_err_codes {
-- 
2.50.1

