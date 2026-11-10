Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244D606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XFk+vXd4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8010E21C;
	Tue, 10 Nov 2026 16:09:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C3410E252
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326896; x=1825862896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKVEoyslkCvKBcqSM2SSIkuto6GflzBWccX6naUB0o4=;
 b=XFk+vXd47dlBNGhk9qfISORQdBCzQO0BZmUm3YRHtMAso5s1JTOjI5zp
 D5B7kFwcX4rGYEAoy3XSCZ07RBaJ86nMnL9p5jKZytzXSHjPOZwCe6PLo
 qRZ3/G0CK1lY4KbF2pfo5mCX8jBI3rZy2ibC/6k6K+X+JmaD7UdiFCnxi
 2BZvF/MbNRym5MzRChGrNeFCYRT4TRga9sGFs0FUTdqB13O0PChRLcEaK
 HBwczi98SoBVUnfR9yfsmMq/WDL0B2RUrXSGgzL/oiT5mCQ3pMBSt04g+
 QvVJ/inglnFkB00HlQgJVJmkqTemmad8gy/iVGPtae+cwNwwQ9c689ttT Q==;
X-CSE-ConnectionGUID: r1CtM8dYQX2xGlEVrIl0Aw==
X-CSE-MsgGUID: sWCeJqWmT8K10XtVtghjFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079352"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079352"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:49 -0800
X-CSE-ConnectionGUID: 4xJ4prjWSX65ITQ0x5BJJg==
X-CSE-MsgGUID: +c4kJiZqQV+dKuz5sFyFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781837"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:46 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 08/10] lib/igt_drm_ras_nl: add event notify subscription
 and event wait support
Date: Tue, 10 Nov 2026 21:35:02 +0530
Message-Id: <20261110160504.1315160-9-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
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

Added event notification support with subscribe for an error-notify event
and wait for the event notification functionalities.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v7:Added detailed debug messages to aid diagnosis of failure conditions
v6:Added normalize_nl_error() for subscribe and wait_for_event functions
v5:Added a guard to prevent duplicate multicast group subscriptions (Soham)
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
   updated error event name from error-notify to error-report to align
   with the latest changes in drm-uapi/drm_ras.h
v2:Handled SEQ_CHECK nl response using separate callback
   Added monotonic-clock deadline to wait for messages without exceeding the
   caller’s total timeout.
   Added support to receive events until it sees an event whose node ID and
   error ID match the requested values.
---
 lib/igt_drm_ras_nl.c | 190 +++++++++++++++++++++++++++++++++++++++++--
 lib/igt_drm_ras_nl.h |  18 ++++
 2 files changed, 201 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index ccd1d7fa3..1cf9935ae 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <poll.h>
 #include <stdint.h>
+#include <time.h>
 
 #include <netlink/errno.h>
 #include <netlink/genl/ctrl.h>
@@ -64,10 +65,12 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	nlh = nlmsg_hdr(msg);
 	gnlh = nlmsg_data(nlh);
 
-	ret = genlmsg_parse(nlh, 0, attrs,
-			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
-	if (ret < 0)
-		return NL_SKIP;
+	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
+		ret = genlmsg_parse(nlh, 0, attrs,
+				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
+		if (ret < 0)
+			return NL_SKIP;
+	}
 
 	switch (gnlh->cmd) {
 	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
@@ -87,14 +90,44 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
 		break;
 	}
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
 	default:
 		return NL_SKIP;
 	}
 
-	ctx->reply_received = true;
-	if (ctx->ack_received)
-		ctx->cmd_done = true;
+	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
+		ctx->reply_received = true;
+		if (ctx->ack_received)
+			ctx->cmd_done = true;
+	}
+
+	return NL_OK;
+}
 
+static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
+{
 	return NL_OK;
 }
 
@@ -160,6 +193,27 @@ static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *c
 	return 0;
 }
 
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
 static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
 				struct nl_cb *cb,
 				struct nl_msg *msg)
@@ -339,7 +393,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->ack_received = false;
 	ctx->response_required = false;
 	ctx->error_threshold = 0;
+	ctx->event_node_id = UINT32_MAX;
+	ctx->event_error_id = UINT32_MAX;
+	ctx->event_error_value = 0;
+	ctx->event_received = false;
 	ctx->family_id = -1;
+	ctx->subscribed_grp_id = -1;
 }
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
@@ -482,3 +541,120 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
 	return 0;
 }
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
index 5c9be5b17..057c6026f 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
 
 	/** @error_threshold: Error threshold value to query/set */
 	uint32_t error_threshold;
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
 };
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
@@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
+					  const char *notify_group_name);
+int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
-- 
2.34.1

