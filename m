Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26768105F782
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074A10EB68;
	Fri, 13 Mar 2026 09:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5hcxXfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49B110EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394373; x=1804930373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5alXonusotdVSjQuHZg5NusGWAccCpnl7bPmvQ2CCUI=;
 b=M5hcxXfdYv64mLQKFA1zZSeDkOkAjLD8yfm7cc2223SiNAJkIWFBZKFh
 fISbHS1lJuS+GdBaEZCBXU11xi59QUZFPKXM9N9XXttFteBb/sF4rvCtV
 vfcQfzAARKZzw05fqESKBK6XHOSgU8CbX3bVuN7vRcFsUP0SDXNbXVGcJ
 /Ia1xlOOwm3GYT5654h1ZisEWaWgc+AOSEmmR7CjpdPQeTL2wp2vOX9lT
 PPKF8g31Ne3WUrJ0UxiY9JtVikssITIn69zXSZ7aByZIVejFt6tG6ezMp
 caI7Zs126jxGoSWTbMoE4iGhUco/WpnKcowzufneT1mVuIWdIhLLf7xRy Q==;
X-CSE-ConnectionGUID: T1SzvS22TrO888dx0oJTCw==
X-CSE-MsgGUID: M52YOMG5QsOA8yGpecCIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85854320"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="85854320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:52 -0700
X-CSE-ConnectionGUID: /yzIrsd3SbmVsDUj8YecEA==
X-CSE-MsgGUID: FeHYBIxDRCykbQ+GHmisKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="220374170"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 1/8] lib/kms: add and use igt_crtc_debugfs_dir()
Date: Fri, 13 Mar 2026 11:31:53 +0200
Message-ID: <30fc91b2a9d6ced1ec26bad26cecc90af81636d3.1773394225.git.jani.nikula@intel.com>
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

Add igt_crtc_debugfs_dir() for getting the debugfs for a CRTC, and use
it where applicable. As a side effect, this fixes several cases where
pipe is used instead of CRTC index for the debugfs dir.

Note: Looks like it's difficult to add any igt_crtc_t based interfaces
in igt_debugfs.h due to header dependencies, so add it to igt_kms.h
along with the rest of the crtc based helpers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c                   | 4 ++--
 lib/igt_kms.c                          | 7 ++++++-
 lib/igt_kms.h                          | 2 ++
 tests/intel/kms_frontbuffer_tracking.c | 4 +---
 tests/nouveau_crc.c                    | 4 +---
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 9ea5e3cf68fd..b418c95e66bd 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -27,7 +27,7 @@ bool intel_fbc_supported(igt_crtc_t *crtc)
 	char buf[FBC_STATUS_BUF_LEN];
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
@@ -44,7 +44,7 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
 	bool print = true;
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72977..6ccc9d0e6221 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5254,6 +5254,11 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
 	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd, crtc->crtc_index, source);
 }
 
+int igt_crtc_debugfs_dir(igt_crtc_t *crtc, int mode)
+{
+	return igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, mode);
+}
+
 const char *igt_crtc_name(igt_crtc_t *crtc)
 {
 	if (crtc == NULL)
@@ -6638,7 +6643,7 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 	int fd, res;
 	unsigned int current;
 
-	fd = igt_debugfs_crtc_dir(drmfd, crtc->pipe, O_RDONLY);
+	fd = igt_crtc_debugfs_dir(crtc, O_RDONLY);
 	igt_assert(fd >= 0);
 
 	if (is_intel_device(drmfd))
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 081613a4b949..2492dac77e4f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -595,6 +595,8 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
+int igt_crtc_debugfs_dir(igt_crtc_t *crtc, int mode);
+
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
 const char *igt_output_name(igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 12f51047d286..e83465c0d478 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1534,10 +1534,8 @@ static void set_mode_for_params(struct modeset_params *params)
 static void __debugfs_read_crtc(const char *param, char *buf, int len)
 {
 	int dir;
-	enum pipe pipe;
 
-	pipe = prim_mode_params.crtc->pipe;
-	dir = igt_debugfs_crtc_dir(drm.fd, pipe, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(prim_mode_params.crtc, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, param, buf, len);
 	close(dir);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index c080ded3e621..29e2d84e76ac 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -370,9 +370,7 @@ int igt_main()
 			igt_plane_set_fb(data.primary, &data.default_fb);
 			igt_display_commit(&data.display);
 
-			dir = igt_debugfs_crtc_dir(data.drm_fd,
-						   data.crtc->pipe,
-						   O_DIRECTORY);
+			dir = igt_crtc_debugfs_dir(data.crtc, O_DIRECTORY);
 			igt_require_fd(dir);
 			data.nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
 			close(dir);
-- 
2.47.3

