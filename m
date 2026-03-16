Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883B5F46453
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314D210E256;
	Mon, 16 Mar 2026 11:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXRkIIDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2539A10E27F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773660570; x=1805196570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bfej1FVLkGahyJTEFRRo5u0y2Rgs/q04YWj+rJ+EOIQ=;
 b=GXRkIIDefGzhUqXGWRaa32/cs/YQPx3kf/PeowZ1lHoo2vOGDRqS2111
 MjgIy7BSfUgVWvQPUXL6Biw2XLRaGKUGTjaENJb2X+7/1blRJxJm7XBn+
 0QYLUqyLMn4VtCvjNFe0+PAwVDPRtHv38OUgDZyHHzMnbNtzyZ6jN4Amd
 HeT4qC+CqZ08NkGx2inPUWsWx02LusEHVCfRgSifKBEZh3Sl62MW5X4l0
 8IpDpOU8rkEKSTRbqQpw79atUT5ZN0hqdXcPxsYFIMfqDmO6AGVu9gtS/
 XDDCo6du42PcZV5C5lnnr6542tLxhcWW7CsXSjufiiIb98NzlowRWe3Oc g==;
X-CSE-ConnectionGUID: lL0X0Sn1Sd6Owocsr2oYRQ==
X-CSE-MsgGUID: DbdJ1JkCS6aQIAXBgfCAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92055967"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92055967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:29:29 -0700
X-CSE-ConnectionGUID: r+llAAXyTEm89M/iDyFHoQ==
X-CSE-MsgGUID: g7QKsZCHQlyXE2cbSJXMeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226347300"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:29:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_debugfs: remove mode parameter from
 igt_debugfs_crtc_dir()
Date: Mon, 16 Mar 2026 13:29:19 +0200
Message-ID: <20260316112919.1162830-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The mode for opening the CRTC debugfs directory should always be
O_DIRECTORY | O_RDONLY. There's no point in letting the callers pass in
the mode. Indeed, most of them omit O_RDONLY, and some omit O_DIRECTORY.

Remove the mode from igt_debugfs_crtc_dir() and subsequently
igt_crtc_debugfs_dir(), always using O_DIRECTORY | O_RDONLY.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_drrs.c                  | 6 +++---
 lib/i915/intel_fbc.c                   | 4 ++--
 lib/igt_debugfs.c                      | 5 ++---
 lib/igt_debugfs.h                      | 2 +-
 lib/igt_kms.c                          | 8 ++++----
 lib/igt_kms.h                          | 2 +-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 tests/nouveau_crc.c                    | 2 +-
 8 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index 1ad993c1e90b..bfe58d7a0694 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -24,7 +24,7 @@ bool intel_is_drrs_supported(igt_crtc_t *crtc)
 	char buf[256];
 	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
@@ -63,7 +63,7 @@ static void drrs_set(int device, int crtc_index, unsigned int val)
 	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
 	snprintf(buf, sizeof(buf), "%d", val);
 
-	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, crtc_index);
 	igt_require_fd(dir);
 	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
 	close(dir);
@@ -125,7 +125,7 @@ bool intel_is_drrs_inactive(igt_crtc_t *crtc)
 	char buf[256];
 	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 9c1767846c25..b8c714d430e9 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -36,7 +36,7 @@ bool intel_fbc_supported(igt_crtc_t *crtc)
 	char buf[FBC_STATUS_BUF_LEN];
 	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
@@ -53,7 +53,7 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
 	bool print = true;
 	int dir;
 
-	dir = igt_crtc_debugfs_dir(crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(crtc);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 11f5ee9984ee..a184843c9acc 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -288,7 +288,6 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
  * igt_debugfs_crtc_dir:
  * @device: fd of the device
  * @crtc_index: CRTC index
- * @mode: mode bits as used by open()
  *
  * This opens the debugfs directory corresponding to the CRTC index on the
  * device for use with igt_sysfs_get() and related functions. This is just
@@ -297,12 +296,12 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
  * Returns:
  * The directory fd, or -1 on failure.
  */
-int igt_debugfs_crtc_dir(int device, int crtc_index, int mode)
+int igt_debugfs_crtc_dir(int device, int crtc_index)
 {
 	char buf[128];
 
 	snprintf(buf, sizeof(buf), "crtc-%d", crtc_index);
-	return igt_debugfs_open(device, buf, mode);
+	return igt_debugfs_open(device, buf, O_DIRECTORY | O_RDONLY);
 }
 
 /**
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 2c546f299a43..30d4b0ff92ba 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -34,7 +34,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
-int igt_debugfs_crtc_dir(int device, int crtc_index, int mode);
+int igt_debugfs_crtc_dir(int device, int crtc_index);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 57f5e099a313..9068e3d7bedd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1309,7 +1309,7 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 	int debugfs_fd, pipe, res = 0;
 	char pipe_char;
 
-	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index, O_RDONLY);
+	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index);
 
 	if (debugfs_fd >= 0) {
 		res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
@@ -5254,9 +5254,9 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
 	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd, crtc->crtc_index, source);
 }
 
-int igt_crtc_debugfs_dir(igt_crtc_t *crtc, int mode)
+int igt_crtc_debugfs_dir(igt_crtc_t *crtc)
 {
-	return igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, mode);
+	return igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index);
 }
 
 const char *igt_crtc_name(igt_crtc_t *crtc)
@@ -6643,7 +6643,7 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 	int fd, res;
 	unsigned int current;
 
-	fd = igt_crtc_debugfs_dir(crtc, O_RDONLY);
+	fd = igt_crtc_debugfs_dir(crtc);
 	igt_assert(fd >= 0);
 
 	if (is_intel_device(drmfd))
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0bb2734ea3d7..83d3d5159a9c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -596,7 +596,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
-int igt_crtc_debugfs_dir(igt_crtc_t *crtc, int mode);
+int igt_crtc_debugfs_dir(igt_crtc_t *crtc);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
 const char *igt_output_name(igt_output_t *output);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 5471b8c51c99..c16f63199bdd 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1535,7 +1535,7 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
 {
 	int dir;
 
-	dir = igt_crtc_debugfs_dir(prim_mode_params.crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(prim_mode_params.crtc);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, param, buf, len);
 	close(dir);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 29e2d84e76ac..ee63e931616c 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -370,7 +370,7 @@ int igt_main()
 			igt_plane_set_fb(data.primary, &data.default_fb);
 			igt_display_commit(&data.display);
 
-			dir = igt_crtc_debugfs_dir(data.crtc, O_DIRECTORY);
+			dir = igt_crtc_debugfs_dir(data.crtc);
 			igt_require_fd(dir);
 			data.nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
 			close(dir);
-- 
2.47.3

