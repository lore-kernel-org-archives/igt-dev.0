Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB6FC4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 16:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45BD10E886;
	Tue, 13 Feb 2024 16:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ui7sJkSY";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E599610E886
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 16:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ3wxhsi6ndUptcbISg7f6vQdiDlPGq4qAD9ruyOml2D2hOR2C6ArRESAQl8ylx80e18LOoJhxmWpyMF8AdW57rOqlSKMVjcEJkoK0aM5sL/J4xFsBnccJtk9wZQ9ycPvBUCsxia0RdSRclJfJFUASA3U3AGj6mTbDqrfctyoX4d/bnkJo3OcqPXZtwSVIqYxg61D+4kEDzFWox57k6OI48XR4LVVsNyOQ2pS7O8TywLdO3kR344ZLta11sio1TApCc2Cq6DdFe0oEjRpkbLfOss98ZMyjPRZOQMvqrYbXrR5WDtv5SxPEZhlSkNnNx6pCFUHlGZxAvX4IzUAP1Chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V1Ou3h8lubKXBJn+5aoWIqH7e4V7rH31wM/U3tJaUY=;
 b=Z3CrAQV3P/BIEN4a8KkggFs9Uvb9KAYZTUwgSbzfsRyI11/YRpQLtXUlcvBJtFyp8NfEf6TbD0pRkTF0JTZhU06EpoBX8iyeDM2aBdXAkphoc0O6NsFz/MsLNy9tK19ucbUgnpjHpGxsmUN+1PsZFOkYRF2jKse/WJZmqJecADFJPW1lVGbboUIiKo+21ywrz4HqQ+WWelQaz+W4vJs9kEPcy087lJnuHHFtXK2+hb+cBpDC5RnMLbGKAPMXLAcCeS9hr3Bw4sBMM7DaYWLCkBFd9IZwfPiyvd0QijJnabW8LdIPo3eu5/wUp40pCQCBhAdJKAmYs9XUQ39yyGumjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V1Ou3h8lubKXBJn+5aoWIqH7e4V7rH31wM/U3tJaUY=;
 b=ui7sJkSYhXERy8GidTDY9MRbWwTGqz9Ee6RjvdetO7F4K8cIrVb7Q4VqKpAWOUvHk+P+ZNrI37N2N7gMM+rQu9QOT9R4SxmfynSZTuRgsujqDdysX1fbc8/9RAlDPLU7xNYG0sQVR0MRyGNCs6pPYchGoMf8Ch1pRmilLrzcDLU=
Received: from SJ0PR03CA0157.namprd03.prod.outlook.com (2603:10b6:a03:338::12)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 16:51:50 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::23) by SJ0PR03CA0157.outlook.office365.com
 (2603:10b6:a03:338::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Tue, 13 Feb 2024 16:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 16:51:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 10:51:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 10:51:48 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 13 Feb 2024 10:51:47 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_multipipe_modeset: Run modeset and
 display enable for multidisplays
Date: Tue, 13 Feb 2024 11:51:45 -0500
Message-ID: <20240213165145.49514-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: ac124e54-9b3d-42b6-4f20-08dc2cb41268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6b9p7DMupGj+FtrDRyNAjmsI+F2JES/uYyg4pgIcMhWFj/0zOlClkw99GMpr/lc5bnOyb0eqWLMzbAVwjZeyvHeAprnRtP+wc/FBy/e7k9ogBNb5t5iWOe202qgpCjNzgdMlaz9WB/jNamRHjlntAesEtEnlS0DuNtFFcfg/utI6+a3LnpF3rFu3tXnLecsZ+xJ2mmuvtzuwMMbAE8cNMw3KIUQ/Xrbm4If6Fx+j8i29TJrnIgby4dOQisoz3YFOw9CbiapDyxKEQ/6qJ+8CLnZ6TwDNTgAe2/KvHWPugcH1aa75FsNy83K+9ET16q1+xiGfc4W9Ra6Z5AY7VQi6A3RWWxxkDqTg+dZhF03zIrrMauUo87RPjBl1R1OHxkR7KNTVAMNzVZmG/cf1uEswi8SV05RYwgLdM9+DyNrBhZCGmDhzX7aW2vRNecQqR75ARxAKvI5GJBrG08IGKCreNLJ/rjlxPrNMWLjDUwJoZbcanTQb5AkSwgdc7CDnuG4aQUxb6k0fnc2AyGKnZQ4sIAV/k+H8hTy3NWZdpKTP72OPq+YkyDJzrPBitAX3wPmW5h65TohHT9DXthTy4IU29fOGgz+wLQXylLy3mVke+dY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(30864003)(54906003)(26005)(7696005)(1076003)(36756003)(2616005)(478600001)(426003)(81166007)(356005)(82740400003)(86362001)(83380400001)(336012)(316002)(8676002)(6636002)(8936002)(4326008)(70206006)(110136005)(70586007)(41300700001)(66899024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 16:51:49.2766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac124e54-9b3d-42b6-4f20-08dc2cb41268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

Run mode set, display enable and disable for multiple
displays.

Loop all display modes. Loop all display combinations.
For DP display(eDP, SST DP, displays connected to
outputs of MST hub), if it supports DP rx crc test, IGT
will read DP rx crc and compare with pipe crc. If DSC
is not enabled for display, DP rx crc should equal to
pipe crc.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_multipipe_modeset.c | 444 +++++++++++++++++++++++++++
 tests/amdgpu/meson.build             |   1 +
 2 files changed, 445 insertions(+)
 create mode 100644 tests/amdgpu/amd_multipipe_modeset.c

diff --git a/tests/amdgpu/amd_multipipe_modeset.c b/tests/amdgpu/amd_multipipe_modeset.c
new file mode 100644
index 000000000..1731f3f74
--- /dev/null
+++ b/tests/amdgpu/amd_multipipe_modeset.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_amd.h"
+#include <xf86drmMode.h>
+
+#define MAX_PIPES 6
+
+/* Common test data. */
+struct data_t {
+	igt_display_t display;
+	igt_plane_t *primary[MAX_PIPES];
+	igt_output_t *output[MAX_PIPES];
+	int fd;
+	igt_pipe_crc_t *pipe_crc_dprx[MAX_PIPES];
+	igt_crc_t crc_fb[MAX_PIPES];
+	igt_crc_t crc_dprx[MAX_PIPES];
+	igt_pipe_crc_t *pipe_crc_otg[MAX_PIPES];
+	igt_crc_t crc_otg[MAX_PIPES];
+};
+
+enum sub_test {
+	MODE_SET,
+	DISPLAY_ENABLE_DISABLE
+};
+
+#define DPCD_TEST_SINK_MISC 0x246
+
+static bool is_mst_connector(int drm_fd, uint32_t connector_id)
+{
+	return kmstest_get_property(drm_fd, connector_id,
+				    DRM_MODE_OBJECT_CONNECTOR,
+				    "PATH", NULL,
+				    NULL, NULL);
+}
+
+static bool sink_detect_error(int drm_fd, uint32_t connector_id, int error_code)
+{
+	switch (error_code) {
+	case ETIMEDOUT:
+	case ENXIO:
+		return true;
+	case EIO:
+		return is_mst_connector(drm_fd, connector_id) ||
+		       is_amdgpu_device(drm_fd);
+	default:
+		return false;
+	};
+}
+
+static bool dpcd_read_byte(int drm_fd,
+	drmModeConnector *connector, uint32_t addr, uint8_t *val)
+{
+	DIR *dir;
+	int dir_fd;
+	uint8_t buf[16] = {0};
+	*val = 0;
+
+	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
+	igt_assert(dir_fd >= 0);
+
+	if (connector->connection != DRM_MODE_CONNECTED &&
+	    is_mst_connector(drm_fd, connector->connector_id)) {
+		close(dir_fd);
+		return false;
+	}
+
+	dir = fdopendir(dir_fd);
+	igt_assert(dir);
+
+	for (;;) {
+		struct dirent *ent;
+		char path[5 + sizeof(ent->d_name)];
+		int fd, ret, i, j, k;
+
+		ent = readdir(dir);
+		if (!ent)
+			break;
+
+		if (strncmp(ent->d_name, "drm_dp_aux", 10))
+			continue;
+
+		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
+
+		fd = open(path, O_RDONLY);
+		igt_assert(fd >= 0);
+
+		k = (addr / 16) + 1;
+		j = addr % 16;
+
+		for (i = 0; i < k; i++) {
+			ret = read(fd, buf, sizeof(buf));
+			if (ret < 0)
+				break;
+			if (ret != sizeof(buf))
+				break;
+		}
+
+		igt_info("%s: %s\n", path,
+			 ret > 0 ? "success" : strerror(errno));
+
+		igt_assert(ret == sizeof(buf) ||
+			   sink_detect_error(drm_fd, connector->connector_id, errno));
+
+		close(fd);
+
+		closedir(dir);
+		close(dir_fd);
+
+		if (ret > 0)
+			*val = buf[j];
+
+		return (ret > 0);
+	}
+
+	closedir(dir);
+	close(dir_fd);
+	return false;
+}
+
+static void set_all_output_pipe_to_none(struct data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+
+	igt_display_commit_atomic(&data->display,
+		DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+static void test_init(struct data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int i;
+	bool ret = false;
+	uint8_t dpcd_246h = 0;
+
+	for (i = 0; i < MAX_PIPES; i++)
+		data->pipe_crc_dprx[i] = NULL;
+
+	for_each_pipe(display, i) {
+		igt_output_t *output;
+		igt_pipe_t *pipes;
+
+		/* For each valid pipe, get one conencted display.
+		 * This will let displays connected to MST hub be
+		 * tested
+		 */
+		output = igt_get_single_output_for_pipe(display, i);
+		pipes = &display->pipes[i];
+		data->primary[i] = igt_pipe_get_plane_type(
+			&data->display.pipes[i], DRM_PLANE_TYPE_PRIMARY);
+		data->output[i] = output;
+
+		/* dp rx crc only available for eDP, SST DP, MST DP */
+		if ((output->config.connector->connector_type ==
+			DRM_MODE_CONNECTOR_eDP ||
+			output->config.connector->connector_type ==
+				DRM_MODE_CONNECTOR_DisplayPort)) {
+			/* DPCD 0x246 bit5: 1 -- Sink device support CRC */
+			ret = dpcd_read_byte(data->fd, output->config.connector,
+				DPCD_TEST_SINK_MISC, &dpcd_246h);
+			if (ret && ((dpcd_246h & 0x20) != 0x0))
+				data->pipe_crc_dprx[i] = igt_pipe_crc_new(
+					data->fd, pipes->pipe,
+					AMDGPU_PIPE_CRC_SOURCE_DPRX);
+		}
+
+		data->pipe_crc_otg[i] = igt_pipe_crc_new(data->fd, pipes->pipe,
+						IGT_PIPE_CRC_SOURCE_AUTO);
+		/* disable eDP PSR */
+		if (data->output[i]->config.connector->connector_type ==
+				DRM_MODE_CONNECTOR_eDP) {
+			kmstest_set_connector_dpms(display->drm_fd,
+				data->output[i]->config.connector,
+				DRM_MODE_DPMS_OFF);
+
+			igt_amd_disallow_edp_enter_psr(data->fd,
+				data->output[i]->name, true);
+
+			kmstest_set_connector_dpms(display->drm_fd,
+				data->output[i]->config.connector,
+				DRM_MODE_DPMS_ON);
+		}
+	}
+
+	igt_require(data->output[0]);
+	igt_display_reset(display);
+}
+
+static void test_fini(struct data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int i = 0;
+
+	for_each_pipe(display, i) {
+		if (data->pipe_crc_dprx[i])
+			igt_pipe_crc_free(data->pipe_crc_dprx[i]);
+		igt_pipe_crc_free(data->pipe_crc_otg[i]);
+	}
+
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+}
+
+static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
+{
+	igt_output_t *output;
+	struct igt_fb *buf;
+	drmModeConnectorPtr conn;
+	drmModeModeInfoPtr kmode;
+	igt_display_t *display = &data->display;
+	int i, j, ret, num_disps, count_modes_disp_config, bitmap_disps;
+	char *crc_str, *crc_str_1, *crc_str_2;
+	bool any_mst = false;
+
+	test_init(data);
+
+	num_disps = 0;
+	for_each_connected_output(display, output)
+		num_disps++;
+
+	igt_info("Connected num_disps:%d\n", num_disps);
+
+	igt_skip_on_f(num_disps > igt_display_get_n_pipes(&data->display) ||
+			      num_disps > data->display.n_outputs,
+		      "ASIC does not have %d outputs/pipes\n", num_disps);
+
+	buf = calloc(sizeof(struct igt_fb), num_disps);
+	igt_assert_f(buf, "Failed to allocate memory\n");
+
+	/* for mode test, it is max number of modes for
+	 * all connected displays. For enable/disable test,
+	 * it is number of connected display combinations
+	 */
+	count_modes_disp_config = 0;
+	for_each_connected_output(display, output) {
+		conn = output->config.connector;
+		if (count_modes_disp_config < conn->count_modes)
+			count_modes_disp_config = conn->count_modes;
+		if  (is_mst_connector(data->fd, conn->connector_id))
+			any_mst = true;
+	}
+
+	if (test_mode == DISPLAY_ENABLE_DISABLE)
+		count_modes_disp_config = (1 << num_disps) - 1;
+	/* display vectors for mode set or enable display
+	 * bit 0: display 0
+	 * bit 1: display 1
+	 * bit 2: display 2, etc.
+	 */
+	bitmap_disps = (1 << num_disps) - 1;
+	igt_info("count_modes_disp_config:%d bitmap_disps:%x\n\n\n",
+		count_modes_disp_config, bitmap_disps);
+
+	for (i = 0; i < count_modes_disp_config; i++) {
+		if (test_mode == DISPLAY_ENABLE_DISABLE) {
+			bitmap_disps = i + 1;
+			igt_info("\n\ndispconfig loop:%d disp bitmap:%x -----\n",
+				i, bitmap_disps);
+			set_all_output_pipe_to_none(data);
+		} else
+			igt_info("\n\nnmode loop:%d -----\n", i);
+		j = 0;
+		for_each_connected_output(display, output) {
+			if (test_mode == DISPLAY_ENABLE_DISABLE) {
+				if (!(bitmap_disps & (1 << j))) {
+					j++;
+					continue;
+				}
+				kmode = igt_output_get_mode(output);
+				igt_assert(kmode);
+				igt_info("pipe:%d %s mode:%s\n",
+					j, output->name, kmode->name);
+				igt_info("clk:%d ht:%d vt:%d hz:%d\n",
+					kmode->clock, kmode->htotal,
+					kmode->vtotal, kmode->vrefresh);
+			} else {
+				conn = output->config.connector;
+
+				if (i < conn->count_modes)
+					kmode = &conn->modes[i];
+				else
+					kmode = &conn->modes[0];
+
+				igt_info("pipe:%d %s mode:%s\n", j, output->name, kmode->name);
+				igt_info("clk:%d ht:%d vt:%d hz:%d\n", kmode->clock,
+					kmode->htotal, kmode->vtotal, kmode->vrefresh);
+
+				if  (is_mst_connector(data->fd, conn->connector_id)) {
+					/* mst hub may not support mode with high clk
+					 * more than 4k@60hz or high refresh rate
+					 */
+					if (kmode->clock > 596000 || kmode->vrefresh > 120) {
+						kmode = &conn->modes[0];
+						igt_info("Mode may not be supported by mst hub.	Use default mode from monitor!\n");
+						igt_info("clk:%d ht:%d vt:%d hz:%d\n",
+							kmode->clock, kmode->htotal,
+							kmode->vtotal, kmode->vrefresh);
+					}
+				}
+
+				/* memory for output->config.connector will be re-alloacted */
+				igt_output_override_mode(output, kmode);
+			}
+
+			igt_create_pattern_fb(data->fd, kmode->hdisplay,
+					kmode->vdisplay, DRM_FORMAT_XRGB8888,
+					0, (buf + j));
+
+			igt_output_set_pipe(output, j);
+			igt_plane_set_fb(data->primary[j], (buf + j));
+			j++;
+		}
+
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* MST hub may take longer time for mode change or display
+		 * enable/disable. Wait for MST stable before CRC check.
+		 * TODO: check if there is a better way to check MST stable
+		 */
+		if (any_mst)
+			sleep(20);
+
+		j = 0;
+		for_each_connected_output(display, output) {
+			bool dsc_on = false;
+
+			if (!(bitmap_disps & (1 << j))) {
+				j++;
+				continue;
+			}
+
+			if (data->pipe_crc_dprx[j]) {
+				igt_pipe_crc_collect_crc(data->pipe_crc_dprx[j],
+					&data->crc_dprx[j]);
+				crc_str = igt_crc_to_string(&data->crc_dprx[j]);
+				igt_info("pipe:%d %s dprx crc:%s\n",
+					j, output->name, crc_str);
+			} else
+				igt_info("pipe:%d %s monitor dprx not available\n",
+					j, output->name);
+
+			igt_pipe_crc_collect_crc(data->pipe_crc_otg[j],
+				&data->crc_otg[j]);
+			igt_fb_calc_crc((buf + j), &data->crc_fb[j]);
+
+			crc_str_1 = igt_crc_to_string(&data->crc_otg[j]);
+			igt_info("pipe:%d %s otg crc:%s\n",
+				j, output->name, crc_str_1);
+
+			crc_str_2 = igt_crc_to_string(&data->crc_fb[j]);
+			igt_info("pipe:%d %s fb crc:%s\n",
+				j, output->name, crc_str_2);
+
+			if (data->pipe_crc_dprx[j]) {
+				ret = strcmp(crc_str, crc_str_1);
+				dsc_on = igt_amd_read_dsc_clock_status(
+						data->fd, output->name);
+				if (ret != 0 && dsc_on)
+					igt_info("pipe:%d %s otg crc != dprx crc due to dsc on\n",
+					j, output->name);
+
+				igt_assert_f(((ret == 0) || (dsc_on)),
+					"ERROR! OTG CRC != DPRX and DSC off\n");
+			}
+			j++;
+		}
+
+		j = 0;
+		for_each_connected_output(display, output) {
+			igt_remove_fb(data->fd, (buf + j));
+			j++;
+		}
+
+		set_all_output_pipe_to_none(data);
+	}
+
+	test_fini(data);
+	free(buf);
+}
+
+IGT_TEST_DESCRIPTION("Test multi-display mode set, display enable and disable");
+igt_main
+{
+	struct data_t data;
+
+	igt_skip_on_simulation();
+
+	memset(&data, 0, sizeof(data));
+
+	igt_fixture
+	{
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(&data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Loop through all supported modes and check DP RX CRC and Pipe CRC");
+	igt_subtest("multiple-display-mode-switch")
+		multiple_display_test(&data, MODE_SET);
+	igt_describe("Enable and Disable displays and check DP RX CRC and Pipe CRC");
+	igt_subtest("multiple-display-enable-disable")
+		multiple_display_test(&data, DISPLAY_ENABLE_DISABLE);
+
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 5bd502496..16262c416 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -39,6 +39,7 @@ if libdrm_amdgpu.found()
 			  'amd_odm',
 			  'amd_subvp',
 			  'amd_vpe',
+			  'amd_multipipe_modeset',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.25.1

