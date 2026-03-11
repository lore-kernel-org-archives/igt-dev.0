Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A205F103E2E6
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 21:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DF910E180;
	Wed, 11 Mar 2026 21:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BDHhRey9";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8D10E180
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 21:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQ6+5adOJxvZ5h2MYOjLii477SLJn1x01GVRjo+vYI7x/mF7C12aPRU0v50LQ71hWfjTJHhjAEYXUh2kmc1+C49FqDBK+xfiQoNnviRKWc2nkRMUC2JG2ZdsqtaXplsn82KFJs2AdHSsFRLV+7mrqHZZpcbOjZl89DVQRziskMS53UkaO2ciJoxQd+8R09WX6cQgwddETAiC3jKFY51Xngy60jePyl90WUgYsCZ5jSx4dYkQSBb5gSxLeFU7wzCsb17GzZH1TI9txAH8UhALmxg4wBkWPEhcbkpoB8FgGNDfOkoG6PC6cBJHpU4heQz7C0JrzAQGPDDxiY970PixRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEhZL5xGLWQq530xzhJHsWkocs48JH2GYO7wts625QM=;
 b=yh0MNV8mzzVuGgUmerMeV5mL2qlbuGjRsqC7xsMtSpOYcgYp412l6Td1Ox8cEQJzrTxNnDiMROZkgaS5bgX47sI97HhzQMncTCWBTxx+Jsv8vgoWBILXBI1tA9K5z+u/QtGeg5NpxaSK7fk/G62SkO/VpFH89nsyZwS9US/fgdwlo6tE2imrUC1DumgUf5oBsMjY2V/6HpeFBhpKfsuqNIY+NTizK6LoQvHBy9xi4l+R4HoZxJfQLNryHXi1ngxK0a69YKUAy56jtQDlV2tpTmJ9aEZDiOu4aet1wXsPRwYMn8J6neRH45Nt3G0zHCaoLep6rJ1SxopT/32cxMfHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEhZL5xGLWQq530xzhJHsWkocs48JH2GYO7wts625QM=;
 b=BDHhRey9jWinT+STwWuz/ugSlFJqKp/NPzFogeu75PZuLLCT4GZ+fGQ5JdSZyGUdUAd+V4ctE3hB4LKQpigXt/TKtOL7KuE8Ys1LKkK5rfFwrOp5fk7yu2RaybIyrm8GhzQIcIc+7f+PolM4qPpSQr562kiqwRlHw0I2lKOPESw=
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 21:25:21 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::26) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 21:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 21:25:21 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 16:25:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [PATCH] lib/tests: Fix gamma 2.2 naming
Date: Wed, 11 Mar 2026 15:25:02 -0600
Message-ID: <20260311212502.2487982-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b7527a-e914-4b92-6e9b-08de7fb4b33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8ZrCmt7YLCaGCWhnRZ9E5MmCPRcyM3iyzdw2YJ01Mwr+WNL45eYTzrNTxn3wyB+MP3upSd05mRKFLTqjT8Ukx8q3aYNwWm8S9moF6XGUyWVYxnKz0YKzNIYzI2MUTJypoGSTkQOLy1CCIXdITqMhUBjfOjSM1PW1ni7FBDcM1D6JqSJ9a9O/UBjhw2+c+3yhiGuJJx2HT+/B4/tfRmeV5safKTPd+urPcKS41uYa83geHIhKurhYv7dULBRdhnKBTZDk9DqA8vVgxVj/Ia0NBc/H/9ONuzR1VH/Ep/pzYYJ5k13pWblVBRK3n1/4t9yCstGavs8XtYPEWIE1EjIl6I+VeSAwHz2TrflcLYp1+bT/swkhqjyPKZSWsBfQRi9akB/e0AhwqQBws4TqUJlaVCKht0OJFSPVJDBQUWm4lrbxQ22Eu8Yexji1AIS+CHGO5gzZNOStyQ6xfMjDtUSpcjhdgJzQTV3FxGfWt2lfTlLoQvGtpM5zg3xqr2+iBUbfdhnCvbXhjTkax/ubkFhdTH/9pzQnA81eTkgvXf1Y8zA5G3MWgaRKAT4rVqK/yUbROYCxbZZoxGl9W16Ahras+BysQ3BpUDCO9RCJlbGrYfm/7Jlq8ZRJIdA5cP/3PeeP2OP8VyNntxewwfDSDiLTA2/Fz3xT2RQRuu7Cr4LgmBvl3sGkeeYr/Ut2XaLqH4p30kIbmS+BV/AK6MZ7wMH/gOD0a9mnHoWaHy1DV/Of8CkN3X8I5Bdy4Tja3CgNPxoLEsDTPK/UDHP0Qe95sfehzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0xPESe59V4g4ulT31GqcDomSzRVZUfD8g+PdGLrnFBP3vgq/t9GHDl3n9Nyl+b39JRJI804BENzO6GvGD72TeCzis6bDa2/7IJWph9J+SWOcV3hgjcg8viIFabc7+/1pV/FNxHMSd5eP3Pu5d9OkfeRugX4+cIlTu3OZfWR+3BLozTPF/1lQM2+QS48PWqZKTxp/K3yse90w61TSpIcwHfAYLA2hAbSHj3+aEWEh8rCgttVgWGmw5dKiS5cb3r3YyXexDRqh/T+RzMTBWt09ZDoDU08gRiSBtxNff1yXNTC5lHi++5ymA0ja/h9FO4uT8Js3sbgENjLRvcTa+fvvy0rllB9zj6ACKGluZn6mgeO8kDtlU3jHZgvqhS4YsPeLW4w/x+d/Q1ZxnL+GNI5RjlVIauaOD6Yqbys9ZS5zdjqNLN9+LNkhIvjTyBqvervW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:25:21.0893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b7527a-e914-4b92-6e9b-08de7fb4b33e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506
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

Rename gamma 2.2 helpers to match their behavior, and
update kms_colorop test names and transform references accordingly.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
Note: this requires the kernel patch "drm/amd/display: Fix gamma 2.2 colorop TFs"

 lib/igt_color.c            |  8 ++++----
 lib/igt_color.h            |  4 ++--
 tests/kms_colorop.c        | 12 ++++++------
 tests/kms_colorop_helper.c |  8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 05ca2d9b4..8c405275a 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -184,14 +184,14 @@ void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
 	igt_color_pq_inv_eotf(pixel);
 }

-void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel)
+void igt_color_gamma_2_2(igt_pixel_t *pixel)
 {
-	igt_color_powf(pixel, 1/2.2f);
+	igt_color_powf(pixel, 2.2f);
 }

-void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel)
+void igt_color_gamma_2_2_inv(igt_pixel_t *pixel)
 {
-	igt_color_powf(pixel, 2.2f);
+	igt_color_powf(pixel, 1/2.2f);
 }

 static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 919330c8b..722446400 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -108,8 +108,8 @@ void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
 void igt_color_bt2020_oetf(igt_pixel_t *pixel);

-void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel);
-void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel);
+void igt_color_gamma_2_2(igt_pixel_t *pixel);
+void igt_color_gamma_2_2_inv(igt_pixel_t *pixel);

 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index d535be4e5..f94cfb407 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -51,9 +51,9 @@
  * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
- * @gamma_2_2_inv_oetf:			Gamma 2.2 Inverse OETF
- * @gamma_2_2_inv_oetf-gamma_2_2_oetf:	Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF
- * @gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF
+ * @gamma_2_2:				Gamma 2.2
+ * @gamma_2_2-gamma_2_2_inv:		Gamma 2.2 -> Gamma 2.2 Inverse
+ * @gamma_2_2-gamma_2_2_inv-gamma_2_2:	Gamma 2.2 -> Gamma 2.2 Inverse -> Gamma 2.2
  * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
@@ -382,9 +382,9 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf" },
+		{ { &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2" },
+		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2-gamma_2_2_inv" },
+		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2-gamma_2_2_inv-gamma_2_2" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index c3a2b8f13..aaee4e567 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -127,8 +127,8 @@ kms_colorop_t kms_colorop_gamma_22_oetf = {
 	.enumerated_lut1d_info = {
 		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_OETF
 	},
-	.name = "gamma_2_2_oetf",
-	.transform = &igt_color_gamma_2_2_oetf
+	.name = "gamma_2_2",
+	.transform = &igt_color_gamma_2_2
 };

 kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
@@ -136,8 +136,8 @@ kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
 	.enumerated_lut1d_info = {
 		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF
 	},
-	.name = "gamma_2_2_inv_oetf",
-	.transform = &igt_color_gamma_2_2_inv_oetf
+	.name = "gamma_2_2_inv",
+	.transform = &igt_color_gamma_2_2_inv
 };

 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
--
2.43.0

