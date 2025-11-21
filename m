Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33293CFA747
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 08:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92E410E7F0;
	Fri, 21 Nov 2025 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VycYnKCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697D810E7EC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763713078; x=1795249078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R8mmDw7hPZnGKmuaNufmtZtrW74uOQvK7pxFEpCRqrc=;
 b=VycYnKCgGf74TdwZWO74suIoc0OBMZ11GbGxzNRq0mRfbGhyUtbqhduZ
 x/Dv72Y1E2uyVwvcHal9PzoPIjLWDjzwerx6iKJ72R7fJdqZLD5IUh35N
 at89TGcWypvWYKYpOWrlpDDRnXeWskDRXTGxMQaVUIUkaSKmVd8mq4Bq+
 Gkve9giVon2ZJAakS1KZDSIAgXYwcRO17kRmohowFNNFsLbHOFewfcVDN
 hlJk0x9jH0ZXFwvzie1ajfS6HDTD91NPXfz5g41D7N0QcGQ3IPKYnXCDR
 Fu1VOh9wcxC+G2NyOANtZuIu+PF7oze5lbdwdvSsWLMPyBm3c/YMJU7rX A==;
X-CSE-ConnectionGUID: hgdQuvtsQIuPFrT1+Yhn4Q==
X-CSE-MsgGUID: e6OeVu6pSimS+oatlZi5Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838368"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65838368"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:17:57 -0800
X-CSE-ConnectionGUID: /EPhngFQTV+kB3qT00zA/w==
X-CSE-MsgGUID: zctu5qUtRf6Lw9iayh3apQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196768022"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:17:55 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] lib/kms: Add helper to detect presence of scaler
 blocks
Date: Fri, 21 Nov 2025 13:54:53 +0530
Message-Id: <20251121082454.1085001-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121082454.1085001-1-swati2.sharma@intel.com>
References: <20251121082454.1085001-1-swati2.sharma@intel.com>
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

Add a new helper, has_scaler_block(), to query the presence of a specific
scaler block (scalers[idx]) in the per-pipe section of i915_display_info.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a75323645..ec636b8ca 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7094,6 +7094,29 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 	return num_scalers;
 }
 
+/**
+ * has_scaler_block:
+ * @display: the display
+ * @pipe: display pipe
+ * @idx: scaler index
+ *
+ * Returns: True if the scaler block "scalers[idx]:" is present in the
+ * 	    i915_display_info debugfs output for the given pipe.
+ */
+bool has_scaler_block(igt_display_t *display, enum pipe pipe, int idx)
+{
+	char buf[8120];
+	char *pipe_loc;
+	char scaler_tag[32];
+
+	sprintf(scaler_tag, "scalers[%d]:", idx);
+
+	pipe_loc = read_pipe_info(display->drm_fd, pipe, buf, sizeof(buf));
+	igt_assert(pipe_loc);
+
+	return strstr(pipe_loc, scaler_tag) ? 1 : 0;
+}
+
 /**
  * igt_parse_marked_value:
  * @buf: Buffer containing the content to parse
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f7ff0b17e..13b1765af 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1280,6 +1280,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
+bool has_scaler_block(igt_display_t *display, enum pipe pipe, int idx);
 int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
 int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
 int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
-- 
2.25.1

