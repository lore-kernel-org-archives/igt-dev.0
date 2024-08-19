Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A960DC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4443C10E46B;
	Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YwKGyJrd";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B852710E468
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPbmep3HrqOE0IOoebVkgdjEqkMW6s7ofDiCDzi+4iNSjNXkj60r+xHTbKb7YvKyL6xa3PeKgBLE9qGH4gQxqduCa4trbJz4CHsNn0AA75lMCje6D06lkncbn+ktBWkXkdT4P1G3pAsg5LX6bSEniehbjMtBwtOVnfGlGp3jTx1MNZiN+oPG/gaBvXdxhsgVoYu3fPuP6f6GetpjwQ9uvUE7JVSaSWpK+0ZLGCxRpMLOiVAWqtFxvYtgjW0UpisyYm8rq8GdAOJDoY2yLlBGeGxitFiKA7ohaTbkBHSHVGlwbaZkwieQ5xQwt/PoxyFyHYZs2oB6BpCpx9gpMhjEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3XlSoU8WnaNNEWUODYqsydBX0TdITioHAFrh5NuuuE=;
 b=Cnah3TKRWLTh5ynJmK33L0hBcCkVIXQdnB0cnQu13X1VDuy7+Ho9QhAHOEa0Ya7Eq8szJYOVqlUocMHquxv66QH2rnnytdyMiHriHqoPsQHHX62fKgoQ90CyjHbQyAQPjSDjS+cTFQ8y1luE8QSdDN4mF0siFFS5eqsestLc3VIJ9yCVIzw4mZK+23XDoZiAhYoXVdXw32cMbiri2o1V3qA7X1pfRuBA9eDDupB8MRGI9hGVkio/R7izFbrcSmuH69AanW5sSZpFkkGxxjkpd6YQu1KCDYQ6AOs1q7W1JZrJ0FI8kQk7DW6MJsZLu+3cqLMhKG1uVmngErJW2aOhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3XlSoU8WnaNNEWUODYqsydBX0TdITioHAFrh5NuuuE=;
 b=YwKGyJrd+Alle4FN17BH3BYXhXlScspNJzAQYNgM8EA51jjMdqIBB6taJIr1cGmteaambq16x9KoJqMzMmnxQs1hU6DlA+zn/8R4ygQ3VyU59hWU93PgvjSt3JF8l67y+PfP3C31SAiEe8XNYofB2v+T3RF1dXprjAcM3Dfh54o=
Received: from CH2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:59::22)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:38 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::3b) by CH2PR03CA0012.outlook.office365.com
 (2603:10b6:610:59::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 14/37] lib/igt_color: Add support for 3x4 matrices
Date: Mon, 19 Aug 2024 16:58:00 -0400
Message-ID: <20240819205823.316656-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: e6810f21-88a7-4140-9453-08dcc091b2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C+ZvMMbECEjiPzxgoM2WBNq3WhmMf2n6CHLAf3f89fzURXzKMp46CcXofs9A?=
 =?us-ascii?Q?eGvD9nyN2nIDdL6IJ1leIVC6Gm+UCFxABDiPTgWcmRVqjXqcr6mmYmtN/XBU?=
 =?us-ascii?Q?zYxBYlQ6gnRKZwUELwoZ+fwSAFiEIeAzlonY06DWpJrUWP22odxcErjjt2m/?=
 =?us-ascii?Q?YKN1Rm0myRjEnRzUuGRr+LzpiqFzoTPrltJ/fwQc23ewI1XuejcsHRg27RTR?=
 =?us-ascii?Q?sNKJ7jKbqr/KSMOE4vykpGk2Iu/J/7V8nEJHLwCYq3Caz8RVKwiTTwBEs+OQ?=
 =?us-ascii?Q?udGesR3c2pxhZGWG9D27EfuJePougxTB7qXgJZF4JOjZpSjSVUHIpBO6pupM?=
 =?us-ascii?Q?NT6u2aFf4eki1q60zmujEbJirMEIvQcKXS3/w8aGyHv0QHaEvSDP33IJeJ92?=
 =?us-ascii?Q?74DD1WW2Zd2eBihE47Hy1NSXKnY45xN0NRBPZpOKzSbEFidpjtsx3dpafqu1?=
 =?us-ascii?Q?Ewka05BHE39B9HW8TF3wONmGEzU1gPtA9s7FV0N4zpI4NCckawLas/sXA+fn?=
 =?us-ascii?Q?Jqoxm59ONLNGA7fY2f6a+xOE4H8cOUHdnVDIM9AajPCAykEckBjAG6jv0v89?=
 =?us-ascii?Q?GoQpJ7NVbZwO7Yd2NegmrXLvy/CpkAuTYxgSZBvaIZDvYsfiCiEC6zDGCU7g?=
 =?us-ascii?Q?tmr2K6qIPIx8y/XlMJK2VySuCsXJlF0Cf5ftxuO2ZS/gXUsTgCDArS78xKwS?=
 =?us-ascii?Q?43S1IhGz6/QAWh4XIvG01gkCqGieCPzwLSPiEenLaxhNpc48eHu6NUX1JtUT?=
 =?us-ascii?Q?Ki2HbD6mBDz3mjqiMd6hxa+OWwPkpSpkKuAXHOhAX1AcpZdUg9h8KuH/s/LJ?=
 =?us-ascii?Q?ncH26fdVKOS1puskuCAOmNmii2RPjyzKpzEgNXm05P+rnMOOl7EfF0B0LfYI?=
 =?us-ascii?Q?aQZta1tI0SxW9c2ZwrbgVPZD/nVynTti1s0MdTipBc/bUMCMfIHNwG4h1F2Q?=
 =?us-ascii?Q?jHYny6u1pMa++2NDBqPINmAN0bWEpil/43NPs1qCZZuqPm/dHUJYQ6WdQMYP?=
 =?us-ascii?Q?EIDXUI7vtf8IBQ6DVf44Bs2CDq7DQabAZ+aQgmtUDy6DJ0nGmnbO3nUVXqEG?=
 =?us-ascii?Q?sMX2T3H9Q6SqBqujtt2pgJHluWYXOeCS3qjpfNeCYnVh4KNhncgfifDvmSRN?=
 =?us-ascii?Q?zovYgvSKNWjl6yAPoFd0PoZa04oEra7HTM4ldeJJ/lqp8ollKeTZ44leiJjQ?=
 =?us-ascii?Q?y9ZKJTgZDHqDSQGa7Ls06jLweiyjY0wI8h8QsW9cQmpk8tBJw0QQ2VaigKF6?=
 =?us-ascii?Q?EA/a7CDjX6vvma3y5ap9V1VDx4RAqWolsJRjdz5qSyFpuATfhehvOIqsQlho?=
 =?us-ascii?Q?w0YgKjBLWYO+B0epQSVXyAJO9jxcyeFmgGb1KvDlvpRKpe/bs54JCi0Ja8Py?=
 =?us-ascii?Q?zQZvlbVpuTrJ9ugNzaf+1xH+V0TbkFVHjKfkl6xbvW7w4qKjRDO07NFHzcn1?=
 =?us-ascii?Q?Dv/w0u1qyXZlgz5J90Lx/ElGcg8uMfmv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:37.8776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6810f21-88a7-4140-9453-08dcc091b2a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530
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
2.46.0

