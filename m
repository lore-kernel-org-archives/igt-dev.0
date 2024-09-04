Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05D6CD37B6
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE7610E689;
	Wed,  4 Sep 2024 07:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkrFU9rh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A362C10E691
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725434518; x=1756970518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gMyG0agosOp190WiyLormDWJTR7K9FJpdpEUggsxYZY=;
 b=RkrFU9rhLPeYUf86j1aq6HHQ1T67ZqrqK/nREEFbhj3MWl/GZnu5CUCw
 R9KZLOnxUIoZqywKIKIFbx3FDbcgdTihQI8NRhJ2M4mx/m52NtfFIAc1G
 nv/22auzjGBo2SMNiWLGsaiUcPh29YUuX6gkdSxBpjblnqhEy6oI9rEws
 fgKm7RNN5Xrjp94k1cWny7oN7XjUfd1CI5WcsbLcXa9bro9dwushT5J7S
 nwC9XDZqF/W4GbRT6VRd2vwpYiLPkejTm/ebcsGwzpjGEVp7OFyKcbNE9
 wpT54O/jtLXOcEFuX8vO+xAeUeisDYNEAnnwmC/Stvh5Hq1NDVf3WsE8h w==;
X-CSE-ConnectionGUID: UiHZ52NXRBG5M/voLUH1pQ==
X-CSE-MsgGUID: VmWZ2icBQ5i689YOgngDdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23951615"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23951615"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:21:58 -0700
X-CSE-ConnectionGUID: fPIUz/YWTMyIMABr48GOpA==
X-CSE-MsgGUID: UobeoKfjSoSsyoGUj3pDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65901811"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:21:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3,2/3] dsc: add dsc+big joiner helper func
Date: Wed,  4 Sep 2024 12:54:24 +0530
Message-Id: <20240904072425.1022100-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904072425.1022100-1-swati2.sharma@intel.com>
References: <20240904072425.1022100-1-swati2.sharma@intel.com>
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

Add dsc with big joiner helper functions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c                | 17 +++++++++++++++++
 lib/igt_dsc.h                |  1 +
 tests/intel/kms_dsc_helper.c | 33 +++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 +++
 4 files changed, 54 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 229cd3298..6674ba77e 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -308,3 +308,20 @@ int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+/**
+ * igt_get_bigjoiner_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the Big Joiner debugfs for the given connector,
+ * else returns -1.
+*/
+int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_bigjoiner_force_enable", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 7ab0917ec..52651ab95 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -27,5 +27,6 @@ int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
 bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name);
 
 #endif
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 0de09b8e9..22095b215 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -7,8 +7,10 @@
 
 static bool force_dsc_en_orig;
 static bool force_dsc_fractional_bpp_en_orig;
+static bool force_dsc_bigjoiner_en_orig;
 static int force_dsc_restore_fd = -1;
 static int force_dsc_fractional_bpp_restore_fd = -1;
+static int force_dsc_bigjoiner_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
 {
@@ -54,6 +56,7 @@ void kms_dsc_exit_handler(int sig)
 {
 	restore_force_dsc_en();
 	restore_force_dsc_fractional_bpp_en();
+	restore_force_dsc_bigjoiner_en();
 }
 
 bool is_dsc_supported_by_source(int drmfd)
@@ -201,3 +204,33 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output)
+{
+	bool status;
+
+	igt_debug("Forcing DSC Big Joiner on %s\n", output->name);
+	status = kmstest_force_connector_bigjoiner(drmfd, output->config.connector);
+	igt_assert_f(status, "forcing dsc big joiner debugfs_write failed\n");
+}
+
+void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output)
+{
+	force_dsc_bigjoiner_en_orig =
+		igt_check_force_joiner_status(drmfd, output->name);
+	force_dsc_bigjoiner_restore_fd =
+		igt_get_bigjoiner_debugfs_fd(drmfd, output->name);
+	igt_assert(force_dsc_bigjoiner_restore_fd >= 0);
+}
+
+void restore_force_dsc_bigjoiner_en(void)
+{
+	if (force_dsc_bigjoiner_restore_fd < 0)
+		return;
+
+	igt_debug("Restoring DSC Big Joiner enable\n");
+	igt_assert(write(force_dsc_bigjoiner_restore_fd, force_dsc_bigjoiner_en_orig ? "1" : "0", 1) == 1);
+
+	close(force_dsc_bigjoiner_restore_fd);
+	force_dsc_bigjoiner_restore_fd = -1;
+}
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 4dbd88fe7..b2f8ea1ca 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -38,5 +38,8 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
 void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_fractional_bpp_en(void);
 bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
+void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output);
+void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_bigjoiner_en(void);
 
 #endif
-- 
2.25.1

