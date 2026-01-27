Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0004D2F000
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6430E10E551;
	Tue, 27 Jan 2026 11:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hy+fO0C3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF110E551
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515006; x=1801051006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Cu2YKpFW2cKpYJ8JQLQlfZLyZuuubtn4zV1OKSkXrg=;
 b=hy+fO0C3OvKkiFxOTLKaygMMu6O2MkeghuoX8Uz5nmxedaliSgfMnMr3
 aMIOL5M10NaiBkouiPC3LzWdcD2Kjq49b3N5x8PF1FLBU/PD7o920py94
 LNFIXYwMhYi2MNgbhcNsbBgeb3NidsHLRyXtA4aggatU0PKAcD+ev0wjZ
 Zscm5HI5h4dhUvGbZ8zoprLWwCEbymJV6vo1qXH/vfEVdvxIT0A8H/7uX
 dW/+OGTNaqOo4MHAhFKhUihC4RiWuAv1aTleM3oXdBr65hhRo5N0MTe0C
 2d8Ua7sUCDAxV7Ol86o9XkLNpdRRqR22gB4pa7GTA+rIGR0+WsPbXisQ9 w==;
X-CSE-ConnectionGUID: qnjL90mlRGSTRNX/3Q+U/w==
X-CSE-MsgGUID: ybgxfQV8SY6i+cEKmwzjHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93365895"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93365895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:46 -0800
X-CSE-ConnectionGUID: W/2oq8qwSjSHsJrYua2PDg==
X-CSE-MsgGUID: BU0Kokw/SKesFmGnmxs+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239222433"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 7/8] lib/igt_debugfs: rename igt_debugfs_pipe_dir() to
 igt_debugfs_crtc_dir()
Date: Tue, 27 Jan 2026 13:56:04 +0200
Message-ID: <305787a2b7c67d4b0f25824e042d266c1f59e147.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
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

Rename the function to reflect what it does. It opens the debugfs
directory based on the CRTC index, not the pipe.

There's no functional change here. If there's code that passes the
hardware pipe to igt_debugfs_crtc_dir(), it needs to be fixed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_drrs.c                  |  6 +++---
 lib/i915/intel_fbc.c                   |  4 ++--
 lib/igt_debugfs.c                      | 10 +++++-----
 lib/igt_debugfs.h                      |  4 +---
 lib/igt_kms.c                          |  4 ++--
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/nouveau_crc.c                    |  2 +-
 7 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index ac8dd5e61d21..5257a6a6a7ca 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -25,7 +25,7 @@ bool intel_is_drrs_supported(int device, enum pipe pipe)
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
@@ -64,7 +64,7 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
 	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
 	snprintf(buf, sizeof(buf), "%d", val);
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
 	close(dir);
@@ -123,7 +123,7 @@ bool intel_is_drrs_inactive(int device, enum pipe pipe)
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a1a6de90e3f3..84c66929dabc 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -28,7 +28,7 @@ bool intel_fbc_supported_on_chipset(int device, enum pipe pipe)
 	char buf[FBC_STATUS_BUF_LEN];
 	int dir;
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
@@ -45,7 +45,7 @@ static bool _intel_fbc_is_enabled(int device, enum pipe pipe, int log_level, cha
 	bool print = true;
 	int dir;
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 40b719545e9b..11f5ee9984ee 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -285,23 +285,23 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 }
 
 /**
- * igt_debugfs_pipe_dir:
+ * igt_debugfs_crtc_dir:
  * @device: fd of the device
- * @pipe: index of pipe
+ * @crtc_index: CRTC index
  * @mode: mode bits as used by open()
  *
- * This opens the debugfs directory corresponding to the pipe index on the
+ * This opens the debugfs directory corresponding to the CRTC index on the
  * device for use with igt_sysfs_get() and related functions. This is just
  * syntax sugar for igt_debugfs_open().
  *
  * Returns:
  * The directory fd, or -1 on failure.
  */
-int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+int igt_debugfs_crtc_dir(int device, int crtc_index, int mode)
 {
 	char buf[128];
 
-	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	snprintf(buf, sizeof(buf), "crtc-%d", crtc_index);
 	return igt_debugfs_open(device, buf, mode);
 }
 
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 76dbff3e8e7f..2c546f299a43 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -29,14 +29,12 @@
 #include <stdint.h>
 #include <stdio.h>
 
-enum pipe;
-
 const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
-int igt_debugfs_pipe_dir(int device, int pipe, int mode);
+int igt_debugfs_crtc_dir(int device, int crtc_index, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6508400fd686..a94c4820bd87 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1309,7 +1309,7 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 	int debugfs_fd, pipe, res = 0;
 	char pipe_char;
 
-	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_index, O_RDONLY);
+	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index, O_RDONLY);
 
 	if (debugfs_fd >= 0) {
 		res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
@@ -6649,7 +6649,7 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
 	int fd, res;
 	unsigned int current;
 
-	fd = igt_debugfs_pipe_dir(drmfd, pipe, O_RDONLY);
+	fd = igt_debugfs_crtc_dir(drmfd, pipe, O_RDONLY);
 	igt_assert(fd >= 0);
 
 	if (is_intel_device(drmfd))
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 7dd52f982d96..cd80ba444cf5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1538,7 +1538,7 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
 	enum pipe pipe;
 
 	pipe = prim_mode_params.pipe;
-	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(drm.fd, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, param, buf, len);
 	close(dir);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 6d61df006095..b30dbb1be592 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -369,7 +369,7 @@ int igt_main()
 			igt_plane_set_fb(data.primary, &data.default_fb);
 			igt_display_commit(&data.display);
 
-			dir = igt_debugfs_pipe_dir(data.drm_fd, pipe, O_DIRECTORY);
+			dir = igt_debugfs_crtc_dir(data.drm_fd, pipe, O_DIRECTORY);
 			igt_require_fd(dir);
 			data.nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
 			close(dir);
-- 
2.47.3

