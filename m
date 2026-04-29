Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF121FF8875
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 19:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58210E12B;
	Wed, 29 Apr 2026 19:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYlZqlv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18810E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777491759; x=1809027759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4iEl4lQ4R3TmI6RNx9tZT1Ic4GYzoIGL+MzuURShMI=;
 b=TYlZqlv2YndC3eAov45xKTF0TAcjT2AfEnXE09K5ReoCEJyTGVjAsBFC
 0b63zSXgU8W7WIbd3K3PvyG7lQMdHTDt0r7VkDvtdzsSIbRPLvob0rAEW
 kKpxXjJDPjP+wwjZt2GJ35JnxoUMySuAFcKKakCnIIhlGQXRGAp+ITW1n
 yloRM5MjRXUJkv08x1v2WEbnuuT6R19TmTOkVa2UmtK3KvsIH27iYKL/R
 Ru2PRrT7YYy3qjTukGnD4KzstBIMTBmBJiAQnvI5G/RhOTRMu443CdTp7
 TNSriiofa9H58gcmqygxE28m6hPSuihD20Uyd4tgQd8SPs4YJtD0D9PK2 g==;
X-CSE-ConnectionGUID: O2LTVnywTKijGzvY6vnwvg==
X-CSE-MsgGUID: dM9cmRfyRwakpVRT7GgZ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82295712"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="82295712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:42:39 -0700
X-CSE-ConnectionGUID: 6SF12vynRnWA6kbTlpuOTg==
X-CSE-MsgGUID: cG3CV52yTguP58Odio/uOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="229762012"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:42:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v5 3/4] tests/intel/kms_dsc_helper: Add helper func()
Date: Thu, 30 Apr 2026 01:21:14 +0530
Message-Id: <20260429195115.2332923-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429195115.2332923-1-swati2.sharma@intel.com>
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
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

Introduce check_dsc_joiner_constraints() to validate minimum pipe
count, DSC slice requirements, and joiner support for DSC joiner
scenarios.

Update meson.build to link kms_joiner_helper.c into DSC-related
tests so the new helper can call igt_is_joiner_supported_by_source().

v2: -Avoid hardcoding min_pipes/min_slices, use enum values (Santhosh)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 54 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 ++
 tests/meson.build            | 17 ++++++++----
 3 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 29b998c2f..63170af1e 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -203,3 +203,57 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+bool check_dsc_joiner_constraints(int drm_fd,
+                                  igt_output_t *output,
+                                  int num_pipes,
+                                  enum joined_pipes type)
+{
+	int min_pipes = 0, min_slices = 0;
+
+	if (!igt_is_joiner_supported_by_source(drm_fd, type))
+		return false;
+
+	/*
+	 * For joiner, 2 slices per pipe is used
+	 * i.e. min_slices = 2 * min_pipes
+	 */
+	switch (type) {
+	case JOINED_PIPES_BIG_JOINER:
+		min_pipes = JOINED_PIPES_BIG_JOINER;
+		min_slices = min_pipes * 2;
+		break;
+	case JOINED_PIPES_ULTRA_JOINER:
+		min_pipes = JOINED_PIPES_ULTRA_JOINER;
+		min_slices = min_pipes * 2;
+		break;
+	case JOINED_PIPES_NONE:
+	case JOINED_PIPES_DEFAULT:
+	default:
+		igt_info("Unsupported joiner type: %s\n",
+                          igt_get_joined_pipes_name(type));
+		return false;
+	}
+
+	if (num_pipes < min_pipes) {
+		igt_info("%s requires minimum %d pipes\n",
+			  igt_get_joined_pipes_name(type), min_pipes);
+		return false;
+	}
+
+	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
+		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
+			  igt_output_name(output), min_slices,
+			  igt_get_joined_pipes_name(type));
+		return false;
+	}
+
+	if (!igt_has_force_joiner_debugfs(drm_fd, output->name)) {
+	    igt_info("Output %s doesn't support force_joiner debugfs for %s\n",
+		      igt_output_name(output),
+		      igt_get_joined_pipes_name(type));
+		return false;
+	}
+
+	return true;
+}
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index ee419c849..e4c970447 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -8,6 +8,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "kms_joiner_helper.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
@@ -39,5 +40,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output, int num_pipes,
+                                  enum joined_pipes type);
 
 #endif
diff --git a/tests/meson.build b/tests/meson.build
index 60cea3aa8..38a42bda6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -399,14 +399,19 @@ extra_sources = {
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_dsc_helper.c') ],
+          join_paths ('intel', 'kms_mst_helper.c'),
+          join_paths ('intel', 'kms_dsc_helper.c'),
+          join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dp_link_training': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_joiner_helper.c') ],
-	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+          join_paths ('intel', 'kms_mst_helper.c'),
+          join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_dsc': [
+          join_paths ('intel', 'kms_dsc_helper.c'),
+          join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
-	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_psr2_sf': [
+          join_paths ('intel', 'kms_dsc_helper.c'),
+          join_paths ('intel', 'kms_joiner_helper.c') ],
 }
 
 # Extra dependencies used on core and Intel drivers
-- 
2.25.1

