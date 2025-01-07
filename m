Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B515E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 18:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA3A10E775;
	Tue,  7 Jan 2025 18:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS1/qhuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFA510E775
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736275923; x=1767811923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VaSPz++Ljy9NacURcbyeCIa9fTiMq7NUb2EwSQYqNms=;
 b=dS1/qhuB0g9VtGcGHbzMWYhG8bCihEj30d0sgl49QRwqldyqltCYO24T
 upgL7xHMKna3i71+RMx6PhFyZ+jVk6Kc1D/pcnxPyhDvQiWcKZPMMi91J
 +hYDTYGUDUteNyuDsLcyG/gONm6z1reUI9PHzg83gy6GYMUYcZpB/Nqfi
 nDnrsU1R5IgVgR+nN7oy5fykVyVq0shgckpBxM9HG4NXWJzPDcEBSG5k0
 eqm1byuwW0ubRd1/2FF6hfsQKW2WZoXl4ANUV1sw7Mkhwo2Ahrn9o7xEX
 e2t2OtewLBHIg/88pqLm2FWmVYeB5+rod5z4PnnkAYBPY4f5ZDCJ0N7ge w==;
X-CSE-ConnectionGUID: oPs0FlG1T5S08bzIlTvqtw==
X-CSE-MsgGUID: CPvwqV5SSOux096kLNBxZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58942023"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="58942023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:03 -0800
X-CSE-ConnectionGUID: 7nBStaBITNWCcEUOP30rxQ==
X-CSE-MsgGUID: F9NQE8dlQpaBmyWiimuBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103706858"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:02 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_kms: Add
 igt_is_(big|ultra)_joiner_supported_by_source()
Date: Wed,  8 Jan 2025 00:27:07 +0530
Message-Id: <20250107185709.116756-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107185709.116756-1-swati2.sharma@intel.com>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
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

Add func() returning true/false if platform supports big/ultra
joiner and use corresponding func() in related binaries.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c            | 41 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h            |  2 ++
 tests/intel/kms_joiner.c |  8 +++-----
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8ee8741d9..6640a6a58 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7301,3 +7301,44 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_is_bigjoiner_supported_by_source:
+ * @drm_fd: drm file descriptor
+ *
+ * Returns: True if bigjoiner is supported by platform, false otherwise
+ */
+bool igt_is_bigjoiner_supported_by_source(int drm_fd)
+{
+	int disp_ver;
+	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	if (disp_ver < 12) {
+		igt_info("Bigjoiner is not supported on D11 and older platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * igt_is_ultrajoiner_supported_by_source:
+ * @drm_fd: drm file descriptor
+ *
+ * Returns: True if ultrajoiner is supported by platform, false otherwise
+ */
+bool igt_is_ultrajoiner_supported_by_source(int drm_fd)
+{
+	bool is_dgfx;
+	int disp_ver;
+
+	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
+	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	if ((is_dgfx && disp_ver == 14) || (disp_ver > 14)) {
+		igt_info("Ultrajoiner is supported on igfx with D14+ and on dgfx with D14\n");
+		return true;
+	}
+
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c4d76bdcb..e8a296c18 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1257,6 +1257,8 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
+bool igt_is_bigjoiner_supported_by_source(int drm_fd);
+bool igt_is_ultrajoiner_supported_by_source(int drm_fd);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 418ff26a6..2b72aa786 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -411,8 +411,8 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 igt_main
 {
-	bool ultra_joiner_supported, is_dgfx;
-	int i, j, display_ver;
+	bool ultra_joiner_supported;
+	int i, j;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
@@ -434,9 +434,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
-		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
-		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
-		if ((is_dgfx && display_ver == 14) || (display_ver > 14))
+		if (igt_is_ultrajoiner_supported_by_source(data.drm_fd))
 			ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
-- 
2.25.1

