Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3F606A32C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0vo5/5kA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494D10E485;
	Tue,  3 Nov 2026 21:47:12 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443A610E1D6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azjBeRuxTVN3ZwyfGwuB5c6sr3EKiiCgn/TF5EHiDowLroGDIyP7fGKv7WxcNn0qhzSgG2c3NonNosIEEJOmQrqnBT3FsWTUSyK20GL3l4IXTXO7CEHGH8jCDo6/kS6Vs5DB2DCJSDNeb1WMWIDoQt2IhYpQSdJiK++5ACL/SNsoRHnAA1Aq4VHH12EGY3h978wXlBtZZqode2PaoTqKO8CEVsG/znXBNmsZftxWnk+ztJksi4A0zW4IbfUDQnXfSFo8F4khRwuTb9tpw0yBBqAIMJoNCEany2Lf2Hkv8IKe2bp7feMLe2BbcFS7J8Je9JcbseFYYphvj3Jv0NQ55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9M1MuHp/R8yuHqQzF/98QY+Z9Me9rWvsJMho+qmz+k=;
 b=Uk7vGliaJahcL/oEstQTpLRNqoEhl90pjgs1OXzjQeEGXcjTstm/YDz3BkIWN8KfKXbCnnQlREZUuvyBzsXyh5/LULBXxsoYx8keUMAvpxJIZw2WHVxCCc07rTFA/Db/7b46TppcobfN8EphpHV+vpA0O3/fFxxrDIGDRIegf70CXpod64t7SsMtNhe3vR4/cvaI3gu2WEPb18tDdAu4AJh0xUkBW7KZiEe+XcrN93z9a1ldGZO/XagfEpJO1tcWFIh7ok8gMIn3Q5+xwYGXyf85Uwh197eLUSf0Q8x/6UetNVqqpqsBPrPExnK0SAStsxrQMVRyAZUfw9dq+JFeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9M1MuHp/R8yuHqQzF/98QY+Z9Me9rWvsJMho+qmz+k=;
 b=0vo5/5kAOsny6Uk7InHN1F93q8UIdh97H8t2/OXi5nDGH0650C1O6OnS0kMRwRYuvqGsjYp6L9GR/VwRY3m39AXzKY7ssbfOq1cpgPD85gZINYMHrjBlG/Mh3RVYcS06n0tjCuVJQVcOAvF/AhIuf8jdXUIw3vPMOROWHHxTtLU=
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by MN0PR12MB6344.namprd12.prod.outlook.com (2603:10b6:208:3d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:38:19 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::64) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:18 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:18 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 03/10] tests/kms_colorop: share writeback and pixel helpers
Date: Tue, 3 Nov 2026 16:37:53 -0500
Message-ID: <20261103213800.618130-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|MN0PR12MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: de8d59b3-3119-4774-534a-08df39f2c74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|22082099003|261102123227099003|3023799007|56012099006|10067099003|261009223027099003|261022113327099003|261021121427099003|261021123027099003|261022075727099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: r6Oie1rHYpEOxPIFOj1I/8k6Nbep08F4FGk+CsAOtXYkROoJkCFc6RD5VHb/cr4Zv6XnkpShbWgeFKbhjiBEVw1HjjTcGczJ8lxm3FOn6dLm8XPfAq4il7Uqm7dMeLoScFIeVjy4hbX5I5a6TNFjxuTXnQ/L73sCci75FAqu1ZAoSPl3PSYJg5IWlzrDLF40xCtwglMiXddbH8jKh4ZcjezQnfj7oFrundvyLIo1rzas2YaJvz4nKIZ/MReg7dPMZ5yPqu6TaEJQWGnel/F6xEx63bogUTIVPOI7WT8/5NFsifhMELopgWq+B56d0LwvoabJ+We78L+LbuSHLGnBrxO+WqDtWo2pyH9qgVaxzLkjCPVZGZbMHwQU/42ZmpvstT1xYVwIYsW72eSp0HBjz7GR1Bm5lHm0KJTq3u1l3wKrGk1X0bYAneA4Uol2skfs6IasWF7d2pVGWsMfKWA15l48N9FZYjoL3BLdODbB2nBz8xADuMjxPLQRz2rOAxSsmGw0NuDhm2QHA6pUfGwbyk6ZHyBfgCKjGLrCukdQldL4UH3wvVaeQmvFokFYqxIaDKrkA8pV1AaJM9UqXhKG+5JQcAXmoLPRTbE3Gzs+mDTIoYZMaMYJq9TwQ9qKB123EcwJpNPJ/n8J+nmbxvGqW6Sif3AU2IcpQFtLZS7XUV7DQgvtinXmrg82pTps5qzhuGmHhyHH3M4kNG3IvfRa9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261102123227099003)(3023799007)(56012099006)(10067099003)(261009223027099003)(261022113327099003)(261021121427099003)(261021123027099003)(261022075727099003)(11063799006)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cxz3I8BWOuJ1jM9iJgwxIO3p0Ta0un8TxOKkJddWUk1hOSh4o4xkNo6AEd9CxP82UCME2q1B21rcZdsH05Fa79nyrrNm4pkESxYCM2Hy6ptoM4Rbhhje6ELzZ14xdqDZUySft4lMB9HtOeunyZ7vCJAIpf6dYdXAvFw+zQJACAryLooLKhlbiTdEWsQfMfj1a27e53K1bg8mYUDUTb3hgPV3Hine3ulX+FTYYRHdM8cUN9GCtU0Z78tM7Gy9uIxTBwUfs1cQe+9IRAr6KDEDJok25DHI7aNUHii3H+9yhMllLneg9h5G9W0sbGIrLXUNK4zxu1RfWFA2IBMlJRcSpkB8drSGUpXC7J7iOK6hq5btbO8UN6JoB9oz6WHhO2dkvJzkIORosZT7sNbqt2e9fNRLE+CUMhkBUFzeCKWXl/6Mr/8rmwAY1iTcyuKcfBVc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:19.7929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8d59b3-3119-4774-534a-08df39f2c74b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6344
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

Move writeback output selection, framebuffer comparison, and software
transforms into the shared colorop helper for reuse by DMA tests.
Preserve the existing behavior.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c        | 143 +------------------------------------
 tests/kms_colorop_helper.c | 141 ++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |   8 +++
 3 files changed, 150 insertions(+), 142 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 0ccd1acdf06e..8423a642fc54 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -122,154 +122,13 @@
  *
  */
 
-static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
-				    drmModeModeInfo override_mode, __u32 fourcc_in,
-				    __u32 fourcc_out)
-{
-	igt_fb_t input_fb, output_fb;
-	igt_plane_t *plane;
-	uint32_t writeback_format = fourcc_out;
-	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
-	int width, height, ret;
-	drmModePropertyBlobRes *wb_formats_blob;
-	int i;
-	__u32 *format;
-	bool found_format = false;
-
-	igt_output_override_mode(output, &override_mode);
-
-	width = override_mode.hdisplay;
-	height = override_mode.vdisplay;
-
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
-		      "plane doesn't support fourcc format %x\n", fourcc_in);
-
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    fourcc_in, modifier, &input_fb);
-	igt_assert(ret >= 0);
-
-	/* check writeback formats */
-	wb_formats_blob = igt_get_writeback_formats_blob(output);
-	format = wb_formats_blob->data;
-
-	for (i = 0; i < wb_formats_blob->length / 4; i++)
-		if (fourcc_out == format[i])
-			found_format = true;
-
-	igt_skip_on_f(!found_format,
-		      "writeback doesn't support fourcc format %x\n", fourcc_out);
-
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    writeback_format, modifier, &output_fb);
-	igt_assert(ret >= 0);
-
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
-
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_plane_set_fb(plane, NULL);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
-
-	return !ret;
-}
-
 typedef struct {
 	bool dump_check;
 } data_t;
 
 static data_t data;
 
-static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
-{
-	igt_output_t *output;
-	igt_crtc_t *crtc;
-
-	drmModeModeInfo override_mode = {
-		.clock = 25175,
-		.hdisplay = 640,
-		.hsync_start = 656,
-		.hsync_end = 752,
-		.htotal = 800,
-		.hskew = 0,
-		.vdisplay = 480,
-		.vsync_start = 490,
-		.vsync_end = 492,
-		.vtotal = 525,
-		.vscan = 0,
-		.vrefresh = 60,
-		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-		.name = {"640x480-60"},
-	};
-
-	for_each_output(display, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
-			continue;
-
-		for_each_crtc(display, crtc) {
-			igt_output_set_crtc(output,
-					    crtc);
-
-			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
-				igt_debug("Using connector %u:%s on pipe %s\n",
-					  output->config.connector->connector_id,
-					  output->name, igt_crtc_name(crtc));
-				return output;
-			}
-		}
-
-		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
-			  output->config.connector->connector_id, output->name);
-
-		/* Restore any connectors we don't use, so we don't trip on them later */
-		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
-	}
-
-	return NULL;
-}
-
-static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
-{
-	/* Each driver is expected to have its own bracket, i.e., by trial and error */
-	if (is_vkms_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 3, 1);
-
-	if (is_amdgpu_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 13, 13);
-
-	/*
-	 * By default we'll look for a [0, 0] bracket. We can then
-	 * define it for each driver that implements support for this
-	 * test. That way we can understand the precision of each
-	 * driver better.
-	 */
-	return igt_cmp_fb_pixels(in, out, 0, 0);
-}
-
-#define MAX_COLOROPS 5
-
-static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *input_fb,
-			     igt_fb_t *sw_transform_fb)
-{
-	int i;
-	int yuv_encoding = -1;
-	enum igt_color_range yuv_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
-	igt_pixel_transform transforms[MAX_COLOROPS];
-
-	for (i = 0; colorops[i]; i++)
-		transforms[i] = colorops[i]->transform;
-
-	/* If first colorop is CSC FF, extract encoding/range for sw reference */
-	if (colorops[0] && colorops[0]->type == KMS_COLOROP_FIXED_MATRIX) {
-		yuv_encoding = colorops[0]->fixed_matrix_info.encoding;
-		yuv_range = colorops[0]->fixed_matrix_info.range;
-	}
-
-	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
-				   yuv_encoding, yuv_range);
-}
+#define MAX_COLOROPS KMS_COLOROP_MAX_COLOROPS
 
 static void colorop_plane_test(igt_display_t *display,
 			       igt_output_t *output,
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 388b990ca4ff..91a494724b78 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -477,3 +477,144 @@ void reset_colorops(kms_colorop_t *colorops[])
 	for(i = 0; colorops[i]; i++)
 		reset_colorop(colorops[i]);
 }
+
+static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+				    drmModeModeInfo override_mode, __u32 fourcc_in,
+				    __u32 fourcc_out)
+{
+	igt_fb_t input_fb, output_fb;
+	igt_plane_t *plane;
+	uint32_t writeback_format = fourcc_out;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
+	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
+
+	igt_output_override_mode(output, &override_mode);
+
+	width = override_mode.hdisplay;
+	height = override_mode.vdisplay;
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    fourcc_in, modifier, &input_fb);
+	igt_assert(ret >= 0);
+
+	/* check writeback formats */
+	wb_formats_blob = igt_get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    writeback_format, modifier, &output_fb);
+	igt_assert(ret >= 0);
+
+	igt_plane_set_fb(plane, &input_fb);
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &input_fb);
+	igt_remove_fb(display->drm_fd, &output_fb);
+
+	return !ret;
+}
+
+igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+
+	drmModeModeInfo override_mode = {
+		.clock = 25175,
+		.hdisplay = 640,
+		.hsync_start = 656,
+		.hsync_end = 752,
+		.htotal = 800,
+		.hskew = 0,
+		.vdisplay = 480,
+		.vsync_start = 490,
+		.vsync_end = 492,
+		.vtotal = 525,
+		.vscan = 0,
+		.vrefresh = 60,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.name = {"640x480-60"},
+	};
+
+	for_each_output(display, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+			continue;
+
+		for_each_crtc(display, crtc) {
+			igt_output_set_crtc(output,
+					    crtc);
+
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
+				igt_debug("Using connector %u:%s on pipe %s\n",
+					  output->config.connector->connector_id,
+					  output->name, igt_crtc_name(crtc));
+				return output;
+			}
+		}
+
+		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
+			  output->config.connector->connector_id, output->name);
+
+		/* Restore any connectors we don't use, so we don't trip on them later */
+		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
+	}
+
+	return NULL;
+}
+
+bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
+{
+	/* Each driver is expected to have its own bracket, i.e., by trial and error */
+	if (is_vkms_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 3, 1);
+
+	if (is_amdgpu_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 13, 13);
+
+	/*
+	 * By default we'll look for a [0, 0] bracket. We can then
+	 * define it for each driver that implements support for this
+	 * test. That way we can understand the precision of each
+	 * driver better.
+	 */
+	return igt_cmp_fb_pixels(in, out, 0, 0);
+}
+
+void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *input_fb,
+		      igt_fb_t *sw_transform_fb)
+{
+	int i;
+	int yuv_encoding = -1;
+	enum igt_color_range yuv_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
+	igt_pixel_transform transforms[KMS_COLOROP_MAX_COLOROPS];
+
+	for (i = 0; colorops[i]; i++)
+		transforms[i] = colorops[i]->transform;
+
+	/* If first colorop is CSC FF, extract encoding/range for sw reference */
+	if (colorops[0] && colorops[0]->type == KMS_COLOROP_FIXED_MATRIX) {
+		yuv_encoding = colorops[0]->fixed_matrix_info.encoding;
+		yuv_range = colorops[0]->fixed_matrix_info.range;
+	}
+
+	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
+				   yuv_encoding, yuv_range);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 4392386eaa16..10d5ecad8340 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -10,6 +10,8 @@
 #include "igt_color.h"
 #include "igt_color_lut.h"
 
+#define KMS_COLOROP_MAX_COLOROPS 5
+
 typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
 
 typedef int (*transform_fb)(igt_fb_t *in);
@@ -119,6 +121,12 @@ extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
 extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
 extern kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb;
 
+igt_output_t *kms_writeback_get_output(igt_display_t *display,
+				      __u32 fourcc_in, __u32 fourcc_out);
+bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out);
+void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *input_fb,
+		      igt_fb_t *sw_transform_fb);
+
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
 				  kms_colorop_t *colorops[]);
-- 
2.56.0

