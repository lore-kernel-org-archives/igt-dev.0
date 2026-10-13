Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C251DCC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF1910E5E5;
	Tue, 13 Oct 2026 19:13:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F0310E8DD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918487; x=1823454487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=caN3CpzcGuky2tQfpvK3v/7Puk3T3oVWd9ogUMuWESA=;
 b=QpfpjFI5t9QUuwULwJ8rcxqLcjfaubHSLuBM+biMPVAXVCxo8h6G/6t/
 NgnxnmdvVNr+HiBYeHxf/TDgiypBsYGtpN0hi3o3SSb0ZghfyWpzJOvdg
 7qesfmcS/pd2RVMf++sVGneumeH1PvtmK5tyywOCBJ7GJcJBQJ6Fp4CVc
 yMe/DNAialFLX0Wyu82+nc0tQL+A5btcw7BhKO2fCsNKz8Xkf8fZb3qDW
 C/iOy6hOq3fkbVhOZdxf7VCe3m/EolYgCR3avVEhb9WqRSCIwgcp5pULR
 /b/nj94voVc1FqHGXpsyklbEGMIYDauARgwV+R82A+EcV72Qqg5baCrQj g==;
X-CSE-ConnectionGUID: GWxovzXORMeXrCxHImKEHA==
X-CSE-MsgGUID: t4PM2IlBQfK3E7qkMHupxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687296"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687296"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:06 -0700
X-CSE-ConnectionGUID: X6pXKzCgRoOLQbIpsKde1g==
X-CSE-MsgGUID: f029lQDTTCeA+2uGygFjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004492"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:03 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 08/10] lib/igt_drm_netlink: add event notify subscription
 and event wait support
Date: Wed, 14 Oct 2026 00:36:49 +0530
Message-Id: <20261013190651.897241-9-ravi.kishore.koppuravuri@intel.com>
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

Added event notification support with subscribe for an error-notify event
and wait for the event notification functionalities.

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
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
 lib/igt_drm_ras_nl.c | 182 +++++++++++++++++++++++++++++++++++++++++--
 lib/igt_drm_ras_nl.h |  18 +++++
 2 files changed, 193 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 94fcc40ac..c5f1a1a3f 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <poll.h>
 #include <stdint.h>
+#include <time.h>
 
 #include <netlink/errno.h>
 #include <netlink/genl/ctrl.h>
@@ -62,10 +63,12 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
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
@@ -85,17 +88,47 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
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
 
 	return NL_OK;
 }
 
+static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
+{
+	return NL_OK;
+}
+
 static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
 {
 	struct igt_drm_ras_nl_context *ctx = arg;
@@ -157,6 +190,27 @@ static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *c
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
@@ -299,7 +353,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
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
@@ -440,3 +499,112 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
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
+	    !notify_group_name || notify_group_name[0] == '\0')
+		return -EINVAL;
+
+	grp_id = genl_ctrl_resolve_grp(ctx->sock,
+				       DRM_RAS_FAMILY_NAME,
+				       notify_group_name);
+	if (grp_id < 0)
+		return grp_id;
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
+		return ret;
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

