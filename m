Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C529C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FB910E161;
	Mon, 24 Aug 2026 16:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp9f+1xM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E433F10E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589736; x=1819125736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hFR76nl5CCL7ZTlsovPZ52wrRvGRy0654+A1jLjeCfA=;
 b=Pp9f+1xMiXZ+VM8YBKDZ7fGcicDTJ4vhIptaGRDkHzRBeBBWJitlydnF
 F1AeuR3oqvhXG3jYXKFc7HZjm3ebKn+1h8yuYgBmGZh3turY2v/04/89R
 N6mVi7oN7QUDsh4qwHIjdx/Mc5b5cziy0Gd5hF3hZ6+K87wp88Vu47VjK
 DZRR5xr4blMlBCZUe3lgu48Yvrsci9mP8sTu6jgUR9QMpZ34s+SoFoLWS
 JPGTMAnbtyNuh/lLtjXcfUsdeiFVasph6tuPJKY2Gx+Or36EGRHLMQe02
 YqETaP4iphboipACPp8Ax7VB50lQ2oLB7fOLTMqhTgnLRkfElxwXPHVbt g==;
X-CSE-ConnectionGUID: U674SpCrRqy78+2NKjHGZw==
X-CSE-MsgGUID: 1ynUP/zOSOy4n7F/L1ZpeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105690"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105690"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:15 -0700
X-CSE-ConnectionGUID: aKd1SXbYRRCNVXfW/rNkFw==
X-CSE-MsgGUID: N0aXQqJ+Rv6cR/u/MCPCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993395"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:14 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 05/10] lib/igt_drm_netlink: add get_error_threshold command
 support
Date: Mon, 24 Aug 2026 22:11:28 +0530
Message-Id: <20260824164133.129138-6-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Added a check whether error_threshold updated by valid callback or not
---
---
 lib/igt_drm_netlink.c | 59 ++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_netlink.h |  2 ++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 76223f3de..f95ddac67 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -43,6 +43,21 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
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
@@ -162,6 +177,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
 		ret = nla_put_u32(msg,
@@ -215,6 +231,7 @@ static int init_app_context(struct app_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 
 	return 0;
@@ -234,6 +251,7 @@ static void cleanup_app_context(struct app_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -285,10 +303,8 @@ int igt_init_nl_socket(struct app_context *ctx)
 	return 0;
 }
 
-int igt_get_error_counter(struct app_context *ctx)
+static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0)
 		return -EINVAL;
 
@@ -301,6 +317,17 @@ int igt_get_error_counter(struct app_context *ctx)
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+int igt_get_error_counter(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
 	ctx->error_value = UINT32_MAX;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -318,3 +345,29 @@ int igt_get_error_counter(struct app_context *ctx)
 
 	return 0;
 }
+
+int igt_get_error_threshold(struct app_context *ctx)
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
index 92ac665e2..d315c4059 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -28,12 +28,14 @@ struct app_context {
 	bool reply_received;
 	bool ack_received;
 	bool response_required;
+	uint32_t error_threshold;
 	int family_id;
 };
 
 void igt_cleanup_nl_socket(struct app_context *ctx);
 int igt_init_nl_socket(struct app_context *ctx);
 int igt_get_error_counter(struct app_context *ctx);
+int igt_get_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

