Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA98C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B627910E51D;
	Thu,  3 Sep 2026 07:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX6oObVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48910F424
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420870; x=1819956870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4phSo0aWrQrlAZllMspG3bK2QT6rfD1QuoRRpCg9cc=;
 b=mX6oObVfAkf535XbjwdZLkHHS4lR3717H1rY9jqjLutW/H4NPKEeAeGj
 YqlNXVRitliRiET/r8cUSo0eyE4OL7XlLIyZs3bdhiK135waSXg8Lmo37
 SdOXf9UUcZw1IDPegtSL2j11S8bOBf3cdZP3p94MoPwDXQUuiYlF//n3k
 8IXADw8poIyfZx7gAtSiq5vnqwlazScSXYtPv6X1ajd1jvie1N4edwrZB
 2X3AptLhKAWAe50MTkIJNQLW0fwTOdYOfhsidB6HECUs2YBttPLjjxUG2
 YtiebvBRt9KRdGKfbkW9CaXf2YyK1b6egLClsnyP2bzCrEbTIKCQ024pv w==;
X-CSE-ConnectionGUID: 2imjgPe6QcGbJWzqJx5lvA==
X-CSE-MsgGUID: xOYxvvj8QkaQUvmHt0wzgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655724"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655724"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:30 -0700
X-CSE-ConnectionGUID: NHrMMwiYSYmCbkqB2cF0wA==
X-CSE-MsgGUID: p4iP6u0iTXK5O3x1k7Mc0g==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:27 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 08/10] lib/igt_drm_netlink: add event notify subscription
 and event wait support
Date: Thu,  3 Sep 2026 13:03:33 +0530
Message-Id: <20260903073335.339540-9-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Handled SEQ_CHECK nl response using separate callback
   Added monotonic-clock deadline to wait for messages without exceeding the
   caller’s total timeout.
   Added support to receive events until it sees an event whose node ID and
   error ID match the requested values.
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
   updated error event name from error-notify to error-report to align
   with the latest changes in drm-uapi/drm_ras.h
---
 lib/igt_drm_netlink.c | 154 +++++++++++++++++++++++++++++++++++++++++-
 lib/igt_drm_netlink.h |   6 ++
 2 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index c0e3aff9b..6a3e475e8 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <poll.h>
 #include <stdint.h>
+#include <time.h>
 
 #include <netlink/genl/ctrl.h>
 #include <netlink/genl/genl.h>
@@ -28,6 +29,27 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	switch (gnlh->cmd) {
 	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		break;
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
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -61,13 +83,20 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
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
 	struct app_context *ctx = arg;
@@ -121,6 +150,23 @@ static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
 	return 0;
 }
 
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
 static int send_and_recv_nl_msg(struct app_context *ctx,
 				struct nl_cb *cb,
 				struct nl_msg *msg)
@@ -263,6 +309,10 @@ static void reset_drm_ras_netlink_context(struct app_context *ctx)
 	ctx->ack_received = false;
 	ctx->response_required = false;
 	ctx->error_threshold = 0;
+	ctx->event_node_id = UINT32_MAX;
+	ctx->event_error_id = UINT32_MAX;
+	ctx->event_error_value = 0;
+	ctx->event_received = false;
 	ctx->family_id = -1;
 }
 
@@ -407,3 +457,101 @@ int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
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
index 9376e3dee..ebc575da6 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -19,6 +19,10 @@ struct app_context {
 	bool ack_received;
 	bool response_required;
 	uint32_t error_threshold;
+	uint32_t event_node_id;
+	uint32_t event_error_id;
+	uint32_t event_error_value;
+	bool event_received;
 	int family_id;
 };
 
@@ -27,6 +31,8 @@ int igt_drm_netlink_init(struct app_context *ctx);
 int igt_drm_netlink_get_error_counter(struct app_context *ctx);
 int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
 int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, const char *notify_group_name);
+int igt_drm_netlink_wait_for_error_report_event(struct app_context *ctx, int timeout_ms);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

