Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0759C61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 18:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C6910F142;
	Thu, 27 Aug 2026 18:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F05TRQRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9089B10F142
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787856294; x=1819392294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pjDrRSTEbZaOjS9WHCFEg7fkCShT/11WHhbbqhGm85s=;
 b=F05TRQRNz7xlUwdJf64XzNkaP0z5rgf5n2bt8JEfQSLa8v/i4/ROIXX/
 K8hRUkkxMAnDZFp5oZirwcqzJeQ7Jvv/7cgQwXxGb5csSGTGe8Gi/V9aT
 S6ufqkaZNfEb0NDHeNgQ0tirLVUJmeZ/9Dask1nYbpSqw02URYua4S+rp
 LCR0cBB5NluUQC8Po1E+iBOqBT160wz/ZUTipahvVmGqqosDbbKHXWSIi
 yBPAZN7swLzUIAlYQsd8Kw34fCOMU9fRKQiRUaxkjdJ+sDUXDYYN4h+oI
 F3IePICpSfmzhtRksTxm3KstLcL59fDV5bBJf0JgVFQYY/2V0MM9GFv+v A==;
X-CSE-ConnectionGUID: XvCtVAC/RzSLQTUJZBrtMg==
X-CSE-MsgGUID: Tv03bKCSTzqA3UPqQBLKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90880243"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="90880243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 11:44:51 -0700
X-CSE-ConnectionGUID: AKX8ljTrT9qNssT8I8/2Ng==
X-CSE-MsgGUID: LQT6BON2TEa93HncZNYspQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="265358092"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 11:44:49 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tools: rename HDMI compliance utility
Date: Fri, 28 Aug 2026 00:23:55 +0530
Message-Id: <20260827185355.378279-1-swati2.sharma@intel.com>
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

Keep the existing AMD debugfs flow for pixel-format forcing. Skip
that operation on Intel devices until a driver-supported interface
for selecting the pixel encoding is available.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
 tools/meson.build                                      | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)

diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
similarity index 99%
rename from tools/amd_hdmi_compliance.c
rename to tools/igt_hdmi_compliance.c
index 2af4c0bab..ece0abd1d 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/igt_hdmi_compliance.c
@@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
 
 	test_init(data, conn_id);
 
-	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
-	igt_assert(fd >= 0);
-
 	igt_info("Setting %d on connector id %d\n",
 			pixel_format, data->output->config.connector->connector_id);
 
+	igt_skip_on_f(is_intel_device(data->fd),
+			      "pixel-format forcing is not supported on Intel devices\n");
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

