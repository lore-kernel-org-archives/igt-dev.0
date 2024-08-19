Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22184C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0110E468;
	Mon, 19 Aug 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Say1vvM7";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF8210E473
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkzNtaoaoaU2gk11XRAsHbob8Pdth2rXAKehDZdu+Ijw/8ReTVMwnGlauSFaPiFmCJ6nKKNNbVCJ9Jla50anLTrRfrDufVr51K/CZgZg62ReVRiKjR7KQYc+3eo57ghPf6urdrvJeSJV2zwdXb7elOmqLWZX5A36O67KLZS4OTtbnjY1kSBC6rptXwBl00bCV6AvO/4/YG19Ll17mNv5t1O7h5ta2wsBKoqq3yITUjJhC3XEtVZdNlg1YnsgxiRxN8eOvNNDGLG0N0sho1haqITrc95ZK6wAinZ8PVW2Jw7H9UuawlAzMI/FMucLIsWTPpYqZsawdEihbtF2EwJtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abrUNeJUofTjmZoaLKP5VmiRx/rUcR6H+IZEUoGdpsY=;
 b=ylTbs4v6s5U4zho9ITmrcrNUIbvdOT+qy92OiMvWy3jwUexi6xWR9cquWgoChGnzlYWJ4ypoD53vrBHfhDkBNnj8s7Y7r0l/elqXxBamhVnLobz5+qCc0rBqu6QiB5ieDR4TPXX19gFFv7fnZTCM8T8UfUYjjr45WWOB5/1eh80LPde/AmZQYrjcs1yNitHqYnM/8v14Wp5pQH8AGVmXmHYBvWHYORWjtKD+54Ic99fwFNRgMTRkYCUF6l9McLPl1Vu8t862s6lh0voga2UyrDppLXspk0NGd9a+sSsDae3OP2jdTp5f+v3tiaa+7HNiV7an6Em3CHqyynx/9s72GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abrUNeJUofTjmZoaLKP5VmiRx/rUcR6H+IZEUoGdpsY=;
 b=Say1vvM7ULmjWHaBMSt442zkzXsPO0cVyZZok7pMyuRfQU6lXY3yf3KSU5x5RxdK+2hHe7Qq1WLUDAQoyNwvtWZ1euJzYxZpRTiYbAl1neoKW7TWiKNXqqe0oEFqkOyJwJ2WzD7SiMe6RQLZZZ+DPElJhPMwg5TKxW200Xb2DGs=
Received: from CH0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:610:b1::34)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:38 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::bd) by CH0PR13CA0029.outlook.office365.com
 (2603:10b6:610:b1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:33 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 15/37] tests/kms_colorop: Add 3x4 CTM tests
Date: Mon, 19 Aug 2024 16:58:01 -0400
Message-ID: <20240819205823.316656-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: aafa5e15-1336-421a-32a6-08dcc091b2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rYqgfiTTgJ+4v2zDdfIORjecS/uD3vkFprCDO5cyaBtpSwDkuYNk3xxHaSaf?=
 =?us-ascii?Q?MkgPsVDYbRGfhLhEXyo3Em06tsAyIx9cE0PMmr7Za5cDh7i9g3iwB9HsLQWY?=
 =?us-ascii?Q?sKCBppNJAjAUbkapWdTxiXuEfsytibmPjlOLM7E+Hx/rwTDZ8rxBLuIgumLz?=
 =?us-ascii?Q?4dngUTdktMYFUhvx1976LOypEdn4peADjYC8m7LOCy/1DJpH8xJcEEU2+P2g?=
 =?us-ascii?Q?cloiXD1c0QqBmMLIam728FrZUp0Fwcq6GFsO0C2b6D/dfHZW6Fv5U/K4gpJn?=
 =?us-ascii?Q?3y3WldejkjjCEyv+1x9Ba9v5tD5P9QvWfddSQs6o7eH4ZKyKdhxyDU+H4aMw?=
 =?us-ascii?Q?TL5F96uZc0WFXKZjmZKsvaGh0sH/T9dgBSiyR4sXFelRyLTu96QUh0Dm/FNw?=
 =?us-ascii?Q?ocldqrhJZMhXJU5/CEawEoFVnVzenu/N7XLl7U/l2oGjgFT8SYt/iMk8d7xh?=
 =?us-ascii?Q?mkbZWKIaad/OR2fV4YOl6BBLk8BVaBLHPJW7WC8rp8rQrogeKO5lGL1OJEdI?=
 =?us-ascii?Q?VD3eHm4jWhYoh34EDieWJxEuuN4NsIM+YAM4T9aT2hnYqPc+SA0tcJQTuhRP?=
 =?us-ascii?Q?zAkINKPB45OXX/hkF4xVukNbnG0sI98/X0VTKnfYo4uUq293dsAVIH+xPJ9i?=
 =?us-ascii?Q?fK12dqeacq4sFIRsbN9+WWLBAT8XOKezg8+m0co86r/n9TOmzGgh/q0XCUMm?=
 =?us-ascii?Q?MF/JTpRM7MZcOdCSg+nUpRMORCROw0EoEUwyVlHXj+jaC/oaNUHUkQ24VIHR?=
 =?us-ascii?Q?S7lxrYnOiRVFf0O2JBvdwMj/dluyw5JzKqyf8mm8X9QBfwN6EDFIpgxT/7k4?=
 =?us-ascii?Q?LcHCt/XmOXl86GTtHrwFilVZXHZlpR2i56/V3LcaMNB90lqdbi+j3eDaaIgq?=
 =?us-ascii?Q?oxVCaaXqF0dbxbJYO52TePzWIcLEpwv/XDu1RxVB91l7YjPRWoPRqyq4XPj0?=
 =?us-ascii?Q?7sWtQCxfvkyq0DQiJYjohIpPRxXKSeWJDxK5MojOwmNBnoEgxQtX5gAng1lS?=
 =?us-ascii?Q?/I75KldoYvCsKyfsZtHhCupR/5dHsUNw+dBvyhQf7F6SWpxtpuNcGgO0JkV6?=
 =?us-ascii?Q?NtkeZ+3NuIzIl47wvCpK78Y5LRTfEh+HAqOnxjmnKq+hJqJGv0xAFEPh4fDx?=
 =?us-ascii?Q?vjVc6tOVQXR+P7H4uQoD/B0jPoBuPuwaa9/dfB5+bJCD+REKWacKukjMVLUe?=
 =?us-ascii?Q?FwoPxQ7znvLE9Ni6l/qp+X7o/SL1hRJJpcm51sEkfb5feP5w67GQahWSmfRP?=
 =?us-ascii?Q?oUPvwfVLvRrSaCtVjFgxPmRlKZUUu6eyiDRekGDo2vW0FdFrPuBb0QLKjYB6?=
 =?us-ascii?Q?6vlxy3rOo1pVLYkfgNZHpcBafMTkrQoG993CjwcZ2GYNcXs1ZnUtLehen8cB?=
 =?us-ascii?Q?WCWJwPUUWxk7f91B6Jrj+mmjKWtmYy82B79i5c9/nJAW23drtB9onkQEa0jg?=
 =?us-ascii?Q?HdNN2cVIkUnQ9hFDQoZ6sxkOed/QSsL+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:38.4715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aafa5e15-1336-421a-32a6-08dcc091b2fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
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

v4:
 - Remove unused defines

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 43 +++++++++++++++++++++++++++++--------------
 tests/kms_colorop.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index b9009a498651..e782f75983c4 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,9 +40,16 @@
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
 
@@ -181,11 +188,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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
@@ -205,13 +211,15 @@ static bool map_to_pipeline(igt_display_t *display,
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
@@ -273,8 +281,10 @@ static void set_colorop(igt_display_t *display,
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
@@ -331,9 +341,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define DUMP_FBS 1
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -481,7 +489,14 @@ igt_main
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
index 8102d25b13be..30278ca4edbd 100644
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
2.46.0

