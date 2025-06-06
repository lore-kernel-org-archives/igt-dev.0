Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61F1C5B552
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 01:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD6E10EACB;
	Fri,  6 Jun 2025 01:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rXD7edS+";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88F10EADE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 01:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7K1eATYMrPmAH2Mno7DI9k6Q7zdB0TGRXuyYirgPop9MMj2DF+LcGtUYcXq3OX+xfGKdz05ob5tLropv7xye7v/2sHKaUJz52kJMunzEh+M7ZmVf/pKn3PQySSukCxwZY+9zjmjTdIMQ93gB17loC+5OISqxTPXSJmVpohlXRWn7AhjOqNSzllSOo/nQ9BSbgpzwnsQa4Nu8X0LwoiG4HXMdsuOSVosGPGctyuAP0c3XegWY0ABWNnP2X49u27cy5NEkgGtq9wuYjXcEGAVvJ9xERpQSU9I6pUH8zLqrID2Eb0+TbaG4G15eOa7YkXkbnHxZq7ceEqm8Och5x/bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WHToypcuA9AEebNJmynAjV6w3+0aT0Qkd0SU4Kxf+I=;
 b=Nv6cOZy3Ss8ns723AwOp8s8cO/JoqpHLnuNj78JIW7ehRfwlWUPToLKt0f5UucIgbVllsw41u3Zry2tcYMgxugnhuCGg6jGMpSpzhAhiIj1H3OVAuBZgRThYDHQMqFGHSeoasgeG/VpHLQrBQqvYZQxzCBkErFcDsQZr4EJU0hy17TIQYemcCcs/vD/U45FUxqWHXoPZjJbZJdBgHJ4oEWiyeH9QA56m3+YA734iXaImYkTZeQTL+/DW0ycOes5O2uELZ3+SRGYR/1fz0gEnRpaQb4c2OoTYdoLvEU16KSz5La3Q0HTfIzriktLcHDt7kxKGceitjIDuuUPJ+SBRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WHToypcuA9AEebNJmynAjV6w3+0aT0Qkd0SU4Kxf+I=;
 b=rXD7edS+DqcrXBmmCbv2lwTadI+3PmXUeHe9uGy1h8r2JZa48Ym+UTptdc4FF25IoFaFlPVLhLJTp+UkI68FyHZoA/PER+B5vKrql0VEISPFpvaWSMND90mM5LhD76AlbTWiAcPrstP50PrAfHo606agnER6yuuR9QNJEtJjnDQ=
Received: from CY5P221CA0082.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::9) by
 MW4PR12MB6681.namprd12.prod.outlook.com (2603:10b6:303:1e1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.37; Fri, 6 Jun 2025 01:20:03 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::fa) by CY5P221CA0082.outlook.office365.com
 (2603:10b6:930:9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Fri,
 6 Jun 2025 01:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 01:20:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:19:58 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 20:19:58 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 2/4] test/amdgpu: to implement vcn/jpeg queue tests
Date: Thu, 5 Jun 2025 21:19:48 -0400
Message-ID: <20250606011950.151078-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606011950.151078-1-vitaly.prosyak@amd.com>
References: <20250606011950.151078-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MW4PR12MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: b83fff4d-d21c-4c55-9bf4-08dda4984347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ybpNOY4W+X/d9jjz5wjTO20DOjtyTkCZPXG6aJnO9RgA2pIOYYKDSE4LMecN?=
 =?us-ascii?Q?F1SSQtEkMEJUYpCNsl37CsARfTPHgzcf8gSjS//YDtYUFIOP4KDMkr9tgrtF?=
 =?us-ascii?Q?hFkhWoyO0Zn7NVp68k2ilU2SppWMqkyrMDG0FGl7LT1LtmiLaeG2lWdNm5Bj?=
 =?us-ascii?Q?ubM4a2L2xuac6GkM0OEGOY7VM6oJAvkikcFdaVzFccmxjphueX6t3IUnihGr?=
 =?us-ascii?Q?6Bx5LUjAwzv6vN1a1pqo8KWg6FZA+h0kPKyYj74l1OFJTo5hv2gtYt5IeFTg?=
 =?us-ascii?Q?TDo1kzJBYgNwynL8EfXBS2NW+sSO8jA6R95N42dXe/5z4dwi4lUYbds0fr2G?=
 =?us-ascii?Q?CfcE1pzHB2/OrGHHaMP8IWKHW6cDzICEhOmFyvCGsYbTAoH1+OlbGNheX2lo?=
 =?us-ascii?Q?8GTWKb0vKBI0VJMGgD8mk+OXmctreysKXAxiDQjfCVGNLgWGw8l3/tSwRSLm?=
 =?us-ascii?Q?mV2BooUHi73RxsdaEIXLKBvDokzJVK/YrUIQ9TbLoyzG+FFBQCnjA8Smbl1Z?=
 =?us-ascii?Q?itZfOFWAvZJVnVcifJMlCq3HekVqkHTpl79eFuYzEJRH5oqSq8DNjNl56sgG?=
 =?us-ascii?Q?2f8E0GYBu+F+dY8iLRLpGCrmtIGFjFwxvpAbls9FS7sCxlJfjp1R5KDKkHlc?=
 =?us-ascii?Q?mGJqK3UJIqYtjxGWDruh4wnVCAeh2Rum20YHmi3jxbnwWNj4jRSx+RBRb09O?=
 =?us-ascii?Q?4Hn1kiTF3Y5FCSiVIHT0JMubWMRfG1rValeMgHXQ1jugPJLKxC/jdv54gC9U?=
 =?us-ascii?Q?+ta8+7OhFSa7jxDUwz8cry2E4CjRIkI+OC3eeHt4hrmZ8CK+iBQUan0UoCOb?=
 =?us-ascii?Q?/PedougQYs1luG8yl9ixyywa+bNcrggnGhuozpCxldpgzOpw+RYnHVD9VKhm?=
 =?us-ascii?Q?KAiYrVA4n9BQxXCNuItqsUqORvxzHn21Me+PRwoX3xXRLDye+u8iCJeQ4Cgk?=
 =?us-ascii?Q?zhT3v/cPIkC5+VGr+Uw4dXDrw7qX/5SdqUzmhBYmSlmViucaI7inzB8eYBi9?=
 =?us-ascii?Q?k6kwkNqV24mCVo2xcVdHRVIwf4y5tcAt2Cp2uIsoBpJ9vpKdOtcm/sq4jAvZ?=
 =?us-ascii?Q?IDZFaR1O06teFZKUo0KSPWouTiodlV6o9XmPbSajaY6YvFUiqM376UsOcyEh?=
 =?us-ascii?Q?CHVeoujVqrTdGcNhOlT3kMB5TJC8dGKXj1JBguBuWgDBSXc07m8muXSCTP3P?=
 =?us-ascii?Q?VWHLuhDA1bV2RxDcxZzFXuFpz3rfavGrIpzqDPuKno6iQP05im6vtW2ZAnst?=
 =?us-ascii?Q?+ryKozjDf0CNTHOnvWGnYIWr7Iv0FdxFuWzjQsY5EXvpCNaCsYPG1PHz8AsD?=
 =?us-ascii?Q?UTL/SKn5nydjKFcFtvL+jtCNN4V0G95jcBZSHCoqardEnpERnrwyEKXrWVl/?=
 =?us-ascii?Q?y1k+PAu6/GUxjwWMjFM6tZQJaf49T5NhPaiCs3lC30L531aGA6pRkmnSXs3k?=
 =?us-ascii?Q?mUFL+6cFcH+vnI1M5zyOURRd7DLtunnpmFoVeKeShfiHdeCyHLuWjL0qek0H?=
 =?us-ascii?Q?yZtCZIuL0z+HHfHtcfHOfAtHUb5fyCsS5AKN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:20:02.6216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b83fff4d-d21c-4c55-9bf4-08dda4984347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6681
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

