Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46B9C54E55
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DD710F291;
	Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="amU00O/c";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7D910F290
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQStr/UqcqieiA0sBsw15AGzDapDrYDN82ytg8LZKuQM+PgT6JzbXhb914RhUuHAEBALZ46D9Q12EclRBsQY2HDRmwN6OdzPd9GGvv8FVMxx38oPy6yPJE0flQSDfz2sItil6D+tGrNUYZLby6aUw9odQoypHgSEK24OvIhIvbwz4nC9mrtI5w/t2sFoY1CScCCl1GCOyRjzcBpo2v1v8GS0K51dflIcAoR4SUxo84cT5EDBEuZ+j22zu/B0EtR09vSkQ2aTBpfspGch7buwk816FYLRXAmUi2uLLytKkUWvAaSXBZbutM4V6pWyITHsoxKpgMGtd0WtDKE/MD/ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNdFOH7Fj6JwV+3kJjLjcekkP2kThhaULOCFSY6ZlUo=;
 b=c9N8e+OXGIyn6pWA5LVdZh3ok3PhAbDzkdZSiPYzg5fMzcbNxhT8DHv+M3ZKCnXh8wgCng81qFZkE5vUbCrrcgbWfHMvIWKHnnrjf+QfPZSiKjrsAssNLE4SB3pU2wM0GQEK0u9VoKziL959kWETe38ucJ7LkDtZSE5MSL2cww1W3MMuHi6uPqT9WVY5ULqST/5FfoRbsSC4s2F2i8B3IEw1gUB0OJHfikj/7m7tqZ3TCEDhBrVoAnyLgpfrC7JbMpl1aQLc7b+b1jQLr168KowMXLUy/Kp+V94TXXOtuT86LsItmVjvZ5ChRLyfH37dJYaCfKMPyFz/kvHf4TLwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNdFOH7Fj6JwV+3kJjLjcekkP2kThhaULOCFSY6ZlUo=;
 b=amU00O/cBrX6Qj43wCgGoU2mO4BgP7gB0LAjIzf8J+J8AdURveDjHzVvlHjvGQojVri0GQsDkEoqMZZT8LXv/OJ7pCRnjjchFfPBK3Kn3IFBei04mdig0AAKd+U9ZPGQO4BTzHBFCb0zdvUVDWGFcLgqQ8VXj2tM/L+DW+71alo=
Received: from MN2PR15CA0019.namprd15.prod.outlook.com (2603:10b6:208:1b4::32)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:38 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::23) by MN2PR15CA0019.outlook.office365.com
 (2603:10b6:208:1b4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:36 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:35 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 14/32] lib/igt_color: Add support for 3x4 matrices
Date: Mon, 26 Feb 2024 16:13:58 -0500
Message-ID: <20240226211416.100660-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: f48acb96-fb0b-4e65-0e72-08dc370ff096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDvXrVr8vFyFoJXHNLg3vJfwGUwSYVxtbRZDDomaDgQtarGGjctfaNCitVtYgtmPJJxNATF5UbOnxT6tnole9/0qXVMma4nQIthcd3f7IWHkuhn9j4A3inmWARMAHU98QqYJVLFZW4JVdU3sOYaHEIOWk8S0bpRJ5T4cRkUdYGn8yYpAy8DdTqwOBwMq3Ga73dCAfYsYYxz/fgndIQlceuYkndE01UQgpDMvnnknxvpHiUfw2rDkH6aSo7Dr0pfL9gJb7Z7+6sLlhVHdYoApe+1JiQcKJ1sNliFXiVMDivP3uPAj18NUtSAoH2VP1aroHQlIt9cAtcGprHA9HlQbdlL4T1lma+3gvdcGgt0nrdZ94Uv+ws9smD2xg2tU60cOcRS52Ys6rVsA+UCPL+DBq+KmEYd1QjtYj4qWdzFm8JLzxl3LblS1Jk02cV7ARzg4xS6HiaH1RxYIMMaLl6Vu/OKYTN0Ycxo1dpUQJwwFmpLCVAwiMNIvxpOsVs40iSITW2exKiiq0ea5jg/vKn7awOWcB9zKKZtf3+fdFEbXBtqp118l1QqUC9tEVXxwG9KRXVKtduBl8IcYWnjjFWedH87GR5Mamlt/gWnuEZ0n8WKjrynJ1vlcBajcPOQn+IJFG4l1vlGPqSPe1xxHex2NjJc3g7aaogphReHdbTawP7c0lxe1okBsAJKRMzoPYuzdJOT/r1Af2URPpE/2KN/b2F0jY+yjqbO/gAsBi7di1WnvlzMofZZsOcpAn3H/Cqka
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:37.9702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48acb96-fb0b-4e65-0e72-08dc370ff096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
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

Also add a few matrices for testing.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_color.h | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 6349f2b15a47..5e1374e4b792 100644
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
index fa9f6cf42991..d218550f6dd0 100644
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
2.44.0

