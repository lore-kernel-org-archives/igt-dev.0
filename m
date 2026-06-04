Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49220CD6E75
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 20:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11011A2CB;
	Thu,  4 Jun 2026 20:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpaeSfyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781FE11A2CA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780603337; x=1812139337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vxeN6CHZoTRzGoLRh8FmYEdyQRfmiy19H+/5In0LEEs=;
 b=HpaeSfyzdj4KSZObOMEHduNqnWP3vm4MzRahexbRd+mS4oy5Ew4/OMYB
 cEN9XZr0mfV1lJWdoX3kvSS0zNwbiTiYkShy+inFqfHq01GL1739ircfd
 A4lZm0SO0np3p8Qr2bV6HYOhrfeDrhHSulck+jhkppfFdYe6xJ0cYmvJN
 8uG2NaxxOJl7uo54/nxYEfmUABCVIjGjwaP0tDQ94WHdN+xzWo+CPCZ/q
 Lmq1O5X/elhD+Ui+68reHFy24DDoODkL/YReE52Cgpqfd1KJ55aexZr6I
 R/Xu1FOmXVwpeFoQuh00FZRUwV5RhhlFT5W8+U8WTyq98GbJYtI5vLik9 Q==;
X-CSE-ConnectionGUID: BYKylmw9QBWj/AakQ9DTIA==
X-CSE-MsgGUID: pL1nU1WmQP+61XnTsgB0QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81622017"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81622017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:02:17 -0700
X-CSE-ConnectionGUID: ydyUuOC2RqqYYE5xN7iCqQ==
X-CSE-MsgGUID: 39XS22PyTTG1Fhqhr9i01A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="248573322"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 13:02:15 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v8 4/5] tests/intel/kms_dsc_helper: Add helper func()
Date: Fri,  5 Jun 2026 01:41:01 +0530
Message-Id: <20260604201102.2583200-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260604201102.2583200-1-swati2.sharma@intel.com>
References: <20260604201102.2583200-1-swati2.sharma@intel.com>
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
count, consecutive HW pipe availability, DSC slice requirements, and
joiner support for DSC joiner scenarios.

Update meson.build to link kms_joiner_helper.c into DSC-related
tests so the new helper can call igt_is_joiner_supported_by_source().

v2: -Avoid hardcoding min_pipes/min_slices, use enum values (Santhosh)
v3: -Handle JOINED_PIPES_NONE/DEFAULT explicitly, return true (Karthik)
    -Fix indentation/style issues (Karthik)
v4: -Move consecutive pipe check (igt_crtc_for_pipe) into helper
     rather than having it in the test (Karthik)
v5: -Remove igt_has_force_joiner_debugfs check from helper; the check
     is not mandatory since joiner may already be enabled by default
     and forcing is only needed when it's not active (Karthik)
    -Add function description comment for check_dsc_joiner_constraints()
     (Karthik)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 68 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  5 +++
 tests/meson.build            | 17 +++++----
 3 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 29b998c2f..9f581758f 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -203,3 +203,71 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+/*
+ * Check whether the given output and pipe combination meets the
+ * requirements for DSC with joiner (big joiner / ultra joiner):
+ * - Source supports the requested joiner type
+ * - Sufficient number of pipes available
+ * - Consecutive HW pipes exist starting from the given pipe
+ * - Sink supports the minimum DSC slice count required by the joiner config
+ */
+bool check_dsc_joiner_constraints(int drm_fd,
+				  igt_output_t *output,
+				  igt_display_t *display,
+				  enum pipe pipe,
+				  int num_pipes,
+				  enum joined_pipes type)
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
+		return true;
+	default:
+		igt_info("Unknown joiner type: %d\n", type);
+		return false;
+	}
+
+	if (num_pipes < min_pipes) {
+		igt_info("%s requires minimum %d pipes\n",
+			 igt_get_joined_pipes_name(type), min_pipes);
+		return false;
+	}
+
+	/* Verify consecutive HW pipes are available from this pipe */
+	if (type == JOINED_PIPES_BIG_JOINER &&
+	    !igt_crtc_for_pipe(display, pipe + 1))
+		return false;
+
+	if (type == JOINED_PIPES_ULTRA_JOINER &&
+	    (!igt_crtc_for_pipe(display, pipe + 1) ||
+	     !igt_crtc_for_pipe(display, pipe + 2) ||
+	     !igt_crtc_for_pipe(display, pipe + 3)))
+		return false;
+
+	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
+		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
+			 igt_output_name(output), min_slices,
+			 igt_get_joined_pipes_name(type));
+		return false;
+	}
+
+	return true;
+}
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index ee419c849..542fe46de 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -8,6 +8,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "kms_joiner_helper.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
@@ -39,5 +40,9 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output,
+				  igt_display_t *display, enum pipe pipe,
+				  int num_pipes,
+				  enum joined_pipes type);
 
 #endif
diff --git a/tests/meson.build b/tests/meson.build
index 811a36748..deaa4ac5b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -400,14 +400,19 @@ extra_sources = {
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

