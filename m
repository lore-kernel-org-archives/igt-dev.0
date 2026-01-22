Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2A0D62613
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 11:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445310E97E;
	Thu, 22 Jan 2026 11:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej13Y2jU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C78210E97E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079931; x=1800615931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iq/+n9qKEh3/tfSgO8X4FJXXN6huySMN8JxcRyXa7Bs=;
 b=ej13Y2jU888YrSpRmC4Fn2KHV0vUTi3QiXd466b5PI8Owp4IHZxmDb8E
 8kR1QVGbxu5TxyHt9jbfdH5erMwhRawDxwbtGo6fVdeAd+pGVs2a0kWSB
 uYHHwU0o1gGcj58OpqYl54GSFJV7+6HSGDLiLEEg6zJiBMr7aVlEpkhiK
 tmzJkGJhEEYRjE+LSirTTmugKU6JhHo0Cwr/GpFMABlEyQ8eMr7sE+u7h
 GZFxo3ghlYrO4S8K91rJpOX0DkEezyO0i8Ce9MNZ5TOgC3L7gVyWtElp0
 sSvpe5R4Ts3S8BcOTMolmrCkFseFAoowjDnHwH86V3lfJETZrt2byNway A==;
X-CSE-ConnectionGUID: kLCEm+1STBKvfgwVCwiqoQ==
X-CSE-MsgGUID: p94o6ng2TWCspZTuj2AEPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87896092"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87896092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:31 -0800
X-CSE-ConnectionGUID: t+KsToixRZaBgBUvp0l9yw==
X-CSE-MsgGUID: Z9YrEeRVRqywMuouANGClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237375560"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:29 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 louis.chauvet@bootlin.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 5/5] lib/igt_kms: Add function to get valid pipe for
 specific output
Date: Thu, 22 Jan 2026 16:34:00 +0530
Message-ID: <20260122110400.330188-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122110400.330188-1-mohammed.bilal@intel.com>
References: <20260122110400.330188-1-mohammed.bilal@intel.com>
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
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af0faf0d4..3b14ab372 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8236,3 +8236,25 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if (igt_output_is_connected(output) &&
+		     (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+			return pipe;
+	}
+
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 861a39c80..8e1cc3f73 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1319,5 +1319,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.48.1

