Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12EDC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092C410E469;
	Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OLJYbC/9";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F013410E43C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0L6qHqyuZqJrjdLPqlo5JGiqemKJw1XHbyt68UbWcIyt/uKImLGyiHuZM9Qjhp6nkeE2xNiJPTO6wZKChLvjCxKbyAW6AOZM3fxiJfpH7QV7sykPm+WgX3hM7x5Z125j5U/m0mas3WGFrohLOMp6sO7Q/Ewj9DdWbR3fuoiQ3sgQkjFTqQ7rYNCM+LTMsqctfigpcJbJctoeuO5htN1h5gvgEz/AXHXeBVjGw6BeAE6UQSL98gNrzXNJIQajZlnHbI8kgX9YELHq4TpOSwPWh0j/LhBgqbqHGAGMvBb/SKArSZFxHCeWX2sasgMOxtf5TIUgBqEnHAQlL4WNPJ9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2434KKANBRPJymwpWr8Ob4+Dz4ZT3zq5m7r/CHteEiE=;
 b=MTE/a0JNsiC++XiqlsTZws+1Qyx/TC7Vu+2JwKVDuI0GcX3kgTKyz5G5cYKht5db26aB0EZPG5YnRJM4GD02/nmJAn2/la66G8D0Y90mUVXIybZewPGMdxrXcBeaMsv68dNpIo8JqqI+56g1QRPcoZoIZHh4GHf6B+J0G+aC6GZ/iBkATiL/sR3IBVeTxoey2w9yQ1tNWEtvikcTpCpFeZxNdXtYBMAfxbibpwHdZFFUJK6RyRW6FFb7KUSkBmeSwTwftsRsKC4NmmT4RaHILIPt1P8gscCeqjKsAsefFSKEShVmZtG5hJyeUBT2VVL9MDWi7x3rRp/Rwl2mZFLo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2434KKANBRPJymwpWr8Ob4+Dz4ZT3zq5m7r/CHteEiE=;
 b=OLJYbC/9+5XB9avpsDPSonelgn+LSQKs7pfg4mNQQhC2SpryalC0qRR1nXb2xxhWza8QjOtgzEq1CHcpDC2mxNTUz2tkUg1Eki/osw8Bv8ghPWX+J9h1AB0iIgS+66pDsPkIABwgv3PspzCXEM5UgIgJm1DuGDjaFOUdR0bKMNo=
Received: from BN0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:e7::14)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:35 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::b4) by BN0PR03CA0039.outlook.office365.com
 (2603:10b6:408:e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 17/37] tests/kms_colorop: Parametrize the buffer format
Date: Mon, 19 Aug 2024 16:58:03 -0400
Message-ID: <20240819205823.316656-18-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d1bfa8-a087-4891-3bf0-08dcc091b0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6VhGNGKIyd3yxEnVBfn+sDbTdJwOfHmDGtCu1e88s4ZrmdXKyGJFfRKIzN+S?=
 =?us-ascii?Q?zOygwQueBFwsHz18mf+ppv2Df/s1N5gsfvt/3Nhq6Qtu+9pE6YHEunGlp5ET?=
 =?us-ascii?Q?Y24LICj5cI9QaWKQ+k9ei4Qp+/kdVf5RZTcqcYevh/KkIX92kh1ydo/5snAB?=
 =?us-ascii?Q?9Z5lKn9eHh1W9NQfYMQMtc/uYqih2cKSfrMv5rStFb5C4SQBGB1p07cib+Ud?=
 =?us-ascii?Q?9sFusT6ozko0CGiOCSAnmtxMMRdQf7wDEbxbqGSVj+w4z6wg2lmKJrBSpsg6?=
 =?us-ascii?Q?+NZdxB2H8DqCADI92I4QDHLkbtp0bIivfAZdFOeMYf4J0pjK9kJD3neL3DYd?=
 =?us-ascii?Q?4HjWzims/5N9vsuIQoIGKafBI6oXgyvltN+vqmkfqvguVNsOW9y1Xe5+jVgk?=
 =?us-ascii?Q?/7+P93hTrX1aB2ChQdQ5pmex/g1b4bobwXAycCK5ulNC8vlMMqv7fcETUQNF?=
 =?us-ascii?Q?9MGHXTp6PcIyRuIrpY6E/tf9G6gm7DXRjT2wpDz+xdkSWCWssQ3z788+TbZE?=
 =?us-ascii?Q?AWATd686eCdamwzTnFkaXFutkGwx7aKOM5UZEpQHEtSkaAu3qXJcxQbqc8w2?=
 =?us-ascii?Q?TNBOvhQ3WHKKjbV+ii3DVp2CsERW8gcpEAIV5Gh0PHvfFDaM8iRhmsJ/EWsK?=
 =?us-ascii?Q?oGW08o+l/rFyGj/pjyR/CCdDkAHZWYu4h1aIDmX5X9+soc2+ixz6h8v/wmjs?=
 =?us-ascii?Q?o4rJ7/roqmkWZWSwvfB+VMoshOlCfMwXW5TVt+SIr1F/0FWKDsidtHuCQu7U?=
 =?us-ascii?Q?QsCqzT8jDYP6Y30Jk63qIXHS26IgWVsd0D6j9/qNArT83jfMzhVNQTk7FyFF?=
 =?us-ascii?Q?18ipKSGFidIApI1nKz2pFVGhX3gKInX0atXAIFXWQN23makTULnUtbXWWq91?=
 =?us-ascii?Q?fs0GJJfIXY/sO4H0amwLseSfm9qVkTJEFIxlsWTSVEHZeyZJPQ1ABnQTlClD?=
 =?us-ascii?Q?uWp+/DvlMRy7sX91GaWEj6F2Lk61NOpZAdoNoasJGIw88N6PW5jwRtU+7/+a?=
 =?us-ascii?Q?YIB6leZGoMEmeK4TEnow5QZteh1i5QIFGJ+58CWDOD3Oc/9EC1/cqppMpC7g?=
 =?us-ascii?Q?eFW9T/LQ4+XPjlHHpp6RsHKRqsyntHDQVz26d+6oz+Vai+MR+yJ5Hc4377d+?=
 =?us-ascii?Q?er4CB2GgfT4g0BqH4SSUd6tuz2msbL4dMbtxQ9STXCFTq8lY5R+1mUMfbhzY?=
 =?us-ascii?Q?4fHOjkv260/zyC4HRkRqyyapGfLgLnFVSVJeYPBoZaahtsDERj31pxlDwnOE?=
 =?us-ascii?Q?RnB40hCfQqSZ0XmKUep1eyF4SrjndHKkiT6wRL/97LesQFmEyuqE/2pn+45G?=
 =?us-ascii?Q?S9CQ43DYSJbRcDadC3TgdPyOc9Q9QnKf4J5iydTWGBWXG4OD+s+GWJZswspj?=
 =?us-ascii?Q?EhkGYFElKwH9EZsXVtLfEQf28uAX8ZafzONZ5L9/rpSc5lRfeEigUYZSQr5+?=
 =?us-ascii?Q?s4Sd3rpHok9UERKSDnTqQJGOAveZnRoy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:35.0795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d1bfa8-a087-4891-3bf0-08dcc091b0f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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

We'll eventually want to run this test for 10 bpc buffers,
or even other formats. Parametrize the buffer format for
both input and writeback buffers using fourcc.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 49 +++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c65a3e73f08a..3a12b84d26c9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -31,7 +31,7 @@
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
- * SUBTEST: plane-%s
+ * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -40,6 +40,10 @@
  *
  * arg[1]:
  *
+ * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ *
+ * arg[2]:
+ *
  * @bypass:			Bypass Color Pipeline
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
@@ -56,11 +60,12 @@
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
-				    drmModeModeInfo override_mode)
+				    drmModeModeInfo override_mode, __u32 fourcc_in,
+				    __u32 fourcc_out)
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
-	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
+	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
 
@@ -70,7 +75,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
@@ -103,7 +108,7 @@ typedef struct {
 static data_t data;
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
 	enum pipe pipe;
@@ -139,7 +144,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
-			if (check_writeback_config(display, output, override_mode)) {
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -366,6 +371,8 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       __u32 fourcc_in,
+			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
@@ -378,7 +385,7 @@ static void colorop_plane_test(igt_display_t *display,
 	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
 
-	output = kms_writeback_get_output(display);
+	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
 	igt_require(output);
 
 	if (output->use_override_mode)
@@ -392,7 +399,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	fb_id = igt_create_color_pattern_fb(display->drm_fd,
 					mode.hdisplay, mode.vdisplay,
-					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					fourcc_in, DRM_FORMAT_MOD_LINEAR,
 					0.2, 0.2, 0.2, &input_fb);
 	igt_assert(fb_id >= 0);
 	igt_plane_set_fb(plane, &input_fb);
@@ -402,7 +409,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* create output fb */
 	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				DRM_FORMAT_XRGB8888,
+				fourcc_in,
 				igt_fb_mod_to_tiling(0),
 				&output_fb);
 	igt_require(fb_id > 0);
@@ -506,8 +513,16 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
 	};
 
+	struct {
+		__u32 fourcc_in;
+		__u32 fourcc_out;
+		const char *name;
+	} formats[] = {
+		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+	};
+
 	igt_display_t display;
-	int i, ret;
+	int i, j, ret;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -529,12 +544,16 @@ igt_main
 
 	}
 
-	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
-		igt_describe("Bla bla bla");
-		igt_subtest_f("plane-%s", tests[i].name)
-			colorop_plane_test(&display, tests[i].colorops);
+	for (j = 0; j < sizeof(formats) / sizeof (formats[0]); j++) {
+		for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+			igt_describe("Bla bla bla");
+			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+				colorop_plane_test(&display,
+						   formats[j].fourcc_in,
+						   formats[j].fourcc_out,
+						   tests[i].colorops);
+		}
 	}
-
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
 #if 0
 	igt_subtest("plane-srgb") {
-- 
2.46.0

