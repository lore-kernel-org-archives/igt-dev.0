Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED2C61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 18:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDA10F142;
	Thu, 27 Aug 2026 18:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNcWWyar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D549110F142
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787856176; x=1819392176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VjgqNVjOaCLPM1vHgkbtnwgHrIG1X6Dx5R7pVWDw0gY=;
 b=fNcWWyarcfXTIBrao7eNalXVsF51TBaeGyTBOLdgHQx0xJINwR2+xEK+
 R384mq5CGM0z39czO3L9r2dgSivT9qa449Pz71Jfpiz8Nt2nwKhqdUKJJ
 AmIK89diDJ/btiJsHK7pDhd0E25u2rL0pd8RdR1h4jxe4o2FMCsZJ8TOz
 jpQ3ocrAJs38GiRf9/LZFoin0+4f49/moBML0x87zHvngiZb/N49Ar4pU
 6VqX26+SrpXTdFcJb+Sd4Qbpku1gHUcLq+rcdNi+5eJtWVsoO5h/Dyv9u
 kz/NZGt99v9U/TSntfY/1LvNKNmcfedHkNMIA6wcZFJqHJM+V0Xmmce5h Q==;
X-CSE-ConnectionGUID: YSfeODysTEeeGL3WQoNPyQ==
X-CSE-MsgGUID: BywqkISMRM2p6prQNtZjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99717174"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="99717174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 11:42:56 -0700
X-CSE-ConnectionGUID: iPOysvSeQnqxx2nStxh+ig==
X-CSE-MsgGUID: zpCpRQXWQ76oEgWs+J31Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="268517565"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:42:54 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tools: add Intel/Xe HDMI compliance support
Date: Fri, 28 Aug 2026 00:21:58 +0530
Message-Id: <20260827185158.378225-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Rename the AMD-specific HDMI compliance utility to a generic
igt_hdmi_compliance binary and update the build rule.

Add Intel/Xe-specific handling in the pixel-format path: require RGB
output on Intel devices, verify the connector exposes Broadcast RGB,
and set it to full range before committing the atomic state.

Keep the existing AMD debugfs flow for non-Intel platforms so the same
compliance checks remain usable across supported drivers.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 ...dmi_compliance.c => igt_hdmi_compliance.c} | 25 ++++++++++++++++---
 tools/meson.build                             |  2 +-
 2 files changed, 23 insertions(+), 4 deletions(-)
 rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (97%)

diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
similarity index 97%
rename from tools/amd_hdmi_compliance.c
rename to tools/igt_hdmi_compliance.c
index 2af4c0bab..cf438a4dc 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/igt_hdmi_compliance.c
@@ -830,15 +830,34 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
 {
 	int fd, res;
 	const char *entry_name;
+	igt_fb_t afb;
 
 	test_init(data, conn_id);
 
-	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
-	igt_assert(fd >= 0);
-
 	igt_info("Setting %d on connector id %d\n",
 			pixel_format, data->output->config.connector->connector_id);
 
+	if (is_intel_device(data->fd)) {
+		igt_require_f(pixel_format == PIXEL_ENCODING_RGB,
+			      "Intel devices do not provide a generic YCbCr output property\n");
+		igt_require_f(igt_output_has_prop(data->output,
+						  IGT_CONNECTOR_BROADCAST_RGB),
+				      "connector has no 'Broadcast RGB' property\n");
+		igt_create_pattern_fb(data->fd, 1024, 1024, DRM_FORMAT_XRGB8888, 0,
+				      &afb);
+		igt_plane_set_fb(data->primary, &afb);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_BROADCAST_RGB,
+					  BROADCAST_RGB_FULL);
+		igt_display_commit_atomic(&data->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_remove_fb(data->fd, &afb);
+		test_fini(data);
+		return;
+	}
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
 	switch (pixel_format) {
 	case 1:
 		entry_name = "force_rgb_output";
diff --git a/tools/meson.build b/tools/meson.build
index fbc6c0a00..68c31da92 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
 	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
 	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
 
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
+executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
 	   dependencies : [tool_deps],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
-- 
2.25.1

