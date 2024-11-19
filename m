Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D80AD4920E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B710E5AE;
	Tue, 19 Nov 2024 05:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS+IhDAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E710E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731993364; x=1763529364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVSG8fKiwTA2XiqS1QzbTHBBLZ6IC0KJsFes+HUhmBo=;
 b=ZS+IhDAZJ8JMkv2yiOcVAeXivubIcPKx0l/g4cmY0/lLpVnzsucpSPQz
 VB960nfvw/FNHie5yqL4u77SoGr9/JdbND2kRStLK66VW2gCqK8Q84G31
 n4B+QdKoR0aji+Cu0xosQzrKjymA9r9lvNrdFPVTaKL7XJF/3psdkD3hX
 4Q96XZtpcBAqZhw8MtG7ZXMCaGR+5ilFJnUB2ykuueVbfRVFhKLka8hst
 Bf9aY8J+JJNnPAFkAxF1rbPT4JZZa10UYegkWWDJC5kOVwBfrsylPpUbk
 RM75P9HYKoYHKsQQMsN+RYr7VReHLcVMaASI553Zqt9JZcI1WHkX48dJL g==;
X-CSE-ConnectionGUID: NwTd1hNNQt2YmP910d60LA==
X-CSE-MsgGUID: dg1q8ryFQ2S9ZGvXg8aMQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54473741"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54473741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:16:04 -0800
X-CSE-ConnectionGUID: WDB1dgUiTFaY8XZ8A5hB8g==
X-CSE-MsgGUID: UaNwFoI5TiuCEnW2ER7E0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89366711"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 21:16:01 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 2/2] lib/igt_kms: Add igt_is_joiner_mode
Date: Tue, 19 Nov 2024 10:41:42 +0530
Message-Id: <20241119051142.2272779-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051142.2272779-1-santhosh.reddy.guddati@intel.com>
References: <20241119051142.2272779-1-santhosh.reddy.guddati@intel.com>
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

Add function igt_is_joiner_mode` to verify if the display is in
big joiner or ultra joiner mode.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 29 +++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 76f32e1e0..de8dca163 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6441,6 +6441,35 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_is_joiner_mode
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Check if the display is in joiner mode.
+ *
+ * Returns: True if the display is in joiner mode, else False.
+ */
+bool igt_is_joiner_mode(igt_display_t *display, igt_output_t *output)
+{
+	bool is_joiner = false;
+	bool is_ultra_joiner = false;
+	int max_dotclock;
+	drmModeModeInfo mode;
+
+	max_dotclock = igt_get_max_dotclock(display->drm_fd);
+	is_joiner = bigjoiner_mode_found(display->drm_fd,
+					 output->config.connector,
+					 max_dotclock, &mode);
+	is_ultra_joiner = ultrajoiner_mode_found(display->drm_fd,
+						 output->config.connector,
+						 max_dotclock, &mode);
+
+	if (is_joiner || is_ultra_joiner)
+		return true;
+
+	return false;
+}
+
 /**
  * igt_has_force_joiner_debugfs
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 301f370df..c94dc0612 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1268,5 +1268,5 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
-
+bool igt_is_joiner_mode(igt_display_t *display, igt_output_t *output);
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

