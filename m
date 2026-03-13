Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA71C105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A9910EB68;
	Fri, 13 Mar 2026 09:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJ9dpvUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4C910EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394364; x=1804930364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sTm1ahNc0F0m2gIf2QDzyvnwRy73gQh55sLYk8cTbFk=;
 b=nJ9dpvUcgfJg56UXV9X96PPJ24BHylXIDflio/XlEyAHiJMs5acoF+Et
 zRkPOzx8hgxvTjZ2RZ+klXfzlmlvV3dU7X3UDZHW/FXZxcS212Fy1T7Fx
 THGyTMwVte+rTLqpUqA7iOh5MkVeRwwnu5tqUQXaD17ULB3FZArbiJHGP
 JLkk6p04MgXyXqxVCc2R3I7tPS0pEcxEmaCjX0MMF1TgHutRxyqSEcMPI
 uT9gX7ihWEr/CHsoIWbQjjHolw94A+CsStX8ba3ZX3jNjbVSxyN1BswNg
 JKsSBRHwVJgY1q0VYqGoCIvb6zLgLbZH4EFjvrBdd8FgFuHvv6A+QMzBn w==;
X-CSE-ConnectionGUID: 6D+OIhJ4R2+0QHC26GvyBg==
X-CSE-MsgGUID: VAMgIuLbROWPBDkYYrDOFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78390387"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="78390387"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:43 -0700
X-CSE-ConnectionGUID: ricgqrcRR92bVGZxk2ci7g==
X-CSE-MsgGUID: pfseq1PQQ3u4g4iRb2cwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="221322724"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 7/8] lib/i915/fbc: convert intel_fbc_{enable,
 disable}() into proper functions
Date: Fri, 13 Mar 2026 11:31:59 +0200
Message-ID: <36f88aedb452336b6371b2f60bbcd262b9ca323e.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Convert intel_fbc_enable() and intel_fbc_disable() into proper
functions, and pass igt_display_t* as the parameter.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c                   | 10 ++++++++++
 lib/i915/intel_fbc.h                   |  5 ++---
 tests/intel/kms_dirtyfb.c              |  4 ++--
 tests/intel/kms_fbc_dirty_rect.c       |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  4 ++--
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 1e0da2cf8cd9..a01023babb12 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -12,6 +12,16 @@
 
 #define FBC_STATUS_BUF_LEN 128
 
+void intel_fbc_enable(igt_display_t *display)
+{
+	igt_set_module_param_int(display->drm_fd, "enable_fbc", 1);
+}
+
+void intel_fbc_disable(igt_display_t *display)
+{
+	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
+}
+
 /**
  * intel_fbc_supported:
  * @crtc: CRTC
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 2e2786733c5f..d45ff1d77dd1 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -8,11 +8,10 @@
 
 #include "igt.h"
 
-#define intel_fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
-#define intel_fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
-
 enum psr_mode;
 
+void intel_fbc_enable(igt_display_t *display);
+void intel_fbc_disable(igt_display_t *display);
 bool intel_fbc_supported(igt_crtc_t *crtc);
 bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 3d0ad84aac26..b85e09346723 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -147,7 +147,7 @@ static void enable_feature(data_t *data)
 	case FEATURE_NONE:
 		break;
 	case FEATURE_FBC:
-		intel_fbc_enable(data->drm_fd);
+		intel_fbc_enable(&data->display);
 		break;
 	case FEATURE_PSR:
 		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
@@ -215,7 +215,7 @@ static void check_feature(data_t *data)
 
 static void disable_features(data_t *data)
 {
-	intel_fbc_disable(data->drm_fd);
+	intel_fbc_disable(&data->display);
 
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
 		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 9a0146460b18..efbd469850b6 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -422,7 +422,7 @@ static bool prepare_test(data_t *data)
 	}
 
 	if (data->feature & FEATURE_FBC)
-		intel_fbc_enable(data->drm_fd);
+		intel_fbc_enable(&data->display);
 
 	return intel_pipe_output_combo_valid(&data->display);
 }
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 789a33e83f3b..5471b8c51c99 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1902,7 +1902,7 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	intel_fbc_disable(drm.fd);
+	intel_fbc_disable(&drm.display);
 	intel_drrs_disable(prim_mode_params.crtc);
 
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
@@ -2535,7 +2535,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 		return false;
 
 	if (t->feature & FEATURE_FBC)
-		intel_fbc_enable(drm.fd);
+		intel_fbc_enable(&drm.display);
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
 	if (t->feature & FEATURE_DRRS)
-- 
2.47.3

