Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915CC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66E710E692;
	Wed, 30 Apr 2025 01:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b4+7Mfzf";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565ED10E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9C/NOANqHLHkNzSGIclwOH+EpgBSkFeBEMTwmCVWJ2aAZ40a85khGGwWFxWrbonFq2eH8oIx/eTocNcx/9BuTJw1VHbDt5csrBQx8AcBS3yw43yk9S0jwRCHOmo/71xxpA714YbDg9HwQs69BxeIghGcMAvqRJmB6wC42CcCX5kVBQ+nLiHBB1Bxy0HEUsqou90aK+9U3JbgiwRneSus16JYM1RFbnNhUDKAi06LhNjfBQVJTTGI+IgsEKUpydHmxXGhYgHs5YeUPh3jJ844OxvIqWCFDKxvUqjg2bvKDKtKEtHXc0gjmK+FjQtiosovRRLw2tisBE++p3AemAZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=LgizQFqX77wEdlVoTw3UbwYocJJvZ0ExpIBS+vhNjIWBX9tDuCS2eFUWYpzl2FYiJzzcKJTfxLPZY4KFoq93RHdzkH0SwVFjbF5rVfJVgtT526/8ngUjo+1DZe2hxrSW/EdHqGgRI/caUtUmYs8oRvCYK+XZm0D/MtjbKJ4Mhp3Us30oN1WsBDfu0747s9sSDNe6MnD/BVhcSAtFLqV+qWTLWWLshC2ToWuFppYfTQrlXumuqzZukSWUcx8IUMKjFkYpjyzVQe8eMOvUWLCOi6oQXmq5QLdML6BOZHDiAW4n6iWCfhqacFvelgs6zTaJ4nvsWDR20fOtllVDKw/hFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=b4+7Mfzf4LvNQZKBw6NzGOIJxwibgtoef85fjoONby1aIL6S1+I5ZWDzpws79nCdtke6cMTXlhb235HVrYHILcp6YnJbWV96o0yy8O1xwYipp14nQukqqERY+BrDQxeAQIJTN8US0hK3GktYDvylg+Z0uGda+CCDuzoTDMiMzwk=
Received: from MW4PR03CA0196.namprd03.prod.outlook.com (2603:10b6:303:b8::21)
 by SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:38:25 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::3f) by MW4PR03CA0196.outlook.office365.com
 (2603:10b6:303:b8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:38:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:38:23 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 15/36] lib/igt_color: Add support for 3x4 matrices
Date: Tue, 29 Apr 2025 19:34:33 -0600
Message-ID: <20250430013454.226910-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 902a5b36-fcdc-48c4-355a-08dd8787b308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMVSaAKXEXKfsSxhwWsXNDK4XRBz+Zt1tDLie3J8HefWDyeI1WJly0znZzWM?=
 =?us-ascii?Q?IYxT5ZHEdp36yzu6iOEy1amd9Jd29U4KAvGYdJ7ekDQiS6XYouKMYaJk5W0J?=
 =?us-ascii?Q?or/tYzF0kAe7eZo2cQ9vyYJioHsmyRe/QX/RLvyRF8zf/hu9fms/6k5kGAU4?=
 =?us-ascii?Q?v1wPkE7hXIVDnD+ZRubNBV0awn3r6856f84X5HegfzAdTM0Y6VeHkcw17pjC?=
 =?us-ascii?Q?WmCR9cKW8clzL/LAnmzAqS2tH0iQKI/LUozqDEyqvV1rah88wySLbk22Qt8y?=
 =?us-ascii?Q?YZrXRXh3yZdPDjJ0+8oMHZHP1QepFy7PcjWf6Fna+uN54vmPt8ekyqXNzBLp?=
 =?us-ascii?Q?xF72M3mXWk/lLC7jzEhAyiWDd7r+epHIlTGdXYnzP4nI14jDN/OUUyNQLNeS?=
 =?us-ascii?Q?Y7Fl9/bKOLuLWS+E8dslI0W+w+ETGxp+yCLovJi5pl6yngHxzCqRm6D5QdPS?=
 =?us-ascii?Q?CDv5G6+V89g1OIhNSOnaP6LWnhddpjO5G/7IT6vlnqIUlmgEQb6/v/ORMveM?=
 =?us-ascii?Q?AWZuscH/uS1T8qyPbRI2tk40x3icbjHRoXtvw2nqRUKpD2aK59/Jjmwmd8Li?=
 =?us-ascii?Q?J1zmYHn8hP7CNK4nf3f0ikWZWZWKR5121rTpMF5IjstYEtiy8JGUAYgwoepu?=
 =?us-ascii?Q?V9gtasqNA00VdgTxbx0UNcKbtmWo4f4u+UZi+a6KtNbgl8i6XqgFdlxiNgaP?=
 =?us-ascii?Q?h3Bc2lL1RpDWP3kNSmxoQ8S+nuAni5D8oYx7zoofVIKnJHW4an1L5Rv53FqU?=
 =?us-ascii?Q?Udzwt8Hhv+GNCnMehbu8BVDM4fNMGwC898wDcrBZQ2AN0xWoACCY5fJApf1G?=
 =?us-ascii?Q?48OwpVfP8L77B+WUyau8tRbfT1VOvQayAJK0BhmZxPs8d2nGdwVzuET86wwf?=
 =?us-ascii?Q?LrHC9iUZcdu0Ixulk1UW4FbM/HHDKneqiL0DCU1s1vKqr7SGaY5CvXtcOtlc?=
 =?us-ascii?Q?zdQwdoPFmMM2FecqikQ4YjJAoz1e5jGzPEjNPuVnJ0p9zWEmoifwwnMh+1zL?=
 =?us-ascii?Q?xbCZWQPHIkKKNYKXdrjlomvY+zmLTYpBpMy4iW/E3o3/Pti2eKoxPD032HBV?=
 =?us-ascii?Q?paer6MeELAFwqN7lCiFRTKuR2w5GJNr0oCQCgQ9Tv/lahuOaT5FNR+d703ub?=
 =?us-ascii?Q?ZFg6acVe7c6th5VjqpNg3gxHINkXnE5r+Xbbqkpy00tEc1HSZUtYx00UkcJA?=
 =?us-ascii?Q?CL6y1bzoQvJk8D1utkIYMyvGt8BYww/f9crrIZx7Xlz0DQr9oUFrNDJoKp8a?=
 =?us-ascii?Q?JN4FPmnjQmPGDG/OFqvEfSj+L5oOVirNJ2oWwYwirAiZNrwncnNcKywVAaAY?=
 =?us-ascii?Q?XlGXmYpgjMvf51Pa2+Wu2DlVLVKPFO3mzjT9azSKaRAuug+EkQpfeBkbCOdS?=
 =?us-ascii?Q?1CUZVjfV5QfdLmJT6DMzEFWJRbeivPncRz/B7ib9tG5jhuA+rTvMRS04M6Wq?=
 =?us-ascii?Q?uFQVd/4rNuteRhnD3nv3DbhImAV9H+wMcoVgC/H6PfUP1xo79QrQamDqwAMH?=
 =?us-ascii?Q?BwedfikijcER0XY3NUW9iZjFciDES8mgYRI9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:38:24.9069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902a5b36-fcdc-48c4-355a-08dd8787b308
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110
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

