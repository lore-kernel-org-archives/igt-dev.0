Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF1CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36E10E8F5;
	Thu, 30 Oct 2025 04:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PdNPBLdl";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011035.outbound.protection.outlook.com
 [40.93.194.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4996010E8D6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiE5Fq9K5Z9bvznlPlTS9dSYg52RNzgOYIJ/7CVrjmpOyrqFfloKbhnJVRSt8xKSv41LbS1IiOkom01vz1tlz5/PhMzodhk4j4z4bpNuIukHF9LMPr+k6ZJEBuFpOKKQaNbBnekElDoNyt+Yi9Fn4k+KFTQFsVslCwUAHT/+PAaVgyPufp5rGQvbSQ3kOHgR3Js5Qi9j27Sx+jnpQgtqmGlBrXRzrz+RuzZH/IezQJfT6NXHulV0u4tUW9hW/FV03Om+iCpbJWFX6wFgyZi8M4sD73EHS7wFlf8Fo74dhK0TAFALVA4d7JUJfzxAn8B/uhFgmrSqtNUwuMo6lZNnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojkr8ZI1mhueueAsb5zDy6XGbgm8PYlmYkJls3/VmLE=;
 b=AD5aJoGhjVcIhUmjKjlznOZBawrBbuEOFkqB0ecKWWuvIr2KRaP7dBDD05MOV4ib523v+w+w6lYSy02ttNa3JwrzRgwSMg0nEUtdoVm8vfkkXpMLNRbj83vKUfmuBSumnKIba8BcKF8QabKAZ5+/WrgY+f6U+aVOCDgQxbg2sVO7wG3/0wv9OtF95Q/yomieOGw4hcytieN9UBE2sf08FaG7rHbvP53PqxC0nIZqWAd9aI8zKO3qXg2H0BBJEVmWfKnt6WgXA+ZpWkma3AHB7VrZFE5AF3X0kKEDHfe6dYc8kJ1fCPDKzjGyoEA2BBcTP7zhLnb8ZGoYYZ6IuDc+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojkr8ZI1mhueueAsb5zDy6XGbgm8PYlmYkJls3/VmLE=;
 b=PdNPBLdlw0gOEHZ0ehVjpcliowPrDzyLynWgLKdeZcdUeSn0iQ2FZhGNzbbL4iiyy9Mw2oeOw/AoPAFR2ZuoRRaegMDoGRO39L3559yyxblI/Sw5HwBO9w5SWp3+N2Hzz67+boWjkwbytYF8g4cmxmjVSKTWjF0Rz8EsceX54/M=
Received: from PH0PR07CA0088.namprd07.prod.outlook.com (2603:10b6:510:f::33)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:32:28 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::fb) by PH0PR07CA0088.outlook.office365.com
 (2603:10b6:510:f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:32:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:32:27 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 18/32] tests/kms_colorop: Refactor to use a subtest group
 with fixtures
Date: Wed, 29 Oct 2025 22:27:47 -0600
Message-ID: <20251030042801.2315866-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3843480b-69e1-48c8-c011-08de176d5540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iwWSTR9hNI8y0LnoTjDhbh0vkrLb9WVjrCGWRZ0oxAypDeGwh/n0tTzmT8z8?=
 =?us-ascii?Q?w2nGpOmRQxV2vqIffcnPm6qigEtEDmC3mCd4uo83ugl3nNjELWVbzRirUDWC?=
 =?us-ascii?Q?A9/LrGMr8Jrjpk/V1ky2bbkoWsaA6kFZM3X06og3cXjwVQljL1NqxOe6Ss4y?=
 =?us-ascii?Q?5kmuY7RqUWs9W1A5gxUhn3gyy1c11gB9yGbLTPTlWDoQ0djOJdP98d9ByJ20?=
 =?us-ascii?Q?U928ExQn2BWSAhe/U4PQ9Bv4yFdnwg9SoqWlZTN8lWHwyF2zXD2V9DPZ3H5g?=
 =?us-ascii?Q?KR8C43OWUM+hSLyLRDkg+do5P3MNfr7cJM/WSC2RnBS8/RwLw+j96O+3Fwka?=
 =?us-ascii?Q?kqVO3Q5q+0rrZpkYBT4N3yZbDRkcn8yn6XyHqs5/9O3rV1gTp0gkdtC4yEB8?=
 =?us-ascii?Q?AwcA6erLq347MNI5o+A2AJ+y5hrNKBGUMotjgrz/DgVag2okOBwkM8sq6wxK?=
 =?us-ascii?Q?Ru/kVQPa8VPuWyEPEIUAQhAuUsul3hCOiDpq5c9IcdZdYLvJlX+bftGUetKH?=
 =?us-ascii?Q?dDxe31OXvBhgo0XKuKQdgJtxl6nvNrbmp51lP0KuCcmokIa0ArVMOwrXHqy+?=
 =?us-ascii?Q?gt9zj6yhoK9lz8GcFC09di1fqHHuFH0BYjd8mjbaA+ZftUv8zoQCX9SbMEx7?=
 =?us-ascii?Q?IaY2Tc3p39wyKorVYf22ooW+oGEQVsTXHPsWwuwN7w5OEU0aUh1/wcd32Ls1?=
 =?us-ascii?Q?Fm1PBP7/jb8VxdB/EUHqaDaTTUGC3VgRr3VTnntN+SxnsciRognkC4vcs3mN?=
 =?us-ascii?Q?gE4P4rD1cwbtYQY5XIeJ4ovf+ZcfQOCgvxiquRFErf0I9WeoeGiSAhv9xeLH?=
 =?us-ascii?Q?j1FIvWgc33Ev0L9Pc2Uhxt+JZcE9e+qAyNskd+6NbW6PzhiggvIlNPpV9EiH?=
 =?us-ascii?Q?93JZTwYzAYldqEPjrqZwO8PhOnfrzeeuqMLFORvAESQkxP9pWsQHP5mwroeM?=
 =?us-ascii?Q?3B8xHpRuBq/Q16CT77XdEyEmPwjXvPpTemDjSJOxkmP0TVS52q3QjQEdQs3M?=
 =?us-ascii?Q?EQT0c071kzaJOGPxX0GRPGSQ1VA3bm4cpdmNlHrMLXXuLP9ndAyPshtSyp5L?=
 =?us-ascii?Q?U2yzCa0MdbHjt4aV5EU3qCrTNIfMDi3d2kbvfkWbeOJTuqijUbgF4KME4ZvI?=
 =?us-ascii?Q?skW46D4oIcGWsSan86KrD0/3enL4ETHp+zwnlpO1jHd7F3qi9IrWjt/19084?=
 =?us-ascii?Q?69WsA78yEWvHS8gPnc08ZfGueJ9YhLUuk86/AyU9pzmaQp6FHU0GHZzhvogT?=
 =?us-ascii?Q?coDg7tTSCTmq3CGFSDjwQG7jFT3PQG9VSwKN3WLfIywsoD9oLrmy9suGYyCj?=
 =?us-ascii?Q?NqJrZtGvZzTtBxX3MPx8UFHgR2AfmUSc80CHOUziY5FCgRUccny9nFmzmpvH?=
 =?us-ascii?Q?iks87NO1SGljb9aiQ468DaMFfxklbe3hZA0etlUmD+wpYoQTVDOiZcMnmdH7?=
 =?us-ascii?Q?t/Y8HMMiWVdL8e1i1iGqJlyhWDckylAJEKSJISB9i9Ma2fQbS2DYxpyy++dK?=
 =?us-ascii?Q?8eNw7BkXTKye2Ehy/HWBVdrxqfqaj6NpcjLby78AQHqjHAARCUTY2CJxz8XQ?=
 =?us-ascii?Q?eKnaqTB1jOxQz37WOig=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:32:28.1767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3843480b-69e1-48c8-c011-08de176d5540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
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

Refactor the test to use an igt_subtest_group to improve code clarity.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 139 +++++++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 61 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 31a97c48f..f361018c9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -320,60 +320,28 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       igt_output_t *output,
+			       igt_plane_t *plane,
+			       igt_fb_t *input_fb,
+			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
-	igt_output_t *output;
-	igt_plane_t *plane;
-	igt_fb_t input_fb;
 	igt_fb_t sw_transform_fb;
-	igt_fb_t output_fb;
-	drmModeModeInfo mode;
-	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
+	int res;
 
-	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
-	igt_require(output);
-
-	if (output->use_override_mode)
-		memcpy(&mode, &output->override_mode, sizeof(mode));
-	else
-		memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-	/* create input fb */
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(plane);
-
-	fb_id = igt_create_color_pattern_fb(display->drm_fd,
-					mode.hdisplay, mode.vdisplay,
-					fourcc_in, DRM_FORMAT_MOD_LINEAR,
-					0.2, 0.2, 0.2, &input_fb);
-	igt_assert(fb_id >= 0);
-	igt_plane_set_fb(plane, &input_fb);
-
-	if (data.dump_check)
-		igt_dump_fb(display, &input_fb, ".", "input");
-
-	/* create output fb */
-	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				fourcc_in,
-				igt_fb_mod_to_tiling(0),
-				&output_fb);
-	igt_require(fb_id > 0);
-
-	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
-
-	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
 
 	/* reset color pipeline*/
 
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
@@ -381,14 +349,15 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
 
 	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
+	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
 
 	igt_assert_crc_equal(&input_crc, &output_crc);
 
 	/* create sw transformed buffer */
+	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
+	igt_assert_lte(0, res);
 
-	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
-	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
+	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
 	apply_transforms(colorops, &sw_transform_fb);
 
@@ -410,7 +379,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	/* commit COLOR_PIPELINE */
 	igt_display_commit_atomic(display,
@@ -419,27 +388,22 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
 
 	if (data.dump_check)
-		igt_dump_fb(display, &output_fb, ".", "output");
+		igt_dump_fb(display, output_fb, ".", "output");
 
 	/* compare sw transformed and KMS transformed FBs */
-	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
+	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
 				NULL);
 	igt_get_and_wait_out_fence(output);
-
-	/* cleanup */
-	igt_detach_crtc(display, output);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
 static int opt_handler(int option, int option_index, void *_data)
@@ -515,21 +479,74 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 			display.has_plane_color_pipeline = 1;
 
 		igt_require(display.is_atomic);
-
 	}
 
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {
-		for (i = 0; i < ARRAY_SIZE(tests); i++) {
-			igt_describe("Check color ops on a plane");
-			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
-				colorop_plane_test(&display,
-						   formats[j].fourcc_in,
-						   formats[j].fourcc_out,
-						   tests[i].colorops);
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group {
+			igt_fixture {
+				output = kms_writeback_get_output(&display,
+								  formats[j].fourcc_in,
+								  formats[j].fourcc_out);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				/* create input fb */
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				fb_id = igt_create_color_pattern_fb(display.drm_fd,
+								mode.hdisplay, mode.vdisplay,
+								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								0.2, 0.2, 0.2, &input_fb);
+				igt_assert(fb_id >= 0);
+				igt_plane_set_fb(plane, &input_fb);
+
+				if (data.dump_check)
+					igt_dump_fb(&display, &input_fb, ".", "input");
+
+				/* create output fb */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats[j].fourcc_in,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			for (i = 0; i < ARRAY_SIZE(tests); i++) {
+				igt_describe("Check color ops on a plane");
+				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+					colorop_plane_test(&display,
+							output,
+							plane,
+							&input_fb,
+							&output_fb,
+							formats[j].fourcc_in,
+							formats[j].fourcc_out,
+							tests[i].colorops);
+			}
+
+			igt_fixture {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
 		}
 	}
 
 	igt_fixture {
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
-- 
2.43.0

