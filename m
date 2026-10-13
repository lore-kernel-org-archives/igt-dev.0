Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624E4CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7710E5E5;
	Tue, 13 Oct 2026 19:11:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF1D10E950
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918465; x=1823454465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GR8ZNlXkrtXeH2MQbLmhDwiG5tubH+qvH+hYOSD9wOI=;
 b=j14aJR84Z1rYeGJjlhYenH8AkG6gZb9n4gd+6LYdRsntBeRLSQ7J8VMH
 zU4t24uTJY1HJEH9+wraby1keMsYPUeCW/kKCJyx7dbn427P9/TMCsH2M
 H9Ljs9mUi/n+V697G/HNMkIY2iElQK0TGhuZmSanhvMHtg5pnZPE2gVYi
 UHXe48ecVuIsLJHFDK1XxcZDRUY5FjKtj900uTItLTbSIYBoU5Udwt8WV
 TeN/SDVlxGD5VpiLAkpmRodroF+TQQGWzS+Aewya66CHn2ADHW1auNhQ9
 Or3pK1qcNwAhBOAE5EyGYTSulwXXuClKxwd8ACUvapJ2H8YJWJYHdhHsS w==;
X-CSE-ConnectionGUID: 7sRWSpnBRaCRfbJNPBbe6A==
X-CSE-MsgGUID: Y/FP3wHuQ3iTLJR+10RYWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687245"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687245"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:45 -0700
X-CSE-ConnectionGUID: ggv56DaIRReEsybsXM1LGw==
X-CSE-MsgGUID: 4spQyFrIQIiuHfApu0uLGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004467"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:41 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 05/10] lib/igt_drm_netlink: add get_error_threshold command
 support
Date: Wed, 14 Oct 2026 00:36:46 +0530
Message-Id: <20261013190651.897241-6-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Add support for GET_ERROR_THRESHOLD to fetch the current value of error
threshold

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
v2:Added a check whether error_threshold updated by valid callback or not
---
 lib/igt_drm_ras_nl.c | 51 +++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_ras_nl.h |  4 ++++
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index a465a53e7..f8f289329 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -75,6 +75,14 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
 		break;
 	}
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
+			return NL_SKIP;
+
+		ctx->error_threshold =
+			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
+		break;
+	}
 	default:
 		return NL_SKIP;
 	}
@@ -226,6 +234,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
 		ret = nla_put_u32(msg,
@@ -276,6 +285,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -322,10 +332,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 	return 0;
 }
 
-int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
+static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0) {
 		igt_warn("Invalid DRM RAS netlink context\n");
 		return -EINVAL;
@@ -339,6 +347,17 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
 	ctx->error_value = UINT32_MAX;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -356,3 +375,29 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
+	if (ret < 0)
+		return ret;
+
+	ctx->error_threshold = UINT32_MAX;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
+	if (ret < 0)
+		return ret;
+
+	if (ctx->error_threshold == UINT32_MAX) {
+		igt_warn("No valid error threshold reply: node_id=%u error_id=%u kernel_error=%d\n",
+			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
+		return ctx->last_nl_error ? normalize_nl_error(ctx->last_nl_error) : -ENODATA;
+	}
+
+	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index f51784524..86cfd79d0 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -44,11 +44,15 @@ struct igt_drm_ras_nl_context {
 
 	/** @family_id: Generic netlink family ID */
 	int family_id;
+
+	/** @error_threshold: Error threshold value to query/set */
+	uint32_t error_threshold;
 };
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
-- 
2.34.1

