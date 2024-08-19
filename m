Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66022C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50110E46A;
	Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V/fVgE0h";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1273E10E470
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqoJk/2o1i/pKa58XN3Z9dG6O1lglC7/RTCQlXOrS7Si0Adq4M9bsGQbPq61O3a/i+aPBJEltRSzuRI1vA+9V3Y5uPE0aIY3VGwDDsPYf/VIJL5fvlYx7LWuEV7xn/75hu+BiwhJpVCGBEiYN+XjgxqhYiGsuL1qkI0APDNF54cYZ6YDde0NS2TE7lnD1wP9QE5mwiYZkSVxOgUHkKW58OGX2CRpfOWAB64OxBlU35bf8d+VoddLIWyQ5U7WlXBYqLoA674pw9vIPUNDaM00k3YX2XTARthKQCTPQuyYj7KCt8PCa2kwi1wH2Yk09U8COSLW9ibYfqz033l69Ubg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+JISXWvm/PkvQucoexG7SQ3TdD33gdkCQSsily+B1k=;
 b=XY3RK2+T5UhjaHJGzbTz3XC0EKSvVYnW5Y6/NV0x0+bh33JK2eOaTYQtJesK9J8oRS819C8CrptsRunCo1pVRwM9MBCua0bqkCVw/cRlUaW1Nw+/Xd5QTG3JcoHIVk/Dc10aga8Ko37JeBg2tfE1EAa9KQg0iLCgTm+4O2gw83ugKY8hv+FxCtn4J816VG4T0DmfLsiFKFcKST/gIRDET7OYxpXxEqESo+T4My86i8UThRdXoeg8OW3mmIKuhZLnyMdr6LGuDBVPfe1iQFiM9/Cw52V4uC0ONUD5X7dRUAAbwLxlj047bpKPxWmZLWibM/nycLLnmStvNBP/c0/rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+JISXWvm/PkvQucoexG7SQ3TdD33gdkCQSsily+B1k=;
 b=V/fVgE0hRIW8IxJ15wYrl7Yby3FVUkS7mp51QOTVGqQhEZkENAHeSsZiHrc+06yzZnXUNVptUwopS93dNcLTJomjaOTASyoqYv/xhcZHAJjM624SiUv8ArRS0OWIfkTFlmifsr6HlH4BoMAJKdCWAfIweDXgXzmg5GXFWZdBGgs=
Received: from BN0PR04CA0196.namprd04.prod.outlook.com (2603:10b6:408:e9::21)
 by DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:33 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::37) by BN0PR04CA0196.outlook.office365.com
 (2603:10b6:408:e9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:31 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 12/37] tests/kms_colorop: Add kms_colorop tests
Date: Mon, 19 Aug 2024 16:57:58 -0400
Message-ID: <20240819205823.316656-13-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2137c6c8-a3ad-4740-25be-08dcc091af8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4upiRukFttRHEdk2aG2z93ZjhUond9fStgHr3+8XajzdnQFzsI5vLbCFH8to?=
 =?us-ascii?Q?DcRp0HRo6C9eZA1KaEzX9jAq/2BNX/TaUjmeoCVJaN+IXsHvDlzPW79lOhdb?=
 =?us-ascii?Q?9kaYNAnNEn77hAnGGAyuPCvSsdkBDH6ErWKEYPkB+YFCPMHMWLI4C0VFz74t?=
 =?us-ascii?Q?/u+68j55BrJEozpZKBFKfJJujES4RTyE4YivAYPLg9dQ0mOlt9YGGsLyVM9V?=
 =?us-ascii?Q?P3rJ/OCZfSL8H1+HYCNSWBHMox6r4aTZW+nxc4VmUm4QoaUMbLTVgTfFhsnL?=
 =?us-ascii?Q?SEX2/b1CL2w0xqSk5JQ0rxwhNNwIyxfqqFQj4VRMXwqiHUUeqAIPALQrqSc9?=
 =?us-ascii?Q?S81CCBFqGmYCw5g7w/aBo+/SnhKudKH/n/snVbm9MlkXtDPI59QpBTkUbaz9?=
 =?us-ascii?Q?mYl/Rfz752CvUTdkV0Eetw2hflH/YTx416fVk7vMBbMDDHQb0X3K271kAMYU?=
 =?us-ascii?Q?fEJJfIyJwJXQxNhl7DNuYUH8i0dj7oTpyxNl0mbsSQ2PStFJYpA1DW7Wu0+t?=
 =?us-ascii?Q?Y3v3+U3iFC+4iBSrUxv7j9f2YhdMcZNXCyaM5Rve1OywyzwLKftc1ruj0EB/?=
 =?us-ascii?Q?Ptn27xTMfn14MBIx06pVz6beH2DHh4Ssf8hwpfGLW8HK3truIsWgK0i6OR8Q?=
 =?us-ascii?Q?a2RaaGSQKWh6YleLCyPMyRd3j6c+XD3aHDXOzMpSbEOW7+V/cfW9RR1UbSqP?=
 =?us-ascii?Q?z9uetua4XAbmU59CryHH32nDJejzQ2uDO62HKTs8x/qtg5zV/ZPBfvi7yKMZ?=
 =?us-ascii?Q?G3cOdX82sGUrOo+bPz/tXh7e7efRXy4icYZR8i/lrCbY46H17HyQqqlB2VYB?=
 =?us-ascii?Q?uvLd/IPgI5IwqiQxICQ0B+RnbW5qe3O4ty3CKoZ3nhbmxXmSaSZ3vDkekjyJ?=
 =?us-ascii?Q?2nQACJw6CYOgaILI/2RdsxXdANMIEM5H2yUoieqviilk/wzMsrU8dOvj0bDh?=
 =?us-ascii?Q?U+SWOoaM+G4exHvXgh3juOx8VDJ2waZXVUEgifmHKTYCr9faeEl0CT8AdoEZ?=
 =?us-ascii?Q?5DXvRGN17o64lmx9mmzu17JlUxpNpNRJGD/yjCXD8wumtcdGvlWB00GUF0i7?=
 =?us-ascii?Q?wHX4+Utcg68XX+Qn834dqd3jLlFAbLcrPB9IYcinp91eYS7xuSy5pwq4oxQE?=
 =?us-ascii?Q?r79BA0Sb+DQ0VDH+FtiBmzHK84TI8kACIqr14JQIQGcUbZQah1P22VGj7UB6?=
 =?us-ascii?Q?8ObU2sb/j0BvhcI/RLuD7O4acrI6Q9VnO4LmH8L6375kAT7AOaviyyrsCESA?=
 =?us-ascii?Q?iwF3KyyUd7879i1GqO3RuWpSpC6n7R7volJ8hNri6RZjDdOcdfcApl6r0V+m?=
 =?us-ascii?Q?bkekSOtDrbD4BxC7sZjVkdQtf98yuzJqGKGBW0pRVqQPNCP87F1zDcTKQw2G?=
 =?us-ascii?Q?tjH5NDIcK/2OEq6AjnydIptZ82vjnBTq2ZTh8W4LOzOUTRZG7MbnebXJfbla?=
 =?us-ascii?Q?AQrbhHhICChMyF3NCCzXb0dvE++ugVn3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:32.7065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2137c6c8-a3ad-4740-25be-08dcc091af8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718
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
index 000000000000..b9009a498651
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
index 000000000000..8102d25b13be
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
index e649466be1a0..75674b0481b3 100644
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
2.46.0

