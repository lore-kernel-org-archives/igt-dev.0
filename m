Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94CDCC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9110E5E5;
	Tue, 13 Oct 2026 19:11:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A2810E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918460; x=1823454460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYuUaj/atX1Y9qit/lscazS9mR8hagClE9m3qqKt99A=;
 b=PND7fTUwvyPnEUeDYwrfdijEr//rIMEf8M3Uho5Kw40kFX94KpwB+2V6
 sdNmND/bunA38718PXg5IBUYm7dZIflnqdZy8ooNayhnoImxuA5BKoOi4
 Hs0zT9KPcxD/xbj30r9AjM5ga+9cihKp/pRCjAbjzhfTiGQiFqyPQr3hP
 eA3G/3XBxCuoEPw/tr8sSp6ftHKhaO/NjWU83b8L/hnM5NoUQwQn7OKhD
 axgG3/paAkV7efRyciIiLnY3mP3Vsz3ZJ9+W4nTMpyi6oqTrs/L8htJM9
 SnGp+f6rig9Kc48ASejAL2nCeM4hQYHxoNB5Mk5bB3mnxYdBeaPaVwCPi Q==;
X-CSE-ConnectionGUID: EffZUIo9Q56oK8jis7Esbw==
X-CSE-MsgGUID: 0a+bYzYtTWKNEkE5R4AQ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687240"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687240"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:40 -0700
X-CSE-ConnectionGUID: onpqncYdRZebs465UrhlkA==
X-CSE-MsgGUID: n854987mRXmGctkjKwSUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004461"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:36 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 04/10] lib/igt_drm_netlink: add get_error_counter support
Date: Wed, 14 Oct 2026 00:36:45 +0530
Message-Id: <20261013190651.897241-5-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5:Renamed library function names prefixed with igt_drm_ras_nl_*
   (Riana and Soham)
   Normalized libnl error codes to standard errnos (Soham)
   Added error messages for error handling functions (Riana)
   Changed the error-id max value from UINT32_MAX to DRM_XE_RAS_ERR_COMP_MAX (Riana)
v4:Added support to poll for incoming netlink messages with 10 seconds timeout
   Renamed the library functions with prefix "igt_drm_netlink_*" and
   other cosmetic changes (Nikula Jani & Kamil)
v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
   Added a check whether error_value updated by valid callback or not
   Added a check whether response required for the command or not
---
 lib/igt_drm_ras_nl.c | 312 ++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_drm_ras_nl.h |  34 +++++
 2 files changed, 344 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 2822361d3..a465a53e7 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -3,14 +3,282 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <errno.h>
+#include <poll.h>
 #include <stdint.h>
 
+#include <netlink/errno.h>
 #include <netlink/genl/ctrl.h>
 #include <netlink/genl/genl.h>
 
 #include "igt_core.h"
 #include "igt_drm_ras_nl.h"
 
+#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
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
+		return -EIO;
+	}
+}
+
+static int ras_command_cb(struct nl_msg *msg, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
+	struct nlmsghdr *nlh;
+	struct genlmsghdr *gnlh;
+	struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	int ret;
+
+	nlh = nlmsg_hdr(msg);
+	gnlh = nlmsg_data(nlh);
+
+	ret = genlmsg_parse(nlh, 0, attrs,
+			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+	if (ret < 0)
+		return NL_SKIP;
+
+	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
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
+	ctx->reply_received = true;
+	if (ctx->ack_received)
+		ctx->cmd_done = true;
+
+	return NL_OK;
+}
+
+static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct igt_drm_ras_nl_context *ctx = arg;
+
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
+static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
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
+		return normalize_nl_error(ret);
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
+	return ret < 0 ? normalize_nl_error(ret) : 0;
+}
+
+static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
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
+	case DRM_RAS_CMD_GET_ERROR_COUNTER:
+		ctx->response_required = true;
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
+	ctx->family_id = -1;
+}
+
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
 {
 	if (!ctx || !ctx->sock)
@@ -18,14 +286,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
 
 	nl_close(ctx->sock);
 	nl_socket_free(ctx->sock);
-	ctx->sock = NULL;
-	ctx->family_id = -1;
+
+	reset_drm_ras_nl_context(ctx);
 
 	igt_debug("Cleaned up netlink socket.\n");
 }
 
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 {
+	if (!ctx)
+		return -EINVAL;
+
+	reset_drm_ras_nl_context(ctx);
+
 	ctx->sock = nl_socket_alloc();
 	if (!ctx->sock)
 		return -1;
@@ -48,3 +321,38 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 		  DRM_RAS_FAMILY_NAME, ctx->family_id);
 	return 0;
 }
+
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
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
+	ctx->error_value = UINT32_MAX;
+
+	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
+	if (ret < 0)
+		return ret;
+
+	if (ctx->error_value == UINT32_MAX) {
+		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
+			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
+		return ctx->last_nl_error ? normalize_nl_error(ctx->last_nl_error) : -ENODATA;
+	}
+
+	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
+		  ctx->node_id, ctx->error_id, ctx->error_value);
+
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 011f3bc05..f51784524 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -7,14 +7,48 @@
 #define IGT_DRM_RAS_NL_H
 
 #include <drm-uapi/drm_ras.h>
+#include <drm-uapi/xe_drm.h>
 
+/**
+ * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
+ *
+ * Holds the state for a DRM RAS generic netlink request/response exchange.
+ */
 struct igt_drm_ras_nl_context {
+	/** @sock: Netlink socket used for the exchange */
 	struct nl_sock *sock;
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
 	int family_id;
 };
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
-- 
2.34.1

