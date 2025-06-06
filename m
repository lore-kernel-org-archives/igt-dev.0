Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6DDC5B555
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 01:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572E210EADB;
	Fri,  6 Jun 2025 01:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WV3FQFAe";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045BD10EAAE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 01:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbfxMVpmKLIBOVxETOgCQt1uIG3F8i3COZokDQ0vMnmeFteVc+7TWK8uM+96P6goic6M7mgMn/BgxZE+xz2uLkbkP4qceDa6N3UxHvFVbCnmRh4HKTOY1v1YdyMGcp0eiRkr0P3rmnpGy1DYYFzGn4Oz99pCLw3OBaUnKJuHXx2t3pXRLMj3edB1U8r1CKzV8gKnu/q4cvWP9XKe1k6MDK1LWp3eY4yF3n0YhQBnI+5dYhAbvzHo9/MVmzQDw1gD4njBiCy9kIuWkvjR3RDKEXGwKMzKZ6/+U9NbIY/6+UrVuchWFtQcWnPhg1uN6Kblk8Zoed/ShLi021JZZ7afEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFD6qkfQUnHedTlHjGu0cWqfBsGQlFb3ZDihvxyIG5s=;
 b=XkTb5aDLlM78Gt8U+S5bu0+LrrY9toT8aADdpAND4WW2VFPrOtJJ2Bqhj/m1iT7yBgHJjVH+7kpyld9UKHBc7wh/iO6eSml0228Ov2eLBwwUsoAPWP1z5Bf8iBKwf7tj0Vs6c57PyPJ0wky/PDM5RlKyd2cr7d9gOYjsNHIbLwz/xVNbp/UEjt0jsEQzbjuG8E9muzMEhKxzE+dTrOCSt9AY9srpbVeJM+GANh/oiW2M0ZKxiUqfvWDxUqq1aiXRETyxyLWgW+DrqGJkqiaRiY8Kjxv7gI0n1urSRnm0oM0LxxwlYmG5kVlji0TJBKIx9vP8iMy7bzxn63ECQcoRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFD6qkfQUnHedTlHjGu0cWqfBsGQlFb3ZDihvxyIG5s=;
 b=WV3FQFAeMcwctGBiwwN1ffDKmICxaUWK6MiN9YAAR2WxAjQ4NyeFBhUYaFmm5zRudj7sH2IZ+UANlTSN+vaD9kkS6KIlwplzaJmt+8MV9WjjmG+GZgqB6SmWASXDJR/S0NFESx/aDMHh1Tt9+r0aAwMRsnTP+zdFmNZ8+9JMxGM=
Received: from CY5P221CA0075.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::18) by
 BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Fri, 6 Jun 2025 01:19:59 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::f5) by CY5P221CA0075.outlook.office365.com
 (2603:10b6:930:9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 6 Jun 2025 01:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 01:19:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:19:58 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 20:19:57 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 1/4] lib/amdgpu: implement vcn/jpeg queue tests
Date: Thu, 5 Jun 2025 21:19:47 -0400
Message-ID: <20250606011950.151078-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe0bf43-c165-4d9e-3a46-08dda4984110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AopA+HXhRfM6nniMAhRac5X8dyo0XBs9npdEvQbU1/j7F0CXAFUcTkChcNrU?=
 =?us-ascii?Q?0BTlX/6WSfLIhjFJSPDzTbagpB+1bBOoFiOPHORrDBO+DsIwSX1roRaKPFwf?=
 =?us-ascii?Q?J+76RgamwtxsjDfc7zHn7hmL0AiKQhGsy7YbELJgu5kFz5qL4znZHvS9zADa?=
 =?us-ascii?Q?VLBYXArc3isxasPiEoHARz0bMVhxbI17CMrkyDgZ3nASj5F16BsQT1uMCtk8?=
 =?us-ascii?Q?g8AJlOyBJlBQ4FfNrLI2jMkWXWOo5hsuBqxXk/XXf/LpTF7Az7BqVBl0TNMi?=
 =?us-ascii?Q?YqmpHKc3XPymfcSJM9WojtElwTP7pNpbjtvnOj1AQ7LrzgqApK/LgVvNGu/s?=
 =?us-ascii?Q?ah8sddIwKe5rRjIRIirnvvPnU6AzJLhQtuBTgNW46cgmuEkXaZDd24ABmp3X?=
 =?us-ascii?Q?I7vTuZziffpJ93h3qiWcZKJLfO38VUFqwDLv/nVhAG+U485HK5facU0FUl2A?=
 =?us-ascii?Q?+nSvql5+0o87/pHrEuWJ310WYCBqJS9LXcS+xlaW1gOAF00eVs+Do2Izhe9C?=
 =?us-ascii?Q?o+eE2IL9JdHP3f94RB2fecUGWbsmgSTUOxr8Gqh0ySQKq4ucp2EC4LEAZfO6?=
 =?us-ascii?Q?gzJJ614Z4fHbpwDVCJepoPplrZq67EY+XilTL20hBk9NNqrl2E3DnOhywXJG?=
 =?us-ascii?Q?jDz0qf8xdatzhKHMYfiSfGAtqnqV24rCmapipdEJKeVAuaHRnLuv9ZgDkon/?=
 =?us-ascii?Q?29YqiVdapT5N/EHTnjh4zB5zgSxoTm+aZFRmyqeqVEtUKh12whEkwLEwm13C?=
 =?us-ascii?Q?fD1grVoy4lbW/wdZ7FAz0Zsf6uo0s1stFhebEE4kti/HhzP7ntYMJf5H8ks4?=
 =?us-ascii?Q?kMv4pTgxzlYL+6CUMReN7klVdkwgq71YLE1YQsE+2gOfAzMZ+gBZhD96gmsa?=
 =?us-ascii?Q?TLxHHzwVq3WrIctIymyFh8pFi1CbqEL2/eBiB54bkvY4GyXn+uotQZKXqFK0?=
 =?us-ascii?Q?WCpJK8YbwynsaWoYY9ISl7UFrXqaHCJoiQ4VBHyPtZlwxnjAiNsXtSvrN0po?=
 =?us-ascii?Q?1iZKSZzqaoM+YxVzxh69DM25Ce/NXqdzWetwowqY6u4FppqpueV7JE7rlc8K?=
 =?us-ascii?Q?WByBFEVGmf/IqbXG6EsoLphUCYKuABOMCEuVyJMWpds45oGtPtB1TrvAM1u9?=
 =?us-ascii?Q?ju6FbYf8FrQBuOPluRz/pXgrq38fx9zBfsLSQLpyBpn2LUq8HJ+NLRCXDfi7?=
 =?us-ascii?Q?jV8Tdxkw6an+nheYGUgKinjqDnVHiRMs3IKSJIMbXKYvugGWY7AsXBRhUTA7?=
 =?us-ascii?Q?jTzT3q6zDlEynlIOnTomt9nNZqkGCgMjipzQUsIHNgWFXIhooslf7V703Fi2?=
 =?us-ascii?Q?u+vzjZABzOxTEbx3t9Z7H2qCikgNneNGcBnS3GgoA2FseyKllvD34sIReTuh?=
 =?us-ascii?Q?wNw7V5Agz/yc1I1mvkY2jiRldKzwjmrRrHXhohKU2tmxHvG2ju8RMGhC60st?=
 =?us-ascii?Q?43KRbFS0tCIsiJxwWl3bF+1a5v/Cr8UOCbDR+RQQhtrQGwjXKnhFu48DqPJ+?=
 =?us-ascii?Q?NshPFzy73m8yVtOAKsBFuz20YsmZJaK1tJo7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:19:58.9043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe0bf43-c165-4d9e-3a46-08dda4984110
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548
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

From: Ruili Ji <ruiliji2@amd.com>

Query the vcn/jpeg queue reset mask to check
if driver has supported queue reset.
Add common api to query the queue sched mask info
and select the ready queue (1: ready, 0: not ready),
then execute test on the selected queue.
If there are multiple queues, test will be
executed on per ready queue.

Queue test shall be independent, because some vcn ips
do not support queue reset. And decode/encode normal
tests and queue tests have some same functions, we
move the duplicated code to the shared lib files.

Signed-off-by: ruiliji2 <ruiliji2@amd.com>
Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c   |   4 +
 lib/amdgpu/amd_jpeg_shared.c | 191 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_jpeg_shared.h | 145 ++++++++++++++++++++++++++
 lib/amdgpu/amd_mmd_shared.c  |  62 +++++++++++-
 lib/amdgpu/amd_mmd_shared.h  |  19 ++++
 lib/amdgpu/amd_vcn_shared.c  | 191 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_vcn_shared.h  | 144 ++++++++++++++++++++++++++
 lib/meson.build              |   2 +
 8 files changed, 756 insertions(+), 2 deletions(-)
 create mode 100644 lib/amdgpu/amd_jpeg_shared.c
 create mode 100644 lib/amdgpu/amd_jpeg_shared.h
 create mode 100644 lib/amdgpu/amd_vcn_shared.c
 create mode 100644 lib/amdgpu/amd_vcn_shared.h

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index b8227ba2b..e4913c77d 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1050,6 +1050,10 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
 	else if (ip_type == AMD_IP_COMPUTE)
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "compute_reset_mask");
+	else if (ip_type == AMD_IP_VCN_UNIFIED)
+		snprintf(reset_mask, sizeof(reset_mask) - 1, "vcn_reset_mask");
+	else if (ip_type == AMD_IP_VCN_JPEG)
+		snprintf(reset_mask, sizeof(reset_mask) - 1, "jpeg_reset_mask");
 	else
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
 
diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
new file mode 100644
index 000000000..e9f673a42
--- /dev/null
+++ b/lib/amdgpu/amd_jpeg_shared.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2025 Advanced Micro Devices, Inc.
+
+#include "amd_jpeg_shared.h"
+
+bool
+is_jpeg_tests_enable(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *context)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_JPEG, 0, &info);
+
+	if (r != 0 || !info.available_rings ||
+			(context->family_id < AMDGPU_FAMILY_RV &&
+			(context->family_id == AMDGPU_FAMILY_AI &&
+			(context->chip_id - context->chip_rev) < 0x32))) { /* Arcturus */
+		igt_info("\n\nThe ASIC NOT support JPEG, test disabled\n");
+		return false;
+	}
+
+	if (info.hw_ip_version_major == 1)
+		context->jpeg_direct_reg = false;
+	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 4)
+		context->jpeg_direct_reg = true;
+	else
+		return false;
+
+	context->vcn_ip_version_major = info.hw_ip_version_major;
+	context->vcn_ip_version_minor = info.hw_ip_version_minor;
+	jrbc_ib_cond_rd_timer = vcnipUVD_JRBC_IB_COND_RD_TIMER;
+	jrbc_ib_ref_data = vcnipUVD_JRBC_IB_REF_DATA;
+	jpeg_rb_base = vcnipUVD_JPEG_RB_BASE;
+	jpeg_rb_size = vcnipUVD_JPEG_RB_SIZE;
+	jpeg_rb_wptr = vcnipUVD_JPEG_RB_WPTR;
+	jpeg_int_en = vcnipUVD_JPEG_INT_EN;
+	jpeg_cntl = vcnipUVD_JPEG_CNTL;
+	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
+
+	if (context->family_id == AMDGPU_FAMILY_AI &&
+		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
+		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
+		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
+		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
+		jpeg_pitch = vcnipUVD_JPEG_PITCH_1;
+		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH_1;
+		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE_1;
+		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1;
+		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1;
+		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1;
+		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1;
+		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2_1;
+		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL_1;
+		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR_1;
+		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR_1;
+		jpeg_luma_base0_0 = vcnipUVD_JPEG_LUMA_BASE0_0;
+		jpeg_chroma_base0_0 = vcnipUVD_JPEG_CHROMA_BASE0_0;
+	} else {
+		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST;
+		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH;
+		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW;
+		jpeg_pitch = vcnipUVD_JPEG_PITCH;
+		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH;
+		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE;
+		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE;
+		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE;
+		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH;
+		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW;
+		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2;
+		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL;
+		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR;
+		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR;
+	}
+
+	return true;
+}
+
+void
+set_reg_jpeg(struct mmd_context *context, uint32_t reg, uint32_t cond,
+		uint32_t type, uint32_t val, uint32_t *idx)
+{
+	context->ib_cpu[(*idx)++] = RDECODE_PKTJ(reg, cond, type);
+	context->ib_cpu[(*idx)++] = val;
+}
+
+/* send a target buffer command */
+void
+send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
+		uint32_t *idx)
+{
+
+	set_reg_jpeg(context, jpeg_pitch, COND0, TYPE0,
+			(JPEG_DEC_DT_PITCH >> 4), idx);
+	set_reg_jpeg(context, jpeg_uv_pitch, COND0, TYPE0,
+			(JPEG_DEC_DT_PITCH >> 4), idx);
+
+	set_reg_jpeg(context, dec_addr_mode, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, dec_y_gfx10_tiling_surface, COND0, TYPE0,
+			0, idx);
+	set_reg_jpeg(context, dec_uv_gfx10_tiling_surface, COND0, TYPE0,
+			0, idx);
+
+	/* set UVD_LMI_JPEG_WRITE_64BIT_BAR_LOW/HIGH based on target buffer address */
+	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_high, COND0, TYPE0,
+			(addr >> 32), idx);
+	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_low, COND0, TYPE0,
+			addr, idx);
+
+	/* set output buffer data address */
+	if (jpeg_luma_base0_0) {
+		set_reg_jpeg(context, jpeg_luma_base0_0, COND0, TYPE0,
+			JPEG_DEC_LUMA_OFFSET, idx);
+		set_reg_jpeg(context, jpeg_chroma_base0_0, COND0, TYPE0,
+			JPEG_DEC_CHROMA_OFFSET, idx);
+	} else {
+		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
+			JPEG_DEC_LUMA_OFFSET, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
+			JPEG_DEC_CHROMA_OFFSET, idx);
+	}
+	set_reg_jpeg(context, jpeg_tier_cntl2, COND0, 0, 0, idx);
+
+	/* set output buffer read pointer */
+	set_reg_jpeg(context, jpeg_outbuf_rptr, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, jpeg_outbuf_cntl, COND0, TYPE0,
+				((0x00001587 & (~0x00000180L)) | (0x1 << 0x7) | (0x1 << 0x6)),
+				 idx);
+
+	/* enable error interrupts */
+	set_reg_jpeg(context, jpeg_int_en, COND0, TYPE0, 0xFFFFFFFE, idx);
+
+	/* start engine command */
+	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0xE, idx);
+
+	/* wait for job completion, wait for job JBSI fetch done */
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0,
+			(JPEG_DEC_BSD_SIZE >> 2), idx);
+	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0,
+			0x01400200, idx);
+	set_reg_jpeg(context, jpeg_rb_rptr, COND3, TYPE3, 0xFFFFFFFF, idx);
+
+	/* wait for job jpeg outbuf idle */
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, 0xFFFFFFFF,
+			idx);
+	set_reg_jpeg(context, jpeg_outbuf_wptr, COND3, TYPE3, 0x00000001,
+			idx);
+
+	/* stop engine */
+	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0x4, idx);
+}
+
+/* send a bitstream buffer command */
+void
+send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
+		uint32_t *idx)
+{
+
+	/* jpeg soft reset */
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 1, idx);
+
+	/* ensuring the Reset is asserted in SCLK domain */
+	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0, 0x01400200, idx);
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0x1 << 0x10), idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
+
+	/* wait mem */
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 0, idx);
+
+	/* ensuring the Reset is de-asserted in SCLK domain */
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0 << 0x10), idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
+
+	/* set UVD_LMI_JPEG_READ_64BIT_BAR_LOW/HIGH based on bitstream buffer address */
+	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_high, COND0, TYPE0,
+			(addr >> 32), idx);
+	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_low, COND0, TYPE0,
+			addr, idx);
+
+	/* set jpeg_rb_base */
+	set_reg_jpeg(context, jpeg_rb_base, COND0, TYPE0, 0, idx);
+
+	/* set jpeg_rb_base */
+	set_reg_jpeg(context, jpeg_rb_size, COND0, TYPE0, 0xFFFFFFF0, idx);
+
+	/* set jpeg_rb_wptr */
+	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
+			(JPEG_DEC_BSD_SIZE >> 2), idx);
+}
\ No newline at end of file
diff --git a/lib/amdgpu/amd_jpeg_shared.h b/lib/amdgpu/amd_jpeg_shared.h
new file mode 100644
index 000000000..09e76b005
--- /dev/null
+++ b/lib/amdgpu/amd_jpeg_shared.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_JPEG_SHARED_H
+#define AMD_JPEG_SHARED_H
+
+#include "amd_mmd_shared.h"
+
+/* jpeg registers */
+#define mmUVD_JPEG_CNTL				0x0200
+#define mmUVD_JPEG_RB_BASE			0x0201
+#define mmUVD_JPEG_RB_WPTR			0x0202
+#define mmUVD_JPEG_RB_RPTR			0x0203
+#define mmUVD_JPEG_RB_SIZE			0x0204
+#define mmUVD_JPEG_TIER_CNTL2			0x021a
+#define mmUVD_JPEG_UV_TILING_CTRL		0x021c
+#define mmUVD_JPEG_TILING_CTRL			0x021e
+#define mmUVD_JPEG_OUTBUF_RPTR			0x0220
+#define mmUVD_JPEG_OUTBUF_WPTR			0x0221
+#define mmUVD_JPEG_PITCH			0x0222
+#define mmUVD_JPEG_INT_EN			0x0229
+#define mmUVD_JPEG_UV_PITCH			0x022b
+#define mmUVD_JPEG_INDEX			0x023e
+#define mmUVD_JPEG_DATA				0x023f
+#define mmUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH	0x0438
+#define mmUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW	0x0439
+#define mmUVD_LMI_JPEG_READ_64BIT_BAR_HIGH	0x045a
+#define mmUVD_LMI_JPEG_READ_64BIT_BAR_LOW	0x045b
+#define mmUVD_CTX_INDEX				0x0528
+#define mmUVD_CTX_DATA				0x0529
+#define mmUVD_SOFT_RESET			0x05a0
+
+#define vcnipUVD_JPEG_DEC_SOFT_RST		0x402f
+#define vcnipUVD_JRBC_IB_COND_RD_TIMER		0x408e
+#define vcnipUVD_JRBC_IB_REF_DATA		0x408f
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH	0x40e1
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW	0x40e0
+#define vcnipUVD_JPEG_RB_BASE			0x4001
+#define vcnipUVD_JPEG_RB_SIZE			0x4004
+#define vcnipUVD_JPEG_RB_WPTR			0x4002
+#define vcnipUVD_JPEG_PITCH			0x401f
+#define vcnipUVD_JPEG_UV_PITCH			0x4020
+#define vcnipJPEG_DEC_ADDR_MODE			0x4027
+#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE	0x4024
+#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE	0x4025
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH	0x40e3
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW	0x40e2
+#define vcnipUVD_JPEG_INDEX			0x402c
+#define vcnipUVD_JPEG_DATA			0x402d
+#define vcnipUVD_JPEG_TIER_CNTL2		0x400f
+#define vcnipUVD_JPEG_OUTBUF_RPTR		0x401e
+#define vcnipUVD_JPEG_OUTBUF_CNTL		0x401c
+#define vcnipUVD_JPEG_INT_EN			0x400a
+#define vcnipUVD_JPEG_CNTL			0x4000
+#define vcnipUVD_JPEG_RB_RPTR			0x4003
+#define vcnipUVD_JPEG_OUTBUF_WPTR		0x401d
+
+#define vcnipUVD_JPEG_DEC_SOFT_RST_1             0x4051
+#define vcnipUVD_JPEG_PITCH_1                    0x4043
+#define vcnipUVD_JPEG_UV_PITCH_1                 0x4044
+#define vcnipJPEG_DEC_ADDR_MODE_1                0x404B
+#define vcnipUVD_JPEG_TIER_CNTL2_1               0x400E
+#define vcnipUVD_JPEG_OUTBUF_CNTL_1              0x4040
+#define vcnipUVD_JPEG_OUTBUF_WPTR_1              0x4041
+#define vcnipUVD_JPEG_OUTBUF_RPTR_1              0x4042
+#define vcnipUVD_JPEG_LUMA_BASE0_0               0x41C0
+#define vcnipUVD_JPEG_CHROMA_BASE0_0             0x41C1
+#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1   0x4048
+#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1  0x4049
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1 0x40B5
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1  0x40B4
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1  0x40B3
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1   0x40B2
+
+uint32_t jpeg_dec_soft_rst;
+uint32_t jrbc_ib_cond_rd_timer;
+uint32_t jrbc_ib_ref_data;
+uint32_t lmi_jpeg_read_64bit_bar_high;
+uint32_t lmi_jpeg_read_64bit_bar_low;
+uint32_t jpeg_rb_base;
+uint32_t jpeg_rb_size;
+uint32_t jpeg_rb_wptr;
+uint32_t jpeg_pitch;
+uint32_t jpeg_uv_pitch;
+uint32_t dec_addr_mode;
+uint32_t dec_y_gfx10_tiling_surface;
+uint32_t dec_uv_gfx10_tiling_surface;
+uint32_t lmi_jpeg_write_64bit_bar_high;
+uint32_t lmi_jpeg_write_64bit_bar_low;
+uint32_t jpeg_tier_cntl2;
+uint32_t jpeg_outbuf_rptr;
+uint32_t jpeg_outbuf_cntl;
+uint32_t jpeg_int_en;
+uint32_t jpeg_cntl;
+uint32_t jpeg_rb_rptr;
+uint32_t jpeg_outbuf_wptr;
+uint32_t jpeg_luma_base0_0;
+uint32_t jpeg_chroma_base0_0;
+
+#define RDECODE_PKT_REG_J(x)		((unsigned int)(x)&0x3FFFF)
+#define RDECODE_PKT_RES_J(x)		(((unsigned int)(x)&0x3F) << 18)
+#define RDECODE_PKT_COND_J(x)		(((unsigned int)(x)&0xF) << 24)
+#define RDECODE_PKT_TYPE_J(x)		(((unsigned int)(x)&0xF) << 28)
+#define RDECODE_PKTJ(reg, cond, type)	(RDECODE_PKT_REG_J(reg) | \
+					 RDECODE_PKT_RES_J(0) | \
+					 RDECODE_PKT_COND_J(cond) | \
+					 RDECODE_PKT_TYPE_J(type))
+
+#define UVD_BASE_INST0_SEG1		0x00007E00
+#define SOC15_REG_ADDR(reg)		(UVD_BASE_INST0_SEG1 + reg)
+
+#define COND0				0
+#define COND1				1
+#define COND3				3
+#define TYPE0				0
+#define TYPE1				1
+#define TYPE3				3
+#define JPEG_DEC_DT_PITCH       0x100
+#define WIDTH                   64
+#define JPEG_DEC_BSD_SIZE       0x200
+#define JPEG_DEC_LUMA_OFFSET    0
+#define JPEG_DEC_CHROMA_OFFSET  0x4000
+#define JPEG_DEC_SUM            262144
+#define IB_SIZE                 4096
+#define MAX_RESOURCES           16
+
+bool
+is_jpeg_tests_enable(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *context);
+
+void
+set_reg_jpeg(struct mmd_context *context, uint32_t reg, uint32_t cond,
+		uint32_t type, uint32_t val, uint32_t *idx);
+
+/* send a bitstream buffer command */
+void
+send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
+		uint32_t *idx);
+
+/* send a target buffer command */
+void
+send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
+		uint32_t *idx);
+#endif // AMD_JPEG_SHARED_H
\ No newline at end of file
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index 976fc61ba..95a89d40e 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -191,6 +191,64 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 	return r;
 }
 
+int
+mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_context *context,
+		mm_test_callback callback, int err_type, const struct pci_addr *pci)
+{
+	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
+	long mask = 0;
+	uint32_t ring_id;
+	char sysfs[125];
+
+	if (!callback)
+		return -1;
+
+	// test is only supported on VCN version >= 4
+	if (context->ip_type == AMD_IP_VCN_UNIFIED)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_vcn_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
+	else if (context->ip_type == AMD_IP_VCN_JPEG)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_jpeg_sched_mask",
+				pci->domain, pci->bus, pci->device, pci->function);
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL) {
+			igt_skip("read the sysfs failed: %s\n", sysfs);
+			return -1;
+		}
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+		pclose(fp);
+	} else
+		sched_mask = 1;
+
+	mask = sched_mask;
+	for (ring_id = 0;  mask > 0; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (mask & 1) {
+			igt_info(" Testing on queue %d\n", ring_id);
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s", 0x1 << ring_id, sysfs);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+			if (callback(device_handle, context, err_type))
+				break;
+		}
+		mask = mask >> 1;
+	}
 
-
-
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
+	return r;
+}
diff --git a/lib/amdgpu/amd_mmd_shared.h b/lib/amdgpu/amd_mmd_shared.h
index 923bcc29c..65857d16a 100644
--- a/lib/amdgpu/amd_mmd_shared.h
+++ b/lib/amdgpu/amd_mmd_shared.h
@@ -7,6 +7,7 @@
 #include "amdgpu_drm.h"
 
 #include "igt.h"
+#include "amd_ip_blocks.h"
 #include "amd_mmd_decode_messages.h"
 #include "amd_mmd_util_math.h"
 #include "amd_memory.h"
@@ -27,6 +28,17 @@
 #define IB_SIZE		4096
 #define MAX_RESOURCES	16
 
+enum decoder_error_type {
+	INVALID_DECODER_IB_TYPE = 0,
+	INVALID_DECODER_IB_SIZE,
+	INVALID_DECODER_DPB_BUFFER,
+	INVALID_DECODER_CODEC_PARAM,
+	INVALID_DECODER_TARGET_BUFFER,
+	INVALID_DECODER_BITSTREAM,
+	INVALID_DECODER_BITSTREAM_BUFFER,
+	INVALID_DECODER_NONE,
+};
+
 struct mmd_shared_context {
 	uint32_t family_id;
 	uint32_t chip_id;
@@ -51,6 +63,7 @@ struct mmd_shared_context {
 	uint32_t vpe_ip_version_major;
 	uint32_t vpe_ip_version_minor;
 	bool vpe_ring;
+	enum amd_ip_block_type ip_type;
 };
 
 struct mmd_context {
@@ -117,3 +130,9 @@ alloc_resource(amdgpu_device_handle device_handle,
 
 void
 free_resource(struct amdgpu_mmd_bo *mmd_bo);
+
+typedef int (*mm_test_callback) (amdgpu_device_handle device_handle, struct mmd_shared_context *context,
+		int err);
+int
+mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_context *context,
+		mm_test_callback test, int err_type, const struct pci_addr *pci);
diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
new file mode 100644
index 000000000..3888ec112
--- /dev/null
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2025 Advanced Micro Devices, Inc.
+
+#include "amd_vcn_shared.h"
+
+bool
+is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_context *context)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_ENC, 0, &info);
+
+	if (r)
+		return false;
+
+	context->vcn_ip_version_major = info.hw_ip_version_major;
+	context->vcn_ip_version_minor = info.hw_ip_version_minor;
+	context->enc_ring = !!info.available_rings;
+	/* in vcn 4.0 it re-uses encoding queue as unified queue */
+	if (context->vcn_ip_version_major >= 4) {
+		context->vcn_unified_ring = true;
+		context->vcn_dec_sw_ring = true;
+		context->dec_ring = context->enc_ring;
+	} else {
+		r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_DEC, 0, &info);
+		context->dec_ring = !!info.available_rings;
+	}
+
+	if (!(context->dec_ring || context->enc_ring) ||
+		(context->family_id < AMDGPU_FAMILY_RV &&
+		(context->family_id == AMDGPU_FAMILY_AI &&
+		(context->chip_id - context->chip_rev) < 0x32))) { /* Arcturus */
+		igt_info("The ASIC does NOT support VCN, vcn test is disabled\n");
+		return false;
+	}
+
+	if (context->family_id == AMDGPU_FAMILY_AI)
+		context->enc_ring  = false;
+
+	if (!context->dec_ring) {
+		igt_info("VCN Tests DEC create disable\n");
+		igt_info("VCN Tests DEC decode disable\n");
+		igt_info("VCN Tests DEC destroy disable\n");
+	}
+
+	if (!context->enc_ring) {
+		igt_info("VCN Tests ENC create disable\n");
+		igt_info("VCN Tests ENC encode disable\n");
+		igt_info("VCN Tests ENC destroy disable\n");
+	}
+
+	if (context->vcn_ip_version_major == 1) {
+		context->vcn_reg_index = 0;
+	} else if (context->vcn_ip_version_major == 2 && context->vcn_ip_version_minor == 0) {
+		context->vcn_reg_index = 1;
+	} else if ((context->vcn_ip_version_major == 2 && context->vcn_ip_version_minor >= 5) ||
+			context->vcn_ip_version_major == 3) {
+		context->vcn_reg_index = 2;
+	}
+
+	return true;
+}
+
+void
+amdgpu_cs_sq_head(struct vcn_context *v_context, uint32_t *base, int *offset, bool enc)
+{
+	/* signature */
+	*(base + (*offset)++) = 0x00000010;
+	*(base + (*offset)++) = 0x30000002;
+	v_context->ib_checksum = base + (*offset)++;
+	v_context->ib_size_in_dw = base + (*offset)++;
+
+	/* engine info */
+	*(base + (*offset)++) = 0x00000010;
+	*(base + (*offset)++) = 0x30000001;
+	*(base + (*offset)++) = enc ? 2 : 3;
+	*(base + (*offset)++) = 0x00000000;
+}
+
+void
+amdgpu_cs_sq_ib_tail(struct vcn_context *v_context, uint32_t *end)
+{
+	uint32_t size_in_dw;
+	uint32_t checksum = 0;
+
+	/* if the pointers are invalid, no need to process */
+	if (v_context->ib_checksum == NULL || v_context->ib_size_in_dw == NULL)
+		return;
+
+	size_in_dw = end - v_context->ib_size_in_dw - 1;
+	*v_context->ib_size_in_dw = size_in_dw;
+	*(v_context->ib_size_in_dw + 4) = size_in_dw * sizeof(uint32_t);
+
+	for (int i = 0; i < size_in_dw; i++)
+		checksum += *(v_context->ib_checksum + 2 + i);
+
+	*v_context->ib_checksum = checksum;
+
+	v_context->ib_checksum = NULL;
+	v_context->ib_size_in_dw = NULL;
+}
+
+void
+vcn_dec_cmd(struct mmd_shared_context *shared_context,
+		struct mmd_context *context, struct vcn_context *v_context,
+		uint64_t addr, unsigned int cmd, int *idx, enum decoder_error_type err_type)
+{
+	if (shared_context->vcn_dec_sw_ring == false) {
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data0;
+		context->ib_cpu[(*idx)++] = addr;
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data1;
+		context->ib_cpu[(*idx)++] = addr >> 32;
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].cmd;
+		context->ib_cpu[(*idx)++] = cmd << 1;
+		return;
+	}
+
+	/* Support decode software ring message */
+	if (!(*idx)) {
+		struct rvcn_decode_ib_package *ib_header;
+
+		if (shared_context->vcn_unified_ring)
+			amdgpu_cs_sq_head(v_context, context->ib_cpu, idx, false);
+
+		ib_header = (struct rvcn_decode_ib_package *)&context->ib_cpu[*idx];
+		if (err_type == INVALID_DECODER_IB_SIZE)
+			ib_header->package_size = 0;
+		else
+			ib_header->package_size = sizeof(struct rvcn_decode_buffer) +
+			sizeof(struct rvcn_decode_ib_package);
+
+		(*idx)++;
+		ib_header->package_type = (DECODE_IB_PARAM_DECODE_BUFFER);
+		(*idx)++;
+
+		v_context->decode_buffer = (struct rvcn_decode_buffer *)&(context->ib_cpu[*idx]);
+		*idx += sizeof(struct rvcn_decode_buffer) / 4;
+		memset(v_context->decode_buffer, 0, sizeof(struct rvcn_decode_buffer));
+	}
+
+	switch (cmd) {
+	case DECODE_CMD_MSG_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= DECODE_CMDBUF_FLAGS_MSG_BUFFER;
+		v_context->decode_buffer->msg_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->msg_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_DPB_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_DPB_BUFFER);
+		v_context->decode_buffer->dpb_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->dpb_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_DECODING_TARGET_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_DECODING_TARGET_BUFFER);
+		v_context->decode_buffer->target_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->target_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_FEEDBACK_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_FEEDBACK_BUFFER);
+		v_context->decode_buffer->feedback_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->feedback_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_PROB_TBL_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_PROB_TBL_BUFFER);
+		v_context->decode_buffer->prob_tbl_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->prob_tbl_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_SESSION_CONTEXT_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_SESSION_CONTEXT_BUFFER);
+		v_context->decode_buffer->session_contex_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->session_contex_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_BITSTREAM_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_BITSTREAM_BUFFER);
+		v_context->decode_buffer->bitstream_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->bitstream_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_IT_SCALING_TABLE_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_IT_SCALING_BUFFER);
+		v_context->decode_buffer->it_sclr_table_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->it_sclr_table_buffer_address_lo = (addr);
+	break;
+	case DECODE_CMD_CONTEXT_BUFFER:
+		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_CONTEXT_BUFFER);
+		v_context->decode_buffer->context_buffer_address_hi = (addr >> 32);
+		v_context->decode_buffer->context_buffer_address_lo = (addr);
+	break;
+	default:
+		igt_info("Not Supported!\n");
+	}
+}
\ No newline at end of file
diff --git a/lib/amdgpu/amd_vcn_shared.h b/lib/amdgpu/amd_vcn_shared.h
new file mode 100644
index 000000000..d6ce0b60b
--- /dev/null
+++ b/lib/amdgpu/amd_vcn_shared.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_VCN_SHARED_H
+#define AMD_VCN_SHARED_H
+
+#include "amd_mmd_shared.h"
+
+#define DECODE_CMD_MSG_BUFFER                              0x00000000
+#define DECODE_CMD_DPB_BUFFER                              0x00000001
+#define DECODE_CMD_DECODING_TARGET_BUFFER                  0x00000002
+#define DECODE_CMD_FEEDBACK_BUFFER                         0x00000003
+#define DECODE_CMD_PROB_TBL_BUFFER                         0x00000004
+#define DECODE_CMD_SESSION_CONTEXT_BUFFER                  0x00000005
+#define DECODE_CMD_BITSTREAM_BUFFER                        0x00000100
+#define DECODE_CMD_IT_SCALING_TABLE_BUFFER                 0x00000204
+#define DECODE_CMD_CONTEXT_BUFFER                          0x00000206
+
+#define DECODE_IB_PARAM_DECODE_BUFFER                      (0x00000001)
+
+#define DECODE_CMDBUF_FLAGS_MSG_BUFFER                     (0x00000001)
+#define DECODE_CMDBUF_FLAGS_DPB_BUFFER                     (0x00000002)
+#define DECODE_CMDBUF_FLAGS_BITSTREAM_BUFFER               (0x00000004)
+#define DECODE_CMDBUF_FLAGS_DECODING_TARGET_BUFFER         (0x00000008)
+#define DECODE_CMDBUF_FLAGS_FEEDBACK_BUFFER                (0x00000010)
+#define DECODE_CMDBUF_FLAGS_IT_SCALING_BUFFER              (0x00000200)
+#define DECODE_CMDBUF_FLAGS_CONTEXT_BUFFER                 (0x00000800)
+#define DECODE_CMDBUF_FLAGS_PROB_TBL_BUFFER                (0x00001000)
+#define DECODE_CMDBUF_FLAGS_SESSION_CONTEXT_BUFFER         (0x00100000)
+
+#define H264_NAL_TYPE_NON_IDR_SLICE 1
+#define H264_NAL_TYPE_DP_A_SLICE 2
+#define H264_NAL_TYPE_DP_B_SLICE 3
+#define H264_NAL_TYPE_DP_C_SLICE 0x4
+#define H264_NAL_TYPE_IDR_SLICE 0x5
+#define H264_NAL_TYPE_SEI 0x6
+#define H264_NAL_TYPE_SEQ_PARAM 0x7
+#define H264_NAL_TYPE_PIC_PARAM 0x8
+#define H264_NAL_TYPE_ACCESS_UNIT 0x9
+#define H264_NAL_TYPE_END_OF_SEQ 0xa
+#define H264_NAL_TYPE_END_OF_STREAM 0xb
+#define H264_NAL_TYPE_FILLER_DATA 0xc
+#define H264_NAL_TYPE_SEQ_EXTENSION 0xd
+
+#define H264_START_CODE 0x000001
+
+struct rvcn_decode_buffer {
+	unsigned int valid_buf_flag;
+	unsigned int msg_buffer_address_hi;
+	unsigned int msg_buffer_address_lo;
+	unsigned int dpb_buffer_address_hi;
+	unsigned int dpb_buffer_address_lo;
+	unsigned int target_buffer_address_hi;
+	unsigned int target_buffer_address_lo;
+	unsigned int session_contex_buffer_address_hi;
+	unsigned int session_contex_buffer_address_lo;
+	unsigned int bitstream_buffer_address_hi;
+	unsigned int bitstream_buffer_address_lo;
+	unsigned int context_buffer_address_hi;
+	unsigned int context_buffer_address_lo;
+	unsigned int feedback_buffer_address_hi;
+	unsigned int feedback_buffer_address_lo;
+	unsigned int luma_hist_buffer_address_hi;
+	unsigned int luma_hist_buffer_address_lo;
+	unsigned int prob_tbl_buffer_address_hi;
+	unsigned int prob_tbl_buffer_address_lo;
+	unsigned int sclr_coeff_buffer_address_hi;
+	unsigned int sclr_coeff_buffer_address_lo;
+	unsigned int it_sclr_table_buffer_address_hi;
+	unsigned int it_sclr_table_buffer_address_lo;
+	unsigned int sclr_target_buffer_address_hi;
+	unsigned int sclr_target_buffer_address_lo;
+	unsigned int cenc_size_info_buffer_address_hi;
+	unsigned int cenc_size_info_buffer_address_lo;
+	unsigned int mpeg2_pic_param_buffer_address_hi;
+	unsigned int mpeg2_pic_param_buffer_address_lo;
+	unsigned int mpeg2_mb_control_buffer_address_hi;
+	unsigned int mpeg2_mb_control_buffer_address_lo;
+	unsigned int mpeg2_idct_coeff_buffer_address_hi;
+	unsigned int mpeg2_idct_coeff_buffer_address_lo;
+};
+
+struct rvcn_decode_ib_package {
+	unsigned int package_size;
+	unsigned int package_type;
+};
+
+struct amdgpu_vcn_reg {
+	uint32_t data0;
+	uint32_t data1;
+	uint32_t cmd;
+	uint32_t nop;
+	uint32_t cntl;
+};
+
+struct buffer_info {
+	uint32_t num_bits_in_buffer;
+	const uint8_t *dec_buffer;
+	uint8_t dec_data;
+	uint32_t dec_buffer_size;
+	const uint8_t *end;
+};
+
+struct h264_decode {
+	uint8_t profile;
+	uint8_t level_idc;
+	uint8_t nal_ref_idc;
+	uint8_t nal_unit_type;
+	uint32_t pic_width, pic_height;
+	uint32_t slice_type;
+};
+
+struct vcn_context {
+	struct amdgpu_mmd_bo enc_buf;
+	struct amdgpu_mmd_bo cpb_buf;
+	struct amdgpu_mmd_bo session_ctx_buf;
+	uint32_t enc_task_id;
+	uint32_t *ib_checksum;
+	uint32_t *ib_size_in_dw;
+	uint32_t gWidth, gHeight, gSliceType;
+	struct rvcn_decode_buffer *decode_buffer;
+};
+
+struct amdgpu_vcn_reg reg[] = {
+	{0x81c4, 0x81c5, 0x81c3, 0x81ff, 0x81c6},
+	{0x504, 0x505, 0x503, 0x53f, 0x506},
+	{0x10, 0x11, 0xf, 0x29, 0x26d},
+};
+
+bool
+is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_context *context);
+
+void
+amdgpu_cs_sq_head(struct vcn_context *v_context, uint32_t *base, int *offset, bool enc);
+
+void
+amdgpu_cs_sq_ib_tail(struct vcn_context *v_context, uint32_t *end);
+
+void
+vcn_dec_cmd(struct mmd_shared_context *shared_context,
+		struct mmd_context *context, struct vcn_context *v_context,
+		uint64_t addr, unsigned int cmd, int *idx, enum decoder_error_type err_type);
+#endif //AMD_VCN_SHARED_H
\ No newline at end of file
diff --git a/lib/meson.build b/lib/meson.build
index 6da6d2a47..04a568cf1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -169,6 +169,8 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_cp_dma.c',
 		'amdgpu/amd_mem_leak.c',
 		'amdgpu/amd_mmd_shared.c',
+		'amdgpu/amd_jpeg_shared.c',
+		'amdgpu/amd_vcn_shared.c',
 		'amdgpu/amd_userq.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
-- 
2.34.1

