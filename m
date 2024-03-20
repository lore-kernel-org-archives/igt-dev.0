Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4AC6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0FD10FDAF;
	Wed, 20 Mar 2024 15:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFNX/uDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6110FDAB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950232; x=1742486232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zXTUvdMiCSxVcO/FPsutVr3hNjrLL4OpvWhbnF6LFc=;
 b=PFNX/uDE+GI5KJeiYUdhgrSudjeXylXPocRA2et7c9vw+Eo+TKXtrWGp
 JkpXbeZyRVdp1+vGInhnr58+EovP5nssB+MxG4xBHTrvbjOnxEdA9ppAD
 iISbL4RRDEuLuZln7/X5mTLmrTv/O+6E5Y/BJ0DDcHO/tPWjlbQC9s9Lf
 TJRFkcsV68Qt8tufoZkUeyqQ5xVJ7Opb4QJKz+apkzx5Hy9maxh7RvHtF
 /WSZsI0L5YhYPXm4aAN+Lg2mK/d7vxxBN4mtNLjUhmEDKbVrF3P3uMmJ+
 Xm1KvrFL6u6DrNX36eMDAb7tD9IbcDpT1du9EBhVab5oLOIZtE/eb5kNw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6007873"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6007873"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18783002"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 2/5] lib/drmtest: Introduced drm_open_driver_another
Date: Wed, 20 Mar 2024 16:56:56 +0100
Message-ID: <20240320155659.33518-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

For user convenience, introduce drm_open_driver_another as
a wrapper for __drm_open_driver_another with skip on fail.
Also add counterpart to open: __drm_close_driver() with
no warning for non-opened fd.

v2: rebased (Kamil)
v6: reword description (Janusz)
v10: change assert into skip, add TODO note about atomic reset
  before tests starts for i915 and on exit path (Janusz)
  add __drm_close_driver() (Kamil)

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 109 ++++++++++++++++++++++++++++++++++----------------
 lib/drmtest.h |   2 +
 2 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..f8810da43 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -241,6 +241,35 @@ static void modulename_to_chipset(const char *name, unsigned int *chip)
 	}
 }
 
+static const char *chipset_to_str(int chipset)
+{
+	switch (chipset) {
+	case DRIVER_INTEL:
+		return "intel";
+	case DRIVER_V3D:
+		return "v3d";
+	case DRIVER_VC4:
+		return "vc4";
+	case DRIVER_VGEM:
+		return "vgem";
+	case DRIVER_AMDGPU:
+		return "amdgpu";
+	case DRIVER_PANFROST:
+		return "panfrost";
+	case DRIVER_MSM:
+		return "msm";
+	case DRIVER_XE:
+		return "xe";
+	case DRIVER_VMWGFX:
+		return "vmwgfx";
+	case DRIVER_ANY:
+		return "any";
+	default:
+		return "other";
+	}
+}
+
+
 /*
  * Logs path of opened device. Device path opened for the first time is logged at info level,
  * subsequent opens (if any) are logged at debug level.
@@ -563,6 +592,27 @@ int __drm_open_driver_another(int idx, int chipset)
 	return fd;
 }
 
+/**
+ * drm_open_driver_another:
+ * @idx: index of the device you are opening
+ * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
+ *
+ * A wrapper for __drm_open_driver with skip on fail.
+ *
+ * Returns:
+ * An open DRM fd or skips
+ */
+int drm_open_driver_another(int idx, int chipset)
+{
+	int fd = __drm_open_driver_another(idx, chipset);
+
+	igt_skip_on_f(fd < 0, "No known gpu found for chipset flags %d (%s)\n",
+		      chipset, chipset_to_str(chipset));
+
+	/* TODO: for i915 and idx > 0 add atomic reset before test */
+	return fd;
+}
+
 /**
  * __drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
@@ -643,34 +693,6 @@ static void cancel_work_at_exit_render(int sig)
 	at_exit_drm_render_fd = -1;
 }
 
-static const char *chipset_to_str(int chipset)
-{
-	switch (chipset) {
-	case DRIVER_INTEL:
-		return "intel";
-	case DRIVER_V3D:
-		return "v3d";
-	case DRIVER_VC4:
-		return "vc4";
-	case DRIVER_VGEM:
-		return "vgem";
-	case DRIVER_AMDGPU:
-		return "amdgpu";
-	case DRIVER_PANFROST:
-		return "panfrost";
-	case DRIVER_MSM:
-		return "msm";
-	case DRIVER_XE:
-		return "xe";
-	case DRIVER_VMWGFX:
-		return "vmwgfx";
-	case DRIVER_ANY:
-		return "any";
-	default:
-		return "other";
-	}
-}
-
 static const char *chipset_to_vendor_str(int chipset)
 {
 	return chipset == DRIVER_XE ? chipset_to_str(DRIVER_INTEL) : chipset_to_str(chipset);
@@ -733,12 +755,33 @@ static bool is_valid_fd(int fd)
 	return false;
 }
 
+/**
+ * __drm_close_driver:
+ * @fd: a drm file descriptor
+ *
+ * Check the given drm file descriptor @fd is valid and if not,
+ * return -1. For valid fd close it and make cleanups.
+ *
+ * Returns: 0 on success or -1 on error.
+ */
+int __drm_close_driver(int fd)
+{
+	if (!is_valid_fd(fd))
+		return -1;
+
+	/* Remove xe_device from cache. */
+	if (is_xe_device(fd))
+		xe_device_put(fd);
+
+	return close(fd);
+}
+
 /**
  * drm_close_driver:
  * @fd: a drm file descriptor
  *
- * Check the given drm file descriptor @fd is valid & Close if it is
- * an valid drm fd.
+ * Check the given drm file descriptor @fd is valid and if not issue warning.
+ * For valid fd close it and make cleanups.
  *
  * Returns: 0 on success or -1 on error.
  */
@@ -750,11 +793,7 @@ int drm_close_driver(int fd)
 		return -1;
 	}
 
-	/* Remove xe_device from cache. */
-	if (is_xe_device(fd))
-		xe_device_put(fd);
-
-	return close(fd);
+	return __drm_close_driver(fd);
 }
 
 /**
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 588d7da17..bbe5f252f 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -110,12 +110,14 @@ void __set_forced_driver(const char *name);
 
 int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
+int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
+int __drm_close_driver(int fd);
 int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
-- 
2.42.0

