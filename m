Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BF0C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8159D10F382;
	Fri, 31 Jul 2026 18:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lYWYeBDD";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFDB10F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBapv7lTMcFKiAWaKtVHd6xLmkJRlYDgvLCvlhvbt6abhCG0HufqBZUbI7M2Vum3vKa2CD8nNYGsvXwTNSNPVGeNMw6SYqNpu4uOg+ZFk+/AvFds+fhsW284uRr+OW4mmloHj9NaUgzTr8yIrUubZC0Zcqrox1gf6jz0SOqePC07C7AN8gdjyGDQtcY4jugCv3nl7o7mr5D4QSvPtT979I4kx6t1n+wFcZvnFfiqhvymUOW/e6AYSuhbPAYLAx1LubFDBDUXAOL1ECOfFoP4H6I4JEZhyTBaX9nkkwT4AWcOkRB5Nx0Jr0Rh2uG6sxRVu849si4Rtp9hisdvRowVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcTe82t4Bl7WwblmuN5vPWk9izRUd37+UrJJiNQ2gj0=;
 b=M3HnNA6BN5aSX0Lti7+MiCEUOU+noZR+B+yaTlHHAPvfIlE4JnP6OsfHyaMBeiLWfXEhuUd8wAEEyHiEhYKuIJaCd9EiX0D2AIN9+P5cPdh+nwL7cnh6oDJjEO5GLrpWAiWg7Skny+OGaU38t4NUcUs0LvEKxPEUIjDJyP4sGKsAwYewDP4ZG2vLLd31zAUUF5wopCQb7Z23TUHDzMllXdUMopw6EPLPG430Ax1WJ+4hNVPiG5Nw/Cef2UQu6sCNYvZcQGhaz3g9dmkaetTGLdleAusfEG3sRRfwPT9gL+k9ZfWg12co2aM2CI9ccB7dMdpWl66VWJJdnwPyUGDW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcTe82t4Bl7WwblmuN5vPWk9izRUd37+UrJJiNQ2gj0=;
 b=lYWYeBDDi3ZjzAgcPim+sdZerOsqHltr2ewMyBeU1EvN08Sqenr4QWAFDD06pNjkv54N8kz3Whj/qL7Wfgzrf2M9nl2X9k27OZPCyO1snacyOPr3RwVu55A2kFESn635oxMbWtnLfEdN5ROv0PGKMfZOaM928tXPRiA0ETYBB4Q=
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::612) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:15 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::6e) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 18:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:13 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:13 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 08/10] tests/kms_colorop: Add FIXED_MATRIX colorop tests
Date: Fri, 31 Jul 2026 14:01:58 -0400
Message-ID: <20260731180200.668795-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ffd853-8757-4b7e-7b36-08deef2dda45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|11063799006|56012099006|3023799007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 2xsV3/VwbDs7cti3LxiNMIy6UD77uW97LGMb+X0YAZVHulISDyzJndXsZVpI+zVJcMjoxO9byarLf9QILryXRXfRu3i1FO8kyy+2qBlWZdqp6h6Pq9QLSN5brvm6T8hKAGNdzls6yGx0YRjfchbYso3nUx1ijVYBR/o1hhP4AJTPfelneZwYQLPbWrr9JXopxNr36jhyAQ68Z0YJuszRQoanGBI0x0QxSzd7WhrcJeB/6/k0TVxmUiDHsNxOxMZJsf0wGnmmkxCV2jj1pBEy+Y2nNLsRFTtAdha2OI/dmIeJToq0QYB0aGkkYzqg+h8nnOP2zPxG4uK1hw2abneVDbWBw1zg/Ig5q6WaCy4iPbSi2+M8Vo3pkRykN4vamZTWiAtKvNeqCOX1SFxhDzcSKZR3BrxRCKEWingi+LXGO6Y8zP0qDp2iFgCwfvNf3nsB/nj7pK9RKGfge6wOs0/XVu4Xzb3SFw9L073kUd7vGdCMVwtRTvZmgi/gkexPubuu6JlxakD0ws7kpPafq32/9kGgih/mksWg+de4dn1Z5dYcT7MiIAJ/ZV+EQnRScdaAWcQqyYLNHmQM5BGrrJDO4gIZW1RwZI/mgKf2YP55iyF63l33gPbJfe4LAiIKFqI1eXzfr8qC1X2sdzeYvUHcDgw5ua50gCMzCCHmeYzZO0uV2ZJ3NPwhD5V/au4K3o4+XwffGl5aY/O5H03aOjmDvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bHofCxcBrPKw0aZsqFsQUwUvN2HRU+xPjs6/ZuHxo4VV6WXDSRikJEjCA4C2dG9ICrqoVbYodIWaD3nKmTrnvKMoPH+GhBoRp94VCYR5V5iz/ExqZAaX+XOBa5Z8cAcFOaXs1dHXYifjokLoCooJRpd/Rc3TG3CJ4gjiDkISx7cmoGwPginADzVEsmZBD0slvnMjJcisdqwWi2Ivoft4lFifo03NKO989vyWSDT+TV40QHcBM5H2Hh7gW/4hydaD7doLd4K9Rm/3mys459mV7kMbm7Er2LEkG/TiXdosKepmPchReRdn/pLk88YlflhNGs4yhiaIdszn9GlOH8TDnwpQ4irAj9PjTKGfq/P12KoYDQ3/bVqiv2zLU0BNeO0VEFElMdDFtk+loQMV7QJ86xkdf2Ldf7K6Wbg8QQbpswJE09MKzeEUPDd668OsMADX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:14.6402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ffd853-8757-4b7e-7b36-08deef2dda45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C
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
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 269 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 218 insertions(+), 51 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index bdfe312b8124..8055a36bab74 100644
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
 
@@ -363,10 +408,11 @@ static const struct option long_options[] = {
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
@@ -399,15 +445,42 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
 
@@ -438,7 +511,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		check_plane_colorop_ids(&display);
 	}
 
-	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+	/* RGB format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
 		igt_fb_t input_fb, output_fb;
@@ -448,8 +522,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_subtest_group() {
 			igt_fixture() {
 				output = kms_writeback_get_output(&display,
-								  formats[j].fourcc_in,
-								  formats[j].fourcc_out);
+								  formats_rgb[j].fourcc_in,
+								  formats_rgb[j].fourcc_out);
 				igt_require(output);
 
 				if (output->use_override_mode)
@@ -464,7 +538,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
-								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
 								0.2, 0.2, 0.2, &input_fb);
 				igt_assert(fb_id >= 0);
 				igt_plane_set_fb(plane, &input_fb);
@@ -474,23 +548,24 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
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
@@ -502,6 +577,98 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	/* YUV format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t temp_fb, output_fb;
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
+				/* Create temp fb to keep plane active between tests */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats_yuv[j].fourcc_in,
+							igt_fb_mod_to_tiling(0),
+							&temp_fb);
+				igt_require(fb_id > 0);
+
+				/* Create output fb shared across tests */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats_yuv[j].fourcc_out,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			/* Run YUV tests - create input_fb per test */
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
+
+					encoding = tests_yuv[i].colorops[0]->fixed_matrix_info.encoding;
+					range = tests_yuv[i].colorops[0]->fixed_matrix_info.range;
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
+					/* Switch plane back to temp_fb to keep CRTC active */
+					igt_plane_set_fb(plane, &temp_fb);
+					igt_display_commit_atomic(&display,
+								DRM_MODE_ATOMIC_ALLOW_MODESET,
+								NULL);
+
+					igt_remove_fb(display.drm_fd, &input_fb);
+				}
+			}
+
+			igt_fixture() {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &temp_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
+	}
+
 	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
-- 
2.55.0

