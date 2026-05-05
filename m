Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF25DFF8855
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 20:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C49010EC0F;
	Tue,  5 May 2026 20:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k1CwRWLm";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012050.outbound.protection.outlook.com
 [40.107.200.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0945E10EC0F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 20:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY8XyguU3Xp/Wma3ZgxLH94OrBiunSDccYxwDXieYYuMoSc5OQ4Z1fUzGL9DND3Pz/zwluoz6e58ACllVxSYOslY/bbYJVIocj+PGV6XWyhQe1cP2brtVZjkvriRxZhZcLH9gcQoWeamTtoiQRtIuZ7T5tZlJBQpDc+T2F0ug4gTaFXZkkQI6H9ycUoO5dhsVT0f7lVnrMpdQmDUCY6/TyjVuAJlQA3Agtctsel/DK05f6Aw68ITSbFTkG8NWrlfNNwSncMTvhfFHC2/caGJIxRvih4mS65x21EtTd5XVjv3DaE5uD6SuKQfHjleyiZVpRD34I6PEemtvKuNGHGCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/a9g4JPCqW/fopi7KOknFDzG+SwurRyiVULm4hsXsc=;
 b=LkwJ3NLGgqKVcWHzgw3DwKg05XE2tw4aNcr6I+/2vftArQVVq4R/t30c37Iwuc5M+81423tLHWBg2cA4unBeoajkubCszHiUYpLI5nHSikMi07XrvRq0Tt6ZvToIBNVsqcH08D7cmD+2rHaGHtNk6LbOdvMx34YC85uN1ubzeEZvXSCeJEYhEgSef1Pt71JdT5uEtoldrI7EfhWUmgJ/Sy2GzjoAkvPo/TNIdIMuu+W9i4SLXDBwnxEiMquvg0eStUKQCnYXbS96SYscjV/K9/tUsQ2ExpruHI2dPGMDDvFiBDerEMSn6mHw8n1K1rA98uoN9XxopGC7lhaBiDR95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/a9g4JPCqW/fopi7KOknFDzG+SwurRyiVULm4hsXsc=;
 b=k1CwRWLmKxJ1r99XtPPgXiq4IJShCMetPduBSr/vrHYIWkiKAQ9VnAiVo4jAOcK3055wGMA1+D/NVG979BMISz2GxSgTsFDWxwcw3FJZIwA+F3gTJsqUq48WZQWOTpegdWPnYz6uilggqOhtncNodLIlFgrzLJlmAwbcQy5057Q=
Received: from MN0P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::14)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 20:58:15 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::df) by MN0P222CA0016.outlook.office365.com
 (2603:10b6:208:531::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 20:58:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 20:58:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 15:58:06 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>, 
 <swati2.sharma@intel.com>, <kamil.konieczny@linux.intel.com>,
 <jani.nikula@intel.com>, Wayne Lin <wayne.lin@amd.com>
Subject: [PATCH i-g-t][V2] tests/amdgpu: Add amd_hdr_visual for manual HDR
 verification
Date: Tue, 5 May 2026 14:57:43 -0600
Message-ID: <20260505205743.1839944-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a62ac8-3d13-41ab-c2f6-08deaae906ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: djrYlo5FOv+ki/xds447izKz7tPkbxrdxBmvyIRsC9XOK2EyOPOEyhDDZrso1yuexqJGMbXjMtStpyvgO79FXvlHYgOwY3wDPfwB0utmbZihv7wPKQ1eZVK4hMRKsU/nLiRJfVdtGQGnT6uLUhsWoK5xMay8MCv3tACz/KYkQp7swldWd3bz5gWsd0R7lP4TrBWnmuZ1GQKdYhmZwZXrTaN1P8Bw9aK/LAPZmXYEgM9UNyAhbGpZGgauN8FkyLffD13R8wVVjyHb0sWP3RItYVVotNj6QvIKu40xd1gvvCRyW6GchwnIL4DQ3ucR5dgRIhdIKybgRxg/6PsOhdiYB8mMjbaYKgOeiGPQwHxDetuwKJoHmq4IPncnVU5jL53QXPYqHIrskeoYWRVdt/HapzTtZ53lozLy1wRUDAmzD814wigkOMX+JiKtWGUaH2PvbCYuHJF9XgX1YxW3PEvGrybi+ehQaaJhCMmrZZ68pKPLZn86W/cxK1VL4t+nKwv2PF0KQcnIX+t/OyXLM2Cc/DZEdgXizKH04wVysROfaFGFVGV2+sFogjvVzhtsiszwCcFG4nqQZvxSA+QOybQibp2AfUKrDh1Yu/nJAfBckTcCyTA01rLdTq9YtQwshkppiqspBnEnqr3dz6VOk4VmIJGwgJQUwivTEtvnr0uVvMZmGhYvTnYW/NBn0QbVrA8b1km+61zX97/cacxM5BlV2rt/xoaPc4cTqSGCopVqnyU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: blbWOARPQitKvuve1rUpFJUnH+ZVDOLta/bapnuyTHS5Nu+CPjljj/0IjNRrQF4ky1d4fptifN3Hz9thsoMH0xKnAQh1t0m37lYypL5teOm1iTP0204McVsaQRt7NQh9bAzgXthgIaWkP4cBlHPwnDXhjgD5eGerCMTRwGdlCaZvRstsOP0lDAiENXJhynjSvNtIkultgjmOWaHQ/Z0yCPgvLQlmvZP9PaiG0aBnQfr62gOllR4xlLAwWOKwoB3k+dcu3aamGC+5wHqKACoQNf42ERiDhTue1ohFn8zDPC79ldQmZZEAl/89cflm9nLnDa3o+upaa9Y3Oj8TFsgjxSY8ftHLs9IiZdsfa5f/uSdORXzgXk3jUOEiHgBi7P0kl3KTcZ7iu/RNQ/hX1/6U8RaxBkZc8Yt2REX5ed/Fk/ol7mOChE6ZvwbhNo3Io/g7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:58:14.8774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a62ac8-3d13-41ab-c2f6-08deaae906ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
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

From: Wayne Lin <wayne.lin@amd.com>

Add a visual verification test for AMD HDR display output. This test
displays HDR test patterns with different metadata types and waits for
user confirmation, enabling manual inspection of HDR output quality.

Subtests:
- static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
- static-swap-traditional-sdr: Display with traditional SDR gamma metadata

Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 tests/amdgpu/amd_hdr_visual.c | 176 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |   7 ++
 2 files changed, 183 insertions(+)
 create mode 100644 tests/amdgpu/amd_hdr_visual.c

diff --git a/tests/amdgpu/amd_hdr_visual.c b/tests/amdgpu/amd_hdr_visual.c
new file mode 100644
index 000000000..63eed937c
--- /dev/null
+++ b/tests/amdgpu/amd_hdr_visual.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include "igt.h"
+#include "igt_hdr.h"
+
+/**
+ * TEST: AMD manual HDR visual tests
+ * Description: Test HDR metadata interfaces by showing visual HDR patterns
+ * Driver requirement: amdgpu
+ * Mega-feature: Display
+ * Sub-category: HDR
+ *
+ * SUBTEST: static-swap-smpte2084
+ * Description: Show a visual HDR pattern with SMPTE ST2084 metadata and
+ * require user confirmation.
+ *
+ * SUBTEST: static-swap-traditional-sdr
+ * Description: Show a visual HDR pattern with traditional SDR gamma metadata
+ * and require user confirmation.
+ */
+IGT_TEST_DESCRIPTION("Test HDR output metadata visual verification");
+
+/* Common test data. */
+typedef struct data {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	drmModeModeInfo *mode;
+	int fd;
+	int w;
+	int h;
+} data_t;
+
+/* Fills the FB with a test HDR pattern. */
+static void draw_hdr_pattern(igt_fb_t *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+
+	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
+	igt_paint_test_pattern(cr, fb->width, fb->height);
+
+	igt_put_cairo_ctx(cr);
+}
+
+/* Prepare test data. */
+static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
+{
+	igt_display_t *display = &data->display;
+
+	data->crtc = crtc;
+	igt_assert(data->crtc);
+
+	igt_display_reset(display);
+
+	data->output = output;
+	igt_assert(data->output);
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+
+	data->primary =
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_output_set_crtc(data->output, crtc);
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+}
+
+/* Returns true if an output supports max bpc property. */
+static bool has_max_bpc(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+}
+
+static void test_static_swap(data_t *data,
+			     void (*fill_metadata)(struct hdr_output_metadata *),
+			     const char *mode_name)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	igt_fb_t afb;
+	int afb_id;
+	bool found = false;
+	struct hdr_output_metadata hdr;
+
+	for_each_connected_output(display, output) {
+		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
+			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
+			continue;
+		}
+
+		if (!igt_is_panel_hdr(data->fd, output)) {
+			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
+			continue;
+		}
+
+		for_each_crtc(display, crtc) {
+			if (!igt_crtc_connector_valid(crtc, output))
+				continue;
+
+			prepare_test(data, output, crtc);
+
+			/* 10-bit formats are slow, so limit the size. */
+			afb_id = igt_create_fb(data->fd, 512, 512,
+					       DRM_FORMAT_XRGB2101010, 0, &afb);
+			igt_assert(afb_id);
+
+			draw_hdr_pattern(&afb);
+
+			/* Start in the specified HDR mode. */
+			igt_plane_set_fb(data->primary, &afb);
+			igt_plane_set_size(data->primary, data->w, data->h);
+			fill_metadata(&hdr);
+			igt_hdr_set_metadata(data->output, &hdr);
+			igt_output_set_prop_value(data->output,
+						  IGT_CONNECTOR_MAX_BPC, 10);
+			igt_display_commit_atomic(display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL);
+
+			igt_info("wait %s!\n", mode_name);
+			igt_debug_wait_for_keypress(mode_name);
+
+			/* Exit HDR mode and enter 8bpc, cleanup. */
+			igt_hdr_set_metadata(data->output, NULL);
+			igt_output_set_prop_value(data->output,
+						  IGT_CONNECTOR_MAX_BPC, 8);
+			igt_display_commit_atomic(display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL);
+
+			igt_display_reset(display);
+			igt_remove_fb(data->fd, &afb);
+
+			found = true;
+			break;
+		}
+	}
+
+	igt_require_f(found, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
+}
+
+int igt_main()
+{
+	data_t data = { 0 };
+
+	igt_fixture() {
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
+
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
+	igt_subtest("static-swap-smpte2084")
+		test_static_swap(&data, igt_hdr_fill_st2084, "smpte2084");
+
+	igt_describe("Tests swapping to traditional SDR gamma HDR metadata");
+	igt_subtest("static-swap-traditional-sdr")
+		test_static_swap(&data, igt_hdr_fill_sdr, "traditional-sdr");
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d5a4820e3..7db1e2d9e 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -90,3 +90,10 @@ foreach prog : amdgpu_progs
 				       install : true)
 	test_list += join_paths('amdgpu', prog)
 endforeach
+
+test_executables += executable('amd_hdr_visual', 'amd_hdr_visual.c',
+			       dependencies : test_deps,
+			       install_dir : amdgpudir,
+			       install_rpath : amdgpudir_rpathdir,
+			       install : true)
+test_list += join_paths('amdgpu', 'amd_hdr_visual')
--
2.43.0

