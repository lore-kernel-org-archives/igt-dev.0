Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72241606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=I2L2cClk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0BA10F4B7;
	Mon, 16 Nov 2026 23:05:19 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5603910F4B7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 23:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utBTA5h/POR5aHYydE91EE70I3xYJJqYQrQy9Ye5wQKKQw+afW8YFWz31IL/yLpp7phLIG0TBtyiPNnOaKH8u5QtSgubVX9fQnDsLfhArWshuACgI9wY5A+O/rqp3wDq+CIbO1aWHLXObxYsWmcxyz9k8UuGyuzX2S8sW1c1r00dKwYtTq7hElRpcPW4hgFUzuT7jNFmByrHHB3xziIZ7JWLSwbgnno8VAMh7w8gHtHwKTfLECrlOd+7BrN+nH01ma7q7xC4iBWZMIFi/Xi5c1MhEt+A3PVZbGeCFjO5VVe2M6Lftien4e6F0rYeglB7TJFinUnOwifGumlOE5qVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo3Ahoqx04z4eIPhQsSnNOkIEekxnmveMjFAiPjaM6I=;
 b=iDqklFTag4RdcBkJ70OoS7reW95jy/duvKt7RTrxWikS3iXyWidRUCVIOqtEiu1V1Wb+IXQui6ghwyGJIeI7n+ahgIK1vdJXQ7DaI2KOydAvp7aYvOHhCTbifLENEqFT8rn2m3yztvA9eM4u9AGmOM28usFddeOZ0ngINRYLVx5kbPPZINCXC6pUBDRI/XdhIjI5QpfK8YADeSEt3HhrFtWPlx/Nf5HDK7HQ1b8i1denPioLusvFRhU1A63wqB5BEOV/MggKyCZ9Bjl3uHhTacv0ZJ4Lbq+kHracsWB7+us9nKLHBFKot62gYaXAfrtfyJYiNL3LhssiXUt1lTyriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo3Ahoqx04z4eIPhQsSnNOkIEekxnmveMjFAiPjaM6I=;
 b=I2L2cClkcw04+4qHmVkRNPbl85muWOtqEB0xNKaOf82qjZjwpFpqk+C1nfhqSad0ckiN7HPmrsoxNKCk0Old9fpojDJTcURO61PHTp5ukBp4v6WyGXyAtgNJKQUgMhepkn+6BmO3+daAV864zqYzEoOz1VrQUGfPdiO6dJw9fm8=
Received: from SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33)
 by CY8PR12MB8214.namprd12.prod.outlook.com (2603:10b6:930:76::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:02:22 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2c) by SJ0PR13CA0148.outlook.office365.com
 (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 23:02:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:02:21 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:02:20 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v2 2/3] tests/kms_colorop: set up subtest groups on demand
Date: Mon, 16 Nov 2026 17:00:47 -0600
Message-ID: <20261116230048.2020931-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116230048.2020931-1-alex.hung@amd.com>
References: <20261116230048.2020931-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CY8PR12MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: edfddf5a-3401-40d5-9859-08df4435abe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|5023799004|261102123227099003|261028144727099003|261026135527099003|261026130827099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261022113327099003|261022115727099003|261021133027099003|261021130227099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: i15uO7QeQWjqEdrAae1vKRytYQIp2936CsEc2w4Q1EKTET7p3kZAtH1OSy8JDU6WjmUPRXweoCfcwiN9SkdinS7RrO3N/swmdV+60rYMevRwF/T8gSQdZBJUlHp7p+99nyui4JH8nPVYtdOkqGMrQm7OQ/XDeTtGEDPeyE2uZoKsgNbgbJKYRxKZLuFZJnRnxV9htF/UlVKmkCfjtCQDm4MSNbbV0NhJW7raBKKvPhq2Zief2joMAWT8vhaQSBVO+76Z1+TjcndpOiCcV1UGzyYb9/5H0ztuOJET1zmlkyHhdTv+iZamG2hhaSXc+orp0FSn1Mda5eaYi26JOdgsqs6pH+gXiNGGaC1SGBS6xuD/fyoHujCFSjntsUtBxf6IwQGPdjBtwkX2yHG6dJXzQK5I7Tz0gdGosHZpLxY+c1hEWNu7+8pHOy+ISNyYwxF5oZuMGSMzuO7YzEBo3WMSiBOyYVxFv5OBW1jjVTRNiIOICuvPzviXP8V3/WKe3Q8ZYM5JPIg5kFTGT9qn0ajgst+QgkfCNYdiypHERWs9CdLPdUe+1vhaf3x9R4UMhISo8gJc9HWk3Fm5PPr22dUa3y4rMhoNgkDB88OpfQcuWufbdXiUqGju/3vFnoZ2s1twqQArMdxa6QoONJZ5fK4M2cz2sDygMCXd3KXK5PjaubXN6OMOP9gmN7SOVDquublANltmcjcZnf23Dn0T14LZeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261026135527099003)(261026130827099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261021133027099003)(261021130227099003)(261021135927099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xiAo3fnXRhPXApUuc57u6MUaksFQGqyDEc3TaK8zq13uudQ8kbO2SPzHW52uckCXYRfSU/crz5lVh5S6Uzd4RixA5C0gbpqsm5Vjiwv6EzLI5EXGAvOvnnDaxTyv3ooU6gGmCAGz8B6x6ZSVTZ3qMDTbEg5PBG52RBnvbgpMxEsknXeCNkvgS+wubFYrjebxQrjuFKDO+F2I45k1SFaYLCY/ODcGIlpts1sS5PCB1UiGZHblnhNj85VWLHmuPQysMJCsJBhJblCNb4RAgfAZxtET3OB7uySWhq6Bx/x7E4eUmwKQwK8bsZKMft/APQMk3BL4LnjTpDljJVEpJ2kAdl/jAILMLuFUeSbejd4Ey6KCFceJpQNFlWY5UjdFRFcid3htGr1xIlfMwtNzTitmHv2HA8Qnd0DgwyggqvDqJueU19t48Z8Ue9rK+eBtRsVB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:02:21.7100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edfddf5a-3401-40d5-9859-08df4435abe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8214
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
v2: Keep each colorop_group in static storage, as igt_subtest_f()
    returns through siglongjmp (Harry)

 tests/kms_colorop.c | 251 ++++++++++++++++++++------------------------
 1 file changed, 111 insertions(+), 140 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 970594a2d..6b39c1f94 100644
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
@@ -539,177 +609,76 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 	/* RGB format tests */
 	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
-		igt_output_t *output;
-		igt_plane_t *plane;
-		igt_fb_t input_fb, output_fb;
-		unsigned int fb_id;
-		drmModeModeInfo mode;
+		static struct colorop_group group;
 
-		igt_subtest_group() {
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
+		group = (struct colorop_group){ 0 };
 
+		igt_subtest_group() {
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
+		static struct colorop_group group;
 
-		igt_subtest_group() {
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
+		group = (struct colorop_group){ 0 };
 
+		igt_subtest_group() {
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
+		static struct colorop_group group;
 		unsigned int fb_id;
-		drmModeModeInfo mode;
-
-		igt_subtest_group() {
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
 
-				/* Create output fb shared across tests */
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-							formats_yuv[j].fourcc_out,
-							igt_fb_mod_to_tiling(0),
-							&output_fb);
-				igt_require(fb_id > 0);
-			}
+		group = (struct colorop_group){ 0 };
 
+		igt_subtest_group() {
 			/* Run YUV tests - create input_fb per test */
 			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
 				igt_describe("Check YUV CSC colorop");
@@ -718,6 +687,10 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 					enum igt_color_encoding encoding;
 					enum igt_color_range range;
 
+					colorop_group_setup(&display, &group,
+							    formats_yuv[j].fourcc_in,
+							    formats_yuv[j].fourcc_out, false);
+
 					/* Extract encoding and range from first colorop (must be CSC FF) */
 					igt_assert(tests_yuv[i].colorops[0]);
 					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_FIXED_MATRIX);
@@ -725,11 +698,11 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -739,17 +712,17 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -759,9 +732,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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

