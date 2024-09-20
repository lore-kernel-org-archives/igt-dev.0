Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFCCF58FC
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 09:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA910E7E7;
	Fri, 20 Sep 2024 09:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWqzhrEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9210E7E7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 09:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726824805; x=1758360805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qrt38/EGI7cN4YSMfOP++JN2mAu3SkDFbks5x+s+WNM=;
 b=MWqzhrEdyrdTWP4ihVzFsb/xtOnJanBIFEP16O1GXmc5sSKqajQv+Ykk
 N+BpsLYFAiespC0hLjcvVeN2PYGU/90bztS+L0tCxgRjAVMWwRSj5WbJc
 f8KCLk12iv7U/KKxpdfCXJvmxUbpP9l7YHhCIgEpnwIuCFhNJFxEkcum+
 vkCUo90C6C/6nwzJjw4HFcgCHVi+5LxPH9HdsE0ROc+EP8BGp10oWqZaV
 QcFSbsWSRDw85yDaqEk7uJO9oBPS5SRn/56vBTDP0XG0shYGk/TXJ8MUx
 m+378LoQkK06WElAWp6BLygUqF907Se+5Wryc9uWEMttbNgAcYvkPA+n9 Q==;
X-CSE-ConnectionGUID: /emEGyTLRbyOdjfMzJkcVA==
X-CSE-MsgGUID: NJM+Ygs0QX6are5pGdLR1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28721545"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="28721545"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 02:33:25 -0700
X-CSE-ConnectionGUID: 5RK+cBC3SsGtXFsK1nLN0Q==
X-CSE-MsgGUID: gAaJThDEQCOq0BoTRri9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70276747"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 02:33:23 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, santhosh.reddy.guddati@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for aux-less
 ALPM status
Date: Fri, 20 Sep 2024 15:15:20 +0530
Message-Id: <20240920094521.1222304-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920094521.1222304-1-jeevan.b@intel.com>
References: <20240920094521.1222304-1-jeevan.b@intel.com>
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

Added helper functions to check aux-less alpm status to check
weather it is enabled or disabled.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b40470c02..be6d6536a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6094,6 +6094,29 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
 	return strstr(buf, "LOBF status: enabled");
 }
 
+/**
+ * igt_get_aux_less_alpm_status
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Return: True if its enabled.
+ */
+bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name)
+{
+	char buf[24];
+	int fd, res;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
+	igt_require(res > 0);
+
+	close(fd);
+
+	return strstr(buf, "Aux-less alpm status: enabled");
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..8bbb6225b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1196,6 +1196,7 @@ void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
+bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
-- 
2.25.1

