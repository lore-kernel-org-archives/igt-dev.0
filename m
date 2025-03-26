Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15801C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247E10E792;
	Wed, 26 Mar 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a3/9WKNS";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED13F10E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFrqN3i62mPzEkQJPy7ZrGNCi6QKB9pJDDg7OfL0NPRittJHvB+RRwOc8I8CY4EAgMOoYpwubFD3CN09+zO9XAIas0ugy8023/viTLqzu6dpii/sOJMufpXuu1Jxc0Flt3XT/O1MbSetMM335avP1FJuQ6BLeDhWCke9eCl8aBi1Ya6JQyGDNCUKwPUZNHrUKgFmMtQY+r/Qo4SKzWbpkJAECeKBdvDiBV86D6JvplVrdIAfTN0nOIKkVX7LPF4so8iRSOEAxD4RUV2Vv+brbfIt3aOpdY+vo5qTe63JyutPAAd8W3zl3XUgTzhl1XbGcDWxj7F3eQ/HVSMW25RLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9udbpeaSPTbA24hsWgk1V76G6WsdgDYDZKGN+NIao+g=;
 b=VTLPXJalo5jul11wA6hFMj1H+hBmem5dmJ+tKGSAxEG0KBlbuk0yFZiks43MfS0EnOYYxfLZid2aHv+Wz0F8BgXmIRZujgnVsuV9/3yJAr5p91HHpwacEtqUX9ZzNL602YLI6NvFy9csrI5wiSrMFCYGUqDZcehOAFiKQNrucKT8j4sDEdZLw3G6qvu2Fh67XzMjozzWsG/qPMIoO51tZUqxYM33JIJ75x3+2DacUP/aMKxP3mWs++hWbb9TNbi7AzyV0avUA+b0xJZXuw3aiXeNNUY/46e/UVX5eeRoXbkJukrYm3LpVLs3eCZbrz80lzk7u0MzY3BAwpnI7o69GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9udbpeaSPTbA24hsWgk1V76G6WsdgDYDZKGN+NIao+g=;
 b=a3/9WKNS4hAuVz4793hidrsX7uPr0fk75JBo314f8Qi//80IkxrhadeN8e4Z4s7Lu95cRi6ihe1tQ2nbFmbcMY2EkNZAlKEEqae7uWc3Ux2G4JDmdRaoT5Ez+i24oGIDnAEXP86qYPt9ySCKo39AZa+3wISxI2FvWOZe/QZSG4w=
Received: from MN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:208:530::33)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:41:57 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::2b) by MN0PR02CA0011.outlook.office365.com
 (2603:10b6:208:530::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:41:56 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:41:55 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 12/37] tests/kms_colorop: Add kms_colorop tests
Date: Wed, 26 Mar 2025 17:35:44 -0600
Message-ID: <20250326233609.2980110-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd01539-305c-407a-da28-08dd6cbfcbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g5o460muInFm1Dv1YJNB8zJpTXBDKMWHWS1XpNz3fHVbh06Oybw4V7amxPUv?=
 =?us-ascii?Q?z6tdUr4rJLxlWGTMfXM4BGZhCU5Ne+6pTki9cT5LdWQi0rfLPx3yCD82uR5+?=
 =?us-ascii?Q?LhoiLlehpl1rvDBGsxwTxrukQxt8UbNtNNYZcAGhfZbICPTQFdfWRcAAKhps?=
 =?us-ascii?Q?Z436unKh2glhrWf8YrUWEf/8Djtxdu2GxtxpYvPDrQBXHZh/LSTaZpqRZ1Ds?=
 =?us-ascii?Q?TX844s6APDiENyKbMMGdL6kFE9c+7xHK71Oh5sHS1UvThOrqIOvXI+sXLpQI?=
 =?us-ascii?Q?FcvlrajVRgq8NxdYoK2L4oAQMoPWC5tbPxKhPx5CnsanTXYeSw5k3MRjenmA?=
 =?us-ascii?Q?4sXXmP6xQ+cj3tPPTYPE8nreP2TDGNe0EAwrcZ3g6eb4XlCPsVk2KqM6y6yC?=
 =?us-ascii?Q?4hzy5/OsmltE/Ep9QvbjLh34aUKaWCu6S+89LchTqrtuEDMuhgboaudp9VoC?=
 =?us-ascii?Q?lQwTbNyHhBrTMt/Ip1i/oWJ+aTZgrJCY7GEq1Dr6M2YBkupctUyNbTZTba/J?=
 =?us-ascii?Q?P90T/nBMCcBo+54/krQEhFsjfbGKOcOGuWyirkvyuQodDXpJbp0nyofFqsZD?=
 =?us-ascii?Q?WWSZPoWwJiGp1BmFE6qRsI2YpHTEVdwuGyC0KLvt5sxVBB64I64+uhKTx7/q?=
 =?us-ascii?Q?95Dh59kIsrWlyoVl/feI0PBg3skdNjPvhCMYi9EHiuahz3JG1hThQlByWxNj?=
 =?us-ascii?Q?IIVARiEmXV9zk/GDFmlgCCR1pnQkmv5n4GmoKiglhLGYTqJz4Vv54ZrkKmTr?=
 =?us-ascii?Q?I9UTd0ItrzALuVGBVfJ9Bptz7SKKMuGxmffzLDvUQUFaiUvXt6b957O92bf9?=
 =?us-ascii?Q?9Q+64VbxXzPHoIEZjPAScFLlZ8Dep2f6xaFDit2ZU6CP20Ks5/06Gljq6QYG?=
 =?us-ascii?Q?JSAFrGLLkUyg1oMfwlAg3nnXdnEXBvNFW5BGN2AylTD/JvXxiltAcmhrpYLc?=
 =?us-ascii?Q?jux74wDgqg9lUtMf+QvoShvP7uuduFffdZnjbzLq6X3Y1GlvhYe5RBRyU0eb?=
 =?us-ascii?Q?9eVKQQHwVHogeIKLCKyaiJEhdwO1GsuPiYTaDyIqK3bFnlNulzH4k4cJ1hSL?=
 =?us-ascii?Q?FmxWNKBXBEQxPUX3fFFfw0ZwvBBVFCBqGsDpFJYPtabfX3oXOZn+TgMH/wU1?=
 =?us-ascii?Q?ira7Texd9hde7yBuyGnheXEhM3a+5DvoJEZsMTZecgsc03uesPNDpc3HkiiF?=
 =?us-ascii?Q?D2/1XYrNhw1588PqO3M0p/FFKHVYSRdJpSiAeLnr7kPCq/HxWSDstF97PY/M?=
 =?us-ascii?Q?tMftopYGecE5GO/Ts3jigH/IOzJ3Tg41u3KmW/hkK12NakC4EiWYVJWK1wkI?=
 =?us-ascii?Q?7ec63HAD7X/PaD8jK0K2yyV0meceO8F6eSY2U65JoF0z67gkvLEe/6bJe/gY?=
 =?us-ascii?Q?wHhijzhjy5OrjfkNbqKGVgrrOYV3X8pF1YRVuup4g8nE+xnplO4SYT5VHKO+?=
 =?us-ascii?Q?7+klFlQJuGNo0EwJ5vsbiLnLK9GRqyXgCbT4xlmKQW7Ayk8LtrgMEdLg2SOU?=
 =?us-ascii?Q?vegCsb1nZRoJsHg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:41:56.9828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd01539-305c-407a-da28-08dd6cbfcbcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
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

This tests the color pipeline API, exposed via the
COLOR PIPELINE plane property and drm_colorop objects.

We introduce tests for:
 - sRGB EOTF
 - sRGB Inverse EOTF
 - sRGB EOTF + sRGB Inverse EOTF

The last one is the holy grail of LUT testing. It tests that
after applying an EOTF, followed by its inverse EOTF we arrive
back at the original value. We can use this to test for
precision loss in the pipeline.

All tests are tested via writeback. All transforms are done in
SW (in floating point) and at the end the SW transformed buffer
is compared with the KMS writeback output buffer. The two should
match within a bracket of acceptable deviations. Since these
deviations might look different for different KMS drivers we'll
do this check on a driver-specific basis.

v3:
 - skip tests if color pipeline not found
 - Rename colorop to color_pipeline in places where it refers
   to the entire pipeline (Sebastian)

v2:
 - Make tests dynamic, allowing definition of tests with an
   arbitrary number of transforms
 - Add test for sRGB Inverse EOTF
 - Add test for sRGB EOTF, followed by sRGB Inverse EOTF

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 530 ++++++++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h |  87 ++++++++
 tests/meson.build   |   1 +
 3 files changed, 618 insertions(+)
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
new file mode 100644
index 000000000..b9009a498
--- /dev/null
+++ b/tests/kms_colorop.c
@@ -0,0 +1,530 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "igt_color.h"
+#include "sw_sync.h"
+
+#include "kms_colorop.h"
+
+/**
+ * TEST: kms colorop
+ * Category: Display
+ * Description: Test to validate the retrieving and setting of DRM colorops
+ *
+ * SUBTEST: plane-%s
+ * Description: Tests DRM colorop properties on a plane
+ * Driver requirement: amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @srgb_eotf:                   sRGB EOTF
+ * @srgb_inv_eotf:               sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
+ *
+ */
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+				    drmModeModeInfo override_mode)
+{
+	igt_fb_t input_fb, output_fb;
+	igt_plane_t *plane;
+	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
+	int width, height, ret;
+
+	igt_output_override_mode(output, &override_mode);
+
+	width = override_mode.hdisplay;
+	height = override_mode.vdisplay;
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+	igt_assert(ret >= 0);
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    writeback_format, modifier, &output_fb);
+	igt_assert(ret >= 0);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
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
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+typedef struct {
+	bool builtin_mode;
+	bool custom_mode;
+	bool list_modes;
+	bool dump_check;
+	int mode_index;
+	drmModeModeInfo user_mode;
+} data_t;
+
+static data_t data;
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+{
+	int i;
+	enum pipe pipe;
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
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+			continue;
+
+		for_each_pipe(display, pipe) {
+			igt_output_set_pipe(output, pipe);
+
+			if (data.custom_mode)
+				override_mode = data.user_mode;
+			if (data.builtin_mode)
+				override_mode = output->config.connector->modes[data.mode_index];
+
+			if (check_writeback_config(display, output, override_mode)) {
+				igt_debug("Using connector %u:%s on pipe %d\n",
+					  output->config.connector->connector_id,
+					  output->name, pipe);
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
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static uint64_t get_writeback_fb_id(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static void detach_crtc(igt_display_t *display, igt_output_t *output)
+{
+	if (get_writeback_fb_id(output) == 0)
+		return;
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static void get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >= 0);
+
+	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd = -1;
+}
+
+static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
+{
+	switch (desired->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE) {
+			return true;
+		}
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_CTM:
+	case KMS_COLOROP_LUT3D:
+	default:
+		return false;
+	}
+}
+
+/**
+ * Iterate color pipeline that begins with colorop and try to map
+ * colorops[] to it.
+ */
+static bool map_to_pipeline(igt_display_t *display,
+			    igt_colorop_t *colorop,
+			    kms_colorop_t *colorops[])
+{
+	igt_colorop_t *next = colorop;
+	kms_colorop_t *current_op;
+	int i = 0;
+	int prop_val = 0;
+
+	current_op = colorops[i++];
+	igt_require(current_op);
+
+	while (next) {
+		if (can_use_colorop(display, next, current_op)) {
+			current_op->colorop = next;
+			current_op = colorops[i++];
+			if (!current_op)
+				break;
+		}
+		prop_val = igt_colorop_get_prop(display, next,
+						IGT_COLOROP_NEXT);
+		next = igt_find_colorop(display, prop_val);
+	}
+
+	if (current_op) {
+		/* we failed to map the pipeline */
+
+		/* clean up colorops[i].colorop mappings */
+		for(i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
+			current_op->colorop = NULL;
+
+		return false;
+	}
+
+	return true;
+}
+
+static igt_colorop_t *get_color_pipeline(igt_display_t *display,
+					 igt_plane_t *plane,
+					 kms_colorop_t *colorops[])
+{
+	igt_colorop_t *colorop = NULL;
+	int i;
+
+	/* go through all color pipelines */
+	for (i = 0; i < plane->num_color_pipelines; ++i) {
+		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
+			colorop = plane->color_pipelines[i];
+			break;
+		}
+	}
+
+	return colorop;
+}
+
+static void set_colorop(igt_display_t *display,
+			kms_colorop_t *colorop)
+{
+	igt_assert(colorop->colorop);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
+
+	/* TODO set to desired value from kms_colorop_t */
+	switch (colorop->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		switch (colorop->enumerated_lut1d_info.tf) {
+		case KMS_COLOROP_LUT1D_SRGB_EOTF:
+			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
+			break;
+		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
+			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
+			break;
+		case KMS_COLOROP_LUT1D_PQ_EOTF:
+		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
+		default:
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+		break;
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_CTM:
+	case KMS_COLOROP_LUT3D:
+	default:
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+}
+
+static void set_color_pipeline(igt_display_t *display,
+			       igt_plane_t *plane,
+			       kms_colorop_t *colorops[],
+			       igt_colorop_t *color_pipeline)
+{
+	igt_colorop_t *next;
+	int prop_val = 0;
+	int i;
+
+	igt_plane_set_color_pipeline(plane, color_pipeline);
+
+	for(i = 0; colorops[i]; i++)
+		set_colorop(display, colorops[i]);
+
+	/* set unused ops in pipeline to bypass */
+	next = color_pipeline;
+	i = 0;
+	while (next) {
+		if (!colorops[i] || colorops[i]->colorop != next)
+			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
+		else
+			i++;
+
+		prop_val = igt_colorop_get_prop(display, next,
+						IGT_COLOROP_NEXT);
+		next = igt_find_colorop(display, prop_val);
+	}
+}
+
+static void set_color_pipeline_bypass(igt_plane_t *plane)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+}
+
+static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
+{
+	if (is_vkms_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 1, 1);
+	else
+		/*
+		 * By default we'll look for a [0, 0] bracket. We can then
+		 * define it for each driver that implements support for this
+		 * test. That way we can understand the precision of each
+		 * driver better.
+		 */
+		return igt_cmp_fb_pixels(in, out, 0, 0);
+}
+
+#define DUMP_FBS 1
+
+#define MAX_COLOROPS 3
+#define NUM_COLOROP_TESTS 3
+#define MAX_NAME_SIZE 256
+
+static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
+{
+	int i;
+	igt_pixel_transform transforms[MAX_COLOROPS];
+
+	/*
+	 * TODO
+	 *
+	 * This is wrong and loses precision since it always goes back
+	 * to an 8-bpc framebuffer.
+	 *
+	 * Instead we need to stay as UNORM or float 16-bpc value throughout
+	 * all transforms.
+	 */
+
+	for (i = 0; colorops[i]; i++)
+		transforms[i] = colorops[i]->transform;
+
+	igt_color_transform_pixels(sw_transform_fb, transforms, i);
+}
+
+static void colorop_plane_test(igt_display_t *display,
+			       kms_colorop_t *colorops[])
+{
+	igt_colorop_t *color_pipeline = NULL;
+	igt_output_t *output;
+	igt_plane_t *plane;
+	igt_fb_t input_fb;
+	igt_fb_t sw_transform_fb;
+	igt_fb_t output_fb;
+	drmModeModeInfo mode;
+	unsigned int fb_id;
+	igt_crc_t input_crc, output_crc;
+
+	output = kms_writeback_get_output(display);
+	igt_require(output);
+
+	if (output->use_override_mode)
+		memcpy(&mode, &output->override_mode, sizeof(mode));
+	else
+		memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+	/* create input fb */
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(plane);
+
+	fb_id = igt_create_color_pattern_fb(display->drm_fd,
+					mode.hdisplay, mode.vdisplay,
+					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					0.2, 0.2, 0.2, &input_fb);
+	igt_assert(fb_id >= 0);
+	igt_plane_set_fb(plane, &input_fb);
+#if DUMP_FBS
+	igt_dump_fb(display, &input_fb, ".", "input");
+#endif
+
+	/* create output fb */
+	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
+				DRM_FORMAT_XRGB8888,
+				igt_fb_mod_to_tiling(0),
+				&output_fb);
+	igt_require(fb_id > 0);
+
+	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+	/* reset color pipeline*/
+
+	/* TODO do we need this? might be good sanity anyways */
+	set_color_pipeline_bypass(plane);
+
+	/* Commit */
+	igt_plane_set_fb(plane, &input_fb);
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	igt_display_commit_atomic(output->display,
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	get_and_wait_out_fence(output);
+
+	/* Compare input and output buffers. They should be equal here. */
+	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
+
+	igt_assert_crc_equal(&input_crc, &output_crc);
+
+	/* create sw transformed buffer */
+
+	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
+	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
+
+	apply_transforms(colorops, &sw_transform_fb);
+#if DUMP_FBS
+	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
+#endif
+	/* discover and set COLOR PIPELINE */
+
+	/* get COLOR_PIPELINE enum */
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+
+	/* skip test if we can't find applicable pipeline */
+	igt_skip_on(!color_pipeline);
+
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	/* commit COLOR_PIPELINE */
+	igt_display_commit_atomic(display,
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	get_and_wait_out_fence(output);
+#if DUMP_FBS
+	igt_dump_fb(display, &output_fb, ".", "output");
+#endif
+
+	/* compare sw transformed and KMS transformed FBs */
+	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
+
+	/* reset color pipeline*/
+	set_color_pipeline_bypass(plane);
+
+	/* Commit */
+	igt_plane_set_fb(plane, &input_fb);
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	igt_display_commit_atomic(output->display,
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	get_and_wait_out_fence(output);
+
+	/* cleanup */
+	detach_crtc(display, output);
+	igt_remove_fb(display->drm_fd, &input_fb);
+	igt_remove_fb(display->drm_fd, &output_fb);
+}
+
+igt_main
+{
+
+	struct {
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		const char *name;
+	} tests[] = {
+		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
+	};
+
+	igt_display_t display;
+	int i, ret;
+
+	igt_fixture {
+		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			display.is_atomic = 1;
+
+		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
+		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+
+		igt_display_require(&display, display.drm_fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&display, display.drm_fd);
+
+		igt_require(display.is_atomic);
+
+	}
+
+	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		igt_describe("Bla bla bla");
+		igt_subtest_f("plane-%s", tests[i].name)
+			colorop_plane_test(&display, tests[i].colorops);
+	}
+
+	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
+#if 0
+	igt_subtest("plane-srgb") {
+		colorop_plane_test(&display, colorops_srgb);
+	}
+	igt_subtest("plane-inv_srgb") {
+		colorop_plane_test(&display, colorops_srgb_inv);
+	}
+#endif
+	igt_fixture {
+
+		igt_display_fini(&display);
+	}
+}
+
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
new file mode 100644
index 000000000..8102d25b1
--- /dev/null
+++ b/tests/kms_colorop.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef __KMS_COLOROP_H__
+#define __KMS_COLOROP_H__
+
+#include "igt_color.h"
+
+typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
+
+typedef int (*transform_fb)(igt_fb_t *in);
+
+typedef int (*transform_pixel)(igt_pixel_t *pixel);
+
+/* Test version definitions */
+typedef enum kms_colorop_type {
+	KMS_COLOROP_ENUMERATED_LUT1D,
+	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM,
+	KMS_COLOROP_LUT3D
+} kms_colorop_type_t;
+
+typedef enum kms_colorop_lut1d_tf {
+	KMS_COLOROP_LUT1D_SRGB_EOTF,
+	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_EOTF,
+	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+} kms_colorop_lut1d_tf_t;
+
+typedef struct kms_colorop_enumerated_lut1d_info {
+	kms_colorop_lut1d_tf_t tf;
+} kms_colorop_enumerated_lut1d_info_t;
+
+typedef struct kms_colorop {
+	kms_colorop_type_t type;
+
+	union {
+		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+	};
+
+	const char *name;
+
+	igt_pixel_transform transform;
+
+	/* Mapped colorop */
+	igt_colorop_t *colorop;
+
+} kms_colorop_t;
+
+kms_colorop_t kms_colorop_srgb_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
+	},
+	.name = "srgb_eotf",
+	.transform = &igt_color_srgb_eotf
+};
+
+kms_colorop_t kms_colorop_srgb_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
+	},
+	.name = "srgb_inv_eotf",
+	.transform = &igt_color_srgb_inv_eotf
+};
+
+#endif /* __KMS_COLOROP_H__ */
diff --git a/tests/meson.build b/tests/meson.build
index fda8584e9..dcdccef18 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -23,6 +23,7 @@ test_progs = [
 	'kms_bw',
 	'kms_color',
 	'kms_concurrent',
+	'kms_colorop',
 	'kms_content_protection',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
-- 
2.43.0

