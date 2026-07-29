Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A87C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D5210E03A;
	Wed, 29 Jul 2026 12:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD/SeKI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE46B10E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327654; x=1816863654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mj13ADlisHzs2uAiD6SUqvfOZRHHZQn7ZN5xqlXu1zA=;
 b=LD/SeKI7PEFjO83G7eudyWm2kE59bW3a33ChhVPW0TBNPiJLV+ps+FvC
 VwDCgw+rfJmz26O0bnyFXfWBJbgMlbgAFFLW+1TGhIHnqp1fKlBY6H+xM
 jX7r63dAw6GY/jS5LC3M8XSpcE3u2k1xaNUVBVdSYXFFTaHyt7jf8o5ge
 Ui//TWWqZW5e7RvTNGJE3d7rAIUnz6eoXlx5QECzeFQCT00WmwHKcyj0X
 plpdHKldsVt6TNe4fAlOJkg6+VZx0co+brHueP4yT6/PLbgAZ0X8kkYj4
 +eZtWYch9Rxyv/5YSLP/30ViG92j7f8wVOM9nnwR07JECl34mDMyvW6Ho A==;
X-CSE-ConnectionGUID: INMyVXv9QWyvTfCG+SH/xA==
X-CSE-MsgGUID: 9MCLu+DiSwq/lPlnFtc+wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725181"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:20:54 -0700
X-CSE-ConnectionGUID: +ui36hOvRC2HgBuTNoF5xw==
X-CSE-MsgGUID: X9pxGOb1QpqkRzt8nP6sGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802236"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:20:51 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 2/8] lib/igt_drm_netlink: add get_error_counter support
Date: Wed, 29 Jul 2026 17:49:53 +0530
Message-Id: <20260729121959.603890-3-ravi.kishore.koppuravuri@intel.com>
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

Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 lib/igt_drm_netlink.c | 179 +++++++++++++++++++++++++++++++++++++++++-
 lib/igt_drm_netlink.h |  11 +++
 2 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 1c07bb2db..4d543275d 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -5,6 +5,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -17,6 +18,146 @@
 #include "igt_core.h"
 #include "igt_drm_netlink.h"
 
+static int ras_command_cb(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = arg;
+	struct nlmsghdr *nlh;
+	struct genlmsghdr *gnlh;
+	int ret;
+
+	nlh = nlmsg_hdr(msg);
+	gnlh = nlmsg_data(nlh);
+
+	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
+		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+
+		ret = genlmsg_parse(nlh, 0, attrs,
+				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+			return NL_SKIP;
+
+		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+		break;
+	}
+	default:
+		return NL_SKIP;
+	}
+
+	return NL_OK;
+}
+
+static int send_and_recv_nl_msg(struct app_context *ctx,
+				struct nl_cb *cb,
+				struct nl_msg *msg)
+{
+	int ret;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	nlmsg_free(msg);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		return ret;
+	}
+
+	ret = nl_recvmsgs(ctx->sock, cb);
+	nl_cb_put(cb);
+
+	return ret;
+}
+
+static int send_command(struct app_context *ctx, uint8_t cmd)
+{
+	struct nl_cb *cb;
+	struct nl_msg *msg;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		return -ENOMEM;
+
+	msg_head = genlmsg_put(msg,
+			       NL_AUTO_PORT,
+			       NL_AUTO_SEQ,
+			       ctx->family_id,
+			       0,
+			       NLM_F_REQUEST | NLM_F_ACK,
+			       cmd,
+			       DRM_RAS_FAMILY_VERSION);
+	if (!msg_head) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_COUNTER:
+		ret = nla_put_u32(msg,
+				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
+				  ctx->node_id);
+		if (ret < 0) {
+			nlmsg_free(msg);
+			return ret;
+		}
+
+		ret = nla_put_u32(msg,
+				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+				  ctx->error_id);
+		if (ret < 0) {
+			nlmsg_free(msg);
+			return ret;
+		}
+		break;
+	default:
+		nlmsg_free(msg);
+		return -EOPNOTSUPP;
+	}
+
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!cb) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		nlmsg_free(msg);
+		return ret;
+	}
+
+	return send_and_recv_nl_msg(ctx, cb, msg);
+}
+
+int init_app_context(struct app_context *ctx)
+{
+	if (!ctx)
+		return -EINVAL;
+
+	ctx->sock = NULL;
+	ctx->node_id = UINT32_MAX;
+	ctx->error_id = UINT32_MAX;
+	ctx->error_value = 0;
+	ctx->family_id = -1;
+
+	return 0;
+}
+
+void cleanup_app_context(struct app_context *ctx)
+{
+	if (!ctx)
+		return;
+
+	ctx->sock = NULL;
+	ctx->node_id = UINT32_MAX;
+	ctx->error_id = UINT32_MAX;
+	ctx->error_value = 0;
+	ctx->family_id = -1;
+}
+
 void cleanup_nl_socket(struct app_context *ctx)
 {
 	if (!ctx || !ctx->sock)
@@ -24,14 +165,20 @@ void cleanup_nl_socket(struct app_context *ctx)
 
 	nl_close(ctx->sock);
 	nl_socket_free(ctx->sock);
-	ctx->sock = NULL;
-	ctx->family_id = -1;
+
+	cleanup_app_context(ctx);
 
 	igt_debug("Cleaned up netlink socket.\n");
 }
 
 int init_nl_socket(struct app_context *ctx)
 {
+	int ret;
+
+	ret = init_app_context(ctx);
+	if (ret < 0)
+		return ret;
+
 	ctx->sock = nl_socket_alloc();
 	if (!ctx->sock)
 		return -1;
@@ -58,3 +205,31 @@ int init_nl_socket(struct app_context *ctx)
 		  DRM_RAS_FAMILY_NAME, ctx->family_id);
 	return 0;
 }
+
+int get_error_counter(struct app_context *ctx)
+{
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	if (ctx->node_id == UINT32_MAX ||
+	    ctx->error_id == UINT32_MAX ||
+	    ctx->error_id == 0) {
+		igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
+			 "node_id should be >= 0 and error_id should be >= 1.\n",
+			 ctx->node_id, ctx->error_id);
+		return -EINVAL;
+	}
+
+	ctx->error_value = 0;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
+	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_value);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index c20d5452b..e539bc030 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -9,17 +9,28 @@
 #include <stdbool.h>
 #include <stdint.h>
 
+#include <linux/genetlink.h>
+
+#include <netlink/attr.h>
+#include <netlink/handlers.h>
+#include <netlink/msg.h>
 #include <netlink/netlink.h>
 
 #include <drm-uapi/drm_ras.h>
 
 struct app_context {
 	struct nl_sock *sock;
+	uint32_t node_id;
+	uint32_t error_id;
+	uint32_t error_value;
 	int family_id;
 };
 
+int init_app_context(struct app_context *ctx);
+void cleanup_app_context(struct app_context *ctx);
 void cleanup_nl_socket(struct app_context *ctx);
 int init_nl_socket(struct app_context *ctx);
+int get_error_counter(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

