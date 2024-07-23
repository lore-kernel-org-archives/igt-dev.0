Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8843DC3DA63
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 04:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BADA10E2EA;
	Tue, 23 Jul 2024 04:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3b20Wu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1410E14E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 04:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721708313; x=1753244313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QV8REiKd257sIP9OMC/hR4/dvkYLudBIz5cmj1WQCWs=;
 b=V3b20Wu3BTAk9bn5woweGHOX9Aep4vfZc3n7w6/FHp41W9SqQrFj2Wbh
 QDDCC2DQusJQAv6vCv6YHPFSPwX6Hn1Sx9K4EYQIc+lOzVTcHSNi1v7XJ
 1ROUryoF1vjk/pFmBlaWqpKGthQbFKAzODlzpmncb3dFzjtEf6jm3/WBl
 HDvmaeThQK9FVGniMOJTJLPnUbnC4+gmTjCScyCHKsiCZLnwoFtgwL0vM
 gSyasQpUBjMe7gQVGcjeBZcPMSM51warnDE4kGlhNLQEhcS21cb1T4iY7
 1Ra0T/g8bfIdw2Ca4lrbGG2UId7QdjJg3mpww2gYd68V/eqw7rzGxcZ4U g==;
X-CSE-ConnectionGUID: J2FwpdDqRHeSMW9dGfmaMA==
X-CSE-MsgGUID: 3zdVP+7EQBSmSY0HUUG4Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30696914"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30696914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:18:33 -0700
X-CSE-ConnectionGUID: DO37Z7JKSams/CEugKh1Yw==
X-CSE-MsgGUID: ywh7+hj4T0OKWYW9H0OHBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="89559752"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:18:30 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for LOBF status
Date: Tue, 23 Jul 2024 09:58:49 +0530
Message-Id: <20240723042850.2651902-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723042850.2651902-1-jeevan.b@intel.com>
References: <20240723042850.2651902-1-jeevan.b@intel.com>
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

Added helper functions to check LOBF status to check weather
it is enabled or disabled.

v2: rename function name.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 64318ef7f..e030b35a6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
+/**
+ * igt_get_i915_edp_lobf_status
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Return: True if its enabled.
+ */
+bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
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
+	return strstr(buf, "LOBF status: enabled");
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 501d48763..e8582a45b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
-- 
2.25.1

