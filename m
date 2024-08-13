Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C31DC52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9E010E324;
	Tue, 13 Aug 2024 12:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxZ2JC2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9A10E322
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551360; x=1755087360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y9dmJ++sCkAlKgO/GwRXsrsJzKUCP9gRJPqYui8R/hw=;
 b=gxZ2JC2I19WcFHL7vCKk76xv5GB6Eacs6Mxp9u5CCWe4nh117he/NMzf
 dt24JKVRJzZiiOwRBjLuTQfAB63M2gFTeqabg+6yoxxBc7Nsq+8lqgDFP
 OfrsflkrE/Eaq2rvdmba0QI9P9sjB5NOubS9rEr0hIDCH/WmyXJrQCnwq
 BnKSjv35z00O+1IXF3B00Li0/Fm6nesxJEPvx+cCx3rVqOStpea+LduTk
 ziYfBGEQ63Jev514CKwXPm9bz2ohKCsdreE8L4zlrLlzipVb4BrvCcWuH
 DGrxmSvMI811iK/KMhwJIKBE2yi4E8Q/n728IG4qKndySGVupSEUpXT6u Q==;
X-CSE-ConnectionGUID: b2sslN34SpSiEs4M5NvLgg==
X-CSE-MsgGUID: SaeTCYK1QOCdwCnR5XkR2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869621"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:00 -0700
X-CSE-ConnectionGUID: 94DEX5JtQXyWwe462kBYEw==
X-CSE-MsgGUID: KEMeGIl8RcysduDH4xoX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181350"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:15:58 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/5] lib/drrs: Add support to force drrs to default on exit
Date: Tue, 13 Aug 2024 17:36:15 +0530
Message-ID: <20240813120618.2697195-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
References: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
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

Use existing exit handler helpers to reset the drrs status
to default on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/i915/intel_drrs.c | 41 ++++++++++++++++++++++-------------------
 lib/igt_kms.c         | 20 ++++++++++++++++++++
 lib/igt_kms.h         |  3 +++
 3 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index ac8dd5e61..0d1f9cbad 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -56,26 +56,18 @@ bool intel_output_has_drrs(int device, igt_output_t *output)
 	return strstr(buf, "seamless");
 }
 
-static void drrs_set(int device, enum pipe pipe, unsigned int val)
+static void reset_crtc_drrs_at_exit(int sig)
 {
-	char buf[2];
-	int dir, ret;
-
-	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
-	snprintf(buf, sizeof(buf), "%d", val);
+	igt_reset_crtcs();
+}
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
-	igt_require_fd(dir);
-	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
-	close(dir);
+static bool drrs_set(int device, enum pipe pipe, const char *val)
+{
+	igt_debug("Manually %sabling DRRS.\n", !strcmp(val, "1") ? "en" : "dis");
 
-	/*
-	 * drrs_enable() is called on DRRS capable platform only,
-	 * whereas drrs_disable() is called on all platforms.
-	 * So handle the failure of debugfs_write only for drrs_enable().
-	 */
-	if (val)
-		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
+	return igt_set_crtc_attrs(device, pipe,
+				  "i915_drrs_ctl",
+				  val, "0");
 }
 
 /**
@@ -90,7 +82,17 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
  */
 void intel_drrs_enable(int device, enum pipe pipe)
 {
-	drrs_set(device, pipe, 1);
+	bool ret = drrs_set(device, pipe, "1");
+
+	/*
+	 * drrs_enable() is called on DRRS capable platform only,
+	 * whereas drrs_disable() is called on all platforms.
+	 * So handle the failure of debugfs_write only for drrs_enable().
+	 */
+	igt_assert_f(ret == 1, "debugfs_write failed");
+
+	dump_crtc_attrs();
+	igt_install_exit_handler(reset_crtc_drrs_at_exit);
 }
 
 /**
@@ -105,7 +107,8 @@ void intel_drrs_enable(int device, enum pipe pipe)
  */
 void intel_drrs_disable(int device, enum pipe pipe)
 {
-	drrs_set(device, pipe, 0);
+	drrs_set(device, pipe, "0");
+	dump_crtc_attrs();
 }
 
 /**
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a8e535a8b..b7c9d430d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1912,6 +1912,26 @@ static bool crtc_attr_set_debugfs(int drm_fd, enum pipe pipe,
 	return true;
 }
 
+/**
+ * igt_set_crtc_attrs:
+ * @drm_fd: drm file descriptor
+ * @pipe: pipe
+ * @attr: attribute to set
+ * @value: value to set
+ * @reset_value: value to reset to
+ *
+ * Set the attribute @attr to @value on the crtc-@pipe.
+ *
+ * @return: true on success
+ */
+bool igt_set_crtc_attrs(int drm_fd, enum pipe pipe,
+			const char *attr, const char *value,
+			const char *reset_value)
+{
+	return crtc_attr_set_debugfs(drm_fd, pipe, attr, value, reset_value);
+
+}
+
 /**
  * kmstest_set_connector_dpms:
  *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6cfa6230a..c649775e1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1085,6 +1085,9 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
 
+bool igt_set_crtc_attrs(int drm_fd, enum pipe pipe,
+			const char *attr, const char *value,
+			const char *reset_value);
 void igt_reset_crtcs(void);
 void dump_crtc_attrs(void);
 
-- 
2.43.2

