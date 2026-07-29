Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D6C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E9F10E046;
	Wed, 29 Jul 2026 12:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLQW9DGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94A10E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327662; x=1816863662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O3slTq3a9nx9s2oPbpbVw8ZlzNKxk9Ou1mIOGXnHhRA=;
 b=QLQW9DGihQcvjNQGYSPdJBXvxvKmF4Kg02JYfiJY/O+DdeDndr14ZBpr
 LB0Jq6xiFFJU/hbTsEPpNFEUQRxf5fNni864mHO67ZMEbyiP9skfEwL1u
 nCSSMiYXAJfsl7j/CRZAXZOBhLpultVt91k9C00Dtya8/4yn6KkxJ9EUG
 1oVeUTEdNKLT/zafqZ+PrDBeFZnPFb+apzenhhlIXSYSnber/tbAzf/oP
 n/vT3sJXF/3+2e/85oi1E685EO0+5qOAD9ds+4AVi/fo5a3TUMxEMDvl6
 RsCcOLs3XacXZf7sg9LVEMXgdQ5JKEkb0HyrI7QbiijugL7EP88hpOIDM Q==;
X-CSE-ConnectionGUID: wdjI4PPtQdWmPZrnwkggrA==
X-CSE-MsgGUID: Tw95tZzQS1Wl3XOusGrdyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725188"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:01 -0700
X-CSE-ConnectionGUID: kSgK/fnORceYI0l/WvN7cg==
X-CSE-MsgGUID: BZnjJBM9T3GSUS3YesXXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802265"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:20:59 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 3/8] lib/igt_drm_netlink: add get_error_threshold command
 support
Date: Wed, 29 Jul 2026 17:49:54 +0530
Message-Id: <20260729121959.603890-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
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
 include/drm-uapi/drm_ras.h | 18 +++++++++++++
 lib/igt_drm_netlink.c      | 53 +++++++++++++++++++++++++++++++++++---
 lib/igt_drm_netlink.h      |  2 ++
 3 files changed, 70 insertions(+), 3 deletions(-)

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
index 4d543275d..036660a6a 100644
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
@@ -94,6 +109,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
@@ -141,6 +157,7 @@ int init_app_context(struct app_context *ctx)
 	ctx->node_id = UINT32_MAX;
 	ctx->error_id = UINT32_MAX;
 	ctx->error_value = 0;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 
 	return 0;
@@ -155,6 +172,7 @@ void cleanup_app_context(struct app_context *ctx)
 	ctx->node_id = UINT32_MAX;
 	ctx->error_id = UINT32_MAX;
 	ctx->error_value = 0;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -206,10 +224,8 @@ int init_nl_socket(struct app_context *ctx)
 	return 0;
 }
 
-int get_error_counter(struct app_context *ctx)
+static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0)
 		return -EINVAL;
 
@@ -222,6 +238,17 @@ int get_error_counter(struct app_context *ctx)
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
 	ctx->error_value = 0;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -233,3 +260,23 @@ int get_error_counter(struct app_context *ctx)
 
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
+	ctx->error_threshold = 0;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
+	if (ret < 0)
+		return ret;
+
+	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index e539bc030..fae9b0e06 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -23,6 +23,7 @@ struct app_context {
 	uint32_t node_id;
 	uint32_t error_id;
 	uint32_t error_value;
+	uint32_t error_threshold;
 	int family_id;
 };
 
@@ -31,6 +32,7 @@ void cleanup_app_context(struct app_context *ctx);
 void cleanup_nl_socket(struct app_context *ctx);
 int init_nl_socket(struct app_context *ctx);
 int get_error_counter(struct app_context *ctx);
+int get_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

