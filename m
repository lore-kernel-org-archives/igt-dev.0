Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1FECDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7ED10EC3C;
	Tue, 23 Jun 2026 18:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s08Dhc7B";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011062.outbound.protection.outlook.com
 [40.93.194.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8BB10EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cubOK8NV3kLlotLZaQC4XVttBVv374/mJJVYPPEAkmvmqYv5RsyxZQaZMzz6nV0YWyUVcomEWgowtKFOrWmcQ3KLr62tnzF4iuNNm2+yvPOa8+H4N4IuEkISPAOJyCCVs3qT96AWomGBqCHCFfA3x9FljJ6r1T7B/dsDba6sUiPH4StHR6T/lOdlGVHFeMtz4Gr/B8Ixnep8pPzt3fHoFqtxKGins83h4FadOFiG3uAe0l3fs0Q51xxlyetwRfWKgpCoGDvnkUBvYzIM7OSfFrNmpUTggYdIPCM9otSLOP2Lhfu3JaG2S9jurSRMnQK5mryRlGXdftAeIQov1koOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu1db2I+F41D7u9I9Hu2P0avsFzZy/6H17lD1TilwSM=;
 b=CxeWhN8GgqOFuEdWyzDoK/DmkGpu3ma7pGfFeR1zoROjwHwUPSUWB0StEg+CwjBD40q+zZnK9L4Em0VOvxbb99WLgueT8yYSSf6Bi22sTanlE5glVtpTP19ErUQmL/bGwEq4dzz+l9uwxUceD7Ni1USUdRO0mwWHpqdvzZ2zuC4Iz1xmi8SYK/8KSL/1MFb0XYY+Rfd6G/ZFlhcKvMyAzPJVumKwHWgYO3otAW2kUjguw/p2XOf1gPgqeMO57qght5aUy08iQYBuGpRbtzKJyuACl2Ed1zmsZeBuzKxjUpFxC2XPWDqMsVXumrif3zJ7AQN6ejOk1pkBsZqgVwGmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu1db2I+F41D7u9I9Hu2P0avsFzZy/6H17lD1TilwSM=;
 b=s08Dhc7BPjkWFsCJkMmljOPt47GLuLeN3WUZ9E5Ui6eGNnCTyMu3UFvwYyFo4Zsno8ugNBPDF6yo6UlXyEA3MhkNPiUUV8LjZublk+hzVctKuaUhmHVVIKR6N+FunZ3duEpeFxwEnEbehTwKP8hD+vOCskhSDwYwaRwYlnKrPNU=
Received: from PH8P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::24)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 17:57:50 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::43) by PH8P221CA0054.outlook.office365.com
 (2603:10b6:510:346::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:47 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 03/12] tests/kms_colorop_helper: Add Fixed Matrix colorop
 infrastructure
Date: Tue, 23 Jun 2026 13:57:28 -0400
Message-ID: <20260623175737.171142-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: feee89b1-8798-47a0-82a1-08ded150ef7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: Bd69AuXUbKPmvUomV6nR728Jxls2F1HdcYV6KEdvBP6JSsYGj89db4LcZotzl3XFrNVOLPbE0s5QkyGWH/kWP9MGgn3tsAV09foUz5TZIlkkqOrN8m7SoRRAehM7Xm9YdR4eWnX4fOaWuIZuxtUw44h54JqPDX9a+VwDOEBcWvqfkJHrYQysUfU8RBmkZ3WFI3LRanFTq8ftJb6MdChHk1iXWC6jPXHIWflTQJCBFhfy+1EwGTOuP94H4VdU7dWkBAUyhEEkRk3lPdCTg1cX6FXB8NIoc8KMvRQx+JmFsr9CnKjM3yqzcqH9RCAEIUzbbOGvs5KX7XSzRGwajautdfUJe+7Oqb5atEvChkZbmPCtIeayYqd7CWqTMwaunlSKaUG1vBkXe6tjIRQfV6ljLxPprCejUHCa1Iz7/twU3WvQAyRHhsqHAYc6rqAKLw4AojdElCj6yHD/kSa9Qd/kjU+Lua0Sgivq07b/8+vv7J3aUl8zoaMEjz7ETNawvO/wSzg4rQsywT/GeMH3iam8nayJ0gqAZMgnWPh0zqQkUmsBw/h83s0EMOLHDkpTQHKW4Avo4qzNoCRe9jPV7aSgcKAQQ/7kbxka2hGSzVUzBQ7kdC0DGDqndfH9CdXA2ksvM03u+KwliGIHxBOisPK95ywgW3dCg4y3VxVjY8JejnXRQpthuad0c20DZeX9ZLZIcgYc/O4eiruQ2loAkA3ASA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fsiIOvqvx7z4YP9il9o7CkxjMOKRlsvQljxh3vNEEkWNzVSvQL4no5OtCNq2C2GDOMJzOxeBDOcni/Vh4YFNtDmLg82S1JLln3sbSNGtPtcaL5wDchlgJ7Dnux8xIdrJ4MLS9syBuf1XQLDRSILekLWX2tnzSCdrqX3PRYXVEpVr+mxQFwOlmBsvYZxYkBOfCni8BPLpt4Nf4mmlon/TI0BUf/ffu+3Lm+mvj8C6+ECTW3drt5PmYE1jrn6MWHKtI9PB6xhrAShGqjE6PE/8jV8ykIF9cVx6CwOYnsECd/pDVuygjNPmuUo02Zp4Ut+qL22NFfqBzTe1rWgtlfdp9yUs7VtFtL3ju13iEooalDXeUEEDWxFibTsU6SPkTjEbsY26V1UE/J5g+k3BOUvMRA1CzOgfM7L90CEsjuY7HI142KJRfqBNXpjK92sJbCCb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:47.7746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feee89b1-8798-47a0-82a1-08ded150ef7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164
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

Add support for Fixed Matrix colorops:
- Add KMS_COLOROP_FIXED_MATRIX type to the test colorop type enum
- Add kms_colorop_fixed_matrix_info_t struct carrying the DRM enum string
  name plus encoding/range for software reference transforms
- Add can_use_colorop() handling: matches DRM_COLOROP_FIXED_MATRIX type and
  verifies the specific FIXED_MATRIX enum value is supported
- Add set_colorop() handling: sets FIXED_MATRIX via single enum property
- Define four FIXED_MATRIX colorop instances: BT.709 limited/full, BT.601
  limited, and BT.2020 limited

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_helper.c | 45 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h | 12 +++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567ef6..d12584c9adb1 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,42 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
+	},
+	.name = "YCbCr BT.709 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+	},
+	.name = "YCbCr BT.709 Full Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
+	},
+	.name = "YCbCr BT.601 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
+	},
+	.name = "YCbCr BT.2020 Limited Range to RGB",
+	.transform = NULL,
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +254,11 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_FIXED_MATRIX:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +403,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_FIXED_MATRIX:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
+					  colorop->fixed_matrix_info.fixed_matrix_type_name);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02db8e..68ae1dd05c6f 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_FIXED_MATRIX,
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,8 +51,13 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef struct kms_colorop_fixed_matrix_info {
+	const char *fixed_matrix_type_name;
+} kms_colorop_fixed_matrix_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
+	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
@@ -94,6 +100,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb;
 
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
-- 
2.54.0

