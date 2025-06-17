Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F08C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7329810E4C8;
	Tue, 17 Jun 2025 04:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="urEFqppN";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CDD10E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezqVBJbye8C9OE1AfImrlIDBStZ6wrL/tHDQs7KnX4dzLU07eYcD02j6oA5eU5aC2aSErmYDWWKYvoXE44E8mpmzhdHOHvkaN3WJE7ASGP8LZX/snMirij23nra1s1SV0YTDBxwzFLf68Y/8EVymy74MFrIvEr+/iOJLOPLIvdgQpYvrMrDz1vHQ3s4pU6PnKq1/NI4dTjq8Rl4kzEl1J29j6qt7GVtAL2XqWmlHFzL8ajJn/xyF+1hjLSi0ET/9xeC/kN64H5uPZe3ncbEYPrDhF8cQ6gkoTZ9BnW46S7vMhW00yWI1XSLu6d8yMSauPfFU0UNu1HJqntc1MuYFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=BmKjrB0QQLxpPu9ldhB59kVlFzG/X3oF1HVNgUrV90YGlKkf+F5YUxuIcGTvHo2A5PbQE4MWGb6gkmw8FwmeRF5TypgHF4YDUlsuJg6JfqEwboN2lT07YNWTqdpc4E5jUbo7skVbB0+eyq/I2bzz6fak8rinUd2anEuUXaZSS2BDpKjIvx0w+ph258s4ah/mbWVoFw35TjXBcXU1ilOrk5SX/3yUqaQKcjmTh3NX1dLCRwNjUK++5FDokMRLqyPJjO4+8GdLfIDnC4bsBPx7TQVarbvHQW5h2FwyWkE5EtVQy0Yx3u1+1Q4+3QIyCPMKqoeJEFZIkAOvOuh/E+cPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMhODvkmQI0i7TKkiFdo5KMI5ZyM3kxEw46ZvkTY7d0=;
 b=urEFqppN4qLu80K6ohTlpr5ht6THYZxge/QBQADRpNMGUR2sMXpRpFKrI2ytMERVtO1e2r6P+JBnlMQY5pcWet9KrF+yhcBLKqfXUvdAbRTjSl6i9jagJwV1KoOM2UY8+UKPvMqfTfkozss8+pfW6F/uHamCCSrO0/wixpQcBUY=
Received: from DM5PR07CA0091.namprd07.prod.outlook.com (2603:10b6:4:ae::20) by
 PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:39:46 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::47) by DM5PR07CA0091.outlook.office365.com
 (2603:10b6:4:ae::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:46 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:39:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 15/36] lib/igt_color: Add support for 3x4 matrices
Date: Mon, 16 Jun 2025 22:36:10 -0600
Message-ID: <20250617043631.2920587-16-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH7PR12MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ab83b4-541e-42c8-e804-08ddad58fcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b9eM2wcg6UZJVwMkZrvXgFJmqlbzTxdY3i13OxsyVDRrEvBOLNQiu/bz7zn1?=
 =?us-ascii?Q?vzryWTUDqU3IYz7r6gV0zwpyso/oFvMbw22JB1C0dMdNAVUkvkPu43cRQZ2l?=
 =?us-ascii?Q?Gh7DV10jzyQ0rLHZ1FUpQZpaLZghIrJWR/DU2pweFP5By0cQZqGRAWzfdJaC?=
 =?us-ascii?Q?suu2/m4L1z0hhD29eUGsydR+IgK8k3hVyLXDo/ZScfXtaT6JMAFvaPtA/rU0?=
 =?us-ascii?Q?7y2VjQYOGCJInlYKy24AKDL/vdeAqmoRcmSPCSp2zZd2KryTvcqPRU1jRw9C?=
 =?us-ascii?Q?fqm08wvj+3xf5RKt57/jCScQcEFPb0dt5xPPNN6LnqY/j4AHGk0Y0bk4MZoe?=
 =?us-ascii?Q?eaBMMbdiYx17t5o9LAqRW7QwTZ5CdEFvrtcTY4wd+Vpn1qguFeVTVRteGJzF?=
 =?us-ascii?Q?XrF3/YG1IYap0oAVv5xsV3kD2QnpOvmaHw/U8/27d4juU8bNKcXrEHb7o7WA?=
 =?us-ascii?Q?DoWSdj+3IUCG7xoYWOX7eumrusNcBe5oRmF7+NDX4HQgFa/j8E4POeKVwa2E?=
 =?us-ascii?Q?Qfw2rNI811MfEyVgD/1qRKw4Nw3O6NlHG4OFg3A4kAgZl82KHvrF8ED0d8hU?=
 =?us-ascii?Q?EZduPaaMREEZ6CxMdrFJx+at/dZCqNad9vCXE8E3pGVqM1DeJb8YckKfRvl0?=
 =?us-ascii?Q?/+6EPbCeSDaqoIqY9p4DpDj4H9AiZXdYhbfSJg4AmA8LG6RqQSSSAEZ8zNHq?=
 =?us-ascii?Q?HCbnDtevi5A2PvmsHOwHZzld95q9lWux9NX87/RuXbOzz0sr1UehNALInsTi?=
 =?us-ascii?Q?g8QmOVtfecZ1/EAOBVdwwNsOb54N48SuN+9gRGZ1Y+heeBkqLY5unKvrALkp?=
 =?us-ascii?Q?z2g7kZzYa/YUd1XQo+AMHwLjt6rw96KcLbo705d5MmgzHQI8iC4rIw7Csmma?=
 =?us-ascii?Q?/kLZ0nmVV92kViOxLqp7m0qQrVMDVkrel+s9EDOhBcD+kbhL6L9jdN0IqwiO?=
 =?us-ascii?Q?Mx4y+y8I1C4d/rXKCxnqXakgyFn2UMX0mrmlThjHxeFZB4Oh05QGxCrx5zg5?=
 =?us-ascii?Q?0+WYffaNgat6gvxglx+jO+MHD3TEgLym0CzvLV7v2fx3qVPFyVrbxV4jZHLj?=
 =?us-ascii?Q?aDpQ9Zgr8q1yIlcw5kwgWkRau5uC+kgUz5dCZuwgB3REv2v3PCnuU4fP9P9j?=
 =?us-ascii?Q?ZcxiKb+y/gyfDFT36Dy1qYEFWN2fIxxF3vJNgrikcX4Td9HTE8vpgPkDQ3cH?=
 =?us-ascii?Q?KjOvIp3QATNZJGgVc91PQrfaDj1MzhYKb1m6we1ZLGet0weV/p6k7DxlgeMq?=
 =?us-ascii?Q?oWK8T01S4lZ+RsVLFRreN0FyR+d9fOAS3MARV6neQx3C6Oov0YxzDVvbRRPd?=
 =?us-ascii?Q?YgMgUOiW1UnekMmV5jEs9rxtO74drN63zBpy36x9xFhMCjq7AbTjNtwsIHtZ?=
 =?us-ascii?Q?mmr7av3cFij1eJRAuRu3lhTacwANinxoFGgmva54B3l8tBB9lGIGnXeCBq3S?=
 =?us-ascii?Q?i8Ax0vEoRhsHljaOtYMt48nwgECzxeKKqxSlYUgr6VN09V6esL8PLBRCOT2q?=
 =?us-ascii?Q?wsXKNcnKxIdvZRUDtr419KrfCTLYf5VUodO2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:46.3565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ab83b4-541e-42c8-e804-08ddad58fcab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884
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

