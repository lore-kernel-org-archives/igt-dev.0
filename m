Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D8C5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 12:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8E210E5ED;
	Thu, 20 Aug 2026 12:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtUYl/HJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670D710E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787228196; x=1818764196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G+veVvRdF/V//Ozuts9uLXXcQvi9S90MHJI3eKxX7hY=;
 b=QtUYl/HJf9FctTKAFt3ex7pNPQd8PQe6FPMWFmGdrxNCyFlrzG9Nn5am
 6Je54BCWFi/nKW17Sw78oJ3J0ZIM+jQzAe+41w6tD/2hN1+gbDs/q7TfK
 RRNORA72I0wAUuzOo+H1JZ2eqho0YjD2VW+O7PstlAmKyB/erVVYupSTe
 tR96aFJMPDJ6M20dU2ONH1YIG+yC8DiVWivPJNwo/SS9qiioluWK4TukR
 0g2eF7g2mbzCHk8ATWm3k64wWd47Pm+cBr1ZzjUkPKnFIlVT6+Xztu9sY
 oKhNxUQzi7fyyNbkVfaRF5CuE5Ph+O+KrA61hrPVWtQjS07hqrpd0U73U g==;
X-CSE-ConnectionGUID: 2mtdrDv+Qeiab/rPIDmDxA==
X-CSE-MsgGUID: e5wm136LR+eI5NCUnA5chg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98917290"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98917290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:36 -0700
X-CSE-ConnectionGUID: 8b7bV7yKTieQfmHirOKsTQ==
X-CSE-MsgGUID: 0HIYOW5jT1e/9QyjhajQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264675936"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:34 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 3/8] lib/igt_drm_netlink: add get_error_threshold command
 support
Date: Thu, 20 Aug 2026 17:45:55 +0530
Message-Id: <20260820121600.75052-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
References: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
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
 include/drm-uapi/drm_ras.h | 18 ++++++++++++
 lib/igt_drm_netlink.c      | 59 ++++++++++++++++++++++++++++++++++++--
 lib/igt_drm_netlink.h      |  2 ++
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 218a3ee86..60611833b 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -33,18 +33,36 @@ enum {
 	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
 	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
 	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
 
 	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
 	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
 };
 
+enum {
+	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
+
+	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
+};
+
 enum {
 	DRM_RAS_CMD_LIST_NODES = 1,
 	DRM_RAS_CMD_GET_ERROR_COUNTER,
 	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
+	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_ERROR_EVENT,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
 };
 
+#define DRM_RAS_MCGRP_ERROR_NOTIFY	"error-notify"
+
 #endif /* _UAPI_LINUX_DRM_RAS_H */
diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index b72f2d5ca..c530076a6 100644
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
@@ -215,6 +231,7 @@ int init_app_context(struct app_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 
 	return 0;
@@ -234,6 +251,7 @@ void cleanup_app_context(struct app_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -285,10 +303,8 @@ int init_nl_socket(struct app_context *ctx)
 	return 0;
 }
 
-int get_error_counter(struct app_context *ctx)
+static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0)
 		return -EINVAL;
 
@@ -301,6 +317,17 @@ int get_error_counter(struct app_context *ctx)
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+int get_error_counter(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
 	ctx->error_value = UINT32_MAX;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -318,3 +345,29 @@ int get_error_counter(struct app_context *ctx)
 
 	return 0;
 }
+
+int get_error_threshold(struct app_context *ctx)
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
index f8b49aae8..08ef4eed0 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -28,6 +28,7 @@ struct app_context {
 	bool reply_received;
 	bool ack_received;
 	bool response_required;
+	uint32_t error_threshold;
 	int family_id;
 };
 
@@ -36,6 +37,7 @@ void cleanup_app_context(struct app_context *ctx);
 void cleanup_nl_socket(struct app_context *ctx);
 int init_nl_socket(struct app_context *ctx);
 int get_error_counter(struct app_context *ctx);
+int get_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

