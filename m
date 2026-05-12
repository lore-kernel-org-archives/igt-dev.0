Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD16ACD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 08:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8945510E17F;
	Tue, 12 May 2026 08:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZCI/URWL";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E910E17F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 08:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBFzc3WbWV6o1ffvPfaEe1ybg2LeyCFoVW+5uZN0V8FeqIBfx/JMVJ28jByWRAPs7RPBAc4dwVTYoC9lb2JF5h5Hnvy+65HS8bcB8fK9qJWEi0Zm28Dz2SWVGt1m8tZ5f3htX7cGV0UIMk2cp+90S0IduG8zmywS5MGOziaNydk0aBgTRf8HBbNP4p+bN3YR3+1fYwBZ6TT0GunAo7fNVEsM+dE8EtIRJk5+v0bJNYBDA2kjuoKTHV71ZS+61BqIFiGV/pxIzMTD/GrfkH71LnDtFPcDGdEFsV70/Dl2OJdezvvJ8vn7cAGY41JCt8XMIBYdn6scTgpNCw4PTpe2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF8GWTIgp4hl9/vthy0nkZ2+iPNndpx2sdBOm/aS1xo=;
 b=ErbpN2m/37+/ShCKUP+EUtM8fXO8fdB/hHSFDRKa//Dipn2CocP07VpZm4RR53f+uNkFylb/tg0lRt13Eaeqx4gqhJUx8tlmrac4hkMBxEHmq9f7EFAGU/3s22gWDIylIZ7b4IBOjNzWyWwmY3iCvOZkc9DxnOWtHftzY8xxiqGGyjRXwmvrCRxxyjkIk+vZQJ8Q7CjsD4+LeBVhinydCiOaXBnE5YdtACJnkSwJraYjJG1PmAsLwhKBHcgkg6wm+7YGWCnlljjZEHra6ahRxNBWEzkBu5tNvpxSPtqQjt2XL0pdE+2iqPpbVLfILxH8heAPzuIOGkktGNrzorhQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF8GWTIgp4hl9/vthy0nkZ2+iPNndpx2sdBOm/aS1xo=;
 b=ZCI/URWL/bE3h/LuqJU04Ig2U4gRbMUyBlZnP4jD8B3Epajx1Dy/+1UBzIPcrsk3T1wxfNJ7sTTSLA51FqeK7p7Nwt6mooPpELq9WocdjF8p1jQyzZ/0s5c5Qtx6FRKLIxnJFwWwLXQxijueXWERtAx+6ULDxgUFOZolUcLBD3A=
Received: from SJ0PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:33f::26)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:02:36 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::49) by SJ0PR05CA0051.outlook.office365.com
 (2603:10b6:a03:33f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Tue, 12
 May 2026 08:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 08:02:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 03:02:34 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 03:02:33 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 03:02:32 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu/amd_replay: add Replay Rate Control
 IGT test
Date: Tue, 12 May 2026 15:59:16 +0800
Message-ID: <20260512080213.3457271-3-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512080213.3457271-1-ray.wu@amd.com>
References: <20260512080213.3457271-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: b58dd341-6fe9-4b67-bc0c-08deaffcd343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Y8NlLLTVLG4E/LY7YoNvd28xEeREwHa/YCVzspL6hiRtLa25far1I3LAUM2DnqHgfJpOZ0h9jCDH9rtdgyHcefZwbTfCMm71gxnULKBDDrVMwG6d+gnycoDQmn6nAJSvKKfUfugQyor5YsANJbqjMxD5xg3fW18YtNtiRRzuww/qbST4LU8dRjBwCVQxnMt0tRi3XR3jue8dz6NkWNNQf2jOKRp+wfLk9MP1SG5Uy3gd2BnlYVE0uyyLVZxbXpAPc6Wc1WcAgn6y8fNlu4k1hi8g1ms6Q1Dn/eaHSu1dUEt0LDQNVborgT7qXyviIGCFuY1cZy6v2xtcxZbfxuIxwq6rUrggEpFyJaGzZlHGN2Y0WkHaM8Z7qeWqb8FPtVw71EuExG0oC/0EG2sr8wXQZT3LlCmPj/0m3p1YFAv0mz+te/re+RUWY9SsYDf79015O2NjzWlR8sTTsBbIJk2LxcxaHC+MXSkiaXulaf65w2jaS0HA8A3L+I2JBR7qcHhIV9dHejLTn+dd0jzMWo6FnTq+dnPkSwX3mP/pqE4K72vWslHVCeWfX0y95zvRHGhHCBtFIZD33OO1pAyD7cuKiJJMoBhkLLCSJbpKjOm8RHuScX77pwGNek20EYRZkY0DyvwsQ8WanwC94a4VI9b2unn7JVuKJ4rUJDGm5vjtIMMpynb3DWGslJEqYJQgV05V5erXZpgnj3TdUC8TnC6PGttXcopnu2JJNeFKEb8JEaU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p2nvckMZ4vESmQB19Gd1kWuCPhI5w6/sJxET3vCYBYxupq+h4rvDG+hnbZBn8jT4VmEjpBTgDl3kdls9AG1wZ+HNe9Oxz+csP14dgKnNF1n5W/j9Wmssi6K5Q5bOsgAZi21YjqpWIpMZEnZPMAxqLa5aDlN5NUne7FVdZ5faWqQ+0ub17Q/uq8wHqPpKwNIZE1kWi1D7fy3H+0p9bkevnHNnn92eZDDS2UAXUra8NhJehK9t4m75FhLd3IlnuDNsUGALUSqdNV9RwVcqMuCDa9r6J9VS8G93saMtFa4CSECDyavvJEutiv6pUO3NLpGkgUKgLU8ywIr/DepU4TrwnnVQBbkzLOlM14z8JPFcIeCKN2hNblgfxj55wveI+YLwVHKttNibqfMKyf9k592XcFvdJ850cz7woDE4Vrwnr2KGhaFyMF3aiSIxB1ozT1Vh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:02:34.3424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58dd341-6fe9-4b67-bc0c-08deaffcd343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282
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

[Why]
Panel Replay rate control lowers the panel refresh rate while the
screen is static by extending coasting vtotal, and restores it when
the screen becomes live again. There is currently no IGT coverage for
this behaviour.

[How]
Add two helpers in lib/igt_amd:

  - igt_amd_replay_support_rate_control(): true when the connector's
    replay_capability advertises "Rate control support: yes".
  - igt_amd_read_replay_coasting_vtotal(): reads replay_coasting_vtotal;
    returns 0 on success or -errno on failure.

Add a "replay_rate_control" subtest that engages Panel Replay via page
flips, samples the coasting vtotal in static and live modes, and
asserts that the static value is strictly greater than the live value.
Skips cleanly when eDP, Panel Replay, or rate control support is
missing.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 lib/igt_amd.c             | 93 +++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h             |  3 ++
 tests/amdgpu/amd_replay.c | 86 ++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index a97adad43..89474eb15 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -20,7 +20,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <errno.h>
 #include <fcntl.h>
+#include <string.h>
 #include <sys/stat.h>
 
 #include "igt_amd.h"
@@ -1082,6 +1084,40 @@ bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
 	return strstr(buf, "Driver support: yes") && strstr(buf, "Config support: yes");
 }
 
+/**
+ * igt_amd_replay_support_rate_control: check if Panel Replay rate control is supported
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ *
+ * Return:
+ *   true  - "Rate control support: yes" found in replay_capability
+ *   false - rate control not supported, field not present (older kernel),
+ *           or any read/debugfs error
+ */
+bool igt_amd_replay_support_rate_control(int drm_fd, char *connector_name)
+{
+	char buf[128];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("output %s: debugfs not found\n", connector_name);
+
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		     DEBUGFS_EDP_REPLAY_CAP, connector_name);
+	close(fd);
+
+	if (ret < 1)
+		return false;
+
+	return strstr(buf, "Rate control support: yes");
+}
+
 /**
  * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
  * @drm_fd: DRM file descriptor
@@ -1177,6 +1213,63 @@ enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
 	return convert_replay_state(raw_state);
 }
 
+/**
+ * @brief Read Panel Replay current coasting vtotal from debugfs interface
+ * @param drm_fd DRM file descriptor
+ * @param connector_name The connector's name, on which we're reading the status
+ * @param vtotal Out: parsed vtotal value (only valid when return value is 0)
+ *
+ * Reads /sys/kernel/debug/dri/<N>/<connector>/replay_current_coasting_vtotal,
+ * which contains a single decimal number (e.g. "4938").
+ *
+ * Return:
+ *   0       on success, *vtotal contains the parsed value
+ *  -errno   on failure. Errors from the underlying igt debugfs helpers are
+ *           passed through; -EINVAL is returned when arguments are invalid
+ *           or the file content cannot be parsed.
+ */
+int igt_amd_read_replay_coasting_vtotal(int drm_fd, char *connector_name,
+					uint32_t *vtotal)
+{
+	char buf[32] = {0};
+	int fd, ret;
+	unsigned long parsed;
+	char *endp;
+
+	if (!vtotal)
+		return -EINVAL;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		ret = -errno;
+		igt_info("Couldn't open connector %s debugfs directory (%s)\n",
+			 connector_name, strerror(-ret));
+		return ret;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_COASTING_VTOTAL,
+				      buf, sizeof(buf) - 1);
+	close(fd);
+
+	if (ret < 1) {
+		igt_info("Reading %s for connector %s failed (%s)\n",
+			 DEBUGFS_EDP_REPLAY_COASTING_VTOTAL, connector_name,
+			 ret < 0 ? strerror(-ret) : "empty");
+		return ret < 0 ? ret : -ENODATA;
+	}
+
+	parsed = strtoul(buf, &endp, 10);
+	if (endp == buf) {
+		igt_info("%s for connector %s: unparseable value '%s'\n",
+			 DEBUGFS_EDP_REPLAY_COASTING_VTOTAL, connector_name,
+			 buf);
+		return -EINVAL;
+	}
+
+	*vtotal = (uint32_t)parsed;
+	return 0;
+}
+
 /**
  * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
  * @drm_fd: DRM file descriptor
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index a45122b68..7f11e1d38 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -49,6 +49,7 @@
 #define MULTIPLIER_TO_LR 270000
 #define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
 #define DEBUGFS_EDP_REPLAY_STATE "replay_state"
+#define DEBUGFS_EDP_REPLAY_COASTING_VTOTAL "replay_coasting_vtotal"
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
@@ -227,6 +228,8 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
 bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
 bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
 bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_rate_control(int drm_fd, char *connector_name);
+int igt_amd_read_replay_coasting_vtotal(int drm_fd, char *connector_name, uint32_t *vtotal);
 bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
 enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name);
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 4b795f5ba..fd0b01f05 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <fcntl.h>
+#include <string.h>
 
 #include "igt_amd.h"
 
@@ -397,6 +398,88 @@ static void run_check_replay_suspend(struct test_data *data)
 	test_fini(data);
 }
 
+/*
+ * Verify replay rate control: when the screen is static, coasting vtotal should be
+ * extended to lower RR; under live mode, coasting vtotal should drop back.
+ *
+ *     coasting_vtotal_in_static >= coasting_vtotal_in_live
+ *
+ */
+static void run_check_replay_rate_control(struct test_data *data)
+{
+	int edp_idx;
+	igt_output_t *output;
+	uint32_t static_coasting_vtotal = 0;
+	uint32_t live_coasting_vtotal = 0;
+	int ret;
+
+	test_init(data);
+
+	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* check if eDP supports Panel Replay. */
+	igt_skip_on(!replay_mode_supported(data));
+
+	igt_skip_on_f(!igt_amd_replay_support_rate_control(data->fd,
+							   data->output->name),
+		      "Replay rate control not supported; skip test\n");
+
+	for_each_connected_output(&data->display, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0,
+				    0.6, 0.6, 0.6, &data->ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0,
+				    0.0, 0.4, 0.14, &data->ref_fb2);
+
+		igt_plane_set_fb(data->primary, &data->ref_fb);
+		igt_display_commit_atomic(&data->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		data->flip_fb = &data->ref_fb;
+
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* Do some page flips and let replay enable */
+		page_flip_test(data, output, TEST_MODE_FLIP_ONLY,
+			       FLIP_FRAME_BEFORE_TEST);
+
+		/* Panel Replay state takes time to settle on static screen */
+		sleep(1);
+		ret = igt_amd_read_replay_coasting_vtotal(data->fd,
+							  output->name,
+							  &static_coasting_vtotal);
+		igt_assert_f(ret == 0,
+			     "failed to read static-mode coasting vtotal: %s\n",
+			     strerror(-ret));
+
+		/* Drive page flips to put replay into live mode */
+		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, 20);
+		ret = igt_amd_read_replay_coasting_vtotal(data->fd,
+							  output->name,
+							  &live_coasting_vtotal);
+		igt_assert_f(ret == 0,
+			     "failed to read live-mode coasting vtotal: %s\n",
+			     strerror(-ret));
+
+		igt_fail_on_f(static_coasting_vtotal <= live_coasting_vtotal,
+			      "coasting vtotal in static (%u) must be > live (%u)\n",
+			      static_coasting_vtotal, live_coasting_vtotal);
+
+		igt_remove_fb(data->fd, &data->ref_fb);
+		igt_remove_fb(data->fd, &data->ref_fb2);
+		data->ref_fb.fb_id = 0;
+		data->ref_fb2.fb_id = 0;
+	}
+
+	test_fini(data);
+}
+
 static int opt_handler(int option, int option_index, void *data)
 {
 	switch (option) {
@@ -454,6 +537,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
 	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
 
+	igt_describe("Test whether Panel Replay can be enabled with rate control mode");
+	igt_subtest("replay_rate_control") run_check_replay_rate_control(&data);
+
 	igt_fixture()
 	{
 		if (opt.visual_confirm) {
-- 
2.43.0

