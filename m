Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1B9C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 23:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B752D10E1BF;
	Wed,  4 Jun 2025 23:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H2cySzrW";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FBD10E1BF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 23:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIhoP5CUatXnNAHX5oYQ2+B2XXhq7NhR3MhCbF+DrsT1aUIRnzOO7Q/HPcnNcfi/gQuYwzjn4nO6qlrHdDn+cvVn8GGFWdTuycDYfwBSjArtKPAReE2VQ9qY2fg0PKuM2IMMKt+RkGDA4KtBIstiTAMV2pCI0l6ZicDb1khJzj7innQ1P9dZt40Zwi//rvnpFpynGg9lodRAptGp8PuRCC7JhRpzDVJBK79c3AKjz7Sm5O+8OjvR3beNHvGSZrisLFczIRGhTbZXikPj3SOf1qC+3OksbySVpvgR4RY1G8DYhHgizRNeUXDFvJoKbzbFTP1MSKWWsTZyInWtyvVRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU53Z/rJF0mRiBwjcKOZd2Qefh/nMfUT/GVE/Asq0es=;
 b=PHHlzDWj8+QXOru5mJuA/DjwerdCw/bTfb17htjWDqz19H0OQh4FkL4J8TkhLLyqO9HFZO9sGmnWN72BHAOxU/iiW9e2lbWVCzRmk2xnfl+m8bQfgjazMOMIhhlky0mlbFWJaR+o03X6mHMYVosQjb7G+QoZfI9opXphC/6nAHAAwzEO/LpwQN7nRr5vRkG8OP6f3bGOKPxi6XGVexD7TzdE3iX8ICTOttsk7RU3IUC3tX5WvFo8dx/pDQUy6BLn112ZqABdGOtze1kdnRhU5I1y9kC2YhoxkK1jTuQsnYKbjNXwCIQOOv3iJnao2XEMhifZzLuzuXPeBayHSdSwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU53Z/rJF0mRiBwjcKOZd2Qefh/nMfUT/GVE/Asq0es=;
 b=H2cySzrWMuU6DEN37bED/ZuT7npjN7gCh6gkCBaNyeRH3EBejwO0yAY8NSFvgBcW5DCa8jGQZtGht4YRqmoxHkTbUk4wU1aGpRyxEnGQWkLYw6wrJXql90tSZ+3yWK1kelEJ7OX2ieUGqEMhg9gi4JR3z9UqiQ8uhzBGuerPwHY=
Received: from MW4PR03CA0074.namprd03.prod.outlook.com (2603:10b6:303:b6::19)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 23:47:15 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:b6:cafe::f) by MW4PR03CA0074.outlook.office365.com
 (2603:10b6:303:b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Wed,
 4 Jun 2025 23:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 4 Jun 2025 23:47:14 +0000
Received: from ruiliji-ubuntu2204.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Jun 2025 18:47:11 -0500
From: Ruili Ji <ruiliji2@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 2/4] test/amdgpu: to implement vcn/jpeg queue tests
Date: Thu, 5 Jun 2025 07:46:51 +0800
Message-ID: <20250604234652.2715698-3-ruiliji2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604234652.2715698-1-ruiliji2@amd.com>
References: <20250604234652.2715698-1-ruiliji2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 519b4b09-f9e5-4e4e-85b3-08dda3c22200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EMvgCMST6AQl04xJ/DGNJrU2G0Dru2ou3cDgBN4fg6Oi45Tmpni1NFczeCHS?=
 =?us-ascii?Q?mq0TK79IGg5pEdz98+OdY0NVQIFtPGIfuvAr5+rpCJNDoMII65ZYBBMLQlSa?=
 =?us-ascii?Q?uaC9z9pJvhqIsbokX3AChCKvCQ5QQby6scd882A6H6wMhsAyJvm874AiGM3f?=
 =?us-ascii?Q?mQRr2oJqMkJaEtca9efP0AmiGUqa2PS5OHq3SMm4vGPqF6gwrjUsjq+xlKAq?=
 =?us-ascii?Q?daSi6mtzQXA6lLb/HVQ2B1yyy8Lmw0ElpMcE951YijY593qzd7j5LYZUv/Ao?=
 =?us-ascii?Q?SIGO+qFz/ihlo7+ntnooCa0aXWOoTR17QuyNtIZJWfTiPPgFcFKwpuJtUwR/?=
 =?us-ascii?Q?y8DX0Nh+0FMgQpVYYjqkLLQqMIHpyK0Bc57NuXMPrxHVskbb5Y4FvungpJqj?=
 =?us-ascii?Q?jO/vXCoeS8amfv3WLZ43iKGOSw+F+MLKooiTs3jwf8EPeV4/bq1OcMDAe0HN?=
 =?us-ascii?Q?8GwwDt9wPf8Jz8WVAX6T2UHEvUjPoj+/9ndAtZBEFZKezA3fQZg+iE3O4D4z?=
 =?us-ascii?Q?QhbUruv92N+YKv5nKfr6qdR2e85jX4IbG6GzGL5tJi77i2FMYy6lmxuDO75B?=
 =?us-ascii?Q?lrf5OnS/PCvSb4H4wF0fxMFer1wXYVFPfM81G8DlmT1XLSFqfWUhUtILHFQo?=
 =?us-ascii?Q?whkh5Lhk1idAnR3B/KoXQckr8i7WVI/hOv7bwzFWTIs8XnWHBGi4rjusRO7b?=
 =?us-ascii?Q?K1VLaCgaaqEezWucqDgegxneZJ8xXsOqedNJnen4/1RnxoY0Ke6JYuYDHD44?=
 =?us-ascii?Q?cQrhq8LE2is/Xg6PaQ3eZfO26Gwz50fq3+uTnCk8TWJttkWH+e0VhEKtMNrd?=
 =?us-ascii?Q?EEOuyIUec/4WGFi/2UiBNPJ5ftvtikrz5YxNBGP9oVQZUUWbJJzGlUfkMDT0?=
 =?us-ascii?Q?MPEyLAStOT3TZ6B+sindgCGhZVjFFQxCJmJYtR5h2SCp+HTUWjHc4Y1HOwox?=
 =?us-ascii?Q?Er0iOZwz5L96nHp98BA4+E/8st40FxLBUhzi1sNlSZngfrcTNjdEspZfA8db?=
 =?us-ascii?Q?pVtQCc98muQWSRXaNv7SpzI9QqCuDuBSvBcabVEj+X2spZQnLS8oGKosNFSa?=
 =?us-ascii?Q?6Na1DJ6mQsHAPOHdxElsgeUrJsx+GzXf3ap0xEaGlviMBsWhRZ/xWI3ZR1Ec?=
 =?us-ascii?Q?BK9oF+Davohm6lxPwp2J6F1aO4Dnjt2G/0vfi/IWeGyShr11SjMu5SXZ+k6d?=
 =?us-ascii?Q?286pUCi5nA36Jv2c41LlHrjyGqMi2AdGWzWHBlHANvFcg9UMnfZrXwqwIj3n?=
 =?us-ascii?Q?/BG6f/GKFzqJtZ8J5zgFGaGKTVIrTgcEwuJSb5+gZxgWbDfLaApjoMwlJ1nt?=
 =?us-ascii?Q?1u4pqDMZwrGC7K8jdcHnCwWb8sp8buubO3zhhXHTfEqtf6dITuZPxvGOx/6J?=
 =?us-ascii?Q?+Ex6plU2UPg9Hdn+0wO0GDDryRCrZRBkcNkOi5eFZKaYiq1oJE8nBqrhpIZY?=
 =?us-ascii?Q?HAdywaTkWj3WRuPu2wRNNnE+Xq5GNjx5OdD7d8Ek614XaXRs7eBj2i99E8iy?=
 =?us-ascii?Q?EtTDq26wFY23rb9zCBpqgZB+ljM9yuwwD2W7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:47:14.4464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 519b4b09-f9e5-4e4e-85b3-08dda3c22200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379
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

Remove the duplicated code for vcn/jpeg tests.

Signed-off-by: Ruili Ji <ruiliji2@amd.com>
Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_jpeg_dec.c | 306 +------------------------------
 tests/amdgpu/amd_vcn.c      | 347 +++---------------------------------
 2 files changed, 27 insertions(+), 626 deletions(-)

diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 4bbd0132e..4431dd8e4 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -2,205 +2,7 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 // Copyright 2017 Advanced Micro Devices, Inc.
 
-#include "lib/amdgpu/amd_mmd_shared.h"
-
-/* jpeg registers */
-#define mmUVD_JPEG_CNTL				0x0200
-#define mmUVD_JPEG_RB_BASE			0x0201
-#define mmUVD_JPEG_RB_WPTR			0x0202
-#define mmUVD_JPEG_RB_RPTR			0x0203
-#define mmUVD_JPEG_RB_SIZE			0x0204
-#define mmUVD_JPEG_TIER_CNTL2			0x021a
-#define mmUVD_JPEG_UV_TILING_CTRL		0x021c
-#define mmUVD_JPEG_TILING_CTRL			0x021e
-#define mmUVD_JPEG_OUTBUF_RPTR			0x0220
-#define mmUVD_JPEG_OUTBUF_WPTR			0x0221
-#define mmUVD_JPEG_PITCH			0x0222
-#define mmUVD_JPEG_INT_EN			0x0229
-#define mmUVD_JPEG_UV_PITCH			0x022b
-#define mmUVD_JPEG_INDEX			0x023e
-#define mmUVD_JPEG_DATA				0x023f
-#define mmUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH	0x0438
-#define mmUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW	0x0439
-#define mmUVD_LMI_JPEG_READ_64BIT_BAR_HIGH	0x045a
-#define mmUVD_LMI_JPEG_READ_64BIT_BAR_LOW	0x045b
-#define mmUVD_CTX_INDEX				0x0528
-#define mmUVD_CTX_DATA				0x0529
-#define mmUVD_SOFT_RESET			0x05a0
-
-#define vcnipUVD_JPEG_DEC_SOFT_RST		0x402f
-#define vcnipUVD_JRBC_IB_COND_RD_TIMER		0x408e
-#define vcnipUVD_JRBC_IB_REF_DATA		0x408f
-#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH	0x40e1
-#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW	0x40e0
-#define vcnipUVD_JPEG_RB_BASE			0x4001
-#define vcnipUVD_JPEG_RB_SIZE			0x4004
-#define vcnipUVD_JPEG_RB_WPTR			0x4002
-#define vcnipUVD_JPEG_PITCH			0x401f
-#define vcnipUVD_JPEG_UV_PITCH			0x4020
-#define vcnipJPEG_DEC_ADDR_MODE			0x4027
-#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE	0x4024
-#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE	0x4025
-#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH	0x40e3
-#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW	0x40e2
-#define vcnipUVD_JPEG_INDEX			0x402c
-#define vcnipUVD_JPEG_DATA			0x402d
-#define vcnipUVD_JPEG_TIER_CNTL2		0x400f
-#define vcnipUVD_JPEG_OUTBUF_RPTR		0x401e
-#define vcnipUVD_JPEG_OUTBUF_CNTL		0x401c
-#define vcnipUVD_JPEG_INT_EN			0x400a
-#define vcnipUVD_JPEG_CNTL			0x4000
-#define vcnipUVD_JPEG_RB_RPTR			0x4003
-#define vcnipUVD_JPEG_OUTBUF_WPTR		0x401d
-
-#define vcnipUVD_JPEG_DEC_SOFT_RST_1             0x4051
-#define vcnipUVD_JPEG_PITCH_1                    0x4043
-#define vcnipUVD_JPEG_UV_PITCH_1                 0x4044
-#define vcnipJPEG_DEC_ADDR_MODE_1                0x404B
-#define vcnipUVD_JPEG_TIER_CNTL2_1               0x400E
-#define vcnipUVD_JPEG_OUTBUF_CNTL_1              0x4040
-#define vcnipUVD_JPEG_OUTBUF_WPTR_1              0x4041
-#define vcnipUVD_JPEG_OUTBUF_RPTR_1              0x4042
-#define vcnipUVD_JPEG_LUMA_BASE0_0               0x41C0
-#define vcnipUVD_JPEG_CHROMA_BASE0_0             0x41C1
-#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1   0x4048
-#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1  0x4049
-#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1 0x40B5
-#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1  0x40B4
-#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1  0x40B3
-#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1   0x40B2
-
-static uint32_t jpeg_dec_soft_rst;
-static uint32_t jrbc_ib_cond_rd_timer;
-static uint32_t jrbc_ib_ref_data;
-static uint32_t lmi_jpeg_read_64bit_bar_high;
-static uint32_t lmi_jpeg_read_64bit_bar_low;
-static uint32_t jpeg_rb_base;
-static uint32_t jpeg_rb_size;
-static uint32_t jpeg_rb_wptr;
-static uint32_t jpeg_pitch;
-static uint32_t jpeg_uv_pitch;
-static uint32_t dec_addr_mode;
-static uint32_t dec_y_gfx10_tiling_surface;
-static uint32_t dec_uv_gfx10_tiling_surface;
-static uint32_t lmi_jpeg_write_64bit_bar_high;
-static uint32_t lmi_jpeg_write_64bit_bar_low;
-static uint32_t jpeg_tier_cntl2;
-static uint32_t jpeg_outbuf_rptr;
-static uint32_t jpeg_outbuf_cntl;
-static uint32_t jpeg_int_en;
-static uint32_t jpeg_cntl;
-static uint32_t jpeg_rb_rptr;
-static uint32_t jpeg_outbuf_wptr;
-static uint32_t jpeg_luma_base0_0;
-static uint32_t jpeg_chroma_base0_0;
-
-#define RDECODE_PKT_REG_J(x)		((unsigned int)(x)&0x3FFFF)
-#define RDECODE_PKT_RES_J(x)		(((unsigned int)(x)&0x3F) << 18)
-#define RDECODE_PKT_COND_J(x)		(((unsigned int)(x)&0xF) << 24)
-#define RDECODE_PKT_TYPE_J(x)		(((unsigned int)(x)&0xF) << 28)
-#define RDECODE_PKTJ(reg, cond, type)	(RDECODE_PKT_REG_J(reg) | \
-					 RDECODE_PKT_RES_J(0) | \
-					 RDECODE_PKT_COND_J(cond) | \
-					 RDECODE_PKT_TYPE_J(type))
-
-#define UVD_BASE_INST0_SEG1		0x00007E00
-#define SOC15_REG_ADDR(reg)		(UVD_BASE_INST0_SEG1 + reg)
-
-#define COND0				0
-#define COND1				1
-#define COND3				3
-#define TYPE0				0
-#define TYPE1				1
-#define TYPE3				3
-#define JPEG_DEC_DT_PITCH       0x100
-#define WIDTH                   64
-#define JPEG_DEC_BSD_SIZE       0x200
-#define JPEG_DEC_LUMA_OFFSET    0
-#define JPEG_DEC_CHROMA_OFFSET  0x4000
-#define JPEG_DEC_SUM            262144
-#define IB_SIZE                 4096
-#define MAX_RESOURCES           16
-
-static bool
-is_jpeg_tests_enable(amdgpu_device_handle device_handle,
-		struct mmd_shared_context *context)
-{
-	struct drm_amdgpu_info_hw_ip info;
-	int r;
-
-	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_JPEG, 0, &info);
-
-	if (r != 0 || !info.available_rings ||
-			(context->family_id < AMDGPU_FAMILY_RV &&
-			(context->family_id == AMDGPU_FAMILY_AI &&
-			(context->chip_id - context->chip_rev) < 0x32))) { /* Arcturus */
-		igt_info("\n\nThe ASIC NOT support JPEG, test disabled\n");
-		return false;
-	}
-
-	if (info.hw_ip_version_major == 1)
-		context->jpeg_direct_reg = false;
-	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 4)
-		context->jpeg_direct_reg = true;
-	else
-		return false;
-
-	jrbc_ib_cond_rd_timer = vcnipUVD_JRBC_IB_COND_RD_TIMER;
-	jrbc_ib_ref_data = vcnipUVD_JRBC_IB_REF_DATA;
-	jpeg_rb_base = vcnipUVD_JPEG_RB_BASE;
-	jpeg_rb_size = vcnipUVD_JPEG_RB_SIZE;
-	jpeg_rb_wptr = vcnipUVD_JPEG_RB_WPTR;
-	jpeg_int_en = vcnipUVD_JPEG_INT_EN;
-	jpeg_cntl = vcnipUVD_JPEG_CNTL;
-	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
-
-	if (context->family_id == AMDGPU_FAMILY_AI &&
-		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
-		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
-		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
-		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
-		jpeg_pitch = vcnipUVD_JPEG_PITCH_1;
-		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH_1;
-		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE_1;
-		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1;
-		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1;
-		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1;
-		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1;
-		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2_1;
-		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL_1;
-		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR_1;
-		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR_1;
-		jpeg_luma_base0_0 = vcnipUVD_JPEG_LUMA_BASE0_0;
-		jpeg_chroma_base0_0 = vcnipUVD_JPEG_CHROMA_BASE0_0;
-	} else {
-		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST;
-		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH;
-		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW;
-		jpeg_pitch = vcnipUVD_JPEG_PITCH;
-		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH;
-		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE;
-		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE;
-		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE;
-		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH;
-		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW;
-		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2;
-		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL;
-		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR;
-		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR;
-	}
-
-	return true;
-}
-
-
-static void
-set_reg_jpeg(struct mmd_context *context, uint32_t reg, uint32_t cond,
-		uint32_t type, uint32_t val, uint32_t *idx)
-{
-	context->ib_cpu[(*idx)++] = RDECODE_PKTJ(reg, cond, type);
-	context->ib_cpu[(*idx)++] = val;
-}
+#include "lib/amdgpu/amd_jpeg_shared.h"
 
 /* send a bitstream buffer command */
 static void
@@ -356,112 +158,6 @@ send_cmd_target(struct mmd_context *context, uint64_t addr,
 	set_reg_jpeg(context, SOC15_REG_ADDR(mmUVD_CTX_DATA), COND0, TYPE0, 0, idx);
 }
 
-/* send a bitstream buffer command */
-static void
-send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
-		uint32_t *idx)
-{
-
-	/* jpeg soft reset */
-	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 1, idx);
-
-	/* ensuring the Reset is asserted in SCLK domain */
-	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0, 0x01400200, idx);
-	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0x1 << 0x10), idx);
-	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
-
-	/* wait mem */
-	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 0, idx);
-
-	/* ensuring the Reset is de-asserted in SCLK domain */
-	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0 << 0x10), idx);
-	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
-
-	/* set UVD_LMI_JPEG_READ_64BIT_BAR_LOW/HIGH based on bitstream buffer address */
-	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_high, COND0, TYPE0,
-			(addr >> 32), idx);
-	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_low, COND0, TYPE0,
-			addr, idx);
-
-	/* set jpeg_rb_base */
-	set_reg_jpeg(context, jpeg_rb_base, COND0, TYPE0, 0, idx);
-
-	/* set jpeg_rb_base */
-	set_reg_jpeg(context, jpeg_rb_size, COND0, TYPE0, 0xFFFFFFF0, idx);
-
-	/* set jpeg_rb_wptr */
-	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
-			(JPEG_DEC_BSD_SIZE >> 2), idx);
-}
-
-/* send a target buffer command */
-static void
-send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
-		uint32_t *idx)
-{
-
-	set_reg_jpeg(context, jpeg_pitch, COND0, TYPE0,
-			(JPEG_DEC_DT_PITCH >> 4), idx);
-	set_reg_jpeg(context, jpeg_uv_pitch, COND0, TYPE0,
-			(JPEG_DEC_DT_PITCH >> 4), idx);
-
-	set_reg_jpeg(context, dec_addr_mode, COND0, TYPE0, 0, idx);
-	set_reg_jpeg(context, dec_y_gfx10_tiling_surface, COND0, TYPE0,
-			0, idx);
-	set_reg_jpeg(context, dec_uv_gfx10_tiling_surface, COND0, TYPE0,
-			0, idx);
-
-	/* set UVD_LMI_JPEG_WRITE_64BIT_BAR_LOW/HIGH based on target buffer address */
-	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_high, COND0, TYPE0,
-			(addr >> 32), idx);
-	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_low, COND0, TYPE0,
-			addr, idx);
-
-	/* set output buffer data address */
-	if (jpeg_luma_base0_0) {
-		set_reg_jpeg(context, jpeg_luma_base0_0, COND0, TYPE0,
-			JPEG_DEC_LUMA_OFFSET, idx);
-		set_reg_jpeg(context, jpeg_chroma_base0_0, COND0, TYPE0,
-			JPEG_DEC_CHROMA_OFFSET, idx);
-	} else {
-		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
-		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
-			JPEG_DEC_LUMA_OFFSET, idx);
-		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
-		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
-			JPEG_DEC_CHROMA_OFFSET, idx);
-	}
-	set_reg_jpeg(context, jpeg_tier_cntl2, COND0, 0, 0, idx);
-
-	/* set output buffer read pointer */
-	set_reg_jpeg(context, jpeg_outbuf_rptr, COND0, TYPE0, 0, idx);
-	set_reg_jpeg(context, jpeg_outbuf_cntl, COND0, TYPE0,
-				((0x00001587 & (~0x00000180L)) | (0x1 << 0x7) | (0x1 << 0x6)),
-				 idx);
-
-	/* enable error interrupts */
-	set_reg_jpeg(context, jpeg_int_en, COND0, TYPE0, 0xFFFFFFFE, idx);
-
-	/* start engine command */
-	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0xE, idx);
-
-	/* wait for job completion, wait for job JBSI fetch done */
-	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0,
-			(JPEG_DEC_BSD_SIZE >> 2), idx);
-	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0,
-			0x01400200, idx);
-	set_reg_jpeg(context, jpeg_rb_rptr, COND3, TYPE3, 0xFFFFFFFF, idx);
-
-	/* wait for job jpeg outbuf idle */
-	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, 0xFFFFFFFF,
-			idx);
-	set_reg_jpeg(context, jpeg_outbuf_wptr, COND3, TYPE3, 0x00000001,
-			idx);
-
-	/* stop engine */
-	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0x4, idx);
-}
-
 static void
 amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 		struct mmd_shared_context *shared_context)
diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index 2ffebd286..03c864c0e 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -4,130 +4,7 @@
  * Copyright 2014 Advanced Micro Devices, Inc.
  */
 
-#include "lib/amdgpu/amd_mmd_shared.h"
-
-#define DECODE_CMD_MSG_BUFFER                              0x00000000
-#define DECODE_CMD_DPB_BUFFER                              0x00000001
-#define DECODE_CMD_DECODING_TARGET_BUFFER                  0x00000002
-#define DECODE_CMD_FEEDBACK_BUFFER                         0x00000003
-#define DECODE_CMD_PROB_TBL_BUFFER                         0x00000004
-#define DECODE_CMD_SESSION_CONTEXT_BUFFER                  0x00000005
-#define DECODE_CMD_BITSTREAM_BUFFER                        0x00000100
-#define DECODE_CMD_IT_SCALING_TABLE_BUFFER                 0x00000204
-#define DECODE_CMD_CONTEXT_BUFFER                          0x00000206
-
-#define DECODE_IB_PARAM_DECODE_BUFFER                      (0x00000001)
-
-#define DECODE_CMDBUF_FLAGS_MSG_BUFFER                     (0x00000001)
-#define DECODE_CMDBUF_FLAGS_DPB_BUFFER                     (0x00000002)
-#define DECODE_CMDBUF_FLAGS_BITSTREAM_BUFFER               (0x00000004)
-#define DECODE_CMDBUF_FLAGS_DECODING_TARGET_BUFFER         (0x00000008)
-#define DECODE_CMDBUF_FLAGS_FEEDBACK_BUFFER                (0x00000010)
-#define DECODE_CMDBUF_FLAGS_IT_SCALING_BUFFER              (0x00000200)
-#define DECODE_CMDBUF_FLAGS_CONTEXT_BUFFER                 (0x00000800)
-#define DECODE_CMDBUF_FLAGS_PROB_TBL_BUFFER                (0x00001000)
-#define DECODE_CMDBUF_FLAGS_SESSION_CONTEXT_BUFFER         (0x00100000)
-
-#define H264_NAL_TYPE_NON_IDR_SLICE 1
-#define H264_NAL_TYPE_DP_A_SLICE 2
-#define H264_NAL_TYPE_DP_B_SLICE 3
-#define H264_NAL_TYPE_DP_C_SLICE 0x4
-#define H264_NAL_TYPE_IDR_SLICE 0x5
-#define H264_NAL_TYPE_SEI 0x6
-#define H264_NAL_TYPE_SEQ_PARAM 0x7
-#define H264_NAL_TYPE_PIC_PARAM 0x8
-#define H264_NAL_TYPE_ACCESS_UNIT 0x9
-#define H264_NAL_TYPE_END_OF_SEQ 0xa
-#define H264_NAL_TYPE_END_OF_STREAM 0xb
-#define H264_NAL_TYPE_FILLER_DATA 0xc
-#define H264_NAL_TYPE_SEQ_EXTENSION 0xd
-
-#define H264_START_CODE 0x000001
-
-
-struct rvcn_decode_buffer {
-	unsigned int valid_buf_flag;
-	unsigned int msg_buffer_address_hi;
-	unsigned int msg_buffer_address_lo;
-	unsigned int dpb_buffer_address_hi;
-	unsigned int dpb_buffer_address_lo;
-	unsigned int target_buffer_address_hi;
-	unsigned int target_buffer_address_lo;
-	unsigned int session_contex_buffer_address_hi;
-	unsigned int session_contex_buffer_address_lo;
-	unsigned int bitstream_buffer_address_hi;
-	unsigned int bitstream_buffer_address_lo;
-	unsigned int context_buffer_address_hi;
-	unsigned int context_buffer_address_lo;
-	unsigned int feedback_buffer_address_hi;
-	unsigned int feedback_buffer_address_lo;
-	unsigned int luma_hist_buffer_address_hi;
-	unsigned int luma_hist_buffer_address_lo;
-	unsigned int prob_tbl_buffer_address_hi;
-	unsigned int prob_tbl_buffer_address_lo;
-	unsigned int sclr_coeff_buffer_address_hi;
-	unsigned int sclr_coeff_buffer_address_lo;
-	unsigned int it_sclr_table_buffer_address_hi;
-	unsigned int it_sclr_table_buffer_address_lo;
-	unsigned int sclr_target_buffer_address_hi;
-	unsigned int sclr_target_buffer_address_lo;
-	unsigned int cenc_size_info_buffer_address_hi;
-	unsigned int cenc_size_info_buffer_address_lo;
-	unsigned int mpeg2_pic_param_buffer_address_hi;
-	unsigned int mpeg2_pic_param_buffer_address_lo;
-	unsigned int mpeg2_mb_control_buffer_address_hi;
-	unsigned int mpeg2_mb_control_buffer_address_lo;
-	unsigned int mpeg2_idct_coeff_buffer_address_hi;
-	unsigned int mpeg2_idct_coeff_buffer_address_lo;
-};
-
-struct rvcn_decode_ib_package {
-	unsigned int package_size;
-	unsigned int package_type;
-};
-
-
-struct amdgpu_vcn_reg {
-	uint32_t data0;
-	uint32_t data1;
-	uint32_t cmd;
-	uint32_t nop;
-	uint32_t cntl;
-};
-
-struct buffer_info {
-	uint32_t num_bits_in_buffer;
-	const uint8_t *dec_buffer;
-	uint8_t dec_data;
-	uint32_t dec_buffer_size;
-	const uint8_t *end;
-};
-
-struct h264_decode {
-	uint8_t profile;
-	uint8_t level_idc;
-	uint8_t nal_ref_idc;
-	uint8_t nal_unit_type;
-	uint32_t pic_width, pic_height;
-	uint32_t slice_type;
-};
-
-struct vcn_context {
-	struct amdgpu_mmd_bo enc_buf;
-	struct amdgpu_mmd_bo cpb_buf;
-	struct amdgpu_mmd_bo session_ctx_buf;
-	uint32_t enc_task_id;
-	uint32_t *ib_checksum;
-	uint32_t *ib_size_in_dw;
-	uint32_t gWidth, gHeight, gSliceType;
-	struct rvcn_decode_buffer *decode_buffer;
-};
-
-static struct amdgpu_vcn_reg reg[] = {
-	{0x81c4, 0x81c5, 0x81c3, 0x81ff, 0x81c6},
-	{0x504, 0x505, 0x503, 0x53f, 0x506},
-	{0x10, 0x11, 0xf, 0x29, 0x26d},
-};
+#include "lib/amdgpu/amd_vcn_shared.h"
 
 static uint32_t
 bs_read_u(struct buffer_info *buf_info, int n);
@@ -135,190 +12,6 @@ bs_read_u(struct buffer_info *buf_info, int n);
 static uint32_t
 bs_read_ue(struct buffer_info *buf_info);
 
-static bool
-is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_context *context)
-{
-	struct drm_amdgpu_info_hw_ip info;
-	int r;
-
-	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_ENC, 0, &info);
-
-	if (r)
-		return false;
-
-	context->vcn_ip_version_major = info.hw_ip_version_major;
-	context->vcn_ip_version_minor = info.hw_ip_version_minor;
-	context->enc_ring = !!info.available_rings;
-		/* in vcn 4.0 it re-uses encoding queue as unified queue */
-	if (context->vcn_ip_version_major >= 4) {
-		context->vcn_unified_ring = true;
-		context->vcn_dec_sw_ring = true;
-		context->dec_ring = context->enc_ring;
-	} else {
-		r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VCN_DEC, 0, &info);
-		context->dec_ring = !!info.available_rings;
-	}
-
-	if (!(context->dec_ring || context->enc_ring) ||
-		(context->family_id < AMDGPU_FAMILY_RV &&
-		(context->family_id == AMDGPU_FAMILY_AI &&
-		(context->chip_id - context->chip_rev) < 0x32))) { /* Arcturus */
-		igt_info("The ASIC does NOT support VCN, vcn test is disabled\n");
-		return false;
-	}
-
-	if (context->family_id == AMDGPU_FAMILY_AI)
-		context->enc_ring  = false;
-
-	if (!context->dec_ring) {
-		igt_info("VCN Tests DEC create disable");
-		igt_info("VCN Tests DEC decode disable");
-		igt_info("VCN Tests DEC destroy disable");
-	}
-
-	if (!context->enc_ring) {
-		igt_info("VCN Tests ENC create disable");
-		igt_info("VCN Tests ENC encode disable");
-		igt_info("VCN Tests ENC destroy disable");
-	}
-
-	if (context->vcn_ip_version_major == 1) {
-		context->vcn_reg_index = 0;
-	} else if (context->vcn_ip_version_major == 2 && context->vcn_ip_version_minor == 0) {
-		context->vcn_reg_index = 1;
-	} else if ((context->vcn_ip_version_major == 2 && context->vcn_ip_version_minor >= 5) ||
-			context->vcn_ip_version_major == 3) {
-		context->vcn_reg_index = 2;
-	}
-
-	return true;
-}
-
-static void
-amdgpu_cs_sq_head(struct vcn_context *v_context, uint32_t *base, int *offset, bool enc)
-{
-	/* signature */
-	*(base + (*offset)++) = 0x00000010;
-	*(base + (*offset)++) = 0x30000002;
-	v_context->ib_checksum = base + (*offset)++;
-	v_context->ib_size_in_dw = base + (*offset)++;
-
-	/* engine info */
-	*(base + (*offset)++) = 0x00000010;
-	*(base + (*offset)++) = 0x30000001;
-	*(base + (*offset)++) = enc ? 2 : 3;
-	*(base + (*offset)++) = 0x00000000;
-}
-
-static void
-amdgpu_cs_sq_ib_tail(struct vcn_context *v_context, uint32_t *end)
-{
-	uint32_t size_in_dw;
-	uint32_t checksum = 0;
-
-	/* if the pointers are invalid, no need to process */
-	if (v_context->ib_checksum == NULL || v_context->ib_size_in_dw == NULL)
-		return;
-
-	size_in_dw = end - v_context->ib_size_in_dw - 1;
-	*v_context->ib_size_in_dw = size_in_dw;
-	*(v_context->ib_size_in_dw + 4) = size_in_dw * sizeof(uint32_t);
-
-	for (int i = 0; i < size_in_dw; i++)
-		checksum += *(v_context->ib_checksum + 2 + i);
-
-	*v_context->ib_checksum = checksum;
-
-	v_context->ib_checksum = NULL;
-	v_context->ib_size_in_dw = NULL;
-}
-
-static void
-vcn_dec_cmd(struct mmd_shared_context *shared_context,
-		struct mmd_context *context, struct vcn_context *v_context,
-		uint64_t addr, unsigned int cmd, int *idx)
-{
-	if (shared_context->vcn_dec_sw_ring == false) {
-		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data0;
-		context->ib_cpu[(*idx)++] = addr;
-		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data1;
-		context->ib_cpu[(*idx)++] = addr >> 32;
-		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].cmd;
-		context->ib_cpu[(*idx)++] = cmd << 1;
-		return;
-	}
-
-	/* Support decode software ring message */
-	if (!(*idx)) {
-		struct rvcn_decode_ib_package *ib_header;
-
-		if (shared_context->vcn_unified_ring)
-			amdgpu_cs_sq_head(v_context, context->ib_cpu, idx, false);
-
-		ib_header = (struct rvcn_decode_ib_package *)&context->ib_cpu[*idx];
-		ib_header->package_size = sizeof(struct rvcn_decode_buffer) +
-			sizeof(struct rvcn_decode_ib_package);
-
-		(*idx)++;
-		ib_header->package_type = (DECODE_IB_PARAM_DECODE_BUFFER);
-		(*idx)++;
-
-		v_context->decode_buffer = (struct rvcn_decode_buffer *)&(context->ib_cpu[*idx]);
-		*idx += sizeof(struct rvcn_decode_buffer) / 4;
-		memset(v_context->decode_buffer, 0, sizeof(struct rvcn_decode_buffer));
-	}
-
-	switch (cmd) {
-	case DECODE_CMD_MSG_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= DECODE_CMDBUF_FLAGS_MSG_BUFFER;
-		v_context->decode_buffer->msg_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->msg_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_DPB_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_DPB_BUFFER);
-		v_context->decode_buffer->dpb_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->dpb_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_DECODING_TARGET_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_DECODING_TARGET_BUFFER);
-		v_context->decode_buffer->target_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->target_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_FEEDBACK_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_FEEDBACK_BUFFER);
-		v_context->decode_buffer->feedback_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->feedback_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_PROB_TBL_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_PROB_TBL_BUFFER);
-		v_context->decode_buffer->prob_tbl_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->prob_tbl_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_SESSION_CONTEXT_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_SESSION_CONTEXT_BUFFER);
-		v_context->decode_buffer->session_contex_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->session_contex_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_BITSTREAM_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_BITSTREAM_BUFFER);
-		v_context->decode_buffer->bitstream_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->bitstream_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_IT_SCALING_TABLE_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_IT_SCALING_BUFFER);
-		v_context->decode_buffer->it_sclr_table_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->it_sclr_table_buffer_address_lo = (addr);
-	break;
-	case DECODE_CMD_CONTEXT_BUFFER:
-		v_context->decode_buffer->valid_buf_flag |= (DECODE_CMDBUF_FLAGS_CONTEXT_BUFFER);
-		v_context->decode_buffer->context_buffer_address_hi = (addr >> 32);
-		v_context->decode_buffer->context_buffer_address_lo = (addr);
-	break;
-	default:
-		igt_info("Not Supported!\n");
-	}
-}
-
 static void
 amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle,
 		struct mmd_shared_context *shared_context,  struct mmd_context *context,
@@ -341,9 +34,11 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle,
 	memcpy(msg_buf.ptr, vcn_dec_create_msg, sizeof(vcn_dec_create_msg));
 
 	len = 0;
-	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr,
+		DECODE_CMD_SESSION_CONTEXT_BUFFER, &len, INVALID_DECODER_NONE);
 	if (shared_context->vcn_dec_sw_ring == true) {
-		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr, 0, &len);
+		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr,
+			DECODE_CMD_MSG_BUFFER, &len, INVALID_DECODER_NONE);
 	} else {
 		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
@@ -381,6 +76,7 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle,
 	int size, len, i, r;
 	unsigned int ip;
 	uint8_t *dec;
+	enum decoder_error_type err_type = INVALID_DECODER_NONE;
 
 	size = 4*1024; /* msg */
 	size += 4*1024; /* fb */
@@ -424,16 +120,23 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle,
 	ctx_addr = ALIGN(dpb_addr + 0x006B9400, 4*1024);
 	dt_addr = ALIGN(dpb_addr + dpb_size, 4*1024);
 
-
 	len = 0;
-	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 0x5, &len);
-	vcn_dec_cmd(shared_context, context, v_context, msg_addr, 0x0, &len);
-	vcn_dec_cmd(shared_context, context, v_context, dpb_addr, 0x1, &len);
-	vcn_dec_cmd(shared_context, context, v_context, dt_addr, 0x2, &len);
-	vcn_dec_cmd(shared_context, context, v_context, fb_addr, 0x3, &len);
-	vcn_dec_cmd(shared_context, context, v_context, bs_addr, 0x100, &len);
-	vcn_dec_cmd(shared_context, context, v_context, it_addr, 0x204, &len);
-	vcn_dec_cmd(shared_context, context, v_context, ctx_addr, 0x206, &len);
+	vcn_dec_cmd(shared_context, context, v_context,
+		v_context->session_ctx_buf.addr, DECODE_CMD_SESSION_CONTEXT_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		msg_addr, DECODE_CMD_MSG_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		dpb_addr, DECODE_CMD_DPB_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		dt_addr, DECODE_CMD_DECODING_TARGET_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		fb_addr, DECODE_CMD_FEEDBACK_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		bs_addr, DECODE_CMD_BITSTREAM_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		it_addr, DECODE_CMD_IT_SCALING_TABLE_BUFFER, &len, err_type);
+	vcn_dec_cmd(shared_context, context, v_context,
+		ctx_addr, DECODE_CMD_CONTEXT_BUFFER, &len, err_type);
 
 	if (shared_context->vcn_dec_sw_ring == false) {
 		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].cntl;
@@ -482,9 +185,11 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 	memcpy(msg_buf.ptr, vcn_dec_destroy_msg, sizeof(vcn_dec_destroy_msg));
 
 	len = 0;
-	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr,
+		DECODE_CMD_SESSION_CONTEXT_BUFFER, &len, INVALID_DECODER_NONE);
 	if (shared_context->vcn_dec_sw_ring == true) {
-		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr, 0, &len);
+		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr,
+			DECODE_CMD_MSG_BUFFER, &len, INVALID_DECODER_NONE);
 	} else {
 		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
-- 
2.34.1

