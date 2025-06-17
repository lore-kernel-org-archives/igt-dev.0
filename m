Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEFFC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9510E4C8;
	Tue, 17 Jun 2025 04:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cGMpEeMX";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4E810E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exyZxDcvgqHDpAXp92LYAXXosHgpI3t3HNh94J4e2Unvv7eehikGRLfXnSQv6yHucZZOuhmOxZ/tKWUUtTYs8rMSyQ0vRVkgiCi1FODjfZS1R2nyx21f43Dum+n6sniRHu+F6Bzs1kGh3T210yC8nc2c010NWfrRBb9IPup9tM2wd3rARvslC/4IclFcyzYO1cJCBp7meFjBydqNOfbfQ2eQPSLpkgk4igqJdI+Kw3jsmvxYCLRqlmKKLnXYGvHo4z3do2wYXWI1bJbNCz4HtMV+EECsOA4IKwd6bupM/SKb+HPHone/1cXn/VMmaFz6PIiArff7NnqYPgOsqG7azQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxAPnVTkYKBkPn4xrYqxCAXaKcONyDPH31MN8Yxtqbg=;
 b=ZhKxYiWAtEUmJr02swkiIN8crHLBvsmwLeE9FXQOanxGRI5YhAd6bQVWj1hSHaAcgAg+EG/W6mJpxP2RkhN3pe3+8DCyA6YFSdrXIQtiHgIvI1A/CL84+J1xJ5CJsWYojWczudDSoxxwiR5Gc3Xjh7Ky5WlZaumZ2AW8y37b/SuQqs0ZisTcA1DgdT4fvId9bagqAnSpR661ntaD1I2HkrLNkaKD83NTscfcC9gmtsS4/CsVJyN+HyxbEOodGQE6JtfgGeuxTHbyI6zja70Mx9Uk2lfu3jJID3dMmjHQIbIL/kgjKw7ID8lPUK3rPq1OLW9KHNRgSOChYXCEuYzGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxAPnVTkYKBkPn4xrYqxCAXaKcONyDPH31MN8Yxtqbg=;
 b=cGMpEeMX+lzv8smL0CY3Gh2cbgm9QCmn6BR/sEstLGJJKDVuLU3RWit0WbPp2WdaQCXXQsoxRPKmIXznBeJZomtpF1S6IjhCUek90pyweenhdCTUoIJpzI3/7EFF81jSbZSqy4XGIYvJ0pPDCg44FJ9UG3p0uBT2nAej2H7/mPs=
Received: from CH0PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:76::24)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:42:45 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::27) by CH0PR04CA0019.outlook.office365.com
 (2603:10b6:610:76::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:42:45 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:42:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 30/36] tests/kms_colorop: Add multiplier tests
Date: Mon, 16 Jun 2025 22:36:25 -0600
Message-ID: <20250617043631.2920587-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c16b3d5-22fa-40ea-7e70-08ddad59675d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ltnck1Rk+pDRrFKWbPGWjg1X4z0YQDnP93ZIx+npzJt3eTBsm1zLpVtWWUR?=
 =?us-ascii?Q?6iOtdsAb9z9ayrfgOSoijlTIGZm1tn8CXgnhhsQxKb1e9z+5rNqZyU4dbT4V?=
 =?us-ascii?Q?alf+u6Nha78BE8X90Ex0dkay6FPzE8dRYo/Jz7AhZVT5NsaGEKU8oe4mE6VB?=
 =?us-ascii?Q?QnG0fjl/Kkpf6Sbq5UDEwWMn7O4k9oCLnr+j9RcD9/YJgSLs2ap5vt7jiiIh?=
 =?us-ascii?Q?/MK3vx7P2vAXm8BZeUT9mKrGtRVrax0ms2raLsQzDFeptroY7N6zIQI1+sdl?=
 =?us-ascii?Q?WHCaKmWIXJXkL83nBinL5JQjzJ97FXhNB/I9w156INtVnjmN8rBsMnBxXvWj?=
 =?us-ascii?Q?icIzjIet+jQEwfeurDS2GaslfhTOsH8F75lg/7eMMQR7RxXfRIMJs7/MYJxr?=
 =?us-ascii?Q?K+Weg/x021sxLMclfYpGFTEI5MVlpotCAMqmNbWS1FBkmURooAzRSQdCjlCq?=
 =?us-ascii?Q?Ab+zgZwwLzpQhqlxYRruVcpdzjy0ZAkXC7n9Wt4PahqxPIyiKERWtndENPtR?=
 =?us-ascii?Q?2XH5iUenN2ukyCiZKFFrPlEK3URMluAi1k0VCBGMaJhKpwSPgPcVzruolFk6?=
 =?us-ascii?Q?2G0bzMVUIPLd4C8rsoPbTmUI9sJKR0lVNdedkn8Omn6PqQOcPd39SbLTubNp?=
 =?us-ascii?Q?svM6GLfjrJGfeoz2oN5IZ5SQND+JgCHR7F8YMxcdvoSViWxtRzosxVRmkXZG?=
 =?us-ascii?Q?A5DF9CHS+2EYz6veDMuBH2c7lHpzJ6rAYdAXsq7XkCyDKIQ+d7lLupP4fVVh?=
 =?us-ascii?Q?En7CkUAFpLoWWXjm7WqKtfZVqfjKeUMeye7bPfVqeGrK+j0v4KClc/ZIONwI?=
 =?us-ascii?Q?fTUv+eLKRf7M6Hbb51H8IQJ04Rz2YvevXq7zTpWXH4qMWiHPnTuXT76mxIqf?=
 =?us-ascii?Q?K6bq8AJXj6SAt0zZj0ibDxj3NKNBia/MZZQ16XzC+CB3LQBxBPfeCe8KZrRb?=
 =?us-ascii?Q?W6vK83jOqrenVw1vDqFL4F6hNV5XhjgCYtQXbPu5n73Jgiq39ps5hy1kM5Ce?=
 =?us-ascii?Q?BpgjIjjsQgQLBAOoln7DTP39BoW6tjLM3pU+ntD73Eqjk8QGzC8EDruz6fFJ?=
 =?us-ascii?Q?ff/+ADWvXtRXUFz0BFCIQDx9P5PcPep1pst5imMPwX7/3l+3a977Jfpm5K7M?=
 =?us-ascii?Q?LlnOlzAZSeVJXPRbMz1+SVpqtQcrhj7jzsmCPW8q6lriKuSwYcH5hReh0p7+?=
 =?us-ascii?Q?a8F5i1GoEf4DVN2baCuksznTq87aWqw7G29NhVHWtrmFcuWGKvVkr8VwquGl?=
 =?us-ascii?Q?xTS6GMgvO8sPlHvpdsZbDEFpa0lv4ZKASh4joVBHqom7vVNk4ULza3cBTpQV?=
 =?us-ascii?Q?VPecSh6abLjV2UT+ih4XrVwre9JmR2wSDLy6S6X5tHDcH+quJWLv7p3z9xat?=
 =?us-ascii?Q?Z7Vg/UYYuPJDYc/ItPgvoIKShgUbjquYE6HGEn8K5swB81crWjK/ZVdpR5vk?=
 =?us-ascii?Q?my7KIIPeG4ZJbAuTgzzFAgaHd7eXq1YeYEB/jtwN0l8YliL+qGledw/OuSL2?=
 =?us-ascii?Q?Cxpx+rmjSO568EzLDxJyMsBNyTeplPu4DZIZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:42:45.3825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c16b3d5-22fa-40ea-7e70-08ddad59675d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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

This includes multiply_125 (125.0f) and multiply_inv_125 (1/125.0f).

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h |  1 +
 lib/igt_color.c             | 10 ++++++++++
 lib/igt_color.h             |  2 ++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 tests/kms_colorop.c         | 11 +++++++++++
 tests/kms_colorop.h         | 15 +++++++++++++++
 7 files changed, 41 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c4cd1197d..cc074760e 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -888,6 +888,7 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
diff --git a/lib/igt_color.c b/lib/igt_color.c
index cc5ee3b0b..e6f435bf4 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -197,6 +197,16 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+void igt_color_multiply_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_multiply_inv_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1/125.0f);
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
diff --git a/lib/igt_color.h b/lib/igt_color.h
index d45d74863..54024f7ad 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -147,5 +147,7 @@ void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
 
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 
 #endif
\ No newline at end of file
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e30573f94..a4d874122 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -711,6 +711,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index efd729dc8..f439587bd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -375,6 +375,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f5895c782..c55975536 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -68,6 +68,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -235,6 +237,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -328,6 +332,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -345,6 +350,10 @@ static void set_colorop(igt_display_t *display,
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut_32));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -546,6 +555,8 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 13d15ea66..1def86bc3 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -36,6 +36,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -73,6 +74,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -223,5 +225,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
 	.transform = &igt_color_ctm_3x4_bt709_dec
 };
 
+kms_colorop_t kms_colorop_multiply_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 125.0f,
+	.name = "multiply_125",
+	.transform = &igt_color_multiply_125
+};
+
+kms_colorop_t kms_colorop_multiply_inv_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 1/125.0f,
+	.name = "multiply_inv_125",
+	.transform = &igt_color_multiply_inv_125
+};
 
 #endif /* __KMS_COLOROP_H__ */
-- 
2.43.0

