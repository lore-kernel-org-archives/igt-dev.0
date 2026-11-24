Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22EB606A32A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 04:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8NAFBjE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5310E4D5;
	Tue, 24 Nov 2026 04:51:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375E810E4D5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795495633; x=1827031633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJ4pfmMmTMv45SX0gLjyTbDSDzAGc/2+hUF3YypIEQE=;
 b=T8NAFBjEjzw2m6buYDlysYqXQsMfJi+dEed2GjD5PnhKlI4sdGIpWFWL
 ZYy1gqDNqdRpogDYF7CNXMgWT3Am48IrRR4ecFqoW1g5riRrn9llSinlq
 6plFPurtGxIw3ZSsdUs4QbhDn4AzZ4PD5XpVaFAXlTWl5fLf5FVkxyhDn
 jpo+FxVB3GQrON0gz+4l1TgBOxstkNdGBlA6YTpVe4BkmuZs3mzS7v4b3
 +79L6eekericv7o1eE5oJgaioHXSSg/mVo4ICpoYtOP60JnVu+hO0GxA3
 Wm3dCbvhNJ34HnL0jfws+iUOLsCBdrvnFqwuP3ngIjzfFqFfrj8+L/rbl Q==;
X-CSE-ConnectionGUID: Yvu3Ht7HQluNdCUIzF0lXg==
X-CSE-MsgGUID: gCzxaKO0TT2KxIpmwhgdMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193614"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4193614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:13 -0800
X-CSE-ConnectionGUID: P5pzWMDESqiGK69hJn3smQ==
X-CSE-MsgGUID: hicDiSsmR0uwBEIIfwnegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11444954"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:11 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_params: Fall back to intel_display module
 parameters
Date: Tue, 24 Nov 2026 10:15:56 +0530
Message-ID: <20261124044559.897167-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124044559.897167-1-jeevan.b@intel.com>
References: <20261124044559.897167-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With display split into a dedicated intel-display.ko, display module
parameters move from /sys/module/<driver>/parameters to
/sys/module/intel_display/parameters.

Add igt_display_params_open() to open the intel_display parameters
directory, and make igt_params_get()/igt_params_set() search the GPU
driver module first and then intel_display. Existing tests keep working
unchanged on kernels both with and without the dedicated display module.
igt_params_open() is unchanged.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_params.c | 83 +++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_params.h |  1 +
 2 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index 3dad317a5..01494d17e 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -28,6 +28,7 @@
 #include <stdio.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <unistd.h>
 
 #include <i915_drm.h>
 
@@ -123,7 +124,9 @@ static void igt_params_save(int dir, const char *name)
  * @device: fd of the device
  *
  * This opens the module parameters directory (under sysfs) corresponding
- * to the device for use with igt_sysfs_set() and igt_sysfs_get().
+ * to the device for use with igt_sysfs_set() and igt_sysfs_get(). Only the
+ * parameters of the GPU driver module are covered; for the dedicated
+ * intel_display module see igt_display_params_open().
  *
  * Returns:
  * The directory fd, or -1 on failure.
@@ -156,12 +159,77 @@ int igt_params_open(int device)
 	return params;
 }
 
+#define INTEL_DISPLAY_PARAMS_PATH "/sys/module/intel_display/parameters"
+
+/**
+ * igt_display_params_open:
+ *
+ * Opens the module parameters directory of the dedicated intel-display.ko
+ * module (/sys/module/intel_display/parameters, the kernel exposes the module
+ * name with an underscore). On kernels where display is still built into the
+ * GPU driver module this directory does not exist.
+ *
+ * Parameters changed at runtime through the driver's debugfs
+ * (<driver>_params) are per DRM device and are not affected by the split.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_display_params_open(void)
+{
+	return open(INTEL_DISPLAY_PARAMS_PATH, O_RDONLY);
+}
+
+/* Is @device driven by a driver whose display code can live in intel_display? */
+static bool device_uses_intel_display(int device)
+{
+	drm_version_t version;
+	char name[32] = "";
+
+	memset(&version, 0, sizeof(version));
+	version.name_len = sizeof(name) - 1;
+	version.name = name;
+	if (ioctl(device, DRM_IOCTL_VERSION, &version))
+		return false;
+
+	return !strcmp(name, "i915") || !strcmp(name, "xe");
+}
+
+/*
+ * Open the params directory that holds @parameter: the GPU driver module
+ * first, then, for i915 and xe devices only, the intel_display module. This
+ * keeps tests working on kernels with and without a dedicated display module
+ * without touching intel_display parameters on other vendors' devices.
+ */
+static int params_open_for(int device, const char *parameter)
+{
+	int dir;
+
+	dir = igt_params_open(device);
+	if (dir >= 0 && faccessat(dir, parameter, F_OK, 0) == 0)
+		return dir;
+	if (dir >= 0)
+		close(dir);
+
+	if (!device_uses_intel_display(device))
+		return -1;
+
+	dir = igt_display_params_open();
+	if (dir >= 0 && faccessat(dir, parameter, F_OK, 0) == 0)
+		return dir;
+	if (dir >= 0)
+		close(dir);
+
+	return -1;
+}
+
 /**
  * __igt_params_get:
  * @device: fd of the device
  * @parameter: the name of the parameter to get
  *
- * This reads the value of the modparam.
+ * This reads the value of the modparam. The GPU driver module is searched
+ * first and, for i915 and xe devices, the intel_display module second.
  *
  * Returns:
  * A nul-terminated string, must be freed by caller after use, or NULL
@@ -172,7 +240,7 @@ char *__igt_params_get(int device, const char *parameter)
 	char *str;
 	int dir;
 
-	dir = igt_params_open(device);
+	dir = params_open_for(device, parameter);
 	if (dir < 0)
 		return NULL;
 
@@ -189,7 +257,7 @@ static bool __igt_params_set(int device, const char *parameter,
 	int dir;
 	int ret;
 
-	dir = igt_params_open(device);
+	dir = params_open_for(device, parameter);
 	if (dir < 0)
 		return false;
 
@@ -208,6 +276,9 @@ static bool __igt_params_set(int device, const char *parameter,
  * @parameter: the name of the parameter to set
  * @fmt: printf-esque format string
  *
+ * The parameter is looked up in the GPU driver module first and, for i915
+ * and xe devices, in the intel_display module second.
+ *
  * Returns true on success
  */
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
@@ -230,7 +301,9 @@ bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
  *
  * Save original value to be restored by exit handler. Parameter is first
  * searched at debugfs/dri/N/<device>_params and if not found will look for
- * parameter at /sys/module/<device>/parameters.
+ * parameter at /sys/module/<device>/parameters. If the parameter is not found
+ * there either, the dedicated intel_display module is searched at
+ * /sys/module/intel_display/parameters.
  *
  * Giving -1 here for default device will search for matching device from
  * debugfs/dri/N where N go from 0 to 63. First device found from debugfs
diff --git a/lib/igt_params.h b/lib/igt_params.h
index 6494786f0..f2ec44d1f 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -27,6 +27,7 @@
 #include <stdbool.h>
 
 int igt_params_open(int device);
+int igt_display_params_open(void);
 
 char *__igt_params_get(int device, const char *parameter);
 
-- 
2.43.0

