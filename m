Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B42CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCA10E9D7;
	Tue, 29 Sep 2026 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWg2/Bu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3510EE40
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679382; x=1822215382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LpGZ5PBJ4XUYawAKie0rwOp7R6vmEMyNWmywoQOnBkA=;
 b=HWg2/Bu+T/Crihr+kVmUoiVXjxUJaYo8GU74fg8zbPKPGmMqQC+m81mo
 QZKdiXuBjvUXDnUYktGOD8oMkqienNym5JYGn3LvghwEhJQ3UhIgTjs7X
 lEX+TF4EfUInu3z0dsFVufMy603jjwWB7me1XZuZQuiSi0pW2qpOaX3hp
 88DRIm5Vxnv81sEHKd4xmTUztIA32TMVlCKrdq/rKnh5UwXHNGuoeqWJb
 NXFREMULs5IqSkwi6ku6W/FMwJlZ2awL97x1s8RQqu28aaivPECsm3977
 oYLBdKX/S2FSWBygU1c5aluk/MPPmrpRBamMXcaRTySlxWg/Qgbpo3vVs Q==;
X-CSE-ConnectionGUID: aO6iINbaS+WyuE774yMNCA==
X-CSE-MsgGUID: +unJfao3SnqgASh4zeSF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101561849"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101561849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:56:21 -0700
X-CSE-ConnectionGUID: uN2ucv7LSLqSDqeR+BpNiw==
X-CSE-MsgGUID: RX6n3INvToWnZUL+RUZPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274870362"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:56:19 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 1/3] From: Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com> DO NOT REVIEW. COMPILATION ONLY.
Date: Tue, 29 Sep 2026 16:25:44 +0530
Message-ID: <20260929105543.2400108-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929105543.2400108-5-soham.purkait@intel.com>
References: <20260929105543.2400108-5-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

This patch is from https://patchwork.freedesktop.org/series/171275
Added only for Compilation.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_netlink.c          | 557 ++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h          |  38 ++
 lib/meson.build                |   9 +
 tests/intel/xe_err_injection.c | 648 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  42 +++
 tests/meson.build              |   1 +
 7 files changed, 1362 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..6b504faeb
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	"drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
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
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTER,
+	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
+	DRM_RAS_CMD_ERROR_EVENT,
+	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#define DRM_RAS_MCGRP_ERROR_REPORT	"error-report"
+
+#endif /* _UAPI_LINUX_DRM_RAS_H */
diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
new file mode 100644
index 000000000..6a3e475e8
--- /dev/null
+++ b/lib/igt_drm_netlink.c
@@ -0,0 +1,557 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <poll.h>
+#include <stdint.h>
+#include <time.h>
+
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/genl.h>
+
+#include "igt_core.h"
+#include "igt_drm_netlink.h"
+
+#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
+
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
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
+	case DRM_RAS_CMD_ERROR_EVENT: {
+		struct nlattr *attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
+
+		ret = genlmsg_parse(nlh, 0, attrs,
+				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+
+		if (!attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
+		    !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
+		    !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
+			return NL_SKIP;
+
+		ctx->event_node_id = nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
+		ctx->event_error_id = nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
+		ctx->event_error_value =
+			nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
+		ctx->event_received = ctx->event_node_id == ctx->node_id &&
+				      ctx->event_error_id == ctx->error_id;
+		break;
+	}
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
+	default:
+		return NL_SKIP;
+	}
+
+	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
+		ctx->reply_received = true;
+		if (ctx->ack_received)
+			ctx->cmd_done = true;
+	}
+
+	return NL_OK;
+}
+
+static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
+{
+	return NL_OK;
+}
+
+static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct app_context *ctx = arg;
+
+	ctx->last_nl_error = err->error;
+	ctx->cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int ras_ack_cb(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = arg;
+
+	ctx->ack_received = true;
+	if (!ctx->response_required || ctx->reply_received)
+		ctx->cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int ras_finish_cb(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = arg;
+
+	ctx->cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
+{
+	int ret;
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int register_multicast_callbacks(struct nl_cb *cb,
+					struct app_context *ctx)
+{
+	int ret;
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
+			ras_multicast_seq_check_cb, ctx);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int send_and_recv_nl_msg(struct app_context *ctx,
+				struct nl_cb *cb,
+				struct nl_msg *msg)
+{
+	struct pollfd pfd = {
+		.fd = nl_socket_get_fd(ctx->sock),
+		.events = POLLIN,
+	};
+	int ret;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	nlmsg_free(msg);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		return ret;
+	}
+
+	/* NL Reply and ACK arrive as separate responses */
+	while (!ctx->cmd_done) {
+		do {
+			/* poll for incoming netlink messages with 10 seconds timeout */
+			ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
+		} while (ret < 0 && errno == EINTR);
+
+		if (ret == 0) {
+			ret = -ETIMEDOUT;
+			break;
+		}
+
+		if (ret < 0) {
+			ret = -errno;
+			break;
+		}
+
+		if (!(pfd.revents & POLLIN)) {
+			ret = -EIO;
+			break;
+		}
+
+		ret = nl_recvmsgs(ctx->sock, cb);
+		if (ret < 0)
+			break;
+	}
+	nl_cb_put(cb);
+
+	return ret < 0 ? ret : 0;
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
+	ctx->last_nl_error = 0;
+	ctx->cmd_done = false;
+	ctx->reply_received = false;
+	ctx->ack_received = false;
+	ctx->response_required = false;
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
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
+	case DRM_RAS_CMD_GET_ERROR_COUNTER:
+		ctx->response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
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
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx->error_threshold);
+			if (ret < 0) {
+				nlmsg_free(msg);
+				return ret;
+			}
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
+	ret = register_callbacks(cb, ctx);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		nlmsg_free(msg);
+		return ret;
+	}
+
+	return send_and_recv_nl_msg(ctx, cb, msg);
+}
+
+static void reset_drm_ras_netlink_context(struct app_context *ctx)
+{
+	ctx->sock = NULL;
+	ctx->node_id = UINT32_MAX;
+	ctx->error_id = UINT32_MAX;
+	ctx->error_value = 0;
+	ctx->last_nl_error = 0;
+	ctx->cmd_done = false;
+	ctx->reply_received = false;
+	ctx->ack_received = false;
+	ctx->response_required = false;
+	ctx->error_threshold = 0;
+	ctx->event_node_id = UINT32_MAX;
+	ctx->event_error_id = UINT32_MAX;
+	ctx->event_error_value = 0;
+	ctx->event_received = false;
+	ctx->family_id = -1;
+}
+
+void igt_drm_netlink_cleanup(struct app_context *ctx)
+{
+	if (!ctx || !ctx->sock)
+		return;
+
+	nl_close(ctx->sock);
+	nl_socket_free(ctx->sock);
+
+	reset_drm_ras_netlink_context(ctx);
+
+	igt_debug("Cleaned up netlink socket.\n");
+}
+
+int igt_drm_netlink_init(struct app_context *ctx)
+{
+	if (!ctx)
+		return -EINVAL;
+
+	reset_drm_ras_netlink_context(ctx);
+
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -1;
+
+	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
+	if (genl_connect(ctx->sock) < 0) {
+		igt_drm_netlink_cleanup(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
+	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
+	if (ctx->family_id < 0) {
+		fprintf(stderr,
+			"Failed to resolve Generic Netlink family '%s': %s. "
+			"This may mean the running kernel does not expose DRM RAS support.\n",
+			DRM_RAS_FAMILY_NAME,
+			nl_geterror(ctx->family_id));
+		igt_drm_netlink_cleanup(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
+
+static int validate_inputs(struct app_context *ctx, uint8_t cmd)
+{
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
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
+	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
+		igt_warn("Invalid error_threshold (%u) provided. "
+			 "error_threshold should be >= 1 and <= 16.\n",
+			 ctx->error_threshold);
+		return -EINVAL;
+	}
+
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
+	ctx->error_value = UINT32_MAX;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
+	if (ctx->error_value == UINT32_MAX) {
+		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
+			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
+		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
+	}
+
+	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_value);
+
+	return 0;
+}
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
+
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret < 0)
+		return ret;
+
+	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret < 0)
+		return ret;
+
+	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_threshold);
+
+	return 0;
+}
+
+int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, const char *notify_group_name)
+{
+	int grp_id;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
+	    !notify_group_name || notify_group_name[0] == '\0')
+		return -EINVAL;
+
+	grp_id = genl_ctrl_resolve_grp(ctx->sock,
+				       DRM_RAS_FAMILY_NAME,
+				       notify_group_name);
+	if (grp_id < 0)
+		return grp_id;
+
+	ret = nl_socket_add_membership(ctx->sock, grp_id);
+	if (ret < 0)
+		return ret;
+
+	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
+		  notify_group_name, grp_id);
+
+	return 0;
+}
+
+int igt_drm_netlink_wait_for_error_report_event(struct app_context *ctx, int timeout_ms)
+{
+	struct nl_cb *cb;
+	struct pollfd pfd;
+	struct timespec start, now;
+	int remaining_ms;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	if (timeout_ms < -1)
+		return -EINVAL;
+
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!cb)
+		return -ENOMEM;
+
+	ret = register_multicast_callbacks(cb, ctx);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		return ret;
+	}
+
+	ctx->event_received = false;
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	pfd.fd = nl_socket_get_fd(ctx->sock);
+	pfd.events = POLLIN;
+	pfd.revents = 0;
+
+	while (!ctx->event_received) {
+		if (timeout_ms == -1) {
+			remaining_ms = -1;
+		} else {
+			clock_gettime(CLOCK_MONOTONIC, &now);
+			remaining_ms = timeout_ms -
+				       (int)((now.tv_sec - start.tv_sec) * 1000 +
+				       (now.tv_nsec - start.tv_nsec) / 1000000);
+			if (remaining_ms <= 0) {
+				ret = -ETIMEDOUT;
+				break;
+			}
+		}
+
+		ret = poll(&pfd, 1, remaining_ms);
+		if (ret == 0) {
+			ret = -ETIMEDOUT;
+			break;
+		}
+
+		if (ret < 0) {
+			ret = -errno;
+			break;
+		}
+
+		ret = nl_recvmsgs(ctx->sock, cb);
+		if (ret < 0)
+			break;
+	}
+	nl_cb_put(cb);
+	if (ret < 0)
+		return ret;
+
+	if (!ctx->event_received)
+		return -ENOMSG;
+
+	igt_debug("Received error-notify event: node_id=%u error_id=%u value=%u\n",
+		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
new file mode 100644
index 000000000..ebc575da6
--- /dev/null
+++ b/lib/igt_drm_netlink.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_DRM_NETLINK_H
+#define IGT_DRM_NETLINK_H
+
+#include <drm-uapi/drm_ras.h>
+
+struct app_context {
+	struct nl_sock *sock;
+	uint32_t node_id;
+	uint32_t error_id;
+	uint32_t error_value;
+	int last_nl_error;
+	bool cmd_done;
+	bool reply_received;
+	bool ack_received;
+	bool response_required;
+	uint32_t error_threshold;
+	uint32_t event_node_id;
+	uint32_t event_error_id;
+	uint32_t event_error_value;
+	bool event_received;
+	int family_id;
+};
+
+void igt_drm_netlink_cleanup(struct app_context *ctx);
+int igt_drm_netlink_init(struct app_context *ctx);
+int igt_drm_netlink_get_error_counter(struct app_context *ctx);
+int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, const char *notify_group_name);
+int igt_drm_netlink_wait_for_error_report_event(struct app_context *ctx, int timeout_ms);
+
+#endif /* IGT_DRM_NETLINK_H */
+
diff --git a/lib/meson.build b/lib/meson.build
index a7cde027e..343a60e56 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -27,6 +27,7 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+	'igt_drm_netlink.c',
         'igt_fs.c',
 	'igt_aux.c',
 	'igt_dp.c',
@@ -145,6 +146,13 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : true),
+	dependency('libnl-genl-3.0', required : true),
+	dependency('libnl-cli-3.0', required : true),
+	dependency('libnl-utils', required : false),
+])
+
 lib_deps = [
 	cairo,
 	glib,
@@ -152,6 +160,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+        libnl,
 	libpci,
 	libudev,
 	math,
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..5492c0b9a
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: MMIO based Error Injection
+ * Category: RAS
+ * Mega feature: Telemetry
+ * Sub-category: Driver
+ * Test category: Error Injection
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "lib/igt_drm_netlink.h"
+#include "lib/intel_chipset.h"
+#include "lib/intel_reg.h"
+#include "lib/intel_compute.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+#include "xe_err_injection.h"
+
+enum {
+	RECOVERY_SUCCESS = 1,
+	RECOVERY_FAILED,
+	RECOVERY_TIMEOUT,
+};
+
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	igt_drm_netlink_cleanup(&ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
+static void run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	if (state == POST_ARMING_INJECTION_WL)
+		igt_info("Running compute-square on all engines post injection\n");
+	else if (state == POST_RECOVERY_WL)
+		igt_info("Running compute-square on all engines post recovery\n");
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
+								    EXECENV_PREF_SYSTEM),
+								    "GPU does not support "
+								    "compute on engine\n");
+	}
+}
+
+static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
+{
+	xe_mmio_write32(mmio, reg, value);
+}
+
+static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
+			   uint32_t bit_mask, bool set)
+{
+	uint32_t regval;
+
+	regval = xe_mmio_read32(mmio, reg_addr);
+	if (set)
+		regval |= bit_mask;
+	else
+		regval &= ~bit_mask;
+
+	xe_mmio_write32(mmio, reg_addr, regval);
+}
+
+static void acquire_steering_semaphore(struct xe_mmio *mmio)
+{
+	uint32_t regval;
+
+	while (true) {
+		regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
+		if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
+			xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
+			return;
+		}
+	}
+}
+
+static void release_steering_semaphore(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
+			STEER_SEMAPHORE_MGSR_3D_VALUE);
+}
+
+static int acquire_forcewake(int fd)
+{
+	int fw_handle;
+
+	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+	return fw_handle;
+}
+
+static void release_forcewake(int fw_handle)
+{
+	if (fw_handle >= 0)
+		close(fw_handle);
+}
+
+static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
+{
+	struct app_context ctx;
+	int ret;
+	uint32_t error_value = UINT32_MAX;
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+	} else {
+		error_value = ctx.error_value;
+		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_drm_netlink_cleanup(&ctx);
+
+	return error_value;
+}
+
+static int check_dmesg(const char *marker, int elapsed_secs)
+{
+	static const char * const recovery_messages[] = {
+		"AER: device recovery successful",
+		"AER: device recovery failed",
+	};
+	char *buff = NULL;
+	size_t buff_size = 0;
+	size_t i;
+	ssize_t line_len;
+	FILE *fp;
+	bool marker_seen = false;
+
+	fp = popen("dmesg", "r");
+	if (!fp) {
+		igt_warn("Unable to open dmesg to check recovery status\n");
+		return -1;
+	}
+
+	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
+		if (!marker_seen) {
+			if (strstr(buff, marker))
+				marker_seen = true;
+			continue;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
+			if (!strstr(buff, recovery_messages[i]))
+				continue;
+
+			igt_debug("Found \"%s\" in dmesg after %d secs\n",
+				  recovery_messages[i], elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_SUCCESS + i;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return RECOVERY_TIMEOUT;
+}
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 10 * 60; /* 10 secs */
+	int time_interval = 30;
+	time_t elapsed_time;
+	int status;
+	char marker[128];
+
+	snprintf(marker, sizeof(marker),
+		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
+		 getpid(), (long long)start_time);
+	igt_kmsg(KMSG_INFO "%s\n", marker);
+
+	while (1) {
+		elapsed_time = time(NULL) - start_time;
+		status = check_dmesg(marker, elapsed_time);
+		if (status < 0) {
+			igt_warn("Failed to query dmesg for recovery status\n");
+			return RECOVERY_FAILED;
+		}
+		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
+			return status;
+
+		if (elapsed_time >= timeout) {
+			igt_warn("Timed out while waiting for error recovery\n");
+			return RECOVERY_TIMEOUT;
+		}
+
+		sleep(time_interval);
+	}
+}
+
+static void print_aer_recovery_status(void)
+{
+	int recovery_ret;
+
+	recovery_ret = check_err_recovery();
+	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
+		     "AER error recovery timed out\n");
+	igt_assert_f(recovery_ret != RECOVERY_FAILED,
+		     "AER device recovery failed\n");
+	if (recovery_ret == RECOVERY_SUCCESS)
+		igt_info("AER device recovery successful\n");
+}
+
+static void log_status(bool val, const char *err_name)
+{
+	if (val)
+		igt_info("Injection: %s Success\n", err_name);
+	else
+		igt_info("Injection: %s Failed\n", err_name);
+}
+
+static bool gt_uc_wkr_parity_recovered;
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
+ * Description: GT Uncorrectable Unicast Walker Command parity error injection
+ * Functionality: error injection
+ */
+static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before_inj;
+	uint32_t error_counter_after_inj;
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=1 (uncorrectable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
+	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_counter_before_inj = get_counter(node_id, error_id);
+
+	acquire_steering_semaphore(mmio);
+	/* Arm the injection sequence. */
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
+
+	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+	error_counter_after_inj = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
+		     error_counter_after_inj != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     error_counter_before_inj, error_counter_after_inj);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 error_counter_before_inj, error_counter_after_inj);
+
+	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
+		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
+		     "failed: before injection=%u after injection=%u\n",
+		     error_counter_before_inj, error_counter_after_inj);
+	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
+	gt_uc_wkr_parity_recovered = true;
+}
+
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+	igt_info("Armed L2 Bank Correctable Error Injection\n");
+
+	/* Rollback to Multicast */
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-threshold-1
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t current_threshold = UINT32_MAX;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Subscribe to error-report event */
+	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
+	}
+
+	/* get current GT Correctable error threshold */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = igt_drm_netlink_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* wait for 10 secs */
+	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+		log_status(true, "L2 Bank Correctable Error with threshold 1");
+		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
+			 "value=%u match=%d\n",
+			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+			 ctx.event_error_value, ctx.event_received);
+	} else {
+		log_status(false, "L2 Bank Correctable Error with threshold 1");
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		igt_drm_netlink_set_error_threshold(&ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = igt_drm_netlink_set_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-corr-err-16-times
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t current_threshold = UINT32_MAX;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
+	int ret;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	ret = igt_drm_netlink_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = igt_drm_netlink_get_error_threshold(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
+
+	for (int i = 0; i < 16; i++) {
+		igt_info("****** Injection iteration: %d ***********\n", i + 1);
+		/* Inject a GT correctable error */
+		l2_bank_corr_err_injection(mmio, fd);
+
+		/* Query error counter after injection */
+		ret = igt_drm_netlink_get_error_counter(&ctx);
+		if (ret < 0) {
+			CLEANUP_ON_ERROR(ctx, fw_handle);
+			igt_assert_f(false,
+				     "Failed to query GT correctable error counter:iteration %d\n",
+				     i + 1);
+		}
+		gt_corr_counter_current = ctx.error_value;
+		igt_info("GT Correctable error counter incremented by : %u "
+			 "since before initial injection\n",
+			 gt_corr_counter_current - gt_corr_counter_before);
+	}
+
+	/* Confirm whether error counter incremented by 16 after 16 injections */
+	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
+		log_status(true, "L2 Bank Correctable Error Injection 16 times");
+	} else {
+		log_status(false, "L2 Bank Correctable Error Injection 16 times");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "GT Correctable error counter didn't increment "
+			     "by 16 after 16 injections\n");
+	}
+
+	ret = igt_drm_netlink_wait_for_error_report_event(&ctx, event_timeout);
+	if (ret == 0 && ctx.event_error_value == 1) {
+		log_status(true, "L2 Bank Correctable Error Injection 16 times");
+	} else {
+		log_status(false, "L2 Bank Correctable Error Injection 16 times");
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, "Did not receive expected error-report event or "
+			     "error_value after injection\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: test_l2-bank-single-corr-err
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_netlink_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/* Query error counter before injection */
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter before injection\n");
+	}
+	gt_corr_counter_before = ctx.error_value;
+	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* Query error counter after injection */
+	ret = igt_drm_netlink_get_error_counter(&ctx);
+	if (ret < 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query GT correctable error counter after injection\n");
+	}
+	gt_corr_counter_after = ctx.error_value;
+	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
+
+	if (gt_corr_counter_after > gt_corr_counter_before) {
+		igt_info("GT Correctable error counter incremented by %u after injection\n",
+			 gt_corr_counter_after - gt_corr_counter_before);
+		log_status(true, "L2 Bank Correctable Error");
+	} else {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+static void igt_require_cri(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
+static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
+{
+	igt_info("Starting Error Injection test: %s\n", injection);
+	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
+		wkr_cmd_parity_err_injection(mmio, fd);
+	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else if (strcmp(injection, "test_l2-bank-corr-err-threshold-1") == 0)
+		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
+	else if (strcmp(injection, "test_l2-bank-corr-err-16-times") == 0)
+		test_l2_bank_corr_err_injection_16_times(mmio, fd);
+	else if (strcmp(injection, "test_l2-bank-single-corr-err") == 0)
+		test_l2_bank_single_corr_err_injection(mmio, fd);
+	else
+		igt_info("Invalid Error Injection specified\n");
+}
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
+ * Description: Run a post-recovery Xe workload after parity error injection.
+ * Functionality: workload validation
+ */
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
+		igt_require_cri(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
+		xe_mmio_access_init(fd, &mmio);
+		igt_require(xe_mmio_is_initialized(&mmio));
+	}
+
+	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
+	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
+		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
+
+	igt_describe("Run post-recovery workload after GT parity error injection test.");
+	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
+		igt_require_f(gt_uc_wkr_parity_recovered,
+			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
+		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
+	}
+
+	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
+	igt_subtest("test_l2-bank-corr-err-threshold-1")
+		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
+
+	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
+	igt_subtest("test_l2-bank-corr-err-16-times")
+		inject_error("test_l2-bank-corr-err-16-times", &mmio, fd);
+
+	igt_describe("Inject a single GT correctable error and validate counter increment.");
+	igt_subtest("test_l2-bank-single-corr-err")
+		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
new file mode 100644
index 000000000..a4b99711e
--- /dev/null
+++ b/tests/intel/xe_err_injection.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_ERR_INJECTION_H
+#define XE_ERR_INJECTION_H
+
+/* Steering Control Register (MC_PKT_CTRL) */
+#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+
+/* GT Uncorrectable worker command parity error injection */
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+/* STEER_SEMAPHORE_MGSR_3D */
+#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
+#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
+
+/* Node types for error counters*/
+#define NODE_ID_CORRECTABLE_ERROR 0
+#define NODE_ID_UNCORRECTABLE_ERROR 1
+
+/* Error types for error counter */
+#define ERROR_ID_CORE_COMPUTE 1
+
+/* L2 Bank (LBCFLOCKMSGREG) error injection */
+#define L2_BANK_ERR_INJ 0xB1B4
+#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
+#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
+#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
+#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
+#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
+	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
+	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
+
+#endif /* XE_ERR_INJECTION_H */
+
diff --git a/tests/meson.build b/tests/meson.build
index c7c614e7c..1b511a525 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
+	'xe_err_injection',
 	'xe_eu_stall',
 	'xe_evict',
 	'xe_evict_ccs',
-- 
2.43.0

