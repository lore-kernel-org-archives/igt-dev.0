Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F026606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DR/Hxrih
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102C11206C;
	Thu, 12 Nov 2026 12:10:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD88112093
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 12:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794485327; x=1826021327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bUMYDvLXu65lisHWqRHOF4cSWGo17CuMS/lm17wniE=;
 b=DR/HxrihCFpQnHrzSVl/vgzc51BTd27b6IvWkwWJsMqVPVWMJU0A9CVD
 vdV3DuQtYf1n7cikdQCM+FgABVcUb2U2PqH7jPRKY8Mkdyk8fbuVQLffo
 guKIAPjIoFu+UGCEVbJRih50qigiGsOMP5D6XPLZLY44PGYlkvcdBgBYC
 +38vMTJgnrEho/OEf0agAysitHaU7os0eFWcMBlWYcMRd1PvE3eMu49E/
 GKOdwVpMh5VSojwG2yIym3NPU148TKHWU6Y7DZPRpAZxFK4Kh98viD8NQ
 lD++CJeYZ5jEUqUU1+zd3KX7NdlxEg8XvM8F/wDGEXISqaKX3xcTC5zli g==;
X-CSE-ConnectionGUID: zhah+k8SQZave9fwDDIwqg==
X-CSE-MsgGUID: 4CRwLgcARLycFGGnOF41tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3164020"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3164020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:46 -0800
X-CSE-ConnectionGUID: aRJEdawmR7OXbIGDic/XNw==
X-CSE-MsgGUID: lYQNxjytQRSMOTCAiU/i1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8829197"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:44 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v4 1/2] From: Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com> DONOT REVIEW. COMPILATION ONLY.
Date: Thu, 12 Nov 2026 17:38:20 +0530
Message-Id: <20261112120821.1456555-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112120821.1456555-1-ravi.kishore.koppuravuri@intel.com>
References: <20261112120821.1456555-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

This patch is from https://patchwork.freedesktop.org/series/171275
Added only for Compilation.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 include/drm-uapi/drm_ras.h     |  67 ++++
 lib/igt_drm_ras_nl.c           | 659 +++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h           |  77 ++++
 lib/meson.build                |   5 +
 meson.build                    |   4 +
 tests/intel/xe_err_injection.c | 601 ++++++++++++++++++++++++++++++
 tests/meson.build              |   4 +
 7 files changed, 1417 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h
 create mode 100644 tests/intel/xe_err_injection.c

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..54a4cf2e4
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _LINUX_DRM_RAS_H
+#define _LINUX_DRM_RAS_H
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
+#endif /* _LINUX_DRM_RAS_H */
diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
new file mode 100644
index 000000000..f7ee3e373
--- /dev/null
+++ b/lib/igt_drm_ras_nl.c
@@ -0,0 +1,659 @@
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
+#include <netlink/errno.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/genl.h>
+
+#include "igt_core.h"
+#include "igt_drm_ras_nl.h"
+
+#define DRM_RAS_NL_OVERALL_TIMEOUT_MS 60000
+#define DRM_RAS_NL_MSG_TIMEOUT_MS 10000
+
+/* Normalize netlink error codes to standard errnos */
+static int normalize_nl_error(int ret)
+{
+	if (ret >= 0)
+		return ret;
+
+	switch (-ret) {
+	case NLE_INVAL:
+		return -EINVAL;
+	case NLE_NOMEM:
+		return -ENOMEM;
+	case NLE_NOATTR:
+	case NLE_MISSING_ATTR:
+		return -ENODATA;
+	case NLE_OPNOTSUPP:
+		return -EOPNOTSUPP;
+	case NLE_EXIST:
+		return -EEXIST;
+	case NLE_NOADDR:
+		return -EADDRNOTAVAIL;
+	case NLE_PERM:
+		return -EPERM;
+	case NLE_NOACCESS:
+		return -EACCES;
+	case NLE_NODEV:
+		return -ENODEV;
+	case NLE_BUSY:
+		return -EBUSY;
+	case NLE_AGAIN:
+		return -EAGAIN;
+	default:
+		igt_debug("Unhandled netlink error code: %d\n", -ret);
+		return -EIO;
+	}
+}
+
+static int ras_command_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	struct igt_drm_ras_nl_context *ctx = arg;
+	struct genlmsghdr *gnlh;
+	struct nlmsghdr *nlh;
+	int ret;
+
+	nlh = nlmsg_hdr(msg);
+	gnlh = nlmsg_data(nlh);
+
+	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
+		ret = genlmsg_parse(nlh, 0, attrs,
+				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+	}
+
+	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
+	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+			return NL_SKIP;
+
+		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+		break;
+	}
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
+			return NL_SKIP;
+
+		ctx->error_threshold =
+			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
+		break;
+	}
+	case DRM_RAS_CMD_ERROR_EVENT: {
+		struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
+
+		ret = genlmsg_parse(nlh, 0, event_attrs,
+				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+
+		if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
+		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
+		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
+			return NL_SKIP;
+
+		ctx->event_node_id =
+			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
+		ctx->event_error_id =
+			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
+		ctx->event_error_value =
+			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
+		ctx->event_received = ctx->event_node_id == ctx->node_id &&
+				      ctx->event_error_id == ctx->error_id;
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
+	struct igt_drm_ras_nl_context *ctx = arg;
+
+	/* err->error is a raw kernel errno, not a libnl NLE_* code */
+	ctx->last_nl_error = err->error;
+	ctx->cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int ras_ack_cb(struct nl_msg *msg, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
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
+	struct igt_drm_ras_nl_context *ctx = arg;
+
+	ctx->cmd_done = true;
+
+	return NL_STOP;
+}
+
+static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_ACK callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_FINISH callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_ERR callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int register_multicast_callbacks(struct nl_cb *cb,
+					struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
+			ras_multicast_seq_check_cb, ctx);
+	if (ret < 0) {
+		igt_warn("Failed to set NL_CB_SEQ_CHECK callback (ret=%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
+				struct nl_cb *cb,
+				struct nl_msg *msg)
+{
+	struct pollfd pfd = {
+		.fd = nl_socket_get_fd(ctx->sock),
+		.events = POLLIN,
+	};
+	const uint64_t timeout_ns = (uint64_t)DRM_RAS_NL_OVERALL_TIMEOUT_MS * 1000000;
+	const uint64_t msg_timeout_ns =
+		(uint64_t)DRM_RAS_NL_MSG_TIMEOUT_MS * 1000000;
+	struct timespec start, message_start;
+	int ret, err_ret = 0;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	nlmsg_free(msg);
+	if (ret < 0) {
+		err_ret = normalize_nl_error(ret);
+		goto process_error;
+	}
+
+	ret = igt_gettime(&start);
+	if (ret < 0) {
+		err_ret = -errno;
+		goto process_error;
+	}
+
+	message_start = start;
+
+	/* NL Reply and ACK arrive as separate responses */
+	while (!ctx->cmd_done) {
+		uint64_t msg_elapsed_ns = igt_nsec_elapsed(&message_start);
+		uint64_t elapsed_ns = igt_nsec_elapsed(&start);
+		uint64_t remaining_ns;
+		int timeout_ms;
+
+		if (elapsed_ns >= timeout_ns || msg_elapsed_ns >= msg_timeout_ns) {
+			err_ret = -ETIMEDOUT;
+			goto process_error;
+		}
+
+		remaining_ns = timeout_ns - elapsed_ns;
+		if (msg_timeout_ns - msg_elapsed_ns < remaining_ns)
+			remaining_ns = msg_timeout_ns - msg_elapsed_ns;
+		timeout_ms = (remaining_ns + 999999) / 1000000;
+		ret = poll(&pfd, 1, timeout_ms);
+		if (ret < 0 && errno == EINTR)
+			continue;
+
+		/* poll()/errno results are already standard errnos, not libnl codes */
+		if (ret == 0) {
+			err_ret = -ETIMEDOUT;
+			goto process_error;
+		}
+
+		if (ret < 0) {
+			err_ret = -errno;
+			goto process_error;
+		}
+
+		if (!(pfd.revents & POLLIN)) {
+			igt_debug("Received unexpected poll revents: %d\n", pfd.revents);
+			err_ret = -EIO;
+			goto process_error;
+		}
+
+		ret = nl_recvmsgs(ctx->sock, cb);
+		if (ret < 0) {
+			err_ret = normalize_nl_error(ret);
+			goto process_error;
+		}
+
+		ret = igt_gettime(&message_start);
+		if (ret < 0) {
+			err_ret = -errno;
+			goto process_error;
+		}
+	}
+
+process_error:
+	nl_cb_put(cb);
+	return err_ret;
+}
+
+static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
+{
+	struct nl_msg *msg;
+	struct nl_cb *cb;
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
+			return normalize_nl_error(ret);
+		}
+
+		ret = nla_put_u32(msg,
+				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+				  ctx->error_id);
+		if (ret < 0) {
+			nlmsg_free(msg);
+			return normalize_nl_error(ret);
+		}
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx->error_threshold);
+			if (ret < 0) {
+				nlmsg_free(msg);
+				return normalize_nl_error(ret);
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
+		return normalize_nl_error(ret);
+	}
+
+	return send_and_recv_nl_msg(ctx, cb, msg);
+}
+
+static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
+{
+	ctx->sock = NULL;
+	ctx->node_id = UINT32_MAX;
+	ctx->error_id = DRM_XE_RAS_ERR_COMP_MAX;
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
+	ctx->subscribed_grp_id = -1;
+}
+
+void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
+{
+	if (!ctx || !ctx->sock)
+		return;
+
+	nl_close(ctx->sock);
+	nl_socket_free(ctx->sock);
+
+	reset_drm_ras_nl_context(ctx);
+
+	igt_debug("Cleaned up netlink socket.\n");
+}
+
+int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
+{
+	if (!ctx)
+		return -EINVAL;
+
+	reset_drm_ras_nl_context(ctx);
+
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -ENOMEM;
+
+	if (genl_connect(ctx->sock) < 0) {
+		igt_warn("Failed to connect to Generic Netlink\n");
+		igt_drm_ras_nl_cleanup(ctx);
+		return -EIO;
+	}
+
+	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
+	if (ctx->family_id < 0) {
+		igt_warn("Failed to resolve Netlink family '%s': %s\n",
+			 DRM_RAS_FAMILY_NAME, nl_geterror(ctx->family_id));
+		igt_drm_ras_nl_cleanup(ctx);
+		return -EIO;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
+
+static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
+{
+	if (!ctx || !ctx->sock || ctx->family_id < 0) {
+		igt_warn("Invalid DRM RAS netlink context\n");
+		return -EINVAL;
+	}
+
+	if (ctx->node_id == UINT32_MAX ||
+	    ctx->error_id == DRM_XE_RAS_ERR_COMP_MAX ||
+	    ctx->error_id == 0) {
+		igt_warn("Invalid node_id (%u) or error_id (%u) provided\n",
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
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
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
+
+		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
+	}
+
+	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_value);
+
+	return 0;
+}
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
+
+		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
+	}
+
+	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_threshold);
+
+	return 0;
+}
+
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
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
+int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
+					  const char *notify_group_name)
+{
+	int grp_id;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
+	    !notify_group_name || notify_group_name[0] == '\0') {
+		igt_warn("Invalid input: ctx or sock or family_id=%d, or notify_group_name=%s\n",
+			 ctx ? ctx->family_id : -1,
+			 notify_group_name ? notify_group_name : "(null)");
+		return -EINVAL;
+	}
+
+	grp_id = genl_ctrl_resolve_grp(ctx->sock,
+				       DRM_RAS_FAMILY_NAME,
+				       notify_group_name);
+	if (grp_id < 0)
+		return normalize_nl_error(grp_id);
+
+	/* Check if already subscribed to the requested multicast group */
+	if (ctx->subscribed_grp_id == grp_id) {
+		igt_debug("Already subscribed to DRM RAS multicast group '%s' (id=%d).\n",
+			  notify_group_name, grp_id);
+		return 0;
+	}
+
+	ret = nl_socket_add_membership(ctx->sock, grp_id);
+	if (ret < 0)
+		return normalize_nl_error(ret);
+
+	ctx->subscribed_grp_id = grp_id;
+
+	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
+		  notify_group_name, grp_id);
+
+	return 0;
+}
+
+int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx,
+					       int timeout_ms)
+{
+	struct timespec start, now;
+	struct pollfd pfd;
+	struct nl_cb *cb;
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
+		return normalize_nl_error(ret);
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
+				igt_warn("Timeout reached while waiting for error event.\n");
+				ret = -ETIMEDOUT;
+				break;
+			}
+		}
+
+		ret = poll(&pfd, 1, remaining_ms);
+		if (ret == 0) {
+			igt_warn("timed out while polling for error event.\n");
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
+		if (ret < 0) {
+			ret = normalize_nl_error(ret);
+			break;
+		}
+	}
+	nl_cb_put(cb);
+	if (ret < 0)
+		return ret;
+
+	if (!ctx->event_received)
+		return -ENOMSG;
+
+	igt_debug("Received error event: node_id=%u error_id=%u value=%u\n",
+		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
+
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
new file mode 100644
index 000000000..057c6026f
--- /dev/null
+++ b/lib/igt_drm_ras_nl.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_DRM_RAS_NL_H
+#define IGT_DRM_RAS_NL_H
+
+#include <drm-uapi/drm_ras.h>
+#include <drm-uapi/xe_drm.h>
+
+/**
+ * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
+ *
+ * Holds the state for a DRM RAS generic netlink request/response exchange.
+ */
+struct igt_drm_ras_nl_context {
+	/** @sock: Netlink socket used for the exchange */
+	struct nl_sock *sock;
+
+	/** @node_id: DRM RAS node ID to query the error counters */
+	uint32_t node_id;
+
+	/** @error_id: RAS error ID to query the error counter */
+	uint32_t error_id;
+
+	/** @error_value: Error counter value returned by the kernel */
+	uint32_t error_value;
+
+	/** @last_nl_error: Last netlink error reported by the kernel */
+	int last_nl_error;
+
+	/** @cmd_done: Set when the command exchange has completed */
+	bool cmd_done;
+
+	/** @reply_received: Set when the command reply has been received */
+	bool reply_received;
+
+	/** @ack_received: Set when the command ACK has been received */
+	bool ack_received;
+
+	/** @response_required: Set when a reply is expected before @cmd_done */
+	bool response_required;
+
+	/** @family_id: Generic netlink family ID */
+	int family_id;
+
+	/** @error_threshold: Error threshold value to query/set */
+	uint32_t error_threshold;
+
+	/** @event_node_id: RAS node ID reported by an error-report event */
+	uint32_t event_node_id;
+
+	/** @event_error_id: RAS error ID reported by an error-report event */
+	uint32_t event_error_id;
+
+	/** @event_error_value: Error counter value reported by an error-report event */
+	uint32_t event_error_value;
+
+	/** @event_received: Set when a matching error-report event has been received */
+	bool event_received;
+
+	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
+	int subscribed_grp_id;
+};
+
+void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
+					  const char *notify_group_name);
+int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
+
+#endif /* IGT_DRM_RAS_NL_H */
+
diff --git a/lib/meson.build b/lib/meson.build
index 1fa4163c8..32d5029b8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,6 +164,11 @@ lib_deps = [
 	zlib
 ]
 
+if have_libnl
+        lib_sources += 'igt_drm_ras_nl.c'
+        lib_deps += [libnl, libnl_genl]
+endif
+
 inc = [ inc, include_directories('vendor') ]
 
 if libtsi.found()
diff --git a/meson.build b/meson.build
index d7bbfd969..eec131375 100644
--- a/meson.build
+++ b/meson.build
@@ -408,6 +408,10 @@ endif
 build_testplan = get_option('testplan')
 build_sphinx = get_option('sphinx')
 
+libnl = dependency('libnl-3.0', required : false)
+libnl_genl = dependency('libnl-genl-3.0', required : false)
+have_libnl = libnl.found() and libnl_genl.found()
+
 subdir('scripts')
 
 subdir('lib')
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..07a290ce6
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,601 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Test Xe RAS (Reliability, Availability, Serviceability) MMIO based Error Injection
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: Error Injection
+ * Test category: Functional tests
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "lib/igt_drm_ras_nl.h"
+#include "lib/intel_chipset.h"
+#include "lib/intel_reg.h"
+#include "lib/intel_compute.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/* Steering Control Register (MC_PKT_CTRL) */
+#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+
+/* Core Compute Uncorrectable error injection */
+#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+/* STEER_SEMAPHORE_MGSR_3D */
+#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
+#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
+
+/* Node types for error counters*/
+#define NODE_ID_CORRECTABLE_ERROR 0
+#define NODE_ID_UNCORRECTABLE_ERROR 1
+
+/* Error types for error counter */
+#define ERROR_ID_CORE_COMPUTE 1
+
+/* Core Compute Correctable error injection */
+#define XE_L2_BANK_ERR_INJ 0xB1B4
+#define XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG 0xC000C
+
+enum {
+	SUCCESS = 1,
+	FAILED,
+	TIMEOUT,
+};
+
+#define INJ_ONCE 1
+#define INJ_MANY 16
+#define THRESHOLD_NONE 0
+#define THRESHOLD_ONE 1
+
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+static bool run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	bool found_engine = false;
+	bool all_succeeded = true;
+
+	igt_info("Running compute-square on all engines post %s\n",
+		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		found_engine = true;
+		if (!xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
+							   EXECENV_PREF_SYSTEM))
+			all_succeeded = false;
+	}
+
+	return found_engine && all_succeeded;
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
+static bool acquire_steering_semaphore(struct xe_mmio *mmio)
+{
+	uint32_t regval;
+	time_t start_time = time(NULL);
+	time_t timeout = 10; /* 10 secs */
+
+	while (time(NULL) - start_time < timeout) {
+		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
+		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
+			return true;
+		sleep(1);
+	}
+
+	return false;
+}
+
+static void release_steering_semaphore(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
+			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
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
+static void cleanup_on_error(struct igt_drm_ras_nl_context *ctx, int fw_handle)
+{
+	igt_drm_ras_nl_cleanup(ctx);
+	release_forcewake(fw_handle);
+}
+
+static int get_counter(uint32_t node_id, uint32_t error_id)
+{
+	struct igt_drm_ras_nl_context ctx;
+	uint32_t error_value = UINT32_MAX;
+	int ret;
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
+		return ret;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
+		igt_drm_ras_nl_cleanup(&ctx);
+		return ret;
+	} else {
+		error_value = ctx.error_value;
+		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return error_value;
+}
+
+static int check_dmesg(const char *marker, int elapsed_secs)
+{
+	static const char * const dmesg_status[] = {
+		[SUCCESS] = "AER: device recovery successful",
+		[FAILED] = "AER: device recovery failed",
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
+		for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
+			if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
+				continue;
+
+			igt_debug("Found \"%s\" in dmesg after %d secs\n",
+				  dmesg_status[i], elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return i;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return TIMEOUT;
+}
+
+/*
+ * TODO: AER device recovery logic is pending to be implemented using
+ * "uevents emitted by the aer driver" instead of relying on the dmesg
+ * logs.
+ */
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 10 * 60; /* 10 mins */
+	int time_interval = 30; /* 30 secs */
+	time_t elapsed_time;
+	char marker[128];
+	int status;
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
+			return FAILED;
+		}
+		if (status == SUCCESS || status == FAILED)
+			return status;
+
+		if (elapsed_time >= timeout) {
+			igt_warn("Timed out while waiting for error recovery\n");
+			return TIMEOUT;
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
+	igt_assert_f(recovery_ret != TIMEOUT,
+		     "AER error recovery timed out\n");
+	igt_assert_f(recovery_ret != FAILED,
+		     "AER device recovery failed\n");
+	if (recovery_ret == SUCCESS)
+		igt_info("AER device recovery successful\n");
+}
+
+static bool uncorr_error_recovered;
+
+/**
+ * SUBTEST: inject_core_compute_uncorr_error
+ * Description: Inject a Core Compute Uncorrectable error and verify
+ *		AER-based device recovery.
+ *		The dynamic subtests are:
+ *		inject            - Injects Core Compute Uncorrectable error
+ *				    and verifies device recovery.
+ *		post-recovery-wl  - Runs a compute workload on all compute
+ *				    engines after recovery to confirm the GPU
+ *				    remains functional.
+ * Functionality: error injection
+ */
+static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
+{
+	int counter_before;
+	int counter_after;
+	int fw_handle;
+	bool ret;
+
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
+	counter_before = get_counter(node_id, error_id);
+	if (counter_before < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to read error counter before injection\n");
+	}
+
+	if (!acquire_steering_semaphore(mmio)) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
+	}
+
+	/* Arm the injection sequence. */
+	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+	igt_debug("Injected Core Compute Uncorrectable error\n");
+
+	/* Run traffic to trigger the injected error */
+	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+	if (!ret) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
+	}
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+
+	counter_after = get_counter(node_id, error_id);
+	igt_assert_f(counter_after >= 0, "Failed to read error counter after injection\n");
+
+	igt_assert_f(counter_before != UINT32_MAX && counter_after != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     counter_before, counter_after);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 counter_before, counter_after);
+
+	igt_assert_f(counter_after > counter_before,
+		     "Core Compute Uncorrectable error injection failed: "
+		     "before=%u after=%u\n", counter_before, counter_after);
+	uncorr_error_recovered = true;
+}
+
+static void inject_core_compute_corr_error(struct xe_mmio *mmio, int fd)
+{
+	/* Disable Multicast for unicast error injection */
+	acquire_steering_semaphore(mmio);
+	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+
+	/* Arm the Injection */
+	xe_mmio_write32(mmio, XE_L2_BANK_ERR_INJ, XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+
+	/* Rollback to Multicast */
+	modify_reg_bit(mmio,
+		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	release_steering_semaphore(mmio);
+}
+
+/**
+ * SUBTEST: inject_core_compute_corr_error_threshold_one
+ * Description: Inject one Core Compute Correctable Error with the
+ *		threshold set to 1 and verify exceed-threshold reporting.
+ * Functionality: error injection
+ *
+ * SUBTEST: inject_core_compute_corr_error_threshold_default
+ * Description: Inject enough Core Compute Correctable Errors to cross
+ *		the current threshold and verify exceed-threshold reporting.
+ * Functionality: error injection
+ *
+ * SUBTEST: inject_core_compute_corr_error_once
+ * Description: Inject one Core Compute Correctable Error and verify the
+ *		error counter increments by 1.
+ * Functionality: error injection
+ */
+static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
+						uint32_t ntimes, uint32_t threshold,
+						bool check_event)
+{
+	uint32_t counter_before = 0, counter_after = 0;
+	uint32_t current_threshold = UINT32_MAX;
+	struct igt_drm_ras_nl_context ctx;
+	int fw_handle, ret;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = igt_drm_ras_nl_init(&ctx);
+	if (ret < 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+	}
+
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=0 (correctable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
+	ctx.error_id = ERROR_ID_CORE_COMPUTE;
+
+	/* Query the error counter before injection */
+	counter_before = get_counter(ctx.node_id, ctx.error_id);
+	if (counter_before < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute Correctable error counter before injection\n");
+	}
+
+	/* Query the current error threshold before injection */
+	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
+	if (ret < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute correctable error threshold before injection\n");
+	}
+	current_threshold = ctx.error_threshold;
+
+	if (threshold == THRESHOLD_NONE && ntimes != INJ_ONCE) {
+		/* set ntimes to current_threshold for injecting enough times to exceed threshold*/
+		ntimes = current_threshold;
+	}
+
+	if (threshold != THRESHOLD_NONE) {
+		/* Set the error threshold to the specified value */
+		ctx.error_threshold = threshold;
+		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
+		if (ret < 0) {
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false, "Failed to set Core Compute correctable error threshold before injection\n");
+		}
+	}
+
+	if (check_event) {
+		/* Subscribe to error event */
+		ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
+		if (ret < 0) {
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false, "Failed to subscribe to error event (ret=%d)\n", ret);
+		}
+	}
+
+	for (uint32_t i = 0; i < ntimes; i++) {
+		igt_debug("****** Injection iteration: %u ***********\n", i + 1);
+		inject_core_compute_corr_error(mmio, fd);
+	}
+
+	if (check_event) {
+		/* wait 10 secs for error report event */
+		ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
+		if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
+			igt_info("Success: Received error event notification from: "
+				 "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
+				 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
+				 ctx.event_error_value, ctx.event_received);
+		} else {
+			if (threshold != THRESHOLD_NONE) {
+				/* restore threshold to original value before exit */
+				ctx.error_threshold = current_threshold;
+				igt_drm_ras_nl_set_error_threshold(&ctx);
+			}
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false,
+				     "Failed: NOT received error event notification from: "
+				     "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
+				     DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id,
+				     ctx.event_error_id, ctx.event_error_value,
+				     ctx.event_received);
+		}
+	}
+
+	if (threshold != THRESHOLD_NONE) {
+		/* restore Core Compute Correctable error threshold to original value */
+		ctx.error_threshold = current_threshold;
+		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
+		if (ret < 0)
+			igt_warn("Failed to restore Core Compute Correctable threshold to original value\n");
+	}
+
+	ret = igt_drm_ras_nl_get_error_counter(&ctx);
+	if (ret < 0) {
+		cleanup_on_error(&ctx, fw_handle);
+		igt_assert_f(false,
+			     "Failed to query Core Compute Correctable error counter after injection\n");
+	}
+	counter_after = ctx.error_value;
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 counter_before, counter_after);
+	igt_assert_f(counter_after - counter_before == ntimes,
+		     "Core Compute Correctable error injection Failed\n");
+
+	cleanup_on_error(&ctx, fw_handle);
+}
+
+static void require_cri_gpu(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
+enum xe_err_injection_type {
+	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
+	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT,
+	XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE,
+};
+
+static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
+{
+	switch (injection) {
+	case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
+		test_inject_core_compute_uncorr_error(mmio, fd);
+		break;
+	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_ONE, true);
+		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_MANY, THRESHOLD_NONE, true);
+		break;
+	case XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE:
+		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_NONE, false);
+		break;
+	default:
+		igt_info("Invalid Error Injection specified\n");
+	}
+}
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
+			      "forcewake_all is not available in debugfs\n");
+		require_cri_gpu(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
+		xe_mmio_access_init(fd, &mmio);
+		igt_require_f(xe_mmio_is_initialized(&mmio),
+			      "Failed to initialize Xe MMIO access\n");
+	}
+
+	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
+	igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
+		igt_dynamic("inject")
+			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
+
+		igt_dynamic("post-recovery-wl") {
+			igt_require_f(uncorr_error_recovered,
+				      "Run the \"inject\" dynamic subtest first\n");
+			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, &mmio, fd);
+		}
+	}
+
+	igt_describe("Inject one Core Compute Correctable Error with the "
+		     "threshold set to 1 and verify exceed-threshold reporting");
+	igt_subtest("inject_core_compute_corr_error_threshold_one")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE, &mmio, fd);
+
+	igt_describe("Inject enough Core Compute Correctable Errors to cross"
+		     " the current threshold and verify exceed-threshold reporting");
+	igt_subtest("inject_core_compute_corr_error_threshold_default")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT, &mmio, fd);
+
+	igt_describe("Inject one Core Compute Correctable Error and verify the "
+		     "error counter increments by 1");
+	igt_subtest("inject_core_compute_corr_error_once")
+		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
+
+	igt_fixture() {
+		xe_mmio_access_fini(&mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index f0a4cef4c..132bb445d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -360,6 +360,10 @@ intel_xe_progs = [
         'xe_tlb',
 ]
 
+if have_libnl
+        intel_xe_progs += 'xe_err_injection'
+endif
+
 chamelium_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
-- 
2.34.1

