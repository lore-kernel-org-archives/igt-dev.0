Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BFFED9F6
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 17:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AAC10E5A5;
	Tue, 17 Mar 2026 17:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LK8gIIAt";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E2E10E5A5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 17:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkqR165jAdD0+baW3vGXEviwDQnVp83oC3WfP/o85EtTV3RtLGP80L3azD5uTv5GDC+GI/P37hk7br1OaVXEhwQulnrtUDNrXnOx1KTjMReueLmeV8/G0Fjj+ZK5AVFohnGX+DWNAoCXb1vtdPEqX7awIV4ARaTOIa7xnG7C2cJDghEDYmCSs73A8cgo6QlNWh6m2BcjhbpuQeun02NO0DmHyM5wzo/BHjq4bV9vulb+4vmEVEduIP7b/AdDc1Oc5fCVxtC7YQ8+48u2NifYYBaUThcheqbikZi3bCuLQAfWO9Rw1hZHoIh2AJec36IVBaWwbgcKhBK+Z00RLRUzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvqUzCOa2qorAipI/3klG6/lizd63BWzTsPWFEocip4=;
 b=nUBmLxgw47xS2mfrJkJmr0e7ufpppyZ2Z1c3fP69nduFLCO3iz9VCflNG8b2OuqS9VBY4JojRE+dWcp4nG9Kn4Qywy0kxKRIKlcN3cot4g2kmUnige+wu8uPswpxsWay3xI/eIo1bgiSiDQeskjVGMArca3OjBe3NGORTPws0dPG+IinT2bLxcG/odyUOriNR7VUCtPu3i6PEvWgyDKK8ufDh4PWCfT34RQr6kv7hiy4g2P6X/kGsYW2vYC/ZQqlc8tCRxvrDJfwaWZ5FL22Nfjc1E/UQ0tN7J79tmxlAGm5PM10kKo9sWS0KVAc3kdJqiXhnAbpERhnzHHYXvAGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvqUzCOa2qorAipI/3klG6/lizd63BWzTsPWFEocip4=;
 b=LK8gIIAtCv/l48RM98BLMbcG0GmoWNwlvDE8jhCCTbnRdpTEM4duBQ4R8v/VM3XVBliXnAl58z+ZYS2JHBAwNFo/NhQyF+MhSacheK5/MGy4I5jYbtjuFzKsukkT+pf3VvzRhvcagoNIinAGBUfikaGqZ+hR0HLm9f1hYk1E9lw=
Received: from CH0PR03CA0333.namprd03.prod.outlook.com (2603:10b6:610:11a::7)
 by SA1PR12MB999252.namprd12.prod.outlook.com (2603:10b6:806:4dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 17:52:17 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::e4) by CH0PR03CA0333.outlook.office365.com
 (2603:10b6:610:11a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 17:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 17:52:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 12:52:15 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, <Mark.Broadworth@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 2/3] tools: Add amd_hdr_visual for manual HDR verification
Date: Tue, 17 Mar 2026 11:51:31 -0600
Message-ID: <20260317175136.3754576-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317175136.3754576-1-alex.hung@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SA1PR12MB999252:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ab6a21-bfff-4107-0000-08de844dede5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: pH3G2GmRCNJA5WqFvH3/XvFdpdI3fGZ4uDMGECYSD3yQRu+eOynPk5PrBQ6+2+48ghsWpY0RihYxDSJOW3+g6R/OCxnR05oPCacvqxV8ZFdiWGPsvDJOzzNSifr/IaVkwUo4hm0Vg/ImGC0PXlNCT+XffxCON0p4Had73kucM9OxL3tsC0VbLQ9kc/b2osFXot1iBKJGKnJlHCnmwGT1zBendYjhcZfGt4m1zu/KUMoTI4LNswtNJFWK+aV5DOd1JZXaWHYxTDzcOp9wt7krerFz8x/vnANeBAanYlKsyC0zwOzaeUkF/m8pBtbS+CDBEh4jcHHZuHpSpnISHiGpbNQ7Wz0cXIa1dVAeZlKa6K57DfpETWer3ezWLKrcR2SFz8zDOyTK/KTkr69mzmAOKqMHOgHP9GsdzfJsbcl8Z6maH+BK5Kj8z/i4eC2DITNAiQM9vYWUJV7LeYgJhPvWqvFfo8v76bzmDCt09eOxBjcTdQSchY0trkcKQil0U11R9/cTyta11lPyBJSFf67FY5cvvendLhF7hMtqE78L0+RtKppfmQBMzdaLzfxjKa6IxiltnlDtzYa5FDFRS49P9sBHTNtgr6p4ixlhK9RxMNtkwh9PB9Pza9jEykSq32yUtWcFirEMGG57fxIWzkz0mfxGBaXhK2YdsNcTKt8kDZa+2DqvakkU1ztZPrgAqIjH+MDx+g04ZJOCCe2haSWfu4iGlHN8W62L2tu1efS/K7/smZtfplwttQBHw4IlNdrlYSrETjFXwy9YYXFn1vmP6w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NR5Xf11754Z/U9eN80eCulZxWdhNXiq0UqzbWtM9gYfGVq1JnzB7E7HuLVWX6N/FkbRvQgRl4OAW1uT7qCekAcYa371LryxZgbKxjRdSbo3TKAr9wpr2Pu9C6R0qSCRS7CbKaiS7h81wBN9Ty9YbzHtC6Dk83Va6QVIutC4vqGhBgxS4nauLMMUftiJkTm/jsfuQhfAc0mZoSGyLkIE6VMiz3VkLoOPPpH+vPbNfi3DMHyR+6is2wnAZDiXZp0kl4SbVsfX6ITuuFCRxl7bzsQ9DhWPVVDH7rn0RxgC4DK2eiF6f1o2JKfO9jJAxCodhz7iFXmvLFtYCUvS54p+E6JIx0MDg90NasNiNDwel22JeMNFespbJjGyYQTZelZS7sEjghPKMKNkecaCvuDqUMtCO14dmo0aVHqjdQZiCn40zkbPQzsq0lg6zTKVWrH+G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:52:17.1202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ab6a21-bfff-4107-0000-08de844dede5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999252
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

Add a visual verification tool for AMD HDR display output. This tool
displays HDR test patterns with different metadata types and waits for
user confirmation, enabling manual inspection of HDR output quality.

Subtests:
- static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
- static-swap-traditional-sdr: Display with traditional SDR gamma metadata

Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 tools/amd_hdr_visual.c | 372 +++++++++++++++++++++++++++++++++++++++++
 tools/meson.build      |   5 +
 2 files changed, 377 insertions(+)
 create mode 100644 tools/amd_hdr_visual.c

diff --git a/tools/amd_hdr_visual.c b/tools/amd_hdr_visual.c
new file mode 100644
index 000000000..58decb356
--- /dev/null
+++ b/tools/amd_hdr_visual.c
@@ -0,0 +1,372 @@
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include <fcntl.h>
+#include <termios.h>
+#include <unistd.h>
+#include "igt_edid.h"
+#include "igt_hdr.h"
+
+IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
+
+/* Test flags. */
+enum {
+	TEST_NONE = 1 << 0,
+	TEST_DPMS = 1 << 1,
+	TEST_SUSPEND = 1 << 2,
+	TEST_SWAP = 1 << 3,
+};
+
+/* BPC connector state. */
+typedef struct output_bpc {
+	unsigned int current;
+	unsigned int maximum;
+} output_bpc_t;
+
+/* Common test data. */
+typedef struct data {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_crtc_t *pipe;
+	igt_pipe_crc_t *pipe_crc;
+	drmModeModeInfo *mode;
+	enum pipe pipe_id;
+	int fd;
+	int w;
+	int h;
+} data_t;
+
+/* Common test cleanup. */
+static void test_fini(data_t *data)
+{
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_display_reset(&data->display);
+}
+
+static void test_cycle_flags(data_t *data, uint32_t test_flags)
+{
+	if (test_flags & TEST_DPMS) {
+		kmstest_set_connector_dpms(data->fd,
+					   data->output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->fd,
+					   data->output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (test_flags & TEST_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+}
+
+/* Returns the current and maximum bpc from the connector debugfs. */
+static output_bpc_t get_output_bpc(data_t *data)
+{
+	char buf[256];
+	char *start_loc;
+	int fd, res;
+	output_bpc_t info;
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
+
+	igt_require(res > 0);
+
+	close(fd);
+
+	igt_assert(start_loc = strstr(buf, "Current: "));
+	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
+
+	igt_assert(start_loc = strstr(buf, "Maximum: "));
+	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
+
+	return info;
+}
+
+/* Verifies that connector has the correct output bpc. */
+static void assert_output_bpc(data_t *data, unsigned int bpc)
+{
+	output_bpc_t info = get_output_bpc(data);
+
+	igt_require_f(info.maximum >= bpc,
+		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
+		      info.maximum);
+
+	igt_assert_eq(info.current, bpc);
+}
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
+static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+{
+	igt_display_t *display = &data->display;
+
+	data->pipe_id = pipe;
+	data->pipe = &data->display.crtcs[data->pipe_id];
+	igt_assert(data->pipe);
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
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
+
+	igt_output_set_crtc(data->output, igt_crtc_for_pipe(display, data->pipe_id));
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+}
+
+static bool igt_crtc_is_free(igt_display_t *display, igt_crtc_t *crtc)
+{
+	int i;
+
+	for (i = 0; i < display->n_outputs; i++)
+		if (display->outputs[i].pending_crtc == crtc)
+			return false;
+
+	return true;
+}
+
+/* Returns true if an output supports max bpc property. */
+static bool has_max_bpc(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+}
+
+
+
+/* Sets the HDR output metadata prop. */
+static void set_hdr_output_metadata(data_t *data,
+				    struct hdr_output_metadata const *meta)
+{
+	igt_output_replace_prop_blob(data->output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? sizeof(*meta) : 0);
+}
+
+
+
+static void test_static_toggle(data_t *data, igt_output_t *output,
+			       uint32_t flags)
+{
+	igt_display_t *display = &data->display;
+	struct hdr_output_metadata hdr;
+	igt_crc_t ref_crc, new_crc;
+	igt_crtc_t *crtc;
+	igt_fb_t afb;
+	int afb_id;
+
+	for_each_crtc(display, crtc) {
+		if (!igt_crtc_connector_valid(crtc, output))
+			continue;
+
+		if (!igt_crtc_is_free(display, crtc))
+			continue;
+
+		prepare_test(data, output, crtc->pipe);
+
+		/* 10-bit formats are slow, so limit the size. */
+		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+		igt_assert(afb_id);
+
+		draw_hdr_pattern(&afb);
+
+		igt_hdr_fill_output_metadata_st2084(&hdr);
+
+		/* Start with no metadata. */
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
+		set_hdr_output_metadata(data, &hdr);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 10);
+
+		/* Verify that the CRC are equal after DPMS or suspend. */
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+		test_cycle_flags(data, flags);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		break;
+	}
+}
+
+static void test_static_swap(data_t *data, igt_output_t *output,
+			     void (*fill_metadata)(struct hdr_output_metadata *),
+			     const char *mode_name)
+{
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
+	igt_fb_t afb;
+	int afb_id;
+	struct hdr_output_metadata hdr;
+
+	for_each_crtc(display, crtc) {
+		if (!igt_crtc_connector_valid(crtc, output))
+			continue;
+
+		if (!igt_crtc_is_free(display, crtc))
+			continue;
+
+		prepare_test(data, output, crtc->pipe);
+
+		/* 10-bit formats are slow, so limit the size. */
+		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+		igt_assert(afb_id);
+
+		draw_hdr_pattern(&afb);
+
+		/* Start in the specified HDR mode. */
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		fill_metadata(&hdr);
+		set_hdr_output_metadata(data, &hdr);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		igt_info("wait %s!\n", mode_name);
+		igt_debug_wait_for_keypress(mode_name);
+
+		/* Exit HDR mode and enter 8bpc, cleanup. */
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		break;
+	}
+}
+
+/* Returns true if an output supports HDR metadata property. */
+static bool has_hdr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+}
+
+static void test_hdr(data_t *data, const char *test_name, uint32_t flags,
+		    void (*fill_metadata)(struct hdr_output_metadata *),
+		    const char *mode_name)
+{
+	igt_output_t *output;
+	int valid_tests = 0;
+
+	for_each_connected_output(&data->display, output) {
+		/* To test HDR, 10 bpc is required, so we need to
+		 * set MAX_BPC property to 10bpc prior to setting
+		 * HDR metadata property. Therefore, checking.
+		 */
+		if (!has_max_bpc(output) || !has_hdr(output)) {
+			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
+			continue;
+		}
+
+		if (!igt_hdr_is_panel_hdr(data->fd, output->id)) {
+			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
+			continue;
+		}
+
+		igt_info("HDR %s test execution on %s\n", test_name, output->name);
+		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
+			test_static_toggle(data, output, flags);
+		if (flags & TEST_SWAP)
+			test_static_swap(data, output, fill_metadata, mode_name);
+
+		valid_tests++;
+	}
+
+	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
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
+		test_hdr(&data, "static-swap-smpte2084", TEST_SWAP,
+			 igt_hdr_fill_output_metadata_st2084, "smpte2084");
+
+	igt_describe("Tests swapping to traditional SDR gamma HDR metadata");
+	igt_subtest("static-swap-traditional-sdr")
+		test_hdr(&data, "static-swap-traditional-sdr", TEST_SWAP,
+			 igt_hdr_fill_output_metadata_sdr, "traditional-sdr");
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..9612acd83 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -104,6 +104,11 @@ executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('amd_hdr_visual', 'amd_hdr_visual.c',
+	   dependencies : [tool_deps],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	msm_dp_compliance_src = [
 		'msm_dp_compliance.c',
-- 
2.43.0

