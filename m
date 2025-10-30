Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E655CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03310E8AC;
	Thu, 30 Oct 2025 04:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="liCqp8LE";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010011.outbound.protection.outlook.com
 [40.93.198.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA8610E8AC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To32LORwU/QTWOsPB+JU5dvWpaqsmiF8U6/pdZcswe6plSTWol993OBIAnE68Oybs8ZuiiNmv2OrG0Xc+c/hZ8mh597wYxQtgo28jGMK1rs1mxQyci4cGj/gMG6sOlyLBJqJmcov1JOhWsDfASmZphVeZD9LeqUGiq/ne497j8UbJPcq9utqajJMlZe7IPpg+xhNhcGHZuO9U3OSimiBm/gd/Kr2ihNwSvjlSdCyKYB9+U53Uh+I8iJpMIwpBwBgNE2qr0v0hxTtPn+nwP+uO5rsMN38QFE+pYg5NeoD6UTFIvl6CqtQm3wFtJR9FtZyb6nmzu3WZPJKBzbbSxxGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3hKk7tNkPqeyCpFMW1ShuDkiimNQl3LjV6yhBVig10=;
 b=UMVIU40Cbx41MuRivOkqVgCsqwpg67gB11MbK2mseAd04zPolXx66aZ1BDXiSzEIM17Aa15v/+az98rYRi/Bn7g4yG7f6I8ZhUYdDsyD26vxhOatdnN2YqDLuFEwJvwaNzO7yY0MHYbarz3XAMOcYUVK40Lp4V1ZZCyaoo+Lm7fYzOXqQLOqopaAv4jn6OMHqJecnDdIkFweH4XVaDHJKUFRiXqrxu9pUxLwg1YNrpKbZoxEymyhs/9byrEq8qOMlMKjhoKCK08uoZSusnh/aTbGt2Y9xGa4yJENu0kggsI7b8lYlCot4Tj9CASP4fuv1AKTFgA0+Ysi/VPt4JJ6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3hKk7tNkPqeyCpFMW1ShuDkiimNQl3LjV6yhBVig10=;
 b=liCqp8LEPa4G76pjxNUIPws+C++AC2PduZhm3t+ZiP7Ili0YS2d2XLKPVESS32TsJ/kPE0H9mdAJ7imQrxhVViEUU95NS4N3ldbUEteFhS+mAxC5oIoE0VHVPFG55jE4kpHpxLxTpK2zp33K0wPmhkatE6Jqk3aXWEpIhte6b7Q=
Received: from SA1P222CA0087.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::20)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:30:57 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::52) by SA1P222CA0087.outlook.office365.com
 (2603:10b6:806:35e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:30:56 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:30:55 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 13/32] lib/igt_color: Add support for 3x4 matrices
Date: Wed, 29 Oct 2025 22:27:42 -0600
Message-ID: <20251030042801.2315866-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DM6PR12MB4058:EE_
X-MS-Office365-Filtering-Correlation-Id: b41614e5-3b6a-4537-7f41-08de176d1ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2XSpzLhKgYwJ6cgpap+HfC7o+oX7raYmeFBYE2cEMp/jaSjSoBS5rSGl1xfM?=
 =?us-ascii?Q?pCKF1m1S/L1fgLdamZIaLmEA42JrnsYJZsF8pkQbzU5bNxUyrop5aTWmF0b5?=
 =?us-ascii?Q?AV5CE1hEZP8QwwmpoRdyOeRSPnkfjKMcOPkZAg1e7A+SFcslxotB4RoaF/XE?=
 =?us-ascii?Q?6OuA1vkiYuqN3tOV8aHBzCxCeFGy98c9zdoLLF7EKr/IE/qKNkdbSCCun/Uz?=
 =?us-ascii?Q?Wq0vYoTeuILtfvuT4ZPErdiNsYmsINXou20BUZMVcEZWAy93zay0XKYaGrph?=
 =?us-ascii?Q?CS5Fo2hVgADMjbz+9Nz9dNcjNNS+ofoqiPOANjH+GykNhwpZxbCMJr5Zih+n?=
 =?us-ascii?Q?lTzBKiNKceWfMd1jG9ssOBYFgvh9Ok/DAEy7JRy7f+PwZ49yvSRJitv/pSZS?=
 =?us-ascii?Q?Dj2DeMPckf18LAYZbrOgChUnUSUMAnPK1fi27V2jHfRjhHGlTzgxfuAJVXz1?=
 =?us-ascii?Q?mtt3ZdOhKoPdaoNMwdSXhY6XDYb6JJO+gd/j6XrKP6UB4O0U1lKnSJib3YZ7?=
 =?us-ascii?Q?YatRLuPlSusKXZnPLKvKNnC/3Aur72A/G5Ym/VLp2cZJ7e7uANLpj+L5bjcf?=
 =?us-ascii?Q?S105Kx02TgbaVypAVDTmYLmCTdVgVXwyf/Oi0VuVsGQhslsYhz2/hgl5i3mv?=
 =?us-ascii?Q?/v0EgpwRgKXI9LCWd4u1GOScJfnCE3Qzwnw3CLeMd/xJPZGGnASTpx/UZduV?=
 =?us-ascii?Q?d9yjnP4M8UBxx243eDLXV5GVCAN6EHsI/oECyZAklwc/84liELw/vD8fJQ7T?=
 =?us-ascii?Q?+eyBmdwq+Z/K9wGzRiCcPSnJmpJFzwXo34/kA+wbRaFs9tyLiXXQa/iYUV4+?=
 =?us-ascii?Q?dRa6iL37i9j23oy707qngdNJn1xeAmD67w4ivDZuejjFroFwmjPm0rQ5yYDj?=
 =?us-ascii?Q?UIGAkz1jR8g7NdxdzP6tPjoCyjrY7r3V6TXVTgBDPuXuSzuJgj2O57wzHN/h?=
 =?us-ascii?Q?Uw/ycgrzn8F7CVdnJI5bJbwpQYMVVCrfJ76GCW5HnQiTz1vhKyq3SbWAk73/?=
 =?us-ascii?Q?yZObZVJ99OVwvOobI29FgvYHVGnvumfytR4mXIZTd3whhqKow951e4nzj6ZP?=
 =?us-ascii?Q?N5wn+OBu2h4nL7fXjd55nLDm3HOkQL7+uNCoYQSGdwug0+0X7QRLrKQovg2L?=
 =?us-ascii?Q?MF4pnfYiet0m2dbzvR+qVEXc3v8WTsN7KHqTkAM2UHUw6UHrJuUu1Y4u/gtb?=
 =?us-ascii?Q?Gg4wFNPlWkLc9+qofwAYS+3yST4Xg7yjMUiSvx/uF/EZM7fMFFfao/WK4t15?=
 =?us-ascii?Q?0S4nHbQ2xAmeIOxjx/fPeRUtq3/tgHTClXyOTH8skMqNLr4lQRZwYCN4Gfob?=
 =?us-ascii?Q?ARKbO9lp9XhMx7txK+379pXOEH6VT3R2pTn7ciwd+jKnpWHupSf7onPlUA4u?=
 =?us-ascii?Q?XEdtRL1EaQcp+Vs1DsQV7Y3glnvsErRhqL2itJktlxPLgMkwf7GtJR9UTnjQ?=
 =?us-ascii?Q?Ywip+jOs87VBn0LpolEpNhycyz/D7cfRnz5yTAoHm+tFt72JNDXvpBBGp6xB?=
 =?us-ascii?Q?b3DUIkVzY8cG7mVLQEL3ssrHAvOEl89VlpuFftEwer0nd+m7sURH/jZQGlRb?=
 =?us-ascii?Q?MqtrbEm/N06hALr2Mzg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:30:56.8783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41614e5-3b6a-4537-7f41-08de176d1ed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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

