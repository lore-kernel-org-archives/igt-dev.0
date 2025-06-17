Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD7C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86AE10E4C4;
	Tue, 17 Jun 2025 04:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="20giLBM9";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E810E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7lOeTLe3eqtw2k5EYb1HTAxAzznaZWZx1zMI6zLaMu0YJManhfC1ShEqQCrp9zQTtMmCT/pjyHkxYuGgiTZDwk9kJ9jBPia64RKte6pVWw/FiI0j/1cnadWimBAErsX9hvhCbKLRsoQurkbKq/8V3YZUV5FAO0G5syQ08vDdInfyBcDMMiWNHbzOn8pKVx9UwhNS/LcGh62NzLsqG6wErvtr+o8aTCtWXXVhfo9as4ekswLTZZFisktCJ3nA5UXMdtn8n0wMDO4qzZHtDF/vy4o4lkBEaAxUaLpfFwmUFWAKRjUqqXB336+6ZfF+2pBrEZWly74UksEmms+BjX5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq9jblIMtpUyYG2xu9WXoaTj0d317XQSLd8I7BQDHxw=;
 b=Hs0+HSiP/IgKsLdFjXPVbsSGI4H/1+FGQRKdSEzoOBpZ9iFT+pOXFaAeF3WCS12dXzDJ/6jMyCSvoI245rTEXvHbwDrE7bW0Is+dyo5B8CL8SD09VWnZnf98lhdy8QP01Ryszk04KzrrLchYFJ8WB+19f1Po4DBNh9TASvNAZxcBrLYHJ7QfOBfF+ekeD/DTUF188b6xCi4GoJg7kOtKXeW+rygg5/mMd2c9xQOjHiT99RX8x0QAMNBxy4IRCZc/72OISy0h24eMGNYzOUrov+NKiUrNhDSFada/SvAJEaMJGfPWz0Bk/HNZ5h773cgI1t6nF+v+dP/My2sGbm0zPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq9jblIMtpUyYG2xu9WXoaTj0d317XQSLd8I7BQDHxw=;
 b=20giLBM9Wkt5mRcZFKaRJlw5Q/XjlyjxUOd3tcX+5jtLjf07RYPf//5LZxWfp0knVhz3ZRr4t7/xSQsFSeJY0g1a+vEiB3UkQvV7d4hJ2xCeaJgte+bq189yFZVaRxmzjajKP2McRw5GJIKoqK852fixlZw/oWh9jR61lk/Y1oU=
Received: from DS7PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:3b5::32)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 04:39:58 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::d5) by DS7PR03CA0057.outlook.office365.com
 (2603:10b6:5:3b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:39:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 16/36] tests/kms_colorop: Add 3x4 CTM tests
Date: Mon, 16 Jun 2025 22:36:11 -0600
Message-ID: <20250617043631.2920587-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 90149fb9-cf70-4bdc-05b9-08ddad5903d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTQfwCE0rqAhNsYlwLe+5zU6z1GMLlNl99hX+hpDSzJsu9vpW+kTtfMM+5I7?=
 =?us-ascii?Q?UNG3/tvf6ZOn+Hxrtf8/xHS923n22904R7hLU+yEckdWGUqRsnJNpovsR3Qd?=
 =?us-ascii?Q?9yk2Sqv0zBWbKAD86KsapRp9k3LV0myNbWvrVnFIVEz0lEnRfDZKPT16Zx/a?=
 =?us-ascii?Q?0KKKV2/xltmdVg3BHMO/69yFSWabgXsl1NHQXcZC4BQJxuRQTsh3HE4utjJC?=
 =?us-ascii?Q?61+LvAgNhwHRH301QnADiz1gWGwZvm88nBkDFyKdJEZi6YOVTFNG7WccD3CH?=
 =?us-ascii?Q?Uc3KYDHT5fRjwiwlqPY43s4l495qDaAWZpIp8iDFnD0Qmy5nzdQWZaR5VxU4?=
 =?us-ascii?Q?56uSNiMLpX2t75Lty4wayTwGw9/KxzAHkwFgSWk0P1FEOefk/q/pKZxASTPG?=
 =?us-ascii?Q?ccLPsgEcUOFOHWt6UtFQHPWvToWIhW05KgGYJmA42JXtbq43CIQicOiIJqmg?=
 =?us-ascii?Q?MxSEEx+yMN9wZaBa5YN5OvJ62NenQAeskX9NZjgjHhx3kYJnXDABdNgWZ9r5?=
 =?us-ascii?Q?M/Y/4B/u3rodLJcgddYktrGdH3CjBvnr+G0Wqi/qu/ccYbXQiZ1CwMlNotyX?=
 =?us-ascii?Q?bz0KqU7H2/46RrkcxczCD4xfIyy6NLfT58apa+2/te23mPXiuLOs0zjR9NVv?=
 =?us-ascii?Q?MMHVPprnt2m8bKc4e4uSfJBXNpHxMwLFJ/HvdFeCzH4UjTuMUeYuAnyIt2iE?=
 =?us-ascii?Q?afhDFVMH5hM0JiRbyGC6Vm5I4Q+Y1YJycLr8RWSGNGNiYT1EcGMw/QwGKJj0?=
 =?us-ascii?Q?xBveYNIGeuOIXK1XN/MDRSehywq2g/A8Y3AL6FdAyskqJC98UO41oxy+QGOt?=
 =?us-ascii?Q?HFTr50kCMcLBN9EvqrfydqW+DLGywSdRt5rr9/ZLDv0MrmSO4vLBBwfXLOSG?=
 =?us-ascii?Q?kLT6NHCStmNGFsecYvlkeSonI5nJ8Okx8iJpA3861kNejgSfzT0/9qc8Jm1l?=
 =?us-ascii?Q?wrmQiwP1t4tYFuZYbX+SWKNM1850v7cJ0LiL2ip9WKm2FWBl0ykUOfGGUWLH?=
 =?us-ascii?Q?ncXxZa9CzBbfXWRhhIrxezYZUVIpPQ2DowizSgVdNk5BbLHnkTEIHIK2AGDF?=
 =?us-ascii?Q?pbbZE7lyGrctulxF/oXjJadfUJAyn3lvyc9vGJms35bidNLPzi0rKzVl7/eX?=
 =?us-ascii?Q?Q9aiGhGDAcest0uiFm9gPuhRIU5oXanEkBEa2u6oCIAoQRSSJme/QH/9cExf?=
 =?us-ascii?Q?GzM7jGL/nApTOBpISlam64RRLKH+pWYSNwDRZK2CrjEGmG7knwBnmaGFSvbb?=
 =?us-ascii?Q?enMAVDEgaDHuKnoV6UEuXYlqVixcgQnSNo284LO21XpjaWNvbLzT0SfJDxb2?=
 =?us-ascii?Q?JZ6FexGWNatkh/YCKG/5wdo4VFYTw8OLCfh710HubCpbIn4WvAsQlwZ1utfZ?=
 =?us-ascii?Q?dyUvBz+R4wWtjKxaLoLCh8R6/gTw8dW/PrA7KWCj+bqmqUueVBRmnfwcGzT5?=
 =?us-ascii?Q?JGlMMpZ2v07QGhfgjf2T2UsOYurTUpkfrFnU3Bf5ETvBr9cRkY91ffGjKZ+C?=
 =?us-ascii?Q?J3SvwT5zEhJ4qW03R14OX+N8CSUVi50jHpWJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:58.3779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90149fb9-cf70-4bdc-05b9-08ddad5903d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940
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

From: Harry Wentland <harry.wentland@amd.com>

v4:
 - Remove unused defines

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 43 +++++++++++++++++++++++++++++--------------
 tests/kms_colorop.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e770c6b2e..95ccf2c47 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -39,9 +39,16 @@
  *
  * arg[1]:
  *
- * @srgb_eotf:                   sRGB EOTF
- * @srgb_inv_eotf:               sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf:                  sRGB EOTF
+ * @srgb_inv_eotf:              sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
+ * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
+ * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
+ * @ctm_3x4_bt709_enc:		BT709 encoding matrix
+ * @ctm_3x4_bt709_dec:		BT709 decoding matrix
+ * @ctm_3x4_bt709_enc_dec:	BT709 encoding matrix, followed by decoding matrix
+ * @ctm_3x4_bt709_dec_enc:	BT709 decoding matrix, followed by encoding matrix
  *
  */
 
@@ -180,11 +187,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE) {
-			return true;
-		}
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -204,13 +210,15 @@ static bool map_to_pipeline(igt_display_t *display,
 	int i = 0;
 	int prop_val = 0;
 
-	current_op = colorops[i++];
+	current_op = colorops[i];
+	i++;
 	igt_require(current_op);
 
 	while (next) {
 		if (can_use_colorop(display, next, current_op)) {
 			current_op->colorop = next;
-			current_op = colorops[i++];
+			current_op = colorops[i];
+			i++;
 			if (!current_op)
 				break;
 		}
@@ -272,8 +280,10 @@ static void set_colorop(igt_display_t *display,
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 		break;
+	case KMS_COLOROP_CTM_3X4:
+		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
+		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -330,9 +340,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define DUMP_FBS 1
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -480,7 +488,14 @@ igt_main
 	} tests[] = {
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
-		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
+		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
+		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_enc" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
 	};
 
 	igt_display_t display;
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 8102d25b1..30278ca4e 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -35,7 +35,7 @@ typedef int (*transform_pixel)(igt_pixel_t *pixel);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
-	KMS_COLOROP_CTM,
+	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -55,6 +55,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
 	const char *name;
@@ -84,4 +85,40 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_50_desat,
+	.name = "ctm_3x4_50_desat",
+	.transform = &igt_color_ctm_3x4_50_desat
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_overdrive = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_overdrive,
+	.name = "ctm_3x4_overdrive",
+	.transform = &igt_color_ctm_3x4_overdrive
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_oversaturate = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_oversaturate,
+	.name = "ctm_3x4_oversaturate",
+	.transform = &igt_color_ctm_3x4_oversaturate
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_enc = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_enc,
+	.name = "ctm_3x4_bt709_enc",
+	.transform = &igt_color_ctm_3x4_bt709_enc
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_dec,
+	.name = "ctm_3x4_bt709_dec",
+	.transform = &igt_color_ctm_3x4_bt709_dec
+};
+
+
 #endif /* __KMS_COLOROP_H__ */
-- 
2.43.0

