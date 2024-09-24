Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E63CF9C73
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6D10E70E;
	Tue, 24 Sep 2024 14:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9Z0e3mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE26910E70E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727188562; x=1758724562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Me7PwMyXDSEb8Felh8fb2sIbHAIE+5bv5pAlQuR+LY=;
 b=e9Z0e3mkpe0ZV3RpR8Uoa7EtuXBYo8FrJ1USD9vdjJYBJSbkguV2+Mwl
 gZh0voe5WYLoVRVZ8rYBibs4VoGzZMjo/vn838tJ4cBi1re2yGlAFHnLg
 vftCHqE4k3OtKIjDGXv7ZtvQLcZRGgvskmx28SCx6OXVYAAOk1I6oGZZC
 XzkHYlOKnq38AK4NDxnh8C36F2TaCwl0/gt7RMcc4LaP1fd2d3U8ujFt+
 onrb+MKrob6qjoJiu3ptHiEDia4EyxV15hT8tl73DZGeS7wXkarOdn/3a
 NGrZHdkyzpF5Xgu/zrlZqAA4+1DqJq6J1GveXzIWEEoJz+N/Lusahn5bE A==;
X-CSE-ConnectionGUID: nyjhEM53Q1C4xeireIATjQ==
X-CSE-MsgGUID: Amc6d0LyTRaHnc+BEIyM2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26137198"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26137198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:02 -0700
X-CSE-ConnectionGUID: cuEPoc/kS86BIvNltMuMdw==
X-CSE-MsgGUID: 4PIeyOmUQ02LyddU2MrWxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="102258316"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:36:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 3/5] lib/dsc: Reset DSC bpc to default on exit
Date: Tue, 24 Sep 2024 19:56:36 +0530
Message-ID: <20240924142638.238291-4-bhanuprakash.modem@intel.com>
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

Add support to force the DSC bpc to default on exit.

V2: - Minor cleanups

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_dsc.c                | 16 ++++++++++++++++
 lib/igt_dsc.h                |  1 +
 tests/intel/kms_dsc_helper.c | 11 ++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 229cd3298..409807b92 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -141,6 +141,22 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
 }
 
+/**
+ * igt_get_dsc_bpc_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the DSC BPC debugfs for the given connector, else returns -1.
+ */
+int igt_get_dsc_bpc_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_dsc_bpc", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
+
 /**
  * igt_get_dsc_debugfs_fd:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 7ab0917ec..1f3ea6920 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -18,6 +18,7 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_dsc_bpc_debugfs_fd(int drmfd, char *connector_name);
 bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
 						enum dsc_output_format output_format);
 int igt_force_dsc_output_format(int drmfd, char *connector_name,
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 0de09b8e9..52e0469c7 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -8,6 +8,7 @@
 static bool force_dsc_en_orig;
 static bool force_dsc_fractional_bpp_en_orig;
 static int force_dsc_restore_fd = -1;
+static int force_dsc_bpc_restore_fd = -1;
 static int force_dsc_fractional_bpp_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
@@ -36,6 +37,9 @@ void save_force_dsc_en(int drmfd, igt_output_t *output)
 	force_dsc_restore_fd =
 		igt_get_dsc_debugfs_fd(drmfd, output->name);
 	igt_assert_lte(0, force_dsc_restore_fd);
+	force_dsc_bpc_restore_fd =
+		igt_get_dsc_bpc_debugfs_fd(drmfd, output->name);
+	igt_assert_lte(0, force_dsc_bpc_restore_fd);
 }
 
 void restore_force_dsc_en(void)
@@ -45,9 +49,14 @@ void restore_force_dsc_en(void)
 
 	igt_debug("Restoring DSC enable\n");
 	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
-
 	close(force_dsc_restore_fd);
+
+	igt_debug("Restoring DSC BPC enable\n");
+	igt_assert(write(force_dsc_bpc_restore_fd, "0", 1) == 1);
+	close(force_dsc_bpc_restore_fd);
+
 	force_dsc_restore_fd = -1;
+	force_dsc_bpc_restore_fd = -1;
 }
 
 void kms_dsc_exit_handler(int sig)
-- 
2.43.0

