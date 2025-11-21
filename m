Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26CECFC26E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D41210E243;
	Fri, 21 Nov 2025 12:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBGibx+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8572510E243
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727889; x=1795263889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R8mmDw7hPZnGKmuaNufmtZtrW74uOQvK7pxFEpCRqrc=;
 b=SBGibx+ATr/kCb6hF1ArN0tUJAvEbq9D4jyfqgrO0Oix4b37RUytAvxm
 APhuPaLp+a2jzSAjjDne8fVSfxwNiv8lgiRTJ1pb2MDw3ZmsIHCdLYl30
 yCT2ZxRBFbkDaypW3TyH23LaOT1LDtc/TflkbTacJ35/RWe1TpBGY7c3y
 QAwzLgL4fABfDw7+utq4IGfXkk0wR6g7z1gDW8SiaeOZGOos5EAoTZoAS
 K6+qjPxtb0ICFTxMPlaBxLoPLZ7oTW3Vqe+6+zdQLjzDIiQWLhJtCzRmy
 4dhdu5OzRe4ubEbS5/tT986pIdQ1Y240K6q2QXgYn+IK38PsAZVv7/bj/ A==;
X-CSE-ConnectionGUID: YITGZqFTRke2eU1csLOCAw==
X-CSE-MsgGUID: ni135BrTTFmu4C/qFDtugQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289595"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289595"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:49 -0800
X-CSE-ConnectionGUID: dFemGRUoQLa0+8dtjiz2jQ==
X-CSE-MsgGUID: Gw92HTSkQWi9pMQvwyHQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047360"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:48 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/6] lib/kms: Add helper to detect presence of scaler
 blocks
Date: Fri, 21 Nov 2025 18:01:33 +0530
Message-Id: <20251121123134.1099006-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

