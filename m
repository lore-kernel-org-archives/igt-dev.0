Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8013108B8E6
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 09:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2258911A;
	Fri, 20 Mar 2026 09:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxCY5iM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A477D10EAC8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774000454; x=1805536454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Khnf5KSYlTU1BBErClnUyUgRZPZ5u/KKygzU8GY/1E8=;
 b=lxCY5iM9++ru855TnqTwAXTUxMDDNfRZeeJowzbsBGzOtby5K72ekmC8
 TxdQW4SFVpPJ2cxrK8lyE/g9UQppbkKEkntHV176UKHyg96Tp29WPdZ0r
 w9vuwiAHqhOUph3ScCUAcoKt6ggD44I9mgIPKu313NVMn5bbhYzVABjSp
 vDoj7VOcNE+Tc/dbjXG5145tgrhwhwnJK405XqCX14194Vd7NhrkNx0Ge
 d+xfCDXCt8T1bey80Qtbq78U2jRa+EdFjL0qccpjLGdxAZ5tXz2Xz/D+S
 0CBduNCpuHV6fEpZv+Q3g6SteKNV9lC5NgK/zvq549XXpYAMQf8N7reac g==;
X-CSE-ConnectionGUID: Cqsqp3MkTX6yvYuluk0ghA==
X-CSE-MsgGUID: 6q71DmSVQCSTfojfUS2imw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74991593"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74991593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:13 -0700
X-CSE-ConnectionGUID: it1S9oI4Q/m9tvrhAiozMA==
X-CSE-MsgGUID: KV30BAdpQ06CaP23kLlNug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227715651"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2] lib/igt_debugfs: remove mode parameter from
 igt_debugfs_crtc_dir()
Date: Fri, 20 Mar 2026 11:54:06 +0200
Message-ID: <20260320095406.2831768-1-jani.nikula@intel.com>
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

v2: Rebase

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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
index 197ed15d1380..481b893fc025 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1310,7 +1310,7 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 	int debugfs_fd, pipe, res = 0;
 	char pipe_char;
 
-	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index, O_RDONLY);
+	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index);
 
 	if (debugfs_fd >= 0) {
 		res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
@@ -5255,9 +5255,9 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
 	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd, crtc->crtc_index, source);
 }
 
-int igt_crtc_debugfs_dir(igt_crtc_t *crtc, int mode)
+int igt_crtc_debugfs_dir(igt_crtc_t *crtc)
 {
-	return igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, mode);
+	return igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index);
 }
 
 const char *igt_crtc_name(igt_crtc_t *crtc)
@@ -6676,7 +6676,7 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 	int fd, res;
 	unsigned int current;
 
-	fd = igt_crtc_debugfs_dir(crtc, O_RDONLY);
+	fd = igt_crtc_debugfs_dir(crtc);
 	igt_assert(fd >= 0);
 
 	if (is_intel_device(drmfd))
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 71ed4604e7e0..ba445eb4ebfd 100644
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
index bb4711dd66a5..11a491e177ef 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -360,7 +360,7 @@ static void setup_test(data_t *data)
 	igt_plane_set_fb(data->primary, &data->default_fb);
 	igt_display_commit(&data->display);
 
-	dir = igt_crtc_debugfs_dir(data->crtc, O_DIRECTORY);
+	dir = igt_crtc_debugfs_dir(data->crtc);
 	igt_require_fd(dir);
 	data->nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
 	close(dir);
-- 
2.47.3

