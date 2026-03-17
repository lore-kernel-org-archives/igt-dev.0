Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE53FED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6C10E5A0;
	Tue, 17 Mar 2026 16:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nJzT/XO2";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012057.outbound.protection.outlook.com
 [40.107.200.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A07E10E6EB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUpMzmaRl1Ke6sr/RzRwCVeEIWtdH7f7/avAY4ehZ/cKchHCfoIyKH7d8Qog4sRJ94xeJw+8f1L92TsaKxezYrTG9sPEOsRPVK+vm+Pzls9/xMTt6Mr+P4aDKEe1A2o6p+894+WqLl4Wjizn8ajFV65EpaYI/v7ebKshH+Qd5WAEjhcnkE4rB293qVQjkv+kxJNBC0PvOpXoZSMERyfudd7GdWGq/apbrgNrcoLdXtENL1049K3gH/i4tAZ7Ymj0emY3bV72FgbuOMRc043U+EqhA7CiBe8jJubloKy+I0WIWMJyihlkQj9ZzRhcdnLSpxWrajraWBhkd+sM79i/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJH2VdLMwXihJaLR9Da+iPo/vUePVx8rmJMKGHZp0BY=;
 b=Oh+0Z2sPwfaoEtRJqaYXitv5dIRFzmVhfp8yObDoZ5bfYgsphgkreiE8s5G23fgyh5Ttf8R9Ov8r9bR6NZFkzXBmo/K8mi3rTscWQAlyqzE3PbzGE6vVgbQGcICRFXVY6H+1tkDTL7QhPfPPrtAt1EUTx4hg516683uhkyVRF0xDRItAEjl1FPXkckdzHslQZTa0/YyhdIMY1Pf7pBZq8uCR7mRAvoUqDeh1zpe48/r1IG2r4MdMVW8ZUKEoLWw8qOd6blXI0A8XhbwQAhREufKnEs0qnv9HH1Fr/ZmqFPHjDEmKJsJoQHXZ8xmH81wvhk+wlFi4U5QORJrgWzHGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJH2VdLMwXihJaLR9Da+iPo/vUePVx8rmJMKGHZp0BY=;
 b=nJzT/XO2vaHiAbLhMNVjSuJU/EXHv1h/xwqItEDB1SHXMVSi1Av51RIDWXI1WMDnCcSKWwjPNt06jb1HRwJvicN/q5wn2SaCUox1xETO9DL360FmeosPClqIXd9jkWAbIPdic7y35w6ZZhNiJ6x5Q/dw8C50Tayj4l1QInGtfpA=
Received: from MW4PR04CA0321.namprd04.prod.outlook.com (2603:10b6:303:82::26)
 by CY8PR12MB8313.namprd12.prod.outlook.com (2603:10b6:930:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 16:05:12 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::c0) by MW4PR04CA0321.outlook.office365.com
 (2603:10b6:303:82::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:05:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Mar
 2026 11:04:50 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:49 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 07/10] tests/kms_colorop: Add CSC colorop tests
Date: Tue, 17 Mar 2026 12:04:33 -0400
Message-ID: <20260317160443.229812-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CY8PR12MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: fdfcce2e-2b3e-4ee3-bd7a-08de843ef85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: W/KLWOawo+sAnpC1VR48K6EvuBEPOuz1hWsyAQHIX+ZrJSAk3FOAyjzIgEd47qyftR+uggu3L8ktd/yApDunnOA0SB4IKtCwnAlWJp0a/t29VpppVRoJqdc8CdVjLoHUKSsIA7EJtVUjQNroUGF49WmnIsTnmUHuS5e2NtsknWEBCGWgnyJx8mB6hH0AHfE2+91Gy2SucqLeu4fB8i23hjrU7pj3+Ko75QrxERbGl+iMlUnucB4vn8/I9WqsiyAiRyIpjEX3lsZPV28RyxQLgcau6Yz7w3eXjA3JiKdROegZprxDYxR0xLjHlquSej9lA7tmS9F4ZvA7epiEnEOA1oObvvX+L8j49a1nGs+ExDr7ioVVeCbPEJaZOIAx8TJeO/+ZyJ91gR22ekM6SKwLwHXbEYi+5+i8iUvaV1wbVoIEBpe19jZMUfyAbnWX6Gc9rWjNROcaKy/epmEYrDWeijntJ9WXW6WLZS2aDRorkzNVshqiDTk0Oc2ecrL7nREQIBrYD3tsAFt8QKPo2c7RdYYBRSlKzANYZGJvzqb2wF6rnjPQxVqLA7QuB8p3KzdGa12HeR1Pc0zPj9P7yaG4OPud6cOYi+MCGirZKCErpz0AimG4sYgm2M0SALJWbtVgxL02x9nP9viCuLR5fdkbt3B+UYZABM2hHQAi0VDMHBcsHOuqN3wa3+V9pOMDeY2ouEXjvbQgcZf2pZ2nm+dj8MRy8kjLOa9baK1s56DHoUhaKW0CmdjmA3LlFuP610XGKXF5UaoK6sFhERaIBuNZBQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iRbqiaHo8ERrWNOq255wzT6mf8fOk8eYKKg/ewqdcS4E3ToFulLEQpHh1D/hNnBeyP2uLzryZv1cHedqg1PtLHFRagwTGx1vbn8hbJ9Zi1rPDmFURBibUJgVJm5myP4DuilB5Ekait08qeujHSIx59m/wKCHXWbnW9cSZHhkATph7JIa7GAMfUQ9nTUPgplbrRWbh4k8X3SeFJ0ZNUIK82k9qcFW7MVPPloZiP1BNWX5HjL8EUMMkfBQuA3kEGn3B03p34x7W/B0SoIqNAjfrg2IXY3zIQS/NfkJKrCgu3f3HAYkP+I9vh4braVGEjw22n53vADsstHwgeWW7VRpTNnHDR2rY64HVr45kjoQpE5fjMVbEZNwvooYNGHyYzDcNxNeiFvPQTwJqvc3mO3shyYm4SgQMnZ9MCwfOEmwy7OymHsOD5LGkoS0tiOtnwei
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:05:12.1356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfcce2e-2b3e-4ee3-bd7a-08de843ef85a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8313
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

Add comprehensive test coverage for CSC (Color Space Conversion) colorops:

Test infrastructure:
- CSC colorop definitions for various encoding/range combinations
- Support for BT.601, BT.709, and BT.2020 color standards
- Limited and full range YUV testing

Test cases:
- NV12 (8-bit YUV 4:2:0) CSC tests
- P010 (10-bit YUV 4:2:0) CSC tests
- BT.709, BT.601, and BT.2020 encoding tests
- Limited and full range tests
- Organized into separate RGB and YUV test groups

The tests verify that CSC colorops correctly convert YUV input to RGB
output by comparing hardware CSC results with software reference
transformations. Tests automatically extract encoding and range
properties from the CSC colorop when available.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c        | 274 ++++++++++++++++++++++++++++---------
 tests/kms_colorop_helper.c |  40 ++++++
 tests/kms_colorop_helper.h |   4 +
 3 files changed, 256 insertions(+), 62 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c11c0c251369..928a414236e6 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -20,51 +20,95 @@
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
- *
+ * SUBTEST: plane-NV12-XR24-csc_bt709_limited
+ * SUBTEST: plane-NV12-XR24-csc_bt709_full
+ * SUBTEST: plane-NV12-XR24-csc_bt601_limited
+ * SUBTEST: plane-NV12-XR24-csc_bt2020_limited
+ * SUBTEST: plane-NV12-XR24-csc_bt709_limited-srgb_eotf
+ * SUBTEST: plane-NV12-XR24-csc_bt601_limited-srgb_eotf
+ * SUBTEST: plane-NV12-XR24-csc_bt709_limited-3dlut_17_12_rgb
+ * SUBTEST: plane-NV12-XR24-csc_bt709_limited-ctm_3x4_50_desat
+ * SUBTEST: plane-NV12-XR24-csc_bt709_limited-srgb_eotf-ctm_3x4_50_desat
+ * SUBTEST: plane-P010-XR30-csc_bt709_limited
+ * SUBTEST: plane-P010-XR30-csc_bt709_full
+ * SUBTEST: plane-P010-XR30-csc_bt601_limited
+ * SUBTEST: plane-P010-XR30-csc_bt2020_limited
+ * SUBTEST: plane-P010-XR30-csc_bt709_limited-srgb_eotf
+ * SUBTEST: plane-P010-XR30-csc_bt601_limited-srgb_eotf
+ * SUBTEST: plane-P010-XR30-csc_bt709_limited-3dlut_17_12_rgb
+ * SUBTEST: plane-P010-XR30-csc_bt709_limited-ctm_3x4_50_desat
+ * SUBTEST: plane-P010-XR30-csc_bt709_limited-srgb_eotf-ctm_3x4_50_desat
+ * Description: Tests DRM colorop properties on YUV formats
+ * Driver requirement: amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
@@ -230,7 +274,7 @@ static void colorop_plane_test(igt_display_t *display,
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
-	igt_crc_t input_crc, output_crc;
+	igt_crc_t input_crc;
 	int res;
 
 	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
@@ -248,17 +292,14 @@ static void colorop_plane_test(igt_display_t *display,
 				NULL);
 	igt_get_and_wait_out_fence(output);
 
-	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
-
-	igt_assert_crc_equal(&input_crc, &output_crc);
-
-	/* create sw transformed buffer */
-	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
+	/* create sw transform buffer with output format */
+	res = igt_create_fb(display->drm_fd,
+			    input_fb->width, input_fb->height,
+			    output_fb->drm_format,
+			    DRM_FORMAT_MOD_LINEAR,
+			    &sw_transform_fb);
 	igt_assert_lte(0, res);
 
-	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
-
 	apply_transforms(colorops, input_fb, &sw_transform_fb);
 
 	if (data.dump_check)
@@ -372,10 +413,11 @@ static const struct option long_options[] = {
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
@@ -408,15 +450,42 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
 	};
 
+	/* YUV tests - CSC colorop with various encoding/range combinations and optional additional colorops */
+	struct {
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		const char *name;
+	} tests_yuv[] = {
+		/* CSC only tests */
+		{ { &kms_colorop_csc_bt709_limited, NULL }, "csc_bt709_limited" },
+		{ { &kms_colorop_csc_bt709_full, NULL }, "csc_bt709_full" },
+		{ { &kms_colorop_csc_bt601_limited, NULL }, "csc_bt601_limited" },
+		{ { &kms_colorop_csc_bt2020_limited, NULL }, "csc_bt2020_limited" },
+		/* CSC + additional colorops */
+		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_srgb_eotf, NULL }, "csc_bt709_limited-srgb_eotf" },
+		{ { &kms_colorop_csc_bt601_limited, &kms_colorop_srgb_eotf, NULL }, "csc_bt601_limited-srgb_eotf" },
+		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_3dlut_17_12_rgb, NULL }, "csc_bt709_limited-3dlut_17_12_rgb" },
+		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_ctm_3x4_50_desat, NULL }, "csc_bt709_limited-ctm_3x4_50_desat" },
+		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "csc_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
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
 
@@ -447,7 +516,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		check_plane_colorop_ids(&display);
 	}
 
-	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+	/* RGB format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
 		igt_fb_t input_fb, output_fb;
@@ -457,8 +527,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_subtest_group() {
 			igt_fixture() {
 				output = kms_writeback_get_output(&display,
-								  formats[j].fourcc_in,
-								  formats[j].fourcc_out);
+								  formats_rgb[j].fourcc_in,
+								  formats_rgb[j].fourcc_out);
 				igt_require(output);
 
 				if (output->use_override_mode)
@@ -473,7 +543,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
-								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
 								0.2, 0.2, 0.2, &input_fb);
 				igt_assert(fb_id >= 0);
 				igt_plane_set_fb(plane, &input_fb);
@@ -483,23 +553,24 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
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
@@ -511,6 +582,85 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
+					/* Extract encoding and range from first colorop (must be CSC) */
+					igt_assert(tests_yuv[i].colorops[0]);
+					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_CSC);
+					encoding = tests_yuv[i].colorops[0]->csc_info.encoding;
+					range = tests_yuv[i].colorops[0]->csc_info.range;
+
+					/* Create input fb with matching encoding/range */
+					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
+									mode.hdisplay, mode.vdisplay,
+									formats_yuv[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+									encoding, range,
+									0.2, 0.2, 0.2, &input_fb);
+					igt_assert(fb_id >= 0);
+					igt_plane_set_fb(plane, &input_fb);
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
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 9ea30bae60a3..07dc6b8d3089 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,46 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_csc_bt709_limited = {
+	.type = KMS_COLOROP_CSC,
+	.csc_info = {
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "CSC BT.709 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt709_full = {
+	.type = KMS_COLOROP_CSC,
+	.csc_info = {
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_FULL_RANGE,
+	},
+	.name = "CSC BT.709 Full Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt601_limited = {
+	.type = KMS_COLOROP_CSC,
+	.csc_info = {
+		.encoding = IGT_COLOR_YCBCR_BT601,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "CSC BT.601 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt2020_limited = {
+	.type = KMS_COLOROP_CSC,
+	.csc_info = {
+		.encoding = IGT_COLOR_YCBCR_BT2020,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "CSC BT.2020 Limited Range to RGB",
+	.transform = NULL,
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index eadfa5401341..8170a7f852df 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -101,6 +101,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_csc_bt709_limited;
+extern kms_colorop_t kms_colorop_csc_bt709_full;
+extern kms_colorop_t kms_colorop_csc_bt601_limited;
+extern kms_colorop_t kms_colorop_csc_bt2020_limited;
 
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
-- 
2.53.0

