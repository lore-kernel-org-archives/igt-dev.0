Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F15606A32E
	for <igt-dev@archiver.kernel.org>; Sat, 14 Nov 2026 02:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A2Qzq4IP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2335110E4EF;
	Sat, 14 Nov 2026 02:10:07 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927B10ED3A
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 02:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+KZsXUPMpfErUUwjsCe7alykEotAu7AFOjpMF9c9gPYTvxxW5WpEppZfEgA5WS03GdudzgGy646GgABZIiy8QQ9IzL3a/2EvWDk1Fot6Tye5QeG3xeQpZ5TSONs77khkOYQQewKL1xpKTwen2ERMtJZ/cXHaul2HK/1OGy1ihMBHflQAENqoqsRRlA4SXZIPNQ8i8/43jy2mwhwhZs3GDgnWp8IJnFWs7bGDHgt2rgYGSHF4EBanXeW+AH3tc0dBw7MBrLCdLfOzSnbXglJt54MkZKP3kJwAv7tme5wUD0M+YpXcn73Un+mTTlnIdocNvG1R2zYsDtb3oBPYXMH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgXApafxLx0+/9ZEnGxQ1pbSBi1PfYewWv9m4DLzIEk=;
 b=ANQ/ob5AD98aLUwgWszUOgQNdrvxE7cFoAdql4CweA1qnoewZvgbycK0c4C+pvn41vB3N8Mv7uLNsHwjEexl6gLVoaZa8FBZfrUrG2ujJkgoji6C4IuBHM7WgVUSkimly2PaRldODdAYH2X64DpJw/W6PGdC7NABe7JwyAaRnytS+I2849aJ42JFyJ0PSVPJwGZUnoInva96bbqLCSAP2VUocPg3H6ANCRB+nAzC/z5XIrnS7Jegy6xtkcfl7Qan9F1V9erFYCMgZbzKG8BP5eHt78+hcAIEoPjci8ZCOr4lWGXqi60EDS1wi+m4w+dmRbgTwx/qDUQVKSiQ8zDUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgXApafxLx0+/9ZEnGxQ1pbSBi1PfYewWv9m4DLzIEk=;
 b=A2Qzq4IPDE7U2vnxo3XmneVUFm209NOK2ILq9qDtid7kCzOU2ZdriruzUkjIM96ZcF0ek18T3lWRKLWyMme1V4iA6euihLvDGMqA9XSDM4eht6ehgnsbyZpxjJhfXhpTIJwmBIT4TvWdLak1n68mmWt8ius9ERwFgOy1vfQ/2Ko=
Received: from BL1PR13CA0217.namprd13.prod.outlook.com (2603:10b6:208:2bf::12)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 02:07:19 +0000
Received: from BN2PEPF0000A890.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::55) by BL1PR13CA0217.outlook.office365.com
 (2603:10b6:208:2bf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Sat, 14
 Nov 2026 02:07:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A890.mail.protection.outlook.com (10.167.248.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 02:07:19 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 20:07:17 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/3] tests/kms_colorop: set up subtest groups on demand
Date: Fri, 13 Nov 2026 20:06:13 -0600
Message-ID: <20261114020614.830491-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114020614.830491-1-alex.hung@amd.com>
References: <20261114020614.830491-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A890:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f0258d-ccbe-45a2-0fc7-08df41f40325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|6133799003|261009223027099003|22082099003|3023799007|11063799006|5023799004|56012099006|10067099003|261026140227099003|261102123227099003|261022115727099003|261026135527099003|261022113327099003|261021121427099003|261022105027099003|261028144727099003|261022075727099003|261026130827099003|261021130227099003|261021123027099003|261026121527099003|261021135927099003|261021133027099003;
X-Microsoft-Antispam-Message-Info: onhOgHfF1LoP30VSswIYcvV6kkvLQdmD5hkUIiVODZru5G29ZqxBUogQJ2iPFxxAbNfZIWBqHBSMLOuEX5Y7Q+KWtM0C5bCLHurW7+MWhq7rnt0fxF3ByoeN3HUjLHaVPYY4JzA1gUZNlX4PoObjqUappKQIWLVbBN7b5xLYEMKwwjbsH5epEYZvkVpWbsTt71aRLxzmrNIvosvI5IowmSDrbAYHkcSat0LbU9Hk/jE6w07IF6N+EteX+nwL2kcmcJVHEE5dCcSvB8vArmg9IapBRc8qZ1qa7UWjrsMzgresx4zKv1bZLNI9rHzYocK9UP9hdRss4aZr8+M2iSwILmeNXjPk8xhJmOFjtuT1GxbfKASLzYLmCWHdF2Abk2LRwHC1HDfZhkXqgHxWpZ0MVu/jz2E4Cih7tpyOrhDvPezUiFK31X0TSnBrMNUnvOrN1m+9SiTFLZRMioOQtBApp1+4Iynw8hw82T0fNxFf0RKMH0fApJHvZAN88f+2txh26GQwBuo8L/9bzd4rFz3gr7wZ2KineDTvnqbcVxUSWxVxrGegxAb6ptFGKbVbCKUaysKSIB1ZmidzrYyDX8WSpX58QwdyKcRKjYwci2Q+o/XUZVMSRtCAy8yoVM3uHbixzskjfOJegb34b5/k7smY8RdRPoM9Afq51gsRAu5BjHV9slMt5n4N1XQacU560tSGseLvgn77xDT3pnBJHPaHuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(261009223027099003)(22082099003)(3023799007)(11063799006)(5023799004)(56012099006)(10067099003)(261026140227099003)(261102123227099003)(261022115727099003)(261026135527099003)(261022113327099003)(261021121427099003)(261022105027099003)(261028144727099003)(261022075727099003)(261026130827099003)(261021130227099003)(261021123027099003)(261026121527099003)(261021135927099003)(261021133027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1fLe4FB7t+j8+hjRJx2vLCJLYSfrNCiPdT+XT8zMreQaArbPgCPc3bME7y5ZavCAKi2pU8v2qf7492ct+YQ0GybnjFLniH5U0ilwfNcPEXjp3enN0NjN9omXeROxN+FOJwH2Z0fy+dH0fCSilzIuy+6mh3u612cdXxjkUsvlvMhAm/RiCDfNp9XuW76gkyiFFI2eqJW1rmPyJsTehxhw16vgKs7I6PjzoGUaG8vLzFSwIN1PcZSm2RmIvzN59c1ckTDYaPa7VdZf3HbE6ETYKzanekjJvULI781QXdIXuJ8MENs69PyyoK62a1Df66DR4jX4aYlr6OI4xz5kxK2Nlo6nq97jf5v3EAWHrZCH/Ohg/3qGBmmuaciu0OkrpcKEWF0Yj99gXNtwXRi0i3DLg+BOs/HnPHv3EkI31ufZPPcSmy6o4d7k1vO8sj4q1yql
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:07:19.0090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f0258d-ccbe-45a2-0fc7-08df41f40325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A890.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every kms_colorop process runs the setup fixture of all subtest groups,
even with --run-subtest. Each fixture probes the writeback connector,
does a modeset and creates the input and output framebuffers, so
igt_runner pays for every group in each of the ~90 processes. On
HW where CPU access to VRAM is slow at low memory clocks, this
adds ~10s per process.

Move the group setup into a helper called by each subtest. The first
subtest of a group that runs does the setup, and the result (including
a skip) is cached for the rest of the group. The cleanup fixture only
releases what was set up.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 245 +++++++++++++++++++-------------------------
 1 file changed, 105 insertions(+), 140 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 970594a2d..284e08b1c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -360,6 +360,76 @@ static void colorop_plane_test(igt_display_t *display,
 	}
 }
 
+/*
+ * Per-group state. The setup is done on demand by the first subtest of the
+ * group that actually runs, so running a single subtest doesn't pay for
+ * the writeback probing and framebuffer creation of every other group.
+ */
+struct colorop_group {
+	igt_output_t *output;
+	igt_plane_t *plane;
+	igt_fb_t input_fb;
+	igt_fb_t output_fb;
+	bool setup_tried;
+	bool ready;
+};
+
+static void colorop_group_setup(igt_display_t *display, struct colorop_group *group,
+				__u32 fourcc_in, __u32 fourcc_out, bool pattern)
+{
+	drmModeModeInfo mode;
+	unsigned int fb_id;
+
+	if (group->setup_tried) {
+		igt_require_f(group->ready, "Subtest group setup failed or was skipped\n");
+		return;
+	}
+	group->setup_tried = true;
+
+	group->output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
+	igt_require(group->output);
+
+	if (group->output->use_override_mode)
+		mode = group->output->override_mode;
+	else
+		mode = group->output->config.default_mode;
+
+	group->plane = igt_output_get_plane_type(group->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(group->plane);
+	igt_require(igt_plane_has_prop(group->plane, IGT_PLANE_COLOR_PIPELINE));
+
+	if (pattern) {
+		/* RGB input fb shared across the group's subtests */
+		fb_id = igt_create_color_pattern_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
+						    fourcc_in, DRM_FORMAT_MOD_LINEAR,
+						    0.2, 0.2, 0.2, &group->input_fb);
+		igt_assert(fb_id > 0);
+		igt_plane_set_fb(group->plane, &group->input_fb);
+
+		if (data.dump_check)
+			igt_dump_fb(display, &group->input_fb, ".", "input");
+	} else {
+		/* YUV subtests create their own input fb, keep the plane active in between */
+		fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay, fourcc_in,
+				      igt_fb_mod_to_tiling(0), &group->input_fb);
+		igt_require(fb_id > 0);
+	}
+
+	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay, fourcc_out,
+			      igt_fb_mod_to_tiling(0), &group->output_fb);
+	igt_require(fb_id > 0);
+
+	group->ready = true;
+}
+
+static void colorop_group_fini(igt_display_t *display, struct colorop_group *group)
+{
+	if (group->output)
+		igt_detach_crtc(display, group->output);
+	igt_remove_fb(display->drm_fd, &group->input_fb);
+	igt_remove_fb(display->drm_fd, &group->output_fb);
+}
+
 static void check_plane_colorop_ids(igt_display_t *display)
 {
 	igt_plane_t *plane;
@@ -539,177 +609,70 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 	/* RGB format tests */
 	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
-		igt_output_t *output;
-		igt_plane_t *plane;
-		igt_fb_t input_fb, output_fb;
-		unsigned int fb_id;
-		drmModeModeInfo mode;
+		struct colorop_group group = {};
 
 		igt_subtest_group() {
-			igt_fixture() {
-				output = kms_writeback_get_output(&display,
-								  formats_rgb[j].fourcc_in,
-								  formats_rgb[j].fourcc_out);
-				igt_require(output);
-
-				if (output->use_override_mode)
-					memcpy(&mode, &output->override_mode, sizeof(mode));
-				else
-					memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-				/* create input fb */
-				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-				igt_assert(plane);
-				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
-
-				fb_id = igt_create_color_pattern_fb(display.drm_fd,
-								mode.hdisplay, mode.vdisplay,
-								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
-								0.2, 0.2, 0.2, &input_fb);
-				igt_assert(fb_id >= 0);
-				igt_plane_set_fb(plane, &input_fb);
-
-				if (data.dump_check)
-					igt_dump_fb(&display, &input_fb, ".", "input");
-
-				/* create output fb */
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats_rgb[j].fourcc_out,
-							igt_fb_mod_to_tiling(0),
-							&output_fb);
-				igt_require(fb_id > 0);
-			}
-
 			/* Run RGB tests */
 			for (i = 0; i < ARRAY_SIZE(tests_rgb); i++) {
 				igt_describe("Check color ops on a plane");
-				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name)
+				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name) {
+					colorop_group_setup(&display, &group,
+							    formats_rgb[j].fourcc_in,
+							    formats_rgb[j].fourcc_out, true);
 					colorop_plane_test(&display,
-							output,
-							plane,
-							&input_fb,
-							&output_fb,
+							group.output,
+							group.plane,
+							&group.input_fb,
+							&group.output_fb,
 							formats_rgb[j].fourcc_in,
 							formats_rgb[j].fourcc_out,
 							tests_rgb[i].colorops,
 							false);
+				}
 			}
 
 			igt_fixture() {
-				igt_detach_crtc(&display, output);
-				igt_remove_fb(display.drm_fd, &input_fb);
-				igt_remove_fb(display.drm_fd, &output_fb);
-
+				colorop_group_fini(&display, &group);
 			}
 		}
 	}
 
 	/* Bypass transition tests - RGB formats */
 	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
-		igt_output_t *output;
-		igt_plane_t *plane;
-		igt_fb_t input_fb, output_fb;
-		unsigned int fb_id;
-		drmModeModeInfo mode;
+		struct colorop_group group = {};
 
 		igt_subtest_group() {
-			igt_fixture() {
-				output = kms_writeback_get_output(&display,
-								  formats_rgb[j].fourcc_in,
-								  formats_rgb[j].fourcc_out);
-				igt_require(output);
-
-				if (output->use_override_mode)
-					memcpy(&mode, &output->override_mode, sizeof(mode));
-				else
-					memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-				/* create input fb */
-				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-				igt_assert(plane);
-				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
-
-				fb_id = igt_create_color_pattern_fb(display.drm_fd,
-								mode.hdisplay, mode.vdisplay,
-								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
-								0.2, 0.2, 0.2, &input_fb);
-				igt_assert(fb_id >= 0);
-				igt_plane_set_fb(plane, &input_fb);
-
-				if (data.dump_check)
-					igt_dump_fb(&display, &input_fb, ".", "input");
-
-				/* create output fb */
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats_rgb[j].fourcc_out,
-							igt_fb_mod_to_tiling(0),
-							&output_fb);
-				igt_require(fb_id > 0);
-			}
-
 			/* Run bypass transition tests */
 			for (i = 0; i < ARRAY_SIZE(tests_bypass_transitions_rgb); i++) {
 				igt_describe("Test color pipeline to bypass transition");
-				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name)
+				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name) {
+					colorop_group_setup(&display, &group,
+							    formats_rgb[j].fourcc_in,
+							    formats_rgb[j].fourcc_out, true);
 					colorop_plane_test(&display,
-							output,
-							plane,
-							&input_fb,
-							&output_fb,
+							group.output,
+							group.plane,
+							&group.input_fb,
+							&group.output_fb,
 							formats_rgb[j].fourcc_in,
 							formats_rgb[j].fourcc_out,
 							tests_bypass_transitions_rgb[i].colorops,
 							true);
+				}
 			}
 
 			igt_fixture() {
-				igt_detach_crtc(&display, output);
-				igt_remove_fb(display.drm_fd, &input_fb);
-				igt_remove_fb(display.drm_fd, &output_fb);
-
+				colorop_group_fini(&display, &group);
 			}
 		}
 	}
 
 	/* YUV format tests */
 	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
-		igt_output_t *output;
-		igt_plane_t *plane;
-		igt_fb_t temp_fb, output_fb;
+		struct colorop_group group = {};
 		unsigned int fb_id;
-		drmModeModeInfo mode;
 
 		igt_subtest_group() {
-			igt_fixture() {
-				output = kms_writeback_get_output(&display,
-								  formats_yuv[j].fourcc_in,
-								  formats_yuv[j].fourcc_out);
-				igt_require(output);
-
-				if (output->use_override_mode)
-					memcpy(&mode, &output->override_mode, sizeof(mode));
-				else
-					memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-				igt_assert(plane);
-				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
-
-				/* Create temp fb to keep plane active between tests */
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats_yuv[j].fourcc_in,
-							igt_fb_mod_to_tiling(0),
-							&temp_fb);
-				igt_require(fb_id > 0);
-
-				/* Create output fb shared across tests */
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats_yuv[j].fourcc_out,
-							igt_fb_mod_to_tiling(0),
-							&output_fb);
-				igt_require(fb_id > 0);
-			}
-
 			/* Run YUV tests - create input_fb per test */
 			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
 				igt_describe("Check YUV CSC colorop");
@@ -718,6 +681,10 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 					enum igt_color_encoding encoding;
 					enum igt_color_range range;
 
+					colorop_group_setup(&display, &group,
+							    formats_yuv[j].fourcc_in,
+							    formats_yuv[j].fourcc_out, false);
+
 					/* Extract encoding and range from first colorop (must be CSC FF) */
 					igt_assert(tests_yuv[i].colorops[0]);
 					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_FIXED_MATRIX);
@@ -725,11 +692,11 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 					encoding = tests_yuv[i].colorops[0]->fixed_matrix_info.encoding;
 					range = tests_yuv[i].colorops[0]->fixed_matrix_info.range;
 
-					igt_skip_on(!get_color_pipeline(&display, plane, tests_yuv[i].colorops));
+					igt_skip_on(!get_color_pipeline(&display, group.plane, tests_yuv[i].colorops));
 
 					/* Create input fb with matching encoding/range */
 					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
-									mode.hdisplay, mode.vdisplay,
+									group.input_fb.width, group.input_fb.height,
 									formats_yuv[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
 									encoding, range,
 									0.2, 0.2, 0.2, &input_fb);
@@ -739,17 +706,17 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 						igt_dump_fb(&display, &input_fb, ".", "input");
 
 					colorop_plane_test(&display,
-							output,
-							plane,
+							group.output,
+							group.plane,
 							&input_fb,
-							&output_fb,
+							&group.output_fb,
 							formats_yuv[j].fourcc_in,
 							formats_yuv[j].fourcc_out,
 							tests_yuv[i].colorops,
 							false);
 
-					/* Switch plane back to temp_fb to keep CRTC active */
-					igt_plane_set_fb(plane, &temp_fb);
+					/* Restore the group's input fb to keep CRTC active */
+					igt_plane_set_fb(group.plane, &group.input_fb);
 					igt_display_commit_atomic(&display,
 								DRM_MODE_ATOMIC_ALLOW_MODESET,
 								NULL);
@@ -759,9 +726,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 			}
 
 			igt_fixture() {
-				igt_detach_crtc(&display, output);
-				igt_remove_fb(display.drm_fd, &temp_fb);
-				igt_remove_fb(display.drm_fd, &output_fb);
+				colorop_group_fini(&display, &group);
 			}
 		}
 	}
-- 
2.53.0

