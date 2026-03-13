Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E5E105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6027F10EB70;
	Fri, 13 Mar 2026 09:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPGFT7Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E036C10EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394343; x=1804930343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yYZERhS+RluLKTHHBuGwUycEc242y9oRglWpFH0znm0=;
 b=YPGFT7Y1htYIlFltXJPsVq7e/94MqLAClXFh1TsZ/KhOwTw5h7DSQ+np
 WxD7axkps9TdqVmWSoQQ8fvLqqhzgu3ZkPNs33Je6vGJADXRUj2El3R5y
 t01k1PTOkZGXCLonzo/fbiGO10GyzHddSZ9Ke0jBQF4v9m1DHt8bkmKru
 nQKft9oi40tf8X0r0XA3l/1klAIS143UUpZXrMlrmVGJVIRYo23dr7oyT
 0jGScL2m4+ZKKWLkZ8S+tcO/v4KqlyliqmVR9zYC1p8TDwqvQhzf6QiBX
 aqFaw4JTyXBfPgfsxW8kroafcFMWzLYAtctzTaaGnjWd/wFQySxbRGrUy Q==;
X-CSE-ConnectionGUID: psl1Nl7aSAmjfddyHEEJ7w==
X-CSE-MsgGUID: PzGRMLVDSOSy8bkE8otvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380919"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74380919"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:23 -0700
X-CSE-ConnectionGUID: vsK5IKwRTfmovvWdAkcITw==
X-CSE-MsgGUID: HlIQ3Lp3R4yUNZw/v3K9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225801385"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 3/8] lib/i915/drrs: convert the interface to igt_crtc_t
Date: Fri, 13 Mar 2026 11:31:55 +0200
Message-ID: <0e5d8dea6ef828160d62df4bc1596bcfc4274450.1773394225.git.jani.nikula@intel.com>
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

Convert most of the intel_drrs.[ch] interfaces to igt_crtc_t*. As a side
effect, this fixes several cases where pipe is used instead of CRTC
index for the DRRS debugfs dir.

Unfortunately, the kms_setmode.c test is not based on the regular igt
structures and has no igt_display_require(), so we need to retain a
intel_drrs_disable_crtc_index() call for that. In the long run, the test
should be converted to align with the rest, but for now that's too much
of a detour for the task at hand.

Similarly, kms_flip.c could be refactored to store igt_crtc_t instead of
CRTC index, but limit the changes to just using
igt_crtc_for_crtc_index() instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_drrs.c                  | 40 ++++++++++++++------------
 lib/i915/intel_drrs.h                  | 10 ++++---
 tests/intel/kms_dirtyfb.c              | 10 +++----
 tests/intel/kms_frontbuffer_tracking.c |  8 +++---
 tests/kms_flip.c                       |  8 ++++--
 tests/kms_setmode.c                    |  2 +-
 6 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index ab32f2b4734f..1ad993c1e90b 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -12,20 +12,19 @@
 
 /**
  * intel_is_drrs_supported:
- * @device: fd of the device
- * @crtc_index: CRTC index
+ * @crtc: CRTC
  *
- * Check if DRRS is supported on given CRTC index.
+ * Check if DRRS is supported on given CRTC.
  *
  * Returns:
  * true if DRRS is supported and false otherwise.
  */
-bool intel_is_drrs_supported(int device, int crtc_index)
+bool intel_is_drrs_supported(igt_crtc_t *crtc)
 {
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
@@ -80,50 +79,53 @@ static void drrs_set(int device, int crtc_index, unsigned int val)
 
 /**
  * intel_drrs_enable:
- * @device: fd of the device
- * @crtc_index: CRTC index
+ * @crtc: CRTC
  *
- * Enable DRRS on given CRTC index.
+ * Enable DRRS on given CRTC.
  *
  * Returns:
  * none
  */
-void intel_drrs_enable(int device, int crtc_index)
+void intel_drrs_enable(igt_crtc_t *crtc)
 {
-	drrs_set(device, crtc_index, 1);
+	drrs_set(crtc->display->drm_fd, crtc->crtc_index, 1);
 }
 
 /**
  * intel_drrs_disable:
- * @device: fd of the device
- * @crtc_index: CRTC index
+ * @crtc: CRTC
  *
- * Disable DRRS on given CRTC index.
+ * Disable DRRS on given CRTC.
  *
  * Returns:
  * none
  */
-void intel_drrs_disable(int device, int crtc_index)
+void intel_drrs_disable(igt_crtc_t *crtc)
+{
+	drrs_set(crtc->display->drm_fd, crtc->crtc_index, 0);
+}
+
+/* FIXME: Remove this and its users. */
+void intel_drrs_disable_crtc_index(int device, int crtc_index)
 {
 	drrs_set(device, crtc_index, 0);
 }
 
 /**
  * intel_is_drrs_inactive:
- * @device: fd of the device
- * @crtc_index: CRTC index
+ * @crtc: CRTC
  *
- * Check if drrs is inactive on given CRTC index.
+ * Check if drrs is inactive on given CRTC.
  *
  * Returns:
  * true if inactive and false otherwise
  */
-bool intel_is_drrs_inactive(int device, int crtc_index)
+bool intel_is_drrs_inactive(igt_crtc_t *crtc)
 {
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/i915/intel_drrs.h b/lib/i915/intel_drrs.h
index 1a612d16f6b6..bcd48c0e1f9f 100644
--- a/lib/i915/intel_drrs.h
+++ b/lib/i915/intel_drrs.h
@@ -8,10 +8,12 @@
 
 #include "igt.h"
 
-bool intel_is_drrs_supported(int device, int crtc_index);
+bool intel_is_drrs_supported(igt_crtc_t *crtc);
 bool intel_output_has_drrs(int device, igt_output_t *output);
-void intel_drrs_enable(int device, int crtc_index);
-void intel_drrs_disable(int device, int crtc_index);
-bool intel_is_drrs_inactive(int device, int crtc_index);
+void intel_drrs_enable(igt_crtc_t *crtc);
+void intel_drrs_disable(igt_crtc_t *crtc);
+bool intel_is_drrs_inactive(igt_crtc_t *crtc);
+
+void intel_drrs_disable_crtc_index(int device, int crtc_index);
 
 #endif
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index d5e7e61a4a1b..4c6a787efa8c 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -127,7 +127,7 @@ static bool check_support(data_t *data)
 		return true;
 
 	case FEATURE_DRRS:
-		if (!(intel_is_drrs_supported(data->drm_fd, data->crtc->pipe) &&
+		if (!(intel_is_drrs_supported(data->crtc) &&
 		      intel_output_has_drrs(data->drm_fd, data->output))) {
 			igt_info("Output doesn't support DRRS\n");
 			return false;
@@ -153,7 +153,7 @@ static void enable_feature(data_t *data)
 		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
 		break;
 	case FEATURE_DRRS:
-		intel_drrs_enable(data->drm_fd, data->crtc->pipe);
+		intel_drrs_enable(data->crtc);
 		break;
 	case FEATURE_DEFAULT:
 		break;
@@ -177,7 +177,7 @@ static void check_feature_enabled(data_t *data)
 			     "PSR still disabled\n");
 		break;
 	case FEATURE_DRRS:
-		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->crtc->pipe),
+		igt_assert_f(!intel_is_drrs_inactive(data->crtc),
 			     "DRRS INACTIVE\n");
 		break;
 	case FEATURE_DEFAULT:
@@ -203,7 +203,7 @@ static void check_feature(data_t *data)
 		psr_sink_error_check(data->debugfs_fd, PSR_MODE_1, data->output);
 		break;
 	case FEATURE_DRRS:
-		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->crtc->pipe),
+		igt_assert_f(!intel_is_drrs_inactive(data->crtc),
 			     "DRRS INACTIVE\n");
 		break;
 	case FEATURE_DEFAULT:
@@ -220,7 +220,7 @@ static void disable_features(data_t *data)
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
 		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 
-	intel_drrs_disable(data->drm_fd, data->crtc->pipe);
+	intel_drrs_disable(data->crtc);
 }
 
 static void prepare(data_t *data)
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e83465c0d478..789a33e83f3b 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1903,7 +1903,7 @@ static bool disable_features(const struct test_mode *t)
 		return false;
 
 	intel_fbc_disable(drm.fd);
-	intel_drrs_disable(drm.fd, prim_mode_params.crtc->pipe);
+	intel_drrs_disable(prim_mode_params.crtc);
 
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
 }
@@ -2190,7 +2190,7 @@ static void setup_drrs(void)
 		return;
 	}
 
-	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.crtc->pipe)) {
+	if (!intel_is_drrs_supported(prim_mode_params.crtc)) {
 		igt_info("Can't test DRRS: Not supported.\n");
 		return;
 	}
@@ -2347,7 +2347,7 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.crtc->pipe)) {
+		if (!intel_is_drrs_inactive(prim_mode_params.crtc)) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
@@ -2539,7 +2539,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
 	if (t->feature & FEATURE_DRRS)
-		intel_drrs_enable(drm.fd, prim_mode_params.crtc->pipe);
+		intel_drrs_enable(prim_mode_params.crtc);
 
 	return ret;
 }
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 29a24c6f0630..518543ce9aee 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -861,8 +861,12 @@ static int set_mode(struct test_output *o, uint32_t fb, int x, int y)
 		if (ret)
 			return ret;
 
-		if (is_intel_device(drm_fd))
-			intel_drrs_disable(drm_fd, o->crtc_index);
+		if (is_intel_device(drm_fd)) {
+			igt_crtc_t *crtc = igt_crtc_for_crtc_index(&display, o->crtc_index);
+
+			if (crtc)
+				intel_drrs_disable(crtc);
+		}
 	}
 
 	return 0;
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 9c0649e17bd0..1f2849bc26cf 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -666,7 +666,7 @@ retry:
 					     crtc->connector_count, &crtc->mode);
 
 		if (is_intel_device(drm_fd))
-			intel_drrs_disable(drm_fd, crtc->crtc_idx);
+			intel_drrs_disable_crtc_index(drm_fd, crtc->crtc_idx);
 
 		free(ids);
 
-- 
2.47.3

