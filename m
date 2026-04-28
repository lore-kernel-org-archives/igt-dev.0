Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEC5FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8446010E2C4;
	Tue, 28 Apr 2026 04:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXDhHTnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45CA10E0EB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351628; x=1808887628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a08CERZJD3xGQ2+dGpAJ42nvcQ14g/9P8BWxmuNOygk=;
 b=fXDhHTnXcBnjYvlr2MrfNxZqkuR2ZmVtR+YBA4zOuY/+YPMh2JMUSicE
 vbpvzgO/mI9GN9HZ4quKLvY1IAdDNi/viem+7EEFaJATCHGDNcsoVTPQq
 4xnmgyhbUu36XKHR+jHEfBlkGeMM4IHYmn5PlwsoUTQdE3k+Dhyv/7THe
 umk81jyzMbdFUTdTD8Px+nzgkwDJVwrgtPOD64PZOSU7+xpfeB/8N64z9
 koBUTiDdXVF71lL8F0SRQZKCXVohJLLLstyYkO6zv5SJXniVwOenW263W
 /fBXgu7Tjh0ynVVaPCwupLORrZP/UYeMA/wyH+mSAbmK3/A4sC2DMAoJl g==;
X-CSE-ConnectionGUID: abjZAdNUQJOklyaf0C9qaA==
X-CSE-MsgGUID: eBMyV6a4TBuDxSkIQ0POiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167795"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:08 -0700
X-CSE-ConnectionGUID: ZAPUvubFSL+CNsiDzXI34g==
X-CSE-MsgGUID: QadHRCjnR9Wjnu28fiMgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706579"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:07 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 05/25] lib/igt_kms: Add function to get valid pipe
 for specific output
Date: Tue, 28 Apr 2026 10:16:14 +0530
Message-ID: <20260428044644.257001-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Introduces a new function igt_get_pipe_for_output in igt_kms. The function
is designed to retrieve a valid pipe for a specific output in a display.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index aa086e96c..73d65f70a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8426,3 +8426,25 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
 	return 0;
 }
+
+/**
+ * igt_get_pipe_for_output:
+ * @display: display to fetch the pipes
+ * @output: output to use
+ *
+ * Get a valid pipe for a specific output. The return value is the pipe first valid pipe for a
+ * specific output.
+ */
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+        igt_crtc_t *crtc;
+
+        for_each_crtc(display, crtc) {
+                if (igt_output_is_connected(output) &&
+                     (output->config.valid_crtc_index_mask & (1 << crtc->crtc_index)))
+                        return crtc->pipe;
+        }
+
+        return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bc921f4ff..70b7d1a58 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1305,5 +1305,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.48.1

