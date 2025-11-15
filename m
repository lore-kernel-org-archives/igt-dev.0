Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB947CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A4910EB82;
	Sat, 15 Nov 2025 00:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LdjJ/xne";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010012.outbound.protection.outlook.com
 [52.101.193.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404910EB82
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=payX4sehyeK7SJfDYnxPMNhpPOolHeTK8BMLrskzJ8NgyTQlBrwc/NtwM2v7U0HnR6yVihGP7dwA/rENe//UpnAegwf6a1c6Lsaxh143FBP6RvkcA/wN8itrwZwAqQq/ac8OukMa+lRptPibpaiZxTFR+XgqrPKlj/a425t13/ys1KsCJuNEymHAEGa+dOphhswM0UbBt+tv0+qxgX/Com5bLBnYdVb1ypMyvjCiszSWuSDnrcyldSIjbS2HkmbnTNQf02poncjWDT10F3jRyDAMI9jI/EwuFcL3uLMM5G3rmoqg2hfWkZXvCNG0DSvxbgQHlhPf9jnw2DK8AfNgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLZFLGY7DIgC6Jcke7twy0xpYibB2IDAa03Kv9kDhPM=;
 b=fEmu3UUWnwL6eA8OUHJe7z/QmpLHqwFJ5DlRTcakAyhhrwN2cTWdd2JIbME8//j+hB33AurapfMkRBz5ZL+1uZqV899CUUEDgVKybfIE3A52ODzEh0E4VdYt0537w4PrV+iJh0szWBKPD5oHgBK9PKjBafypBNiX2VkJv+5nUtgYCw8Pf+EnsfMNe6SPjWmP1AJifCsrVklQznQbmYkElenF64gtiR+qLaUDjealaUO6sbBJHfhOkJp6kT1qRzBQ9S6OdBeti0+alnT8y5bcsVpJ0/y3SJuSvWY0XmGr6wUhEvp9Wu/8DyScem1Q5hGc2r+sKj+zgIqr35um0ApxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLZFLGY7DIgC6Jcke7twy0xpYibB2IDAa03Kv9kDhPM=;
 b=LdjJ/xneYDDWQH0N3w+rBTG/S4kuisf53icBgepwPpMXl+UY7r3zqIcsneyaDpUcpHTnn5mV4CW1ZHdvTNfo+ZLNCPMF+KLG6OdBjLDgEjgIC34DUHyu6SJDNny4vn4rXSmutAnOm2QweI3YWYeG6yzF6VugRd1LqHh9TQOoJLM=
Received: from MN0P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::30)
 by PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:22:31 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::cc) by MN0P221CA0008.outlook.office365.com
 (2603:10b6:208:52a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:22:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:22:28 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 18/32] tests/kms_colorop: Refactor to use a subtest group
 with fixtures
Date: Fri, 14 Nov 2025 17:18:27 -0700
Message-ID: <20251115001841.3563993-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2b17ff-a02e-48eb-544c-08de23dd10ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M+iexb4Fcs/y4pgi79+yaRosNrCF+ZP7hfD7W1V2habl0iORszq3G1kAZCdn?=
 =?us-ascii?Q?6rRwjCVx68viEivwWUQnCDUO4diGYUQeoipbpx4manyWOvKXA1jKH5dw2vA0?=
 =?us-ascii?Q?0JZ7IxBvUNZO6rOnBTjEbHODik2A2odKY5sI1PbF2tld84vH6nGWfPC4u2o/?=
 =?us-ascii?Q?XvMlmosyfHToDWzfpyuUs6xCebU/+tB7TPI1cg3oGNxo1Nk3TPp0P2FetGjD?=
 =?us-ascii?Q?fY2aCLDyyHKIhIyqA+qVh7Mr2fhEhsLsbG2wSHSJk56ELA4qDJZ1puWDkiuU?=
 =?us-ascii?Q?giXnnjQGk5bbcvhIap/GbE7ugFWGsHkkOYGDaD2b0nFyBHEKwE6onjp/i5tE?=
 =?us-ascii?Q?xsA3Dg8QwGGK4/wtqvYBPh92SrgcgfctNYZVfLNrCqlumZpPw6prdXpTQZPS?=
 =?us-ascii?Q?viAgAoax4lNbYWMgDQoIFgiG7nKJjxYNMdPA+bau16/mKxxD8sn+GqNZeEH5?=
 =?us-ascii?Q?mgXL2rw5yuj7tO4T5oO2aDgSmZERJqYJ8Fp0JUq9TvvbBPNyVtdNRt/LrQ+N?=
 =?us-ascii?Q?iqMxP0HUknDj6zr+g6nhgDafFmPAiKBAqpQlq3e3kHaYI+lW4oM1+0dzQXD0?=
 =?us-ascii?Q?fPou8o1+5dfBaXK6pe0JprEQ+4LTSAbyhYWM4eIjh/Z/7cn4U7eGHIHc3tQW?=
 =?us-ascii?Q?ZC0jJQRHM+fJFMe0eBhJvXNR+AlDz2E/0vYg58CKalC+gQTVKLMYdI43K2hj?=
 =?us-ascii?Q?mP3Q7voJQLbfW1mE4IYdWkr6ZsgExoLovxqGgapYh8FX0SmycQZkFXxunFAV?=
 =?us-ascii?Q?orEiDUp2pkCChOEzuWiy3O7l4jzfBYoLr65soy43Snw50nmRWSq2TVug5NV3?=
 =?us-ascii?Q?wNzaK+PA93PdROoADC1ZE0dz3g9nh5Zdb9YK02T3U46Z9UCgT/1Pp0b73WjM?=
 =?us-ascii?Q?K7Lt2of0ofq/5f9TErG+aJGNg81gnTVnVXo1ykeIBAP8lnc7IC3V4OhYXgsh?=
 =?us-ascii?Q?yeVhDUZ6jWUqR9M7EZ6+y9cgqCUAq6dV6Fd73W69Tjj2EVX5d5l6xiX526y4?=
 =?us-ascii?Q?CPRNqWNz52QTXahUMVEf0o+gjkQ2JIl1yrB3BA6Mkyz1uhtjcg5vGpnk4VUd?=
 =?us-ascii?Q?Ru9QoX/4+UeKWkK7zySO62J2M6RJ5kHqBFIRcuwMT8uaYQvNNUEn/U5AZJdj?=
 =?us-ascii?Q?xcOlbrCUPEZeMmZGArn1lgJBxVKe6mGuAUwtAInV8JOWmWbpRd8/nH+H9kGz?=
 =?us-ascii?Q?FmvcLm4GjCeFwHxR31H788RKGb3sd7YelJjY0Xy6QrHCbmSeZFcdsK5cc74A?=
 =?us-ascii?Q?0WiP+GRHX5zIhZnwKAf7d8Ylsjbw/VhlHOF9k9sSw8m6u3rhizUMa1o7lbk6?=
 =?us-ascii?Q?YKnOHtdf7WWSrAMl3zN58yB0kOYDz/yRs9kqlyf340mqA7LLI+Q2jDKunkhL?=
 =?us-ascii?Q?9aKN7MszCvM3uf3FnTPoOCBywLk9w4mapCYqzPQcN1BNgyzjl0b0/wGxcLF2?=
 =?us-ascii?Q?IwIDStG6UoUGj6qBEXxBlQDp+9C8aggoHuEB3wxVFcQVdMx9zzrIrV2jc5el?=
 =?us-ascii?Q?CCatseiJtgW8gkc6nuJOZtMaUZcPKwdC5g2/y6WYK5GF9pP+Go3dxYChjUEY?=
 =?us-ascii?Q?h6G0ffrmbu29wO31Rlw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:22:30.8134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2b17ff-a02e-48eb-544c-08de23dd10ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

