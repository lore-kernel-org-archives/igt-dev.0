Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD2C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAEB10E4C4;
	Tue, 17 Jun 2025 04:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mq8i+d3V";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2CE10E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzNDgblAILLnjIVrMhW+bNQGgstoIuwn0RwtrSjWX85ch/voY1muSJvLvXqQv526Mky/bnVzT11KDgLPlRvXWqPfDq8iO/9hiHKohfEbDxnmYjTRNZFmkaj9vZImf8Za7Uas4QqR6G+zlZ6P1cWVKREUyrAkYFXj3GeCXvAnrzNeDbsWBxNUd1hUOmDATBqtAnc10Ha2dXxY3nuQIhBVh+SEQUq7D+ViJGDu/YwjCeDFPQenOjfobAeeVNUcp46IncdmCRSQT8vRW5KQ6DeGIJBBMA5MRK9n2BvGQmRwYUs+PhBrSPCU3mk5RgpQlKvnC9APhITvlBPWzxuYGrC7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg9JxYXrteeYOV3hxu47cUCqLZxejxhCmCLm13Hijeo=;
 b=eGCY0zP2QPzbszFEbm1wV0FMLRLV5bp8sCPYPzKarb0VzDUB3JMUNZRpA+L12QgZAz9TfRohfyFrYsHcq15CiyZOhFYgp+YJtgJ0C9akeTaLp/Qf/AUsecqbWNRuroEGEZ7b+MM4YHk04XTBHRW+0S8Ofbk4O8HFE28JUQr1HJfM9LvyhXRmYE79++0rBxj1DNyTn89U6euciSSnTxe6xR+I6Rk3iHflIffXtQRQuGcWAwzR9vhCII2Sf6fTkBejtXuqP+EuYWTA3tvNTZ6nM6TKNWT71s+XLL/XP5O3G8Pw4vqBo8etRnLqKQ5gqmVcL8iDN6VKL2J5gOXsnyRDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg9JxYXrteeYOV3hxu47cUCqLZxejxhCmCLm13Hijeo=;
 b=mq8i+d3VlPGCKtM8wv8bZszxBmS4tZL8zX6INUtnMpKSQYjRXe2njAm638AEnPFzZgCpzSgUT/qFoTa9Pqk16GknbC7Ps8sX2ZM3novI3co/RPHQhwkk8WBP+ICmAhH0FBSefsMxzElIJh1ArXsDfaMBTDNziY1Npfgri6i/coI=
Received: from DS7P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::26) by
 MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:39:22 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::a3) by DS7P220CA0032.outlook.office365.com
 (2603:10b6:8:223::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:22 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:39:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 13/36] tests/kms_colorop: Add kms_colorop tests
Date: Mon, 16 Jun 2025 22:36:08 -0600
Message-ID: <20250617043631.2920587-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 0423ff24-2292-47ff-0874-08ddad58ee7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H9e4eeH9EvQL90tpuP4y2S/gwFyZ/AO8TilO5gftGt+PdssW2kPGs7QnKsH8?=
 =?us-ascii?Q?EnvdoMT1h3PG5tSrriWVp9vsRlG8idpnU3xK2OUiQ3hdpHi0A55ostbukgcd?=
 =?us-ascii?Q?ajsUmNCnRqlGKSxoS614Gn9shNhCPqXVvSrW+buKST34NnIBiDpXS5a8Dq40?=
 =?us-ascii?Q?BFYi1stmArNrnuSO6mBEWrcA/4+QzpXxjgvsHcoSgCtiv7S4LRCu8uQpWY4M?=
 =?us-ascii?Q?AZr26gC+frOwFId54vORVsgzVdJLjNLnVjKkorPiNrl45L1Gbb6GaeC2VGTy?=
 =?us-ascii?Q?XuQbFA9La7wvsFH02ZX6saf3wFnsFBMR1qpCPkHXFbr93krpFN+I34iiMOnv?=
 =?us-ascii?Q?U7B15aA5q3aiflama09YWxeW9FTOTwVe++mcaol9V2ywtP0glcYTDWrkGeoW?=
 =?us-ascii?Q?C5ATM+sVUzVRDD7npvsIRK/ZifZAf7TUInBD7/t4tAeU+O0RIzz5nUqJqr/x?=
 =?us-ascii?Q?7rpUPIEisZJvKS4hgosOGRZvyK+3MomBnL+3eilG1mD98Un7QJGsV7A/0W4Q?=
 =?us-ascii?Q?gUuRgTdFav6YWN0eSxAfMqpWcDnsW+l2j9LwgX1r1k/fV4uyZp3rJwhPQy9P?=
 =?us-ascii?Q?ycvjREIXNLYgyglNGV6Z1V4EHCgbTwi5rM/TRfIqm6LfkDKXdru6y5fOJ5q1?=
 =?us-ascii?Q?ZZuTWXt8dwsdYkMMEtkrk0SV7Ldr+VMY80O1+ZtQNQMIPuI91Y79aGEmumGk?=
 =?us-ascii?Q?vFN5DVi3SL+pX3H6guf035IqBS0YkBafI1Q2DLaLW0q7Zk7EBJRohqtVo2i9?=
 =?us-ascii?Q?3pgJTWmKflOienDtaBc9dk+88CPIeZ38zyvyrK0PK0epPlT4dMgNvc15oiuc?=
 =?us-ascii?Q?v97r1PhxDqMt6+LdSFV8vMkSPcwskq7MFHMYfCqjEtSqGQzQpIiJFA3O7H8m?=
 =?us-ascii?Q?ku7uQUaMGmdB1zYtLq5UcnY3baCA4UVlCQkNkGqzTLGQlHKJBoQv8dM2mu32?=
 =?us-ascii?Q?7ISX53T/V0XNI8Or29kYnzY80XFTJ+lQM1IlMxv3lXgcoaHjecrvYKhx4kE0?=
 =?us-ascii?Q?2K4cHCXI+gpA4xHs8wOSr+k5tqd70CHakxy2e02TP0taBsZGh4eYAg/C/n24?=
 =?us-ascii?Q?hfjnjtldUKBHLdOEVXD12Bx7NLZdJbUnvghEWAa3sPSA92RTlHaV+uN1X2ty?=
 =?us-ascii?Q?Xc07IFgxcSUOX+Dz/lkxuoKGQTdVX90CaMjvI9auMeiWmjEdXFTG0xDPyas9?=
 =?us-ascii?Q?fM5euarveEX+3RQ1P9jXgY1I4+MrmgPoW0D59XzYt8r6hp7FKOyuvFH1btw/?=
 =?us-ascii?Q?m7v8yKHr9LGCXcGyi5wC209rte+J3SWioRy4TP64QaHcujtvoFK+GvqwLB7e?=
 =?us-ascii?Q?dEz4XRaanu1uCHwK194HsoajcOTC+6T5gn2hmbEsOoxj0afFamaGb2bEaupv?=
 =?us-ascii?Q?pKXvwF0BdaMRPEecXkQDeKvneD364z0Uuu9NYvWsyuOcDsf9heKOW9zuAWBw?=
 =?us-ascii?Q?wAPXRuLP34YgNB8/ppxbPxksl2YEWw1PabW7/2yyjYkzcjf9UzwTmkFo+rIy?=
 =?us-ascii?Q?PYaFUGKvjATEqhnH8UdiINU8oeSl+mgOC4we?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:22.5668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0423ff24-2292-47ff-0874-08ddad58ee7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
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
 tests/kms_colorop.c | 528 ++++++++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h |  87 ++++++++
 tests/meson.build   |   1 +
 3 files changed, 616 insertions(+)
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
new file mode 100644
index 000000000..e770c6b2e
--- /dev/null
+++ b/tests/kms_colorop.c
@@ -0,0 +1,528 @@
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
+		for (i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
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
+	for (i = 0; colorops[i]; i++)
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
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
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
index 55bcf57ec..447ae379c 100644
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

