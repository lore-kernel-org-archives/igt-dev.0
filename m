Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51429606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NNb5X1bN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8610EA24;
	Wed, 11 Nov 2026 13:09:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1363A10E942
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794402406; x=1825938406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HilSM86iXjMU5+nLqCZ6BEi2mE0Jyujwef3mTOzOr2w=;
 b=NNb5X1bNCPTmH1QSEnOI1NB/QsTYzyXLYgPcWmjE+96KznXPPo/eqi7D
 CrpOsIQYgChVXxZS4Z0t7dKMVf0IIJR3YR4Ydlb3jUuE3fMXpf+TBPMfo
 Lt5WNjuMmOeZHethjC112NN5OpPeji6JMZQqzgBG5yPkGu9kK/bQKmOcT
 6TYb+7Kx6vGxPOQZtxvrceRI0f2VqfQByuMuGhMITmySkguWz89bk02O3
 182pctil+8aYBnAgdsXPZd/qrANugv1dCtyfwURpkV8osdlIaOedXp6CC
 uWlaoOK9yllTe120/H4PsItrzkUbGkuJ2hq88sfeFqQUel3Dp425rrDRY Q==;
X-CSE-ConnectionGUID: TFHHQCF3TFaBFwkgmeX4QA==
X-CSE-MsgGUID: +kP3/zeHSJ2CLd1PVTwKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054407"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054407"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:46 -0800
X-CSE-ConnectionGUID: apljbeq5RIyYx7qL9fUx4A==
X-CSE-MsgGUID: HCRtwvG3ScSpfNbwwfb22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8413409"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:44 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v8 04/10] lib/igt_drm_ras_nl: add get_error_counter support
Date: Wed, 11 Nov 2026 18:36:18 +0530
Message-Id: <20261111130624.1446908-5-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
References: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v8:Cosmetic changes
v7:Added detailed debug messages to aid diagnosis of failure conditions
   Introduced an overall timeout for Netlink response completion
   Consolidated redundant error-handling paths using a common goto label
v6:Removed normalize_nl_error() for standard errno in ras_error_cb() and
   send_and_recv_nl_msg() (Soham)
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
 lib/igt_drm_ras_nl.c | 351 ++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_drm_ras_nl.h |  34 +++++
 2 files changed, 383 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 91396452d..38cc54075 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -4,14 +4,320 @@
  */
 
 #include <errno.h>
+#include <poll.h>
 #include <stdint.h>
 
+#include <netlink/errno.h>
 #include <netlink/genl/ctrl.h>
 #include <netlink/genl/genl.h>
 
 #include "igt_core.h"
 #include "igt_drm_ras_nl.h"
 
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
@@ -19,14 +325,19 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
 
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
 		return -ENOMEM;
@@ -49,3 +360,39 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
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
+
+		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
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

