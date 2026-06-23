Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F65CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FC510EC3A;
	Tue, 23 Jun 2026 18:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FRJ7AMQN";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404AF10EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mitiHZbC/5sV7TcrISkj/OVulmFhl1hjzwwOwo1P8btQqOYje/ed7IuC3uinlBd1APRQqFfZ3qlSbeKW0zMaQAc/H2AnlWPvyfI/19VKYKN4wVetWcRLWKCsJnmeUEC5Ehhe4wEsqEdbqVyUP/a9IANwbQErNTFI6pCaRAUPF+Oa0atOhTt4w4Vdv0xmdYMKKb/kH1MRwCrYyl3Ajm5vpvWRTcw+SNkxJPdfwERkWRpPkyWL1KDUmJ4hf56CN5UHqnSefeDu5atde5nyxHXVHwMitFZwyY6T0dEWUjQJaT8/qiVieB2oPFV7CLgDl5y9gSaHDx7ycUsotwX18wIRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyvbrLxlW8ptc1K95+V5l9cURgjZeJVoqMfulpqMdDA=;
 b=rf4FPUkglR8dR7Ot/elnD4QG0wCztyga1JKbfZSe4nRXkJv8v3HLPgLZjrMmRlgcLf1/94M59M8W1PpB+8u31WU44UwRhp5q8ARH+DZ2kAuOWKPCElQnOgZ8N5p5H/RtTOSxVN9yx8l+G/wSTmHfwk5o4/mjorjrO0b+61GZe3cOQzdSwyHK9aNo9I4WOvmUw3vCkXt+ZR5PpwRCU2Ka2UEWg2SwkmDUcxXYJ0TxBK6oOrpFzH1ReL7AWo/Thwv8D5vibLEBBJRE3V50pfvvuHF9ONgfkW0rhdH+l+5Ho9WLI3luUYKKjHGlJVI+n0fOCbruLau2K7paufqco8/Svw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyvbrLxlW8ptc1K95+V5l9cURgjZeJVoqMfulpqMdDA=;
 b=FRJ7AMQNVbkCT/p7u/RmaDCFIvCHzYGyDdY3RmyxMpl77jvqlWmIMQw/i1Y7yGtqZyu8lsjkCJu0wmMuJTRFJ/HSv798OxWuhb+hdnONu3WoDyXpOr1EmrzzwAmxmm7Y+OqW5JUSXPm0O4Wc8BKot3PDevvG/E1C9V/ruGgNUww=
Received: from BN9PR03CA0619.namprd03.prod.outlook.com (2603:10b6:408:106::24)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 17:57:52 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::59) by BN9PR03CA0619.outlook.office365.com
 (2603:10b6:408:106::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 17:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:50 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 09/12] tests/kms_colorop: Add FIXED_MATRIX colorop tests
Date: Tue, 23 Jun 2026 13:57:34 -0400
Message-ID: <20260623175737.171142-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: b43f67ab-a41a-4757-4a38-08ded150f20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|3023799007|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: teWNmQi9sctYjy+RAa5jFxsdK8chUTMQ2TVUQpJPJ9BRneklQITThbY/bjpnKW9+ZxrCT/lEQt/+M637mYJGOkbOK+LYzvAjQ6svV0LCZmfCfaeEdSlTZWZGvjIzQSM5blAqmU33fYMoGZBbgN6XIUTUo9nQtBCgwRd5d3KEDlZruTj9Fggq9/98ihcNePOcmi13F0qhiyFAcVeMHh1TuR5RzL4spTOC6QuR/KT7xM+xOKL7dgmAkZBflWJjGHtA+6F8iKg8HoxEJDfRxiBEo2zf9KdwBMXPWIvDMTzAstwvF0jP78pTCrCRSzkAliwisnGMxfgiCv3GO1/gvRpnD8f1d1jvvC0m+0K0+rGN8lD0OYFL+9Z4tKtjWLXjsKRzleXTFrwe8UyZGaS4OKlMdan4mH2HYkhPMlSs37CoT2XGP6u+qD16QoOq6iAObLIopyNN8vmXTS6D+2Scmu7Zpv93Xnz+uKOoGBuM8UaLhHYB/Lz0t99qaKEgwmciavYGKuvIztY8s9YYFSG0T0MMo/BmO/Pm2XU4tsEOEKEbRBnmTGrVcbYp3JDQ5WTIK853wc1hjSiurV6KHTpCdVji5FPjZaZRa0qoG0kjwQB6wOlzhPtHG6FgYsNdqYdOUyq0O0qLMveOJ3kSibeQJOVlJwOISrZxpUdcuuVG5uoaY2YhJPEz/AZkc6SwWTHGnK5U9+KAxjvzBURV1CUaFsKsow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NtB7bLnt95Zp16BDftr7rdCVO1+7QtNLuEX8GjN1qjrZEFK7gBUMaLzjX8hIPIU14R3OFU5xKLbj1B+124uRZxPDPbIJcNuR91GxMPUIQpJYstPuP+dSqjsOFAtdNEo60bIPw/lKrsBSHkmOCBSqDMSzPrdhXsRyzztPrskPKHI5xPkaga4QrRPy3GxJo8v+/6RkfbJCZfc7ylyWyLaiXsMBPw7X8KhyvhziQC2Ou8CP5Qz4hgh+ArYQp69Ykh3ZCcYvgsFitNZLGjgWkMhfaIzsRzIIvnyNNvbC0JriGZt8gntrIKCCCbMwdLN2hIc7Uu112e2kknisauSM62hC7b+bM6Y+I5az11Ea4A+/Ph7/6tqrTXL7r693RaslK1/gIZN4aqcr/vhQGSN4OXctQ8Hv8rjSn0F/RhvW0V134Lu8ft2dWMHVX5WDwz12xM41
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:52.1171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b43f67ab-a41a-4757-4a38-08ded150f20b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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

Add comprehensive test coverage for FIXED_MATRIX colorops for CSC:

Test cases:
- NV12 (8-bit YUV 4:2:0) CSC tests
- P010 (10-bit YUV 4:2:0) CSC tests
- BT.709, BT.601, and BT.2020 encoding tests
- Limited and full range tests
- CSC combined with additional colorops (sRGB EOTF, 3D LUT, CTM)
- Organized into separate RGB and YUV test groups

The tests verify that FIXED_MATRIX colorops correctly convert YUV input to
RGB output by comparing hardware CSC results with software reference
transformations using the igt_color_encoding matrix library.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 256 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 205 insertions(+), 51 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 5cf1f688832f..1d30d2538574 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -20,50 +20,95 @@
  * SUBTEST: check_plane_colorop_ids
  * Description: Verify that all igt_colorop_t IDs are unique across planes
  *
- * SUBTEST: plane-%s-%s
- * Description: Tests DRM colorop properties on a plane
+ * SUBTEST: plane-XR24-XR24-bypass
+ * SUBTEST: plane-XR24-XR24-srgb_eotf
+ * SUBTEST: plane-XR24-XR24-srgb_inv_eotf
+ * SUBTEST: plane-XR24-XR24-srgb_eotf-srgb_inv_eotf
+ * SUBTEST: plane-XR24-XR24-srgb_eotf-srgb_inv_eotf-srgb_eotf
+ * SUBTEST: plane-XR24-XR24-srgb_inv_eotf_lut
+ * SUBTEST: plane-XR24-XR24-srgb_inv_eotf_lut-srgb_eotf_lut
+ * SUBTEST: plane-XR24-XR24-bt2020_inv_oetf
+ * SUBTEST: plane-XR24-XR24-bt2020_oetf
+ * SUBTEST: plane-XR24-XR24-bt2020_inv_oetf-bt2020_oetf
+ * SUBTEST: plane-XR24-XR24-pq_eotf
+ * SUBTEST: plane-XR24-XR24-pq_inv_eotf
+ * SUBTEST: plane-XR24-XR24-pq_eotf-pq_inv_eotf
+ * SUBTEST: plane-XR24-XR24-pq_125_eotf
+ * SUBTEST: plane-XR24-XR24-pq_125_inv_eotf
+ * SUBTEST: plane-XR24-XR24-pq_125_eotf-pq_125_inv_eotf
+ * SUBTEST: plane-XR24-XR24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
+ * SUBTEST: plane-XR24-XR24-gamma_2_2
+ * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv
+ * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv-gamma_2_2
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_50_desat
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_overdrive
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_oversaturate
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_enc
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_dec
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_enc_dec
+ * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_dec_enc
+ * SUBTEST: plane-XR24-XR24-multiply_125
+ * SUBTEST: plane-XR24-XR24-multiply_inv_125
+ * SUBTEST: plane-XR24-XR24-3dlut_17_12_rgb
+ * SUBTEST: plane-XR30-XR30-bypass
+ * SUBTEST: plane-XR30-XR30-srgb_eotf
+ * SUBTEST: plane-XR30-XR30-srgb_inv_eotf
+ * SUBTEST: plane-XR30-XR30-srgb_eotf-srgb_inv_eotf
+ * SUBTEST: plane-XR30-XR30-srgb_eotf-srgb_inv_eotf-srgb_eotf
+ * SUBTEST: plane-XR30-XR30-srgb_inv_eotf_lut
+ * SUBTEST: plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut
+ * SUBTEST: plane-XR30-XR30-bt2020_inv_oetf
+ * SUBTEST: plane-XR30-XR30-bt2020_oetf
+ * SUBTEST: plane-XR30-XR30-bt2020_inv_oetf-bt2020_oetf
+ * SUBTEST: plane-XR30-XR30-pq_eotf
+ * SUBTEST: plane-XR30-XR30-pq_inv_eotf
+ * SUBTEST: plane-XR30-XR30-pq_eotf-pq_inv_eotf
+ * SUBTEST: plane-XR30-XR30-pq_125_eotf
+ * SUBTEST: plane-XR30-XR30-pq_125_inv_eotf
+ * SUBTEST: plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf
+ * SUBTEST: plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
+ * SUBTEST: plane-XR30-XR30-gamma_2_2
+ * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv
+ * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv-gamma_2_2
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_50_desat
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_overdrive
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_oversaturate
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_enc
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_dec
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_enc_dec
+ * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_dec_enc
+ * SUBTEST: plane-XR30-XR30-multiply_125
+ * SUBTEST: plane-XR30-XR30-multiply_inv_125
+ * SUBTEST: plane-XR30-XR30-3dlut_17_12_rgb
+ * Description: Tests DRM colorop properties on RGB formats
  * Driver requirement: amdgpu
  * Functionality: kms_core
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * arg[1]:
- *
- * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
- *
- * arg[2]:
- *
- * @bypass:				Bypass Color Pipeline
- * @srgb_eotf:				sRGB EOTF
- * @srgb_inv_eotf:			sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
- * @srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
- * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
- * @bt2020_inv_oetf:			BT.2020 Inverse OETF
- * @bt2020_oetf:			BT.2020 OETF
- * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
- * @pq_eotf:				PQ EOTF
- * @pq_inv_eotf:			PQ Inverse EOTF
- * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
- * @pq_125_eotf:			PQ EOTF for [0.0, 125.0] optical range
- * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
- * @gamma_2_2:				Gamma 2.2
- * @gamma_2_2-gamma_2_2_inv:		Gamma 2.2 -> Gamma 2.2 Inverse
- * @gamma_2_2-gamma_2_2_inv-gamma_2_2:	Gamma 2.2 -> Gamma 2.2 Inverse -> Gamma 2.2
- * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
- * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
- * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
- * @ctm_3x4_bt709_enc:			BT709 encoding matrix
- * @ctm_3x4_bt709_dec:			BT709 decoding matrix
- * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
- * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
- * @multiply_125:			Multiplier by 125
- * @multiply_inv_125:			Multiplier by inverse of 125
- * @3dlut_17_12_rgb:			3D LUT with length 17, color depth 12, and traversal order = RGB
+ * SUBTEST: plane-NV12-XR24-fm_bt709_limited
+ * SUBTEST: plane-NV12-XR24-fm_bt709_full
+ * SUBTEST: plane-NV12-XR24-fm_bt601_limited
+ * SUBTEST: plane-NV12-XR24-fm_bt2020_limited
+ * SUBTEST: plane-NV12-XR24-fm_bt709_limited-srgb_eotf
+ * SUBTEST: plane-NV12-XR24-fm_bt601_limited-srgb_eotf
+ * SUBTEST: plane-NV12-XR24-fm_bt709_limited-3dlut_17_12_rgb
+ * SUBTEST: plane-NV12-XR24-fm_bt709_limited-ctm_3x4_50_desat
+ * SUBTEST: plane-NV12-XR24-fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat
+ * SUBTEST: plane-P010-XR30-fm_bt709_limited
+ * SUBTEST: plane-P010-XR30-fm_bt709_full
+ * SUBTEST: plane-P010-XR30-fm_bt601_limited
+ * SUBTEST: plane-P010-XR30-fm_bt2020_limited
+ * SUBTEST: plane-P010-XR30-fm_bt709_limited-srgb_eotf
+ * SUBTEST: plane-P010-XR30-fm_bt601_limited-srgb_eotf
+ * SUBTEST: plane-P010-XR30-fm_bt709_limited-3dlut_17_12_rgb
+ * SUBTEST: plane-P010-XR30-fm_bt709_limited-ctm_3x4_50_desat
+ * SUBTEST: plane-P010-XR30-fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat
+ * Description: Tests DRM colorop properties on YUV formats
+ * Driver requirement: amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  *
  */
 
@@ -371,10 +416,11 @@ static const struct option long_options[] = {
 int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 {
 
+	/* RGB tests - for RGB input formats only */
 	struct {
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
-	} tests[] = {
+	} tests_rgb[] = {
 		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
@@ -407,15 +453,42 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
 	};
 
+	/* YUV tests - CSC FF colorop with various encoding/range combinations and optional additional colorops */
+	struct {
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		const char *name;
+	} tests_yuv[] = {
+		/* CSC only tests */
+		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, NULL }, "fm_bt709_limited" },
+		{ { &kms_colorop_bt709_full_ycbcr_to_rgb, NULL }, "fm_bt709_full" },
+		{ { &kms_colorop_bt601_limited_ycbcr_to_rgb, NULL }, "fm_bt601_limited" },
+		{ { &kms_colorop_bt2020_limited_ycbcr_to_rgb, NULL }, "fm_bt2020_limited" },
+		/* CSC + additional colorops */
+		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, NULL }, "fm_bt709_limited-srgb_eotf" },
+		{ { &kms_colorop_bt601_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, NULL }, "fm_bt601_limited-srgb_eotf" },
+		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_3dlut_17_12_rgb, NULL }, "fm_bt709_limited-3dlut_17_12_rgb" },
+		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-ctm_3x4_50_desat" },
+		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
+	};
+
 	struct {
 		__u32 fourcc_in;
 		__u32 fourcc_out;
 		const char *name;
-	} formats[] = {
+	} formats_rgb[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
 		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
+	struct {
+		__u32 fourcc_in;
+		__u32 fourcc_out;
+		const char *name;
+	} formats_yuv[] = {
+		{ DRM_FORMAT_NV12, DRM_FORMAT_XRGB8888, "NV12-XR24" },
+		{ DRM_FORMAT_P010, DRM_FORMAT_XRGB2101010, "P010-XR30" },
+	};
+
 	igt_display_t display;
 	int i, j, ret;
 
@@ -442,7 +515,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		check_plane_colorop_ids(&display);
 	}
 
-	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+	/* RGB format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
 		igt_fb_t input_fb, output_fb;
@@ -452,8 +526,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_subtest_group() {
 			igt_fixture() {
 				output = kms_writeback_get_output(&display,
-								  formats[j].fourcc_in,
-								  formats[j].fourcc_out);
+								  formats_rgb[j].fourcc_in,
+								  formats_rgb[j].fourcc_out);
 				igt_require(output);
 
 				if (output->use_override_mode)
@@ -468,7 +542,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
-								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
 								0.2, 0.2, 0.2, &input_fb);
 				igt_assert(fb_id >= 0);
 				igt_plane_set_fb(plane, &input_fb);
@@ -478,23 +552,24 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 				/* create output fb */
 				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats[j].fourcc_in,
+							formats_rgb[j].fourcc_out,
 							igt_fb_mod_to_tiling(0),
 							&output_fb);
 				igt_require(fb_id > 0);
 			}
 
-			for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			/* Run RGB tests */
+			for (i = 0; i < ARRAY_SIZE(tests_rgb); i++) {
 				igt_describe("Check color ops on a plane");
-				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name)
 					colorop_plane_test(&display,
 							output,
 							plane,
 							&input_fb,
 							&output_fb,
-							formats[j].fourcc_in,
-							formats[j].fourcc_out,
-							tests[i].colorops);
+							formats_rgb[j].fourcc_in,
+							formats_rgb[j].fourcc_out,
+							tests_rgb[i].colorops);
 			}
 
 			igt_fixture() {
@@ -506,6 +581,85 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	/* YUV format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group() {
+			igt_fixture() {
+				output = kms_writeback_get_output(&display,
+								  formats_yuv[j].fourcc_in,
+								  formats_yuv[j].fourcc_out);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				/* create output fb */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats_yuv[j].fourcc_out,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			/* Run YUV tests - create input_fb per test with correct encoding/range */
+			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
+				igt_describe("Check YUV CSC colorop");
+				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
+					igt_fb_t input_fb;
+					enum igt_color_encoding encoding;
+					enum igt_color_range range;
+
+					/* Extract encoding and range from first colorop (must be CSC FF) */
+					igt_assert(tests_yuv[i].colorops[0]);
+					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_FIXED_MATRIX);
+					fixed_matrix_type_to_encoding_range(
+						tests_yuv[i].colorops[0]->fixed_matrix_info.fixed_matrix_type_name,
+						&encoding, &range);
+
+					/* Create input fb with matching encoding/range */
+					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
+									mode.hdisplay, mode.vdisplay,
+									formats_yuv[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+									encoding, range,
+									0.2, 0.2, 0.2, &input_fb);
+					igt_assert(fb_id >= 0);
+
+					if (data.dump_check)
+						igt_dump_fb(&display, &input_fb, ".", "input");
+
+					colorop_plane_test(&display,
+							output,
+							plane,
+							&input_fb,
+							&output_fb,
+							formats_yuv[j].fourcc_in,
+							formats_yuv[j].fourcc_out,
+							tests_yuv[i].colorops);
+
+					igt_remove_fb(display.drm_fd, &input_fb);
+				}
+			}
+
+			igt_fixture() {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
+		}
+	}
+
 	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
-- 
2.54.0

