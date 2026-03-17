Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E35FB5EAF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 04:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F32A10E343;
	Tue, 17 Mar 2026 04:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Letaahp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4210E343
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 04:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773723540; x=1805259540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxCnGL5x6rZ/a67DGhVhuOTn21C4X5Ul/y0zilKJyn8=;
 b=Letaahp8fyKhR9hd4SMI/N/EPVfNSxKRzfhacmWrNF8h5fntsRHU7N83
 8FXOXYNmXRAmx6hLQz7fwC7ajW1WJHCox5mD0KK38oV5tXje1zo5KCCcj
 Oc1TaVeqgr1Fh+coKUQMTWpMQi5NNauZED5SjddWflc/Y6JYWSS8Xu1vv
 dQ9OxaKuhY4V9+frcaiFKnZxXfJb5aHY2/uN43lqo5q95QO5LtImCxvcp
 2tWWS7v2VkDPrPZUVap+6J1oDbmshapkZcwZskjvxqvhPe8ZzeVRmKRxT
 cGWI37cdEuOfBIXyPfejqzMl/jZIw0NYgVC2X42Uh7MBCCzzNTOdTvvmu w==;
X-CSE-ConnectionGUID: 5Is87DOOQQ+ypIzv7abrVw==
X-CSE-MsgGUID: SPxhTOqSStWcPfP1LkWNHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78642299"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78642299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:59:00 -0700
X-CSE-ConnectionGUID: 0YTTPMrAQqakoLui2IJGOw==
X-CSE-MsgGUID: x7gjhdU5RriSlu2bAnO6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="216552268"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 21:58:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add lowclk and highclk modes
Date: Tue, 17 Mar 2026 10:26:54 +0530
Message-Id: <20260317045655.45527-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
References: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
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

Introduce functions to return low clock and high clock modes when
connector supports multiple modes.This sorts connector modes by display
clock rather than resolution.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8c42909fc..2ba34b034 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5198,6 +5198,42 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
 	return lowest_mode;
 }
 
+/**
+ * igt_output_get_lowclk_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the mode with the lowest
+ * pixel clock.
+ */
+drmModeModeInfo *igt_output_get_lowclk_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	igt_assert_f(connector->count_modes > 0, "No modes for %s\n", igt_output_name(output));
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
+
+	return &connector->modes[0];
+}
+
+/**
+ * igt_output_get_highclk_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the mode with the highest
+ * pixel clock.
+ */
+drmModeModeInfo *igt_output_get_highclk_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	igt_assert_f(connector->count_modes > 0, "No modes for %s\n", igt_output_name(output));
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	return &connector->modes[0];
+}
+
 /**
  * igt_output_override_mode:
  * @output: Output of which the mode will be overridden
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3def1e73..6c8e60f02 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -604,6 +604,8 @@ bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_lowclk_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_highclk_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
 void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc);
-- 
2.34.1

