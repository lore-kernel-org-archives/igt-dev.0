Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D5C624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320A10F441;
	Thu,  3 Sep 2026 07:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGij/f18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193610F42A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420862; x=1819956862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WkbNVzbBGnuOGMv6v8qMLeFujEr/r6ugWxWr+3JYnUg=;
 b=DGij/f18sNkfzamnSK/Jz1XPvVgEsom+sn9wUAtNKPlAAaColG6FCBLr
 wl/XpBnL4ozox7CnwuvKiQhJHBChlAEGEVkUD85PSS7+BQt7G7+pJkYdF
 0yCNBkR59dVH1SiNg+zusZGfvdiIjeNE20WcKwdtyvwJZrFnk6DGRx9lM
 E32prxb25NmbgwGm7M9edG+BSSs4/NHtwiIFG7YFY0LG+mRZBLeDwjBci
 gM3Y4UmlSThfIL9CjyzUT0Uefcc26BFZk8vs85HwGRJORGnCX8MdcFGwi
 B0uePsIwVVUU/rtj7GhLge7Y+a2OQo91brJDMLUuxzkXVSxvSLpzeX5X3 w==;
X-CSE-ConnectionGUID: gHOTF4NZSkufd9yMI+YBpw==
X-CSE-MsgGUID: quTPrzTCT+yyEGdX/bGpSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655716"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:21 -0700
X-CSE-ConnectionGUID: PUFDUlJVRRCyFqO5Vo4ckA==
X-CSE-MsgGUID: WugJV9glSsypr1LvaIHTMg==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:19 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 05/10] lib/igt_drm_netlink: add get_error_threshold command
 support
Date: Thu,  3 Sep 2026 13:03:30 +0530
Message-Id: <20260903073335.339540-6-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Added a check whether error_threshold updated by valid callback or not
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
---
 lib/igt_drm_netlink.c | 58 ++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_netlink.h |  2 ++
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index b18e3eeb6..1be7d4361 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -40,6 +40,21 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
 		break;
 	}
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
+		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+
+		ret = genlmsg_parse(nlh, 0, attrs,
+				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+
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
@@ -183,6 +198,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
 		ret = nla_put_u32(msg,
@@ -233,6 +249,7 @@ static void reset_drm_ras_netlink_context(struct app_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -283,10 +300,8 @@ int igt_drm_netlink_init(struct app_context *ctx)
 	return 0;
 }
 
-int igt_drm_netlink_get_error_counter(struct app_context *ctx)
+static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0)
 		return -EINVAL;
 
@@ -299,6 +314,17 @@ int igt_drm_netlink_get_error_counter(struct app_context *ctx)
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+int igt_drm_netlink_get_error_counter(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
 	ctx->error_value = UINT32_MAX;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -316,3 +342,29 @@ int igt_drm_netlink_get_error_counter(struct app_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
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
+		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
+	}
+
+	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index 5db7f4ab5..89ef58243 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -18,12 +18,14 @@ struct app_context {
 	bool reply_received;
 	bool ack_received;
 	bool response_required;
+	uint32_t error_threshold;
 	int family_id;
 };
 
 void igt_drm_netlink_cleanup(struct app_context *ctx);
 int igt_drm_netlink_init(struct app_context *ctx);
 int igt_drm_netlink_get_error_counter(struct app_context *ctx);
+int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

