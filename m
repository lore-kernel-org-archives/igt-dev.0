Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1884CD2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0A10E54C;
	Tue, 27 Jan 2026 11:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3oFdXKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDD510E54C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515011; x=1801051011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fzVgz882ZneLrWmGhUY2DN53N68I5iSdS3NuC+2bjNU=;
 b=S3oFdXKh9IYfccC/ht/geoezKkRBj7UXYWcYpuEaXoU5+eE69UoL2ejp
 j2UtHxVkmuppsz0WoAE5NnukHbpYa+6UWyS3FSZLCJWFNR56F7oFDpzvO
 +xCsNGRbS5XfFrOX4X5EoOMNJRikySmb9K4SQO3R7vnZcVfzXPJFAMA3W
 3yXFaiE4/eJ3/Rr/WgI3b8sEWlVFCyIYQEn+PN+nrLKLQJN1+YYt9ft7I
 JMz0Zi8GQdEj7koMLhBUIJ5TmmCerPODRynjA6Uj4F//WBLH+hT3GpWNY
 QRRGg0kI3ZkR9T+4JDotmWRl634trGrpLoh6Jgj8abgIe4fepqMp5poGg w==;
X-CSE-ConnectionGUID: JR2QZIv9TuexJNnZ5luoFw==
X-CSE-MsgGUID: LmuFtXyjSb2VDZNQ6mMnvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93365897"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93365897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:50 -0800
X-CSE-ConnectionGUID: u7tNI0pAR2WET38NWd8xkw==
X-CSE-MsgGUID: RpUgGKxZTIq2WzTMUHKnYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239222442"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 8/8] lib/i915/drrs: switch the interface from pipe to
 CRTC index
Date: Tue, 27 Jan 2026 13:56:05 +0200
Message-ID: <02071779015eff879fce4d4e79c38576ab3fcca2.1769514879.git.jani.nikula@intel.com>
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

All of the DRRS functionality assumes CRTC index, even though the
functions have enum pipe as parameter. Switch to CRTC index to reflect
what the functions expect in reality.

There's no functional change here. If there's code that passes the
hardware pipe to the DRRS functions, it needs to be fixed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_drrs.c | 36 ++++++++++++++++++------------------
 lib/i915/intel_drrs.h |  8 ++++----
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index 5257a6a6a7ca..ab32f2b4734f 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -13,19 +13,19 @@
 /**
  * intel_is_drrs_supported:
  * @device: fd of the device
- * @pipe: Display pipe
+ * @crtc_index: CRTC index
  *
- * Check if DRRS is supported on given pipe.
+ * Check if DRRS is supported on given CRTC index.
  *
  * Returns:
  * true if DRRS is supported and false otherwise.
  */
-bool intel_is_drrs_supported(int device, enum pipe pipe)
+bool intel_is_drrs_supported(int device, int crtc_index)
 {
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
@@ -56,7 +56,7 @@ bool intel_output_has_drrs(int device, igt_output_t *output)
 	return strstr(buf, "seamless");
 }
 
-static void drrs_set(int device, enum pipe pipe, unsigned int val)
+static void drrs_set(int device, int crtc_index, unsigned int val)
 {
 	char buf[2];
 	int dir, ret;
@@ -64,7 +64,7 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
 	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
 	snprintf(buf, sizeof(buf), "%d", val);
 
-	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
 	igt_require_fd(dir);
 	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
 	close(dir);
@@ -81,49 +81,49 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
 /**
  * intel_drrs_enable:
  * @device: fd of the device
- * @pipe: Display pipe
+ * @crtc_index: CRTC index
  *
- * Enable DRRS on given pipe
+ * Enable DRRS on given CRTC index.
  *
  * Returns:
  * none
  */
-void intel_drrs_enable(int device, enum pipe pipe)
+void intel_drrs_enable(int device, int crtc_index)
 {
-	drrs_set(device, pipe, 1);
+	drrs_set(device, crtc_index, 1);
 }
 
 /**
  * intel_drrs_disable:
  * @device: fd of the device
- * @pipe: Display pipe
+ * @crtc_index: CRTC index
  *
- * Disable DRRS on given pipe
+ * Disable DRRS on given CRTC index.
  *
  * Returns:
  * none
  */
-void intel_drrs_disable(int device, enum pipe pipe)
+void intel_drrs_disable(int device, int crtc_index)
 {
-	drrs_set(device, pipe, 0);
+	drrs_set(device, crtc_index, 0);
 }
 
 /**
  * intel_is_drrs_inactive:
  * @device: fd of the device
- * @pipe: Display pipe
+ * @crtc_index: CRTC index
  *
- * Check if drrs is inactive on given pipe
+ * Check if drrs is inactive on given CRTC index.
  *
  * Returns:
  * true if inactive and false otherwise
  */
-bool intel_is_drrs_inactive(int device, enum pipe pipe)
+bool intel_is_drrs_inactive(int device, int crtc_index)
 {
 	char buf[256];
 	int dir;
 
-	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
+	dir = igt_debugfs_crtc_dir(device, crtc_index, O_DIRECTORY);
 	igt_require_fd(dir);
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
diff --git a/lib/i915/intel_drrs.h b/lib/i915/intel_drrs.h
index d4d27a5f9991..1a612d16f6b6 100644
--- a/lib/i915/intel_drrs.h
+++ b/lib/i915/intel_drrs.h
@@ -8,10 +8,10 @@
 
 #include "igt.h"
 
-bool intel_is_drrs_supported(int device, enum pipe pipe);
+bool intel_is_drrs_supported(int device, int crtc_index);
 bool intel_output_has_drrs(int device, igt_output_t *output);
-void intel_drrs_enable(int device, enum pipe pipe);
-void intel_drrs_disable(int device, enum pipe pipe);
-bool intel_is_drrs_inactive(int device, enum pipe pipe);
+void intel_drrs_enable(int device, int crtc_index);
+void intel_drrs_disable(int device, int crtc_index);
+bool intel_is_drrs_inactive(int device, int crtc_index);
 
 #endif
-- 
2.47.3

