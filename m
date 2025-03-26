Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2D5C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910310E792;
	Wed, 26 Mar 2025 23:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yUbcWpJa";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1F410E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6H83cidiDoUscxUfenB1YOY9pEwucnyM1joty008zYDTLa9KZzxIdelMnIAGLDdyl7bbKKj2puw5CH6vS2B7nZz5g788WuXf9KxiG+K4xi4+WIovh+9gDkmw8uD+oMCJeydenk5FNpBZWOjUdOPI641Eil660H0fcwwfDu2bUpQBBb0UZN/7ujrv9onG6RRcgI2jYkla8pXWy2bDgFl/DDUEV3fXYoU7Dbn9bRXwgkTujrGbkJvfpdZYCRAYTAPXDBD8oFvWC+vsQIZn2GevUU3PBaPrAkAhD4AXSaDQEBx6vWsAI0LLgPZUTyKsBOhQTS/l+Ao6GqK2HiuIM6aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=kkcrTNoFb95oBzTqGYH09EOKobjlXhwf1c9vHbI6cQbajtVnp4Sr0nEzRSvULZpXoiXOk3iWFtwDGmdl6kG9iADqvNHRnWbRy1W1o1z9b0pq4/kHTs/9YicMGd+FX/wu7gZ4cZTl4MUGOnGrw5tYe7CKu/jyyuOoUDEdvFHlpt1xtwOtXEi6G1D1lS+MnPSLrUODRROF88kOA0B6btJW+Fppe6q8XohV0KcOPDygzJFuiAJ1fnqRpQTw2EDW6z1MlyiP/csJDs0lJFcMYZVqDE1tYw7I1SYCpDaYN1fySQ37sQH3BlWIpIYMli+x1uOiVASDrHym7WZEfPSDWdMkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=yUbcWpJaWpqbFBVxhZf2ogn4A7RKCODEJYpXukfySRpu6mRu9Az5einfIkTNht4yh79EqEgEOSlr5UUn1B62CTpnKidQQMvJoEvUaz8T94Bmn7MNG79aBkoxEBspA1Mr1R9FhhRLtd6CVXAA39ZoRpBmcUZAXNdDxd2GMcf4nuc=
Received: from MN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:208:530::27)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:42:21 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::c6) by MN0PR02CA0013.outlook.office365.com
 (2603:10b6:208:530::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:42:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:42:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 14/37] lib/igt_color: Add support for 3x4 matrices
Date: Wed, 26 Mar 2025 17:35:46 -0600
Message-ID: <20250326233609.2980110-15-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6881d5-0814-46e1-1367-08dd6cbfda10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RLSBtBajuQNHrl8+BQvJs5o5MJG1MgHjuDM2S/goj0KlFNDyYoex9DHxFqlg?=
 =?us-ascii?Q?A5HIo+uf1Vj0HGIsu2adDjs1+AqoJTOI51fx3BE+Gg/bd0RBFGSNlq+h8khJ?=
 =?us-ascii?Q?piqBPCM1b9zlu2EHiaquQfcLSQ36+SnYoj/SVyPpOHFJEr1ignuBAwHsE0rT?=
 =?us-ascii?Q?pRMPAiylFtEttp4bl19Xhvhtj8zIWLVgQ55FNTx3+aDQ1b69mljdmc4pnSfT?=
 =?us-ascii?Q?wPQbgJcbsGZEdqGUqKQ8qhy1oS6uoU5aHqCC8v0GVmWzxOABDCEuoqx1vftp?=
 =?us-ascii?Q?/c4s5E/g2bWbuWy8t7F44y6Aip1Alu9RVxrGETjenoTg/aj2bmxCVEQNSl/u?=
 =?us-ascii?Q?MLvKKNR17yamhMJoqEsCDCnS1Rs63nHoUPBRmro340X5EZz5f0RXU5XH/H8I?=
 =?us-ascii?Q?qn5UuegIccU+PElznrUviQ5TWajNYoLVbZc8XDubDTdUEdB7qtUCTjEU6Les?=
 =?us-ascii?Q?qu0ETEQrUnWA3YJqUFNtkUWKPbSyMzb3lmcScpdiO6vxWMc4ks1GYRG9xBnH?=
 =?us-ascii?Q?2UE5QhMcsKYO6+p6Qe8U+yo8AHVE54QzczfhOdX3njIuap8wglYchY/Tfseo?=
 =?us-ascii?Q?1WLtbAdPj32fbcRzZg1JdX0ysEmMFRpoqU3K7n0YVIsZNSXaHtK2ruOSLaX2?=
 =?us-ascii?Q?O0r0C25mA8cnOjjQDTFbkP+a5b4AkcYARZ8O/42JY3buC936GZ5oVwfwsgJd?=
 =?us-ascii?Q?wGpA/G1zBRBxdn1Wa2W5ZldANd1n3wBu5H4J0w+IQWMBWw3WTmIJQGgt3KoQ?=
 =?us-ascii?Q?IXpMEDd2OC8sfbHimCmETsJlE6CGpkpZKaA24vq6RrzT9rjVkg5o8PmZX6LT?=
 =?us-ascii?Q?bhUoz6kY2WMdmGJmnA1NtWneaTbPU+eqiTu7MfK7BG2yvN4GhjXrzM4UW+5L?=
 =?us-ascii?Q?8bZQRseCaqS4wywJSO7NsM7AjgAbsPic1KQZxNepMc7IX7yvTYACl4ZAnQVh?=
 =?us-ascii?Q?/T3ZcT+tzaK01pRaxfJaxzfS0gVCgNTkhIspjokQgj7qZIUFEnViPHUit/X0?=
 =?us-ascii?Q?SCLf/56Hc2hCqiRn0pu0DENmVThoHUhAr6YbydZwdU/ZbCRxy1TYD3cKnrpQ?=
 =?us-ascii?Q?bcAELt1XGQMj+CFesgHd+Ur0oR6BmWC55+hav40aDC7CGvFM4NNjgRE6vjt5?=
 =?us-ascii?Q?5oKrihAj6201lPHtQ6NdrXYmqQoTvaGCnb3JU5d46odm/SrE5obuSNZv4gQK?=
 =?us-ascii?Q?R1ILMuKBMwklKWV+uyXmsj3iwmkSj0GRzpSXMerTL9Kf+WNkKPGBP9ZBMSs8?=
 =?us-ascii?Q?yVcCABZr8K4X/4x2OO+FIFXAXbtmiQM0TSZ+PfKNtf4CoVUy5MdEAuI1QnOT?=
 =?us-ascii?Q?1vlWSQgNOe7kPJQiI464lVYD20Di/2tWUhhz7yCENFOy6NRwcj+BejF2fC4g?=
 =?us-ascii?Q?TdW+vK/RvR4lCFaiXnF8B5H5UtA5S7ICvtrr8RvESn4ScmBL5E+diQydh8jS?=
 =?us-ascii?Q?AZ5LD2oJvGF+gv6biuDctp/bEzBJXcnLcM3JWTHBGFp4ZA6kneDZlK04CYV6?=
 =?us-ascii?Q?p+6MjMCREfl0kUc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:42:20.9049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6881d5-0814-46e1-1367-08dd6cbfda10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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

Also add a few matrices for testing.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_color.h | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 6349f2b15..5e1374e4b 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -9,6 +9,7 @@
 #include <errno.h>
 #include <math.h>
 
+#include "drmtest.h"
 #include "igt_color.h"
 #include "igt_core.h"
 #include "igt_x86.h"
@@ -70,6 +71,62 @@ void igt_color_srgb_eotf(igt_pixel_t *pixel)
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
@@ -136,6 +193,11 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
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
@@ -255,4 +317,28 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
 	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
-}
\ No newline at end of file
+}
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
index fa9f6cf42..d218550f6 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -27,6 +27,62 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_matrix_3x4 {
+	/*
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
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
+#if 0
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
+	 0.2126,   0.7152,  0.0722, 0.0,
+	-0.1146, -0.3854,  0.5,    0.0,
+	 0.5,     -0.4542, -0.0458, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
+	1.0,  0.0,     1.5748, 0.0,
+	1.0, -0.1873, -0.4681, 0.0,
+	1.0,  1.8556,  0.0,    0.0
+} };
+#else
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
+#endif
+
+
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
 
@@ -37,7 +93,22 @@ typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
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
+
+
 #endif
\ No newline at end of file
-- 
2.43.0

