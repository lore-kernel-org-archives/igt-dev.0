Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FFECE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5BE10EC03;
	Sat, 15 Nov 2025 00:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hKm0GC3p";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013037.outbound.protection.outlook.com
 [40.93.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A685B10EC14
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:21:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPXb9HzpJnOmvWomV/QH+7OZgvPFLINjDAZSG4pW+wbvIwpe8ySuQ5r4KdS3R9S2e5fshlmlHYBHs3XDpwL62WNfcVdLU+7LSj95cJqjGNIM0JOTy+V7TVnH6IKdHgufD8oqeegTzo/2eBnQAylTPNypNN29JOThnSr29pl+fS7jpeIUzo/Ky+Q3K/BoT8OXXdV12kupElfg18uD67wG88nJVYTfBnkABajupKS5bjrsq+fbECMU/Q3h/ZegHqq81JX290KsXGmx85o4Kg2SCFzlewfsdsXDbbMGwLJHqNyTsJ/QC7xuPHY6dLbR4zTyr/958k9gc7xfLdVvXApXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKHvtvIbumzdsXT3hw1S90Jm5M4DVAtcm34VAM1Fzfw=;
 b=mu5d/47G6iXOuMlz5tgypHAbE1kXd9haYeKpXCQsFT/g3CHRn5ey0gCBArFyym7/uR5/KT2nMopFCxSlHfvllmNgDa974ECyhM17tjJvrdTkUgMiH15d4CP+l0tGqoGWeEyyQcobKcl/y/hg3UbtgsouhRHVy42ORwKSK1hxLxGcOLmCyuHt3Fjfd8ieHn1DJ4DmgW4QMSWDB1J4o1v9pe0vJSqySvSELSB/mYvwV25DZVPx0whLDla2yyEB++i4XQIb2v/prZoNk/JofPzu0sDqSc/Gji1yoGGqwNdS7w1PLHOtgrcaSlBpUbXHB3YEmXSDD69mZOihCKi8C4DXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKHvtvIbumzdsXT3hw1S90Jm5M4DVAtcm34VAM1Fzfw=;
 b=hKm0GC3pMS5f+EXpYrMWpIm4YSm9v+c1WDVJ2+6ElCIsZwTevMROcBzKAcokFRXn+XL4pH15wlx0Db2ZrZWgZGXl+TrK9YCdpNyZ/eoVz4KCW5Kl0YvsAEqUigYBrUY3dRNEINde3bRvN+QScGz/i7bMcgxVPkfytLZpQuwXK1c=
Received: from BN9PR03CA0843.namprd03.prod.outlook.com (2603:10b6:408:13d::8)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:21:29 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::9d) by BN9PR03CA0843.outlook.office365.com
 (2603:10b6:408:13d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Sat,
 15 Nov 2025 00:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:21:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:21:28 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 13/32] lib/igt_color: Add support for 3x4 matrices
Date: Fri, 14 Nov 2025 17:18:22 -0700
Message-ID: <20251115001841.3563993-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ed7429-1caa-40fd-2288-08de23dcec12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bb4pgHGTYc02xDxFdEfGvKh/E+WY4JmBMGTZca9xCUq2/91wgfy39456NrXr?=
 =?us-ascii?Q?0v+dV+FPm1IDyVrFuYdeVHEd952UEkTi5bnulZStefsWSeSnAJzf0TRTOk24?=
 =?us-ascii?Q?UcPJm9ExlbTdHK3AFS5RZdXeUlcx9HhiO7x5l3xONH2w8n1YhEhugu6OyI8z?=
 =?us-ascii?Q?Gr5Lc3AbEqJ+qmm53TajB5/frVkg9Q6HrUQYFHprDB2+Om+pw9Jq6uKKbJrP?=
 =?us-ascii?Q?oin59Z9E1sJDLm3tkOvPmMePw1VvAF8ZgJsFwwbtvUlWcPN8Go52LMeKKxPa?=
 =?us-ascii?Q?pRGXqHb+pkLDAXhvf6tPzEc1AXCZf1oE1Y7IvoJhWEmgOdHxhyS7enu3Xunk?=
 =?us-ascii?Q?yiME4C6XGqg5F6VVfAk5Ae3Kiln6FAfi7BO5um/D5OSIPBS90H+75OEb156+?=
 =?us-ascii?Q?RpeM68xxU1MlONWvkGt/EvnTwpmqStq6mU7BFCl35a9qk/wPGDocbwfw9nGR?=
 =?us-ascii?Q?S5y0wItw8V4EBBw2KQ7qz3DJBEZlCAhWVIzJuIJJBAK0bGuVUlBelE14qHKc?=
 =?us-ascii?Q?RiM4RuVymlkph0B9d4NF5anr6niP1xlVnvT7xx45NEJubSYFDFqhydEkrJNt?=
 =?us-ascii?Q?5FtBItxDV4RcRnsCtoyhEFkskqPsLHjijxQ2pH4VpsOZBDit37XuBPwz5fuk?=
 =?us-ascii?Q?l80cEFQVMZKo+mbe0XCEr+QZsqD0wIlQroBKhTezVK/B3OUGdKaRGgV/p0ww?=
 =?us-ascii?Q?C0gBtuZKR1o5PA/FeDQFQlxl7c7OzLrxu+uYxVauEbLgJ0eKVqmAowR1c7NG?=
 =?us-ascii?Q?ViJ2Dy5VQ0N/Z8/B75iHwPnrJ9IJXQdz7iPMpUWIGk0Lnsqoe+GyUflwyk0c?=
 =?us-ascii?Q?iCtdb0zzOWxKygbYQm+1hN9lCzO/As2xnJuwnJs/V0OEvnKhd6okaxO0AOkR?=
 =?us-ascii?Q?rYx8Hndvvegyomm+mXYRjObGmatz2pY150diapEVwFSJDNpnp3Ta2T4+zkfj?=
 =?us-ascii?Q?YuwWxcvIPR/WU4N+S+rmbk5SBSun8dkBJyaTVBptZ8KOIXFD9L/elZFcPr58?=
 =?us-ascii?Q?HnXpadwo8C2zt5A3DLkjEZWX0AB2hyUezTC1QlUpmxLNth8Fw7195ZGLVwIX?=
 =?us-ascii?Q?09wFhl9wUK/w+GQAbH+R33iNVLdCgdFz7WBNQRQvYIM3R55iCjCQmYTVls3n?=
 =?us-ascii?Q?pyYu2n2hN30V5XqIb1gp7p4hkwR8O8dClG8bnBJQ3kMwvk24rf0UGl/dWa+N?=
 =?us-ascii?Q?r7/YN0PNWtNtxI3bmcBvsPbyNfdrOKU6vGwyFgRsBfwLd9JyUacI7A7/YmSp?=
 =?us-ascii?Q?mw6jNgmYrZKkV2qDKmQu170lLjN2wzPWh7LY/3FFaFgX4z10RQhgZfcHRBII?=
 =?us-ascii?Q?dXBxe+qemR8qYUTOuRqQyLdtEtXpGdp3yoMohFWZDP5OYK7Zj3V4OWDP6P4H?=
 =?us-ascii?Q?KJ5dxLgm6uuW0/D6Qtcp2oSdsrLgJHDzRBFRDgFvhEsezFoArC5Bw4I0T6i9?=
 =?us-ascii?Q?Gkgl9EBm7kGFyHai5iOrapsnIcYdavAlcF+qzoS5/fTBSKCrbGbiVJQwb+Bb?=
 =?us-ascii?Q?+4ZlnSWhM/kcIC4ngXQUpz1eIjvgEvhLn/50jt3SHFfXpNOLmkdwoOoiYhmi?=
 =?us-ascii?Q?cVEUrZwjkfYifa9S2Ac=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:21:29.3153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ed7429-1caa-40fd-2288-08de23dcec12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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

Support 3x4 matrices in color pipeline API.

Also add a few matrices for testing.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_color.h | 54 +++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 0e5f391db..bc90fbdca 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -11,6 +11,7 @@
 #include <errno.h>
 #include <math.h>
 
+#include "drmtest.h"
 #include "igt_color.h"
 #include "igt_core.h"
 #include "igt_x86.h"
@@ -76,6 +77,62 @@ void igt_color_srgb_eotf(igt_pixel_t *pixel)
 	pixel->b = igt_color_tf_eval(&srgb_eotf, pixel->b);
 }
 
+static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
+{
+	igt_pixel_t result;
+
+	memcpy(&result, pixel, sizeof(result));
+
+	result.r = matrix->m[0] * pixel->r +
+		   matrix->m[1] * pixel->g +
+		   matrix->m[2] * pixel->b +
+		   matrix->m[3];
+
+	result.g = matrix->m[4] * pixel->r +
+		   matrix->m[5] * pixel->g +
+		   matrix->m[6] * pixel->b +
+		   matrix->m[7];
+
+	result.b = matrix->m[8] * pixel->r +
+		   matrix->m[9] * pixel->g +
+		   matrix->m[10] * pixel->b +
+		   matrix->m[11];
+
+	memcpy(pixel, &result, sizeof(result));
+
+}
+
+void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_50_desat);
+}
+
+void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_overdrive);
+}
+
+void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_oversaturate);
+}
+
+void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_enc);
+}
+
+void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
+}
+
+
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
 {
 	uint32_t *line = NULL;
@@ -142,6 +199,11 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 			for (i = 0; i < num_transforms; i++)
 				transforms[i](&pixel);
 
+			/* clip */
+			pixel.r = fmax(fmin(pixel.r, 1.0), 0.0);
+			pixel.g = fmax(fmin(pixel.g, 1.0), 0.0);
+			pixel.b = fmax(fmin(pixel.b, 1.0), 0.0);
+
 			/* de-normalize back to 8-bit */
 			pixel.r *= (0xff);
 			pixel.g *= (0xff);
@@ -244,3 +306,27 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
 }
+
+void igt_colorop_set_ctm_3x4(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const igt_matrix_3x4_t *matrix)
+{
+	struct drm_color_ctm_3x4 ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (matrix->m[i] < 0) {
+			ctm.matrix[i] =
+				(int64_t) (-matrix->m[i] *
+				((int64_t) 1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else {
+			ctm.matrix[i] =
+				(int64_t) (matrix->m[i] *
+				((int64_t) 1L << 32));
+		}
+	}
+
+	/* set blob property */
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
+}
diff --git a/lib/igt_color.h b/lib/igt_color.h
index f368344b9..cb4cd00e8 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -29,6 +29,47 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_matrix_3x4 {
+	/*
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	float m[12];
+} igt_matrix_3x4_t;
+
+const igt_matrix_3x4_t igt_matrix_3x4_50_desat = { {
+	0.5, 0.25, 0.25, 0.0,
+	0.25, 0.5, 0.25, 0.0,
+	0.25, 0.25, 0.5, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_overdrive = { {
+	1.5, 0.0, 0.0, 0.0,
+	0.0, 1.5, 0.0, 0.0,
+	0.0, 0.0, 1.5, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_oversaturate = { {
+	1.5,   -0.25, -0.25, 0.0,
+	-0.25,  1.5,  -0.25, 0.0,
+	-0.25, -0.25,  1.5,  0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
+	 0.2126,   0.7152,   0.0722,  0.0,
+	-0.09991, -0.33609,  0.436,   0.0,
+	 0.615,   -0.55861, -0.05639, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
+	1.0,  0.0,      1.28033, 0.0,
+	1.0, -0.21482, -0.38059, 0.0,
+	1.0,  2.12798,  0.0,     0.0
+} };
+
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
 
@@ -38,7 +79,20 @@ typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
 
+/* colorop helpers */
+
+void igt_colorop_set_ctm_3x4(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const igt_matrix_3x4_t *matrix);
+
+/* transformations */
+
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
 #endif
-- 
2.43.0

