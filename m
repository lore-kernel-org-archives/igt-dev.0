Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7FCD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 07:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5910E1B8;
	Wed, 13 May 2026 07:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l9FIwnFt";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A932810E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 07:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o68/dO3YbViABhT5oYUQO17vqM5AUOIPmB2mN1ixXwjREdlyMT+/9jyolSEyrm+DM6uqZkhdZdFbHF7DByuCR0iben3lAC+jkljif6s0MZNGOXAL6AZP6WoBx+yMQyoxftzNtgj+RCi6MbvImZhJcA5P0lJ6wb+yp54MWTMfwVuyzIGEfKC3ZwSJ+XEY+wa7yw7whivAG+no53wY6+Gf7wV9v4oT768E9CZsdJzUUKBM2Z3r/EPUoM9sKLUDvb62oYUxyqMBHe3dswH1MQnuRfVtTAeeK53DpoPyb48AGfiGazjGEt+cYhkK20aQiZunGyi+g3O8fzzF7Tex5P1aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpdAxKHcsqJwh3JHemOzIGPQTe9LKA1J9rX1fRN94IE=;
 b=ewVqxDzVTKCPz3LG5N34oz9c/ARDcPc1uBaj+JR4hKLbR68p+FNiJBEL5D30AovX6smvlcNmFrcmM+WLi36o9But0mjdgyPCJx07JNq4WxPPSAW46WTRpBnHIREO0CcTSDxpTbvaFV3TpBahz/B+oHQw0Xvw4Xve0nlVnP6ZU78J5RdXzS5UiMDMQRuZV4GBepohpsJ0U1LCWda02A2FEAolYzeLWzdw4cY+kIEw5FfhQyobAZcKAe2Uz0rb++tLy1nN93l02817EmlBwagl7Akfv3Fq8Opuc6y6I0dbdoh83iwCP5iJwAyIyALxdKcj5w4U3awNCcliPlzRt/Ge3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpdAxKHcsqJwh3JHemOzIGPQTe9LKA1J9rX1fRN94IE=;
 b=l9FIwnFtk7E/yWinB2a3n685FnsXSPjXHs2DYcFLLga7ApITXYWFk2fJ8fR4Sa4xLIN+tU1dVQp0d+y9NSmqnfVdG+JXK/6gxvZ71Ir4lac1bmoveJTdnL5okE/qRfF2bVvP5RJFIpYMVAvZJWrRrOaYNWi1iFEfFJxWfEc7uFs=
Received: from BN9PR03CA0439.namprd03.prod.outlook.com (2603:10b6:408:113::24)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 07:06:40 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::b1) by BN9PR03CA0439.outlook.office365.com
 (2603:10b6:408:113::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 07:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:06:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 02:06:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 02:06:39 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 02:06:37 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t,
 v2 2/2] tests/amdgpu/amd_replay: add Replay Rate Control IGT test
Date: Wed, 13 May 2026 15:03:22 +0800
Message-ID: <20260513070631.3723466-3-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513070631.3723466-1-ray.wu@amd.com>
References: <20260513070631.3723466-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e80280c-a1e1-4c95-679a-08deb0be2e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|22082099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: nqaLoyrzW8nOgneaEp02eaBzqZ2u/OGYvFeAiVDsFYuyfMOy55EFGrUuns1XN3jMnueUiN1Q4uGP2GpgHVNonxXceMthvmG8drrqqmzOmhsstjXQkghh8KH62pC4ZhErm+hzj/UrijArKebMUCSTeS156iwQhJmftCzM4+mfE/RnqBDO7tpJ693HcjU3hihI4QJgk4pO2k5rIM62hyhb5c/hVtfwBZIIYr8gK6WP8JrxOpRQ8507ERcJUexKGhn17vnF58gj6qZFD5+OKxCUknLhjIw7uSXf/rCL3qcdxbvZatnsw/GRC+dmE1uwGoenjuD4tv01TUQr4S6/zhpyM+TLxzYjbdsRJUJfQdxUL/CB+i2Wu8ZlVAITjhSaJXp8ey4WmlbrCZzz65CC8Hb9uwMycWYz9zDnoTWGMYq+Fs3+qZFEfNB8eOQj0HGE1VFVStpVCYpbDA2kHtBwYY1oDiUphxMql0rBWXW6U+mGmgyS064mvUVcsdJlm5QTWO9u8aWTo4fFpK5jiCqN+lzpi5qHrhPHhyMXHqGr5DeESCtk5ddjUFfG9RK+MLCpJmikz2DqwFLSZ168mM4G+2Xlda7uuB8tdOWDXy6wwZMxyLZCVTXsEuoiNMRuEKibmf2+BT0PS7k9s/WA9Ca1owcihQPRv8ipfx4KE3nt6cnkBLpPNKnnYDN5Obp8O/Nqe7QqYJeS2l1oqCjQ7L+mb2Emh6ePHo68jYMPvLo8sZ6S48w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gwKY8tG214Li3e6RtR9r92As59KLIZFNzq7cHrdGeoQ/leyZeMUUSI1SH5BBfiPZEKxASyQNzJmWYQ3J0HgOrn9lYzTcMbMGa6TQPgAmBpqMdqcAbAv8O6oQ6WL6rI5TVRa1MMg+2tij8Cl6zG77zu4kFLOPQxE8mx6jCUzSnU+p4QmArn2tDkfq02J5y6UTp5cZGv0ekBJhW4byVmBhXsBLgkPB6MyEReI96o3D6zu+8aHSN1rx6rPjU2qeE2kBWRFSJZaUzGrOpTLD4bk/bNSGROuRMP5mQaoZ6qjQdyEN+7xHggHnkRKHWgWV5X9OpQvAyBnlLoAZpClmqxhV1OPSafm11ra1PDr88KpIRxrH0bOmXerO340v0oGQfriMyNPH0FQ6T4WDfVodQ+W9kLZoZIoT+57emBgwCYUNiDo/VKpazHjSjNSCs3QWl9bU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:06:39.8247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e80280c-a1e1-4c95-679a-08deb0be2e34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722
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
v2:
- Move close(fd) before igt_assert_f() to avoid fd leak. (Alex)
- Correct the rate control comment. (Alex)
- Check drmModePageFlip() return value. (Alex)
---
 lib/igt_amd.c             | 94 +++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h             |  3 ++
 tests/amdgpu/amd_replay.c | 88 ++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index a97adad43..8ad3be7a7 100644
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
+	close(fd);
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		     DEBUGFS_EDP_REPLAY_CAP, connector_name);
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
@@ -1177,6 +1213,64 @@ enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
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
+ *   0         on success, *vtotal contains the parsed value
+ *  -EINVAL    invalid arguments, or the file content cannot be parsed
+ *  -ENODATA   the debugfs file is empty
+ *  -errno     other errors passed through from the underlying igt
+ *             debugfs helpers (e.g. -ENOENT, -EACCES on debugfs open)
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
index 4b795f5ba..db2b565b5 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <fcntl.h>
+#include <string.h>
 
 #include "igt_amd.h"
 
@@ -397,6 +398,90 @@ static void run_check_replay_suspend(struct test_data *data)
 	test_fini(data);
 }
 
+/*
+ * Verify replay rate control: when the screen is static, coasting vtotal should
+ * be extended to lower the refresh rate; under live mode, coasting vtotal should
+ * drop back. Equal values mean rate control did not engage, which is a failure.
+ *
+ *     static_coasting_vtotal > live_coasting_vtotal
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
+		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+				      data->flip_fb->fb_id,
+				      DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_assert_eq(ret, 0);
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
@@ -454,6 +539,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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

