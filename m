Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0613CCD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 19:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51210F41D;
	Thu, 30 Apr 2026 19:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkx6/xP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025E210F421
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777575702; x=1809111702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4iEl4lQ4R3TmI6RNx9tZT1Ic4GYzoIGL+MzuURShMI=;
 b=Dkx6/xP/Yat43NT1RqQHMpMq17NoxJA+135No3CQ6sC5D8oJDgSd2h/O
 XoLQWacmWSgLEL8FdsFivJC8rIeNXLxmlmsXd2Fr/WzS4bPqGwYNEJgpD
 xd/LJ9obDoRKb5ruOpGlaRmXtuToYP+hd2suzyZOT83HnzBcG6OLCQRoz
 fXpa0c6UgW1bxxcHjR9uyU3H01fVLVxcNYDz2pUHVwTj8DLpQCIkmeYV7
 NJEuxkZ9JAJmB/jgVALpEDZ/qnWY8NrEAU5w99YyyCw2k4iG4eZqlSCc9
 MSLXvwJM5glsLfn2QjBaqi2n+3Cf6PVghhAbRsVVcpi3E2fcO4psb+RQj w==;
X-CSE-ConnectionGUID: 8x7dQRMRSiKqhxm42/Nwug==
X-CSE-MsgGUID: I+UtKXZNRPK7YrisWOkzlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90003576"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="90003576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:01:28 -0700
X-CSE-ConnectionGUID: xJ5KemJ/TS+ZMIgHt2KnVA==
X-CSE-MsgGUID: Q+JbpcBCQdGE/2hnw6OQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234559304"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:01:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v6 3/4] tests/intel/kms_dsc_helper: Add helper func()
Date: Fri,  1 May 2026 00:39:46 +0530
Message-Id: <20260430190947.2347314-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430190947.2347314-1-swati2.sharma@intel.com>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
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

