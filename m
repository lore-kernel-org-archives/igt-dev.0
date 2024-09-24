Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD9BCF9C77
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC7910E8C9;
	Tue, 24 Sep 2024 14:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/g2Erc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4910E70E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188561; x=1758724561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRpotQug2Nr/23n+Qg8lX9zp4+0fWVv4UtqVW5fIfYI=;
 b=g/g2Erc8MEgdbwouSrbpuC59t+hR16SVu+6/fA6hD+71Mqh/KIhr1ITk
 Onp3RaxFZ1PDaspb/ZLSEidpDfYwlj7zBav/04UBKdWtNzfF18Usrh04B
 YAr+AOJJJTcrhpXT0to9tTK/AOE6OcoFWrJ65kzYKNvCvwCRb7DkMTmLr
 C8cmtePZR1Z12vJHWuKyIxOj4vJerikB8N5fXFK9BGcLLSe8nTLDVaevy
 SbwtJ4NuqP1G7obuNgFopWTW7IuMskzRhz7ij0zbTmwRZRVWIgD4WChfZ
 tngK+QoUI6SPc1HQ8H/aWxXM8hZm4zFBsm88mBwCGNREAIqYQCuMqLM0r w==;
X-CSE-ConnectionGUID: xXyx0BzJSfGuzx09hVPWbA==
X-CSE-MsgGUID: ugMjxXBUQ2i5CXAMGTuRwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26137197"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26137197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:01 -0700
X-CSE-ConnectionGUID: VYf0PSj9SdqRXt5YAEMayA==
X-CSE-MsgGUID: lUgasN4JTPOdmRchvqNuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102258312"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:00 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 2/5] lib/drrs: Add support to force drrs to default on exit
Date: Tue, 24 Sep 2024 19:56:35 +0530
Message-ID: <20240924142638.238291-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
References: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
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
index c22cdb602..d7f6e475e 100644
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
index 97efbefa5..67635d89a 100644
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
2.43.0

