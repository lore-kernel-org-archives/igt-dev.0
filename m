Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5C8CA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605CD10E49E;
	Mon, 18 Aug 2025 16:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miz8Mwse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9893110E49E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755533345; x=1787069345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHnL46PTXPjJeMSumhC+MB1WXJoEmW70ALLbx66fTa4=;
 b=miz8MwsePIE8W1LNvHiJFbF4f/mlLZ8+Hr2ZA4qqVhY7gS/g6w3D9h6u
 vRNYolnNNHp7fR/7c+hyHtklqfDFTVCG65sDgKDQL0tHbWc7QixvMM2gR
 WZPsNynRZReOTnQD0+4xx5JpnkeYLOt5JCmwwVZ4mHC15kB7xLKtT8wha
 eQ0q8kVGxGBmuXdr3bw9TGXavLxJ4ulSkc6M6oJqTnQ7d+7LT2hxJNhQA
 SGu8z39r/On93n8lcFq35Rs6JretIsV/SDilItuKkY2qXVInn4v4Xf6sv
 8V70+4lwCUvuM5iYV9iCr/Q2CWRZIILZefC6tQf5MOVbfe57hxD13qKnN g==;
X-CSE-ConnectionGUID: BsJ3+N1RS5m1czETuR4F0A==
X-CSE-MsgGUID: lv5FDuiAQ3Wuv3LKbcMERQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75329201"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75329201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:09:05 -0700
X-CSE-ConnectionGUID: j1ovAo9oSq+ZnOjzFvAzwQ==
X-CSE-MsgGUID: j8eQoPuzR8O1AfjpPyxDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168415994"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2025 09:09:04 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/2] lib/igt_kms: Add helper to get count of
 connected outputs
Date: Mon, 18 Aug 2025 21:46:49 +0530
Message-Id: <20250818161649.2157822-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818161649.2157822-1-pranay.samala@intel.com>
References: <20250818161649.2157822-1-pranay.samala@intel.com>
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

Introduce a new helper function to return the number of
actively connected outputs in a given igt_display_t instance.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7191bf92e..60e49037c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7519,3 +7519,22 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
 
 	return blob;
 }
+
+/**
+ * igt_get_connected_output_count:
+ * @display: pointer to igt_display_t
+ *
+ * Get the number of actively connected outputs.
+ *
+ * Returns: the count of connected outputs.
+ */
+int igt_get_connected_output_count(igt_display_t *display)
+{
+	int conn_outputs = 0;
+
+	for (int i = 0; i < display->n_outputs; i++) {
+		if (igt_output_is_connected(&display->outputs[i]))
+			conn_outputs++;
+	}
+	return conn_outputs;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f140ad91a..0dc0d622a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1285,6 +1285,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+int igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
-- 
2.34.1

