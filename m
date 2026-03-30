Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615641061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106F010E6C7;
	Mon, 30 Mar 2026 15:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YlmT1/w2";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6710E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFE0Mv+lcChdND9lsbaEyM0bG/5BQC/obS3iZOnM3ryF7rpOMB/0DMS2w+TArPc3/MOnZyhYX09BNUWecDRNyg52SGJ3YA2bAka+HLFb2HnpRe/kTvwRJATJ9a1B/9VJAzIYFwbVNzW6J3nXLTX5hH0EJauZXqlwzOoJRMOSaTQnug51mZfeiuM59WcGieje5rxty7TTfpjIS3w8DmYyqOXiBsBqw5cIE3T4f6m6RKfxPD9jdg9fMa7kL2qplr5/NwKuSN8T8fpNxC/hSjOe/b9dJwBwZQIVwwN2gnUgcu+33TjrBTh1aGOV8xVUZuWCWNfUn+wnHbhtfRzHMpxFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikqszcqntAZ1KrIVDc4DaEj5WuT9955o7IP1IpNQhWc=;
 b=X15EQLL+fR7zVxArVIn1stFkDt6koK+aKix0uZHLkSNoGVnWV1otqDORaBbQcFYFc+xG7/gbKpH87xBoPtzu4dHnd837LUbBMVzd4BPwg+FORV4AkZI9oCtO4gGJSPLD0uOzrmwDa0kIe+8+Y4IEaZ2jvu8SFqDQ9WQHSaunqS+exyrxZY9kMDWGM7gpsNQ+X2fgSIw8TMm++iMbJwSyLzL2i0GXB8nMPRTOxTuLmy8t1rZLOsKvXbRPg6Hf92eeRTtgfVvA6wbZQjR+qI8LIR8AJ/vESuw3tXGncTkohJEC20m1E1uv0JWf5Q1NNCzB8YXAOLltihErbDlYx9Vheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikqszcqntAZ1KrIVDc4DaEj5WuT9955o7IP1IpNQhWc=;
 b=YlmT1/w2YJwJ+qVgnYI0zkzC2+6ZC4+P5a1SgaA2dceGuYsgwiCeTVNO+bG/ds15HsImQ+2Bk8+DuDdJ5KLQ0FnvHkNL4cchzcVGvfnbKWQn5gvPJJxo7iMFBsXXOcan3qaLFUn3y4SYfZxCLn86FEvCcIKadmvXxPKItgV5umo=
Received: from SJ0PR05CA0076.namprd05.prod.outlook.com (2603:10b6:a03:332::21)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 15:35:28 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::de) by SJ0PR05CA0076.outlook.office365.com
 (2603:10b6:a03:332::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.27 via Frontend Transport; Mon,
 30 Mar 2026 15:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:26 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:25 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 08/11] tests/kms_colorop: Add CSC FF colorop tests
Date: Mon, 30 Mar 2026 11:35:15 -0400
Message-ID: <20260330153518.99898-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da24173-e66c-4663-f66b-08de8e71f894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xXsyIWbV/RWEWROY8srz06AHREdXkB53t2bjBVRplFBN8qX4Z+nCVkD0kS3zMHtYHBmxWm5hFXocYHPMnH/LK8QAo7F2U8t15F1ZPJbJ4EdBPUxBy76F9mND+6xRpKpbaQ1ulf1jxQXTSoFhaAPCfK47DhPoRIMl+aFqpNqNQdIEaDfGsaT55s1CRd9h/vjtJvhkRuZYx5zAJZ+Aic557jqE8I6v3/+KU7mXaeDoZ0g7XMLSscM088yd+EAgUG6u9Nzd59DjfLSV3KeL4AQQeXGFJHMM6x5LIQbizc73hbe9EqDUf2jLHZ3f/pvM5Vt367xAH3mj3G7Z0iM1IRye7zmq4sq9OQcNvnisAjgjlFHh/Dl6MkXCXDG62oPH3X9HmEziP4cbU8plmCAE8EKVRXDrbLd37gBuaIp3gCPuW+HRMRIqOT78mKGfBrkHGDqEj9ubGGBuzNkSYUVEDYxEIIzUxW1vqeVh5m5I5Jql5DiNxoNY2j9JFtwbCFzClLQ35VGA8kAPyiRm/Ajcrd3cZpurLIZ49RINANB9FsL2X4kkmARk6lLH0sOPsYsESmG1nNPTpRfJnVzTdp0jp2cgDZmpJXRM1Y4/vU2Tmuhow1FlqnkdWFK9/Ybu1IJ1TmGI2Q7NjN7DNfaBJknURTDMYtxXi4d3tpmVeh81+ot6F4fLqlKuyWSx0N7MnhVoYMn0a+ddfGVU+cIeLnGOPMd1wyMZZIOTYgDMiuM5AhuGd6NRYXX1ZHj8u3JpF7llhI/GQaZiagu9s81r331GHo21CQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4ygsUeAqspTQUJj21JyzBvChU4lYsDV9FCRI9kes2XUoiZj5TJyhN75KCpfULzKglI0YPdbTlX82fWubjjz23ECcBg7QNsb1isp0ilfw4YmnjsKk/viMvV9fzCUZxD2f234gz2Zs2PU/lGe0Ki36RQ1DSlfC6DVFAIe4Tz2wyTFJjy9FUxTKvLtd1rU6gFucBMFc+G3AUbRl/1kziz6ztsZdgJiZS2sJ/yftxFTux6cPW7T7IWig4VksUnekOIBKuYJu0mR2QcAg0LAuSGrQgcbytpj4dx2e+FDF+/xebNL6S9vxPF07EjVZj6y+8GDTs9O1mAgNCDFM6MuD9TAciLP7B1MaGrEWl1fzq7WEokO1RfUdTkIPZbRJwSHYqO40WaolauKrxxgHhnlt9JTCJwidfgQeS9NWcyI0+eUMLknj+MSAOVBnsxQfqMJ9ubHM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:28.5461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da24173-e66c-4663-f66b-08de8e71f894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459
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

Add comprehensive test coverage for CSC Fixed-Function colorops:

Test infrastructure:
- CSC FF colorop definitions for various encoding/range combinations
- Support for BT.601, BT.709, and BT.2020 color standards
- Limited and full range YUV testing

Test cases:
- NV12 (8-bit YUV 4:2:0) CSC tests
- P010 (10-bit YUV 4:2:0) CSC tests
- BT.709, BT.601, and BT.2020 encoding tests
- Limited and full range tests
- CSC combined with additional colorops (sRGB EOTF, 3D LUT, CTM)
- Organized into separate RGB and YUV test groups

The tests verify that CSC FF colorops correctly convert YUV input to
RGB output by comparing hardware CSC results with software reference
transformations using the igt_color_encoding matrix library.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 256 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 205 insertions(+), 51 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index ead8d9f49c22..fbf254b694bb 100644
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
  *
  */
 
@@ -373,10 +418,11 @@ static const struct option long_options[] = {
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
@@ -409,15 +455,42 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
 	};
 
+	/* YUV tests - CSC FF colorop with various encoding/range combinations and optional additional colorops */
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
 
@@ -448,7 +521,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		check_plane_colorop_ids(&display);
 	}
 
-	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+	/* RGB format tests */
+	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
 		igt_fb_t input_fb, output_fb;
@@ -458,8 +532,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_subtest_group() {
 			igt_fixture() {
 				output = kms_writeback_get_output(&display,
-								  formats[j].fourcc_in,
-								  formats[j].fourcc_out);
+								  formats_rgb[j].fourcc_in,
+								  formats_rgb[j].fourcc_out);
 				igt_require(output);
 
 				if (output->use_override_mode)
@@ -474,7 +548,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
-								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
 								0.2, 0.2, 0.2, &input_fb);
 				igt_assert(fb_id >= 0);
 				igt_plane_set_fb(plane, &input_fb);
@@ -484,23 +558,24 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
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
@@ -512,6 +587,85 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
+					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_CSC_FF);
+					csc_ff_type_to_encoding_range(
+						tests_yuv[i].colorops[0]->csc_ff_info.csc_ff_type_name,
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
2.53.0

