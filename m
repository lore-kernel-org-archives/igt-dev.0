Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A67C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F8010E322;
	Tue, 13 Aug 2024 12:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lkg7l1Yn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDFE10E322
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551361; x=1755087361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXC0lgq2Q0MUEhlscFeWn26/65kvt7CG9er1s0uGC2Q=;
 b=Lkg7l1YnPqDv5mipPpIpW8P5PPfl21SbpEcOE+cFoKFAzXqepdsKQmvS
 Hg08SysnfCcc0TYL/r7/FjFbatq1SeMEqZ2ck3hfBsOCwegumD+n4/SFX
 xhjBUsqpel78monXl+K55pZOor4iu/3ZtHc2qfQrLbYIW3/0E4713GFGg
 b9+zl7GWJjBJgY5B1dQ/eJ+pLEv/UDqbmuVKK4DI/vFNC9cRnF1y/dbI0
 42MqwQEEBctnVrsp0j/lOfzQL2pDtZ2bDing248iAK8FiL2bV9zCgU3/W
 8DQ17Rn2NyJQh0pdTDBNMRvVAzpWCC5EvsMgvylorjN/Vdfjr0pzk/tpD w==;
X-CSE-ConnectionGUID: GZbpO1b5QHOxiXtGB8JArQ==
X-CSE-MsgGUID: ORcPEQX8SYWGLO/YULsNxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869626"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:01 -0700
X-CSE-ConnectionGUID: G91UJ2irRgmzOgdzY1Y8Vg==
X-CSE-MsgGUID: juAbmmkLT/Sp+ALv8hBY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181362"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:16:00 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 3/5] lib/dsc: Reset DSC bpc to default on exit
Date: Tue, 13 Aug 2024 17:36:16 +0530
Message-ID: <20240813120618.2697195-4-bhanuprakash.modem@intel.com>
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

Add support to force the DSC bpc to default on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_dsc.c                | 16 ++++++++++++++++
 lib/igt_dsc.h                |  1 +
 tests/intel/kms_dsc_helper.c |  9 ++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

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
index 0de09b8e9..53bc1cc33 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -6,6 +6,7 @@
 #include "kms_dsc_helper.h"
 
 static bool force_dsc_en_orig;
+static bool force_dsc_en_bpc_orig;
 static bool force_dsc_fractional_bpp_en_orig;
 static int force_dsc_restore_fd = -1;
 static int force_dsc_fractional_bpp_restore_fd = -1;
@@ -33,6 +34,8 @@ void save_force_dsc_en(int drmfd, igt_output_t *output)
 {
 	force_dsc_en_orig =
 		igt_is_force_dsc_enabled(drmfd, output->name);
+	force_dsc_en_bpc_orig =
+		igt_get_dsc_bpc_debugfs_fd(drmfd, output->name);
 	force_dsc_restore_fd =
 		igt_get_dsc_debugfs_fd(drmfd, output->name);
 	igt_assert_lte(0, force_dsc_restore_fd);
@@ -45,8 +48,12 @@ void restore_force_dsc_en(void)
 
 	igt_debug("Restoring DSC enable\n");
 	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
-
 	close(force_dsc_restore_fd);
+
+	igt_debug("Restoring DSC BPC enable\n");
+	igt_assert(write(force_dsc_en_bpc_orig, "0", 1) == 1);
+	close(force_dsc_en_bpc_orig);
+
 	force_dsc_restore_fd = -1;
 }
 
-- 
2.43.2

