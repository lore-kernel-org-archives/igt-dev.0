Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB4CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 21:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600DA10EC4C;
	Fri,  5 Sep 2025 21:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkvJTL2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A189D10EC4C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106093; x=1788642093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nyfox2TWPX3AYGl3isfosz+wmXzJhYROzzT9RJgiMgg=;
 b=jkvJTL2JXUgCoRjp5fuUkdSpnJpBGZAD3k6HaZjK0gYDreyhPc/Ns1mg
 mtU/Ypa0uTruulCj+YOXXNP+oAHjO4sS7nWA8O4h3hdezMq3hZF7D7IlO
 203z1nEnroiXb0JKiofo/VFugTs0j69hCabzI5MTyM7NM53YT8br7LsBN
 WAzMZRbc0TbfK6KLuItenPTNuvwiQ/TIf7O7cFnCunuvaJpIsFvFbblzh
 YkUDNe9QxBpf9bjTYSINe/4BcrD4hgnckXiUJm65J45s6BgCLDgoKUvII
 z5TmBclUg9RCmyzyXfflWGGth39FICdveWdAjaUUppP6G/+6poeYNpLp8 g==;
X-CSE-ConnectionGUID: yRVSGq2ATgOKYbGBnz8O6A==
X-CSE-MsgGUID: zNIXrQTITx6GHu5Ko9TTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59530911"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59530911"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:01:32 -0700
X-CSE-ConnectionGUID: 785NL5f/QWOOWvsZAFFjFw==
X-CSE-MsgGUID: 7Q+RnEEYRZiSgUDvvPFZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="177459208"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:01:29 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 3/4] tests/intel/kms_dsc_helper: Add helper func()
Date: Sat,  6 Sep 2025 02:38:15 +0530
Message-Id: <20250905210816.319104-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905210816.319104-1-swati2.sharma@intel.com>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 54 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 ++
 tests/meson.build            | 17 ++++++++----
 3 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index cea4304e4..df2f1d5c9 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -201,3 +201,57 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
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
+		min_pipes = 2;
+		min_slices = 4;
+		break;
+	case JOINED_PIPES_ULTRA_JOINER:
+		min_pipes = 4;
+		min_slices = 8;
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
index 4dbd88fe7..505821871 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -8,6 +8,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "kms_joiner_helper.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
@@ -38,5 +39,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output, int num_pipes,
+                                  enum joined_pipes type);
 
 #endif
diff --git a/tests/meson.build b/tests/meson.build
index 5c01c64e9..dbe434c3a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -379,14 +379,19 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_dsc_helper.c') ],
+	   join_paths ('intel', 'kms_mst_helper.c'),
+	   join_paths ('intel', 'kms_dsc_helper.c'),
+	   join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dp_link_training': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_joiner_helper.c') ],
-	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	   join_paths ('intel', 'kms_mst_helper.c'),
+	   join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_dsc': [
+	   join_paths ('intel', 'kms_dsc_helper.c'),
+	   join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
-	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_psr2_sf': [
+	   join_paths ('intel', 'kms_dsc_helper.c'),
+	   join_paths ('intel', 'kms_joiner_helper.c') ],
 }
 
 # Extra dependencies used on core and Intel drivers
-- 
2.25.1

