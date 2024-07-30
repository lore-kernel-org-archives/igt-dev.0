Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F7C3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 08:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA00C10E24D;
	Tue, 30 Jul 2024 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6xDezAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAFB10E24D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722327631; x=1753863631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QV8REiKd257sIP9OMC/hR4/dvkYLudBIz5cmj1WQCWs=;
 b=U6xDezAhAVxUL9AyRmvEUoRunu9KfXG9AOKVlKFDRUNiGiJazKIU+f/t
 regzQCzAgUe8Q4WbXKuMvKwoUfDB5gmWWX+7JN4/E+g2D99g9T0qEcEEN
 6QORjx3QVp9+dCeYjkMm533fthdog5X16G9M5H8Y2u2WWEDw0Ox922+LD
 ATb08eeBCIiwPcUKugPn4dzknGsAj43a2JwhxH5i5baI1bWAeQlloQUQK
 E3wOpfNuSjAAlRBXtPWFFz+uSFp9lRhJ9vWgbNW7e7HPpuDBRs+583TkT
 axcQOlTlwuCJski52CeWuJ32mSmkgR3SUMcP/XQiMEXRvG65TNMh77Na0 g==;
X-CSE-ConnectionGUID: 8hEmbw//RMm7iP4vJIumjA==
X-CSE-MsgGUID: gcmCehVZRtCOc7RMa8iPjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23915371"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23915371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:31 -0700
X-CSE-ConnectionGUID: sEF9ymI+Rcu7fV5zmpd88Q==
X-CSE-MsgGUID: oew/ChPzQlmmplUDuVg7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54316361"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:29 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for LOBF status
Date: Tue, 30 Jul 2024 14:01:10 +0530
Message-Id: <20240730083111.2897557-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730083111.2897557-1-jeevan.b@intel.com>
References: <20240730083111.2897557-1-jeevan.b@intel.com>
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

