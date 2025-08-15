Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0B7CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40110E956;
	Fri, 15 Aug 2025 04:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3strmwa5";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367D10E956
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/Npu7vkDewK3uN9nv9qltV7sk7WTxYJybQqznou1NPXu8h5t4qTpQ6ekb5JS8ym2i7OK4QV40R4tLDtJjXtxmxRoLbr7J840aN6ndc90tULD5z5nh/Sh2dTPhs+5tmcOeSHLN58MGyN0NS/Qs3TUxWVeFwqOwnE13vZ1oPAQWIpUkU6UnAnyl/5L7t2zogplJ7aEVhEHtMH/hRqAEJL9BldyFMjGPScpfICSovvyAqVAq0aiXgdSDGDgCshxTflDsQaWtAyPmX3irhLX375jeVtJFQvFf6vHt1bWOxElHa9EIR3mtESOfxjS9fQWFHXAskXjNmEx+lVpxMPFGWc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2xAwGZbzSUIyKEFC2sEnQ1r6gijDbyakN8afrNbsWs=;
 b=jtOYwEQmwyF7oadJ3oXvVsJH6LvEMBcwDKCZLSJXWe9gJvV+JmOYAwgN6qhJlnhWqMhz8QkG1TjXK1B0nRdcqPpsiDhwqB+2bc/1cqaU1g9F9owVyDTb9/lB8NYPg66krBMelPH6KC3EAZZdDzRhoXOCWWIcFc6Scu69Tue/wTgXesouSLxAbwJ7otjixuLVb+BQgm2QhgyI38WKYg13NcgIwqcFCJJzlv3nGgL3c3Xr4CD9yJ5lv4ZiVFxyKmpetpIENm61iz81yFAb9NJMytPL5+/utPFtRP/X9gxUc5LMDeGSuKfaRvgUC1pxn/r2pHDxMc+40oLwLanx1+5Mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2xAwGZbzSUIyKEFC2sEnQ1r6gijDbyakN8afrNbsWs=;
 b=3strmwa5n/eelGfM6DnSmdssf1QYuDYSJ9pA85QYmmuGNjH5yXAunMekszh7dDku4uSP/JoL0f1tOWDtjn4X2UQdw9Oun8u+1kC/pd4ZCtUd3gR7yJLn6bsfjANNUb+VqvqbFXsm4lwhP44lAYMh6C5bZH/APQvxmvcR7lh8swU=
Received: from BY3PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:217::15)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:09:28 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::e0) by BY3PR04CA0010.outlook.office365.com
 (2603:10b6:a03:217::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:09:27 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:09:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 11/30] lib/igt_color: Add support for 3x4 matrices
Date: Thu, 14 Aug 2025 22:06:40 -0600
Message-ID: <20250815040659.3321102-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 548269d7-8772-407d-2a1a-08dddbb18705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u1G///LKXiXZwtQ3XQ4DVMv6tpmc1VIsjQJ0ibPT+0DbrfH3ThvbKbyUMVJ6?=
 =?us-ascii?Q?E91f9iG65oCHH2kkGOvym8j44d9clN1EiywZOxSgs8ALSh2s3rFMffw5I9Bf?=
 =?us-ascii?Q?Kb5OKhcreOLm6TsqB4qfTKAiknfMUXzA6uVlHvZo9MI+qBjdc6g6nx6QLMN5?=
 =?us-ascii?Q?2VmvhQc5ZgHCiWZeCPpzyzt/dt5UORz3hOM/1Za/g6M0+A1kasGpSH4YDPh8?=
 =?us-ascii?Q?ZIycNNnZ3ilaV0dpwviUjd+y1GeW3Z4jtnQ9zgWeq8env3jD2kSSzxSROa2/?=
 =?us-ascii?Q?A09VrFo9zVnrG8EhI2U9yPwmO6WU4WNMqmlFb9hD5Fr9upF/DGVOViSypFZ9?=
 =?us-ascii?Q?2oW4JG/Ys7Ph+v+p5Br82g07DHck2TfiqRW2uCdfpj6xZJ4KSdDdYGNXVZJg?=
 =?us-ascii?Q?73rsjsc/UDwtlKY4ekvxRValwoccWxgBtIoYuRNbUMWYbWadmP4p/qpCzRlj?=
 =?us-ascii?Q?qYapRdN2u0fo5rP4zJve9OXuh9zEFJtnK4YKDztHK1Fl0/glr4Idj56nfZxU?=
 =?us-ascii?Q?z9qMOCm0t3rfS6pOgI02JrDUUx4uN/5K7Anb1o8rorljQtBSLRyLDji2W62f?=
 =?us-ascii?Q?b6WPTqCGFOhwsUwBqUtcPiC/iKMYPH6oEhfBiJ6jkzIq4xMQemriPAyrh57Q?=
 =?us-ascii?Q?KTEzAITE/l4lbQlYYJXQrs627PKQ1B987kLV6pDHoglq2HZDbvo+3MNNH7ny?=
 =?us-ascii?Q?dKHaTcA6/J9iUFBpafsODn+aGuSxgnDcWEUgtJC4jY0Aa4bjj4c8jhypyLvA?=
 =?us-ascii?Q?+TIBVWGN0YyCOt2nuamuwRq0viNEXJ25JpsKZWIguOPbZHiAMIuljaGLn3rc?=
 =?us-ascii?Q?1ctDyo7oqSuvcmICYjHHzCcONtXDOvalTLw3asXOyq5cIpuHjMAVYs9+Str7?=
 =?us-ascii?Q?JXI2rWjX2rNo2ai+TewbWUq6ZR3Q6pM+h6/CPkU58Xkz1qtROoC4QIMmJGOQ?=
 =?us-ascii?Q?buOVmZc8HB2hvjFYkm7ZEV9yuMG9CfSJhyZNmyrPzliHmF2CrCNf8q3dPw+C?=
 =?us-ascii?Q?GGLEiK3rjpP9McyzNNex0xqjHGVVKLFba6WEpHnGQuKuMsg2h96EFrrVSsOq?=
 =?us-ascii?Q?3JwOLXXHxkun9H37w286qW6dOSJ9QxS8vQ5Cqlz0ZTOD5LKXxtvXZSMU2TBv?=
 =?us-ascii?Q?IxggcyDQK1Tfe/5UUYCi4+FG4zPPlvU821cknfp4lrjQx4UNBVnapd09YNz4?=
 =?us-ascii?Q?9PiiXn/15hs4xv4z1I4klUDO2ku2rW0hMuvYrmtZW+Lj8b9505zNA69Jjgzz?=
 =?us-ascii?Q?o9kcS+VCE2beL32n4pq/l1/IJbLoYlxYgIYEdkYwBiY1JqERMinb1BIKUwei?=
 =?us-ascii?Q?ZKRQiIasZNiDaXbi8vGnyRZXdtvRclTMt0N5EYMVwqgtb4+PXYY66JJo6xLX?=
 =?us-ascii?Q?sBLahYgTRzdgz4gzmXgE9FGB9nwFkRjHOjet4HB7y9ULDuLc6k3l/zQYvA8n?=
 =?us-ascii?Q?WSxO9WKvEVWaWHrSfzrMK9u2nY7S0cI9cVne5e00q/n4B1X8wok/7fHFkTM3?=
 =?us-ascii?Q?1akyMeWLoRTcO8k8eTfk4KRc1O9UfRPFwGIq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:09:27.6093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548269d7-8772-407d-2a1a-08dddbb18705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173
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
index 4f34a1b0d..fe0037ae5 100644
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
 
@@ -39,7 +80,20 @@ typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
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

