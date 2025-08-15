Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE4CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E5710E9CE;
	Fri, 15 Aug 2025 04:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3Q/bgShf";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9B010E9CE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2kot41W0svcPdcFLBu1w2R9cK8KLGZ6S+WeSaPmlvS19DW7l7GRUx2q88jpB86J3+JYsYg5nZnDQI7SIlJMiu15V8St8AGS7qq5Y1qc4xZg6F+o1mbF4l8AropSTbl1fHkzWuzc3n7sUfUGnRS2o6t+Tzx9urhiyxovCPYbhyPGpZeoqQxMj8m46ebIwsIyGK9vu3y6yLn9PvVPrHqwp1Mxk216zGxJPbeK6DbDRUy50E9mmY/dlaIfx39Qd7YeV/iF/N2/pMK0JQm5hqNv5IDXKnTmdoEPVMQsCjA2NKbEyKlQIVQnHkESX5UomA0Fn5N6K9wMBf7QlsB8eS1Mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob1+FTnS2Ph211AEi7mlaf+5DJ/DVVnpqp9fb+H9hqI=;
 b=eJkxNHLsACQDjHnWDE6lzgI/jEKluDMvkYAbdcoMPTi/m/Dxp/Ze6Pe1fWm9WKPC6vio/u4io0HXOacrEjT7I0VLHcvmehN9CUWgwdmGYf2mQ00JeR6dJvt1uK0l4EAr9jc5RsYv3YDhNb/CzKpbn4Q4KEO6cN2foHGahvRnlHqPz38nz2b72/zoKHIUgmqhRzSsSoWnJG5i655oFj2ikUFekkZ1dcDsbQx9QUqZ7fbbFEv47YKnbaQrc4osbX3gCDcvP6OF6HBDnVJxIwVwUgwbcA28CBig6PkMPR1CFF6mRG2vyHrigbgVCGxLkdJb1YGpNFawT3sG3OixmB9hEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob1+FTnS2Ph211AEi7mlaf+5DJ/DVVnpqp9fb+H9hqI=;
 b=3Q/bgShf5R3DPfo3Ttf68TVHsZ0hkkzJP0NrEdn91FUkW1gWgqVgwLLHG4fh1tmQl3Xf5bskFZgRUYgnDJ63F8USnra0Vz+SmHHmgeLveywx7vKCglgxorREL/rdCnsnw8k9t7+/D4oU6fSsBqOJHD6j6bpScu8trbzCciTii0k=
Received: from SJ0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:a03:2ef::29)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:10:27 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::86) by SJ0PR03CA0204.outlook.office365.com
 (2603:10b6:a03:2ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:10:27 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:10:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 16/30] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Thu, 14 Aug 2025 22:06:45 -0600
Message-ID: <20250815040659.3321102-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: c57a25a5-f9db-47f2-3b7b-08dddbb1aab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8QB9e9VWKC6ZWcKh6gD+/eqPSSM50XN0qMGhnD7n50Zo/36NTYkbbxYaH5gF?=
 =?us-ascii?Q?S/Gy2ECQNEMoWFgc/qsrtwiBVn8zcs6xp36O89IHw3oCuoJIaEOkBtwSuFb1?=
 =?us-ascii?Q?mNox4v417qQD1CpcUV75xbyxNtmntqZpD61+F7ChqNu0g2ySkQj3Rnz0QnKl?=
 =?us-ascii?Q?/L1Nbv9F0Fh9E/7P9ScfK5vOV2mc4nmgjN9vBhUm0wYwh8KNSgoKUi86JjST?=
 =?us-ascii?Q?ByU+IDlAzwT6TdGbf2WH0v3mzzwopZ7+kBa1Nxd27qUsvCtDSeIhOvS9wCHi?=
 =?us-ascii?Q?CQv2e3jS2Eaht7hYpH2UVBFvHR6jdNGbQ23662HwF1zKiz+gk7ICiXmGHpYC?=
 =?us-ascii?Q?WOkgyHPQDxbUDqtgfn0K3JgrZHcUtYA6TYbN6HHayrgOvGpJZcVijqeWAtmK?=
 =?us-ascii?Q?8I/8H2S26jP8Z5KHrYJ8R3Q8R5z7ugQin3wZHbIQ/079zNg8lm70JWO4Nfwg?=
 =?us-ascii?Q?VIg7u4+e76JuNrwGgohwSxG1+TtTvXhT++JDnhpFAeIOGT+74/UgHm0hVfHQ?=
 =?us-ascii?Q?jNm6CS2GCyfkp1ZVMRzIUANGz0wM45pk/qlV8qUTdL6HeAOeW9+unKppS8uk?=
 =?us-ascii?Q?5P+XSxdEcHburo7QRmKgLY13WH6u4Xrpwc5jFQQc/D5Mv4EY6HvOiAWYvi2x?=
 =?us-ascii?Q?9pqyl70vRQ50qVWgplFETRgMJRaGyytaz816yP+ZKHzs+Kn9+SiVs378ei0o?=
 =?us-ascii?Q?fjCBb/jC4jIxwvL3IxwTaCmE7CwGDBTBZUYlgNfI8fED9V2fFtnlOmebq0Vr?=
 =?us-ascii?Q?hAXLEYbjm49YP51D32duQnzwGVO+V9wU+ZY5mwDmJaxOzNF7G3KFbYww7Kqe?=
 =?us-ascii?Q?PQUgkiLarfubaamSznsHgEYvA1d+dYCuVvjZTaOQ6hk6zNbFOp6+UyG3biiZ?=
 =?us-ascii?Q?sbAYaNaR9JnnmbTqexbzboegIzzhwSNovFI40AkotLPH5Atj5+/hBW+ES1vC?=
 =?us-ascii?Q?DRwMycRO6PQfDgQL4jXi4n6T00DgsufCSJ6DBi4Ch4Qt7n71idZ91TzhZStI?=
 =?us-ascii?Q?cy+toaT4HIK2S3xXIYo3MOclFGwGKMuPjdLBoMq8oXRFsQSXqmRVk9DtrUBX?=
 =?us-ascii?Q?OK/8MacyR0x74dO70mxHZpPjAZ9+qiixbeEGu32REDH8YvCzoGungd06TPfe?=
 =?us-ascii?Q?2ZTdlvwj7Hxw6AELbebOCvqeK0GWkN4oYPAB7SReA173NlLcfRZnGe101Ych?=
 =?us-ascii?Q?m+SHynsU82mFqhP5dgxcWVULY2GdKf+zrp4JeyDRYsiKso8Oso5iclcd4Hwq?=
 =?us-ascii?Q?nBdU31Hn8PI3eFPb+aSm2EF9+JnAWaUZU+y6qKezjzQdYd0ceBoDlgJsHpuW?=
 =?us-ascii?Q?PFtDXSGfDi1I6zY+wOjnzUx4NnltwX1TdndYeW7QGRRAX8ErnSAZSrc4J01a?=
 =?us-ascii?Q?aRAnFH/u1JRmq2U9FixUGeDXFFgZqwrsh/lIHAUCkSeVr0V8NH22egv4Yo7r?=
 =?us-ascii?Q?TpApSCGklJ0SXFHX/7v8Bf2AvFv0Q9WrvyN4fe71d1NamK2fwNnT9kTqqZqC?=
 =?us-ascii?Q?moMIYELkfEvUT+zhXLQIM3zdlNIEggaohoek?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:10:27.4669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57a25a5-f9db-47f2-3b7b-08dddbb1aab3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935
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

The function is able to handle any non-planar format. It's been
tested for XRGB8888 and XRGB2101010 so far but should work
for a wider range of formats.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c        |   4 --
 tests/kms_colorop.c | 138 +++++++++++++++++++++++++-------------------
 2 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 8c8436e94..b3474781d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
 	if (src->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (src->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
 			      src->modifier, fb);
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 77d8c6bfa..7ac74c536 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -380,60 +380,28 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
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
-#if DUMP_FBS
-	igt_dump_fb(display, &input_fb, ".", "input");
-#endif
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
@@ -441,14 +409,15 @@ static void colorop_plane_test(igt_display_t *display,
 	get_and_wait_out_fence(output);
 
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
 #if DUMP_FBS
@@ -469,7 +438,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	/* commit COLOR_PIPELINE */
 	igt_display_commit_atomic(display,
@@ -477,28 +446,24 @@ static void colorop_plane_test(igt_display_t *display,
 				NULL);
 	get_and_wait_out_fence(output);
 #if DUMP_FBS
-	igt_dump_fb(display, &output_fb, ".", "output");
+	igt_dump_fb(display, output_fb, ".", "output");
 #endif
 
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
 	get_and_wait_out_fence(output);
 
-	/* cleanup */
-	detach_crtc(display, output);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
 igt_main
@@ -550,21 +515,74 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 
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
+#if DUMP_FBS
+				igt_dump_fb(&display, &input_fb, ".", "input");
+#endif
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
+				detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
 		}
 	}
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
 	igt_fixture {
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
-- 
2.43.0

