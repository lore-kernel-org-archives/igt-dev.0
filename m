Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076C8C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF010EBD6;
	Wed, 29 Jul 2026 12:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGg+K9kG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1645010E046
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327677; x=1816863677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FZ+7LZE7qfcfHD5RsKlXqJp7ciMh0J2g5uHOwqLad0=;
 b=ZGg+K9kGY9Pv0STyRqS+Ev55h5jyfLHbk2m61G/AMkiUxtEiyX0ztUFi
 KMXkxydJHAxubYIySRaTAM6GmCCT56ILDtorVxwC0w7m36PKxKesGOUCI
 sVKdb1lck7WVLnmo7MMby5aLcHZnpcBmXbGM2dbxHD2MwnT1NzoEX/zcH
 Jy3AAPG2J112V9Rp/AWg9UG6gtQwPk4P2BzORGYc80HCvlcU3vzHjxMEa
 X1c6sidnkESPyOI3+y1XcAAbffvR7NUJwmIz5NuvtJrSzrasGFKrRj7kv
 540VU8MYYv/T9mCG1bd3z4jq5juRGCV6eKhBGPzfHJGgMfBT5z7i4Hquw A==;
X-CSE-ConnectionGUID: 7xbhcR1yQxaKzKqdrHERow==
X-CSE-MsgGUID: OnFiUywJTx6bUBip1TY8FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725203"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:16 -0700
X-CSE-ConnectionGUID: Sd3tvVk5QOy3qM/nn1Ckqg==
X-CSE-MsgGUID: HWCuSZ6hTsOqgnI5aW4c5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802341"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:14 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 6/8] lib/igt_drm_netlink: add event notify subscription and
 event wait support
Date: Wed, 29 Jul 2026 17:49:57 +0530
Message-Id: <20260729121959.603890-7-ravi.kishore.koppuravuri@intel.com>
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

Added event notification support with subscribe for an error-notify event and
wait for the event notification functionalities.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 lib/igt_drm_netlink.c | 108 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |   6 +++
 2 files changed, 114 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 4738090af..b72fb343d 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -6,6 +6,7 @@
 #include <stdbool.h>
 #include <stdint.h>
 #include <errno.h>
+#include <poll.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -31,6 +32,26 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
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
+		ctx->event_received = true;
+		break;
+	}
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -171,6 +192,10 @@ int init_app_context(struct app_context *ctx)
 	ctx->error_id = UINT32_MAX;
 	ctx->error_value = 0;
 	ctx->error_threshold = 0;
+	ctx->event_node_id = UINT32_MAX;
+	ctx->event_error_id = UINT32_MAX;
+	ctx->event_error_value = 0;
+	ctx->event_received = false;
 	ctx->family_id = -1;
 
 	return 0;
@@ -186,6 +211,10 @@ void cleanup_app_context(struct app_context *ctx)
 	ctx->error_id = UINT32_MAX;
 	ctx->error_value = 0;
 	ctx->error_threshold = 0;
+	ctx->event_node_id = UINT32_MAX;
+	ctx->event_error_id = UINT32_MAX;
+	ctx->event_error_value = 0;
+	ctx->event_received = false;
 	ctx->family_id = -1;
 }
 
@@ -319,3 +348,82 @@ int set_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int subscribe_error_notify(struct app_context *ctx, const char *notify_group_name)
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
+int wait_for_error_notify_event(struct app_context *ctx, int timeout_ms)
+{
+	struct nl_cb *cb;
+	struct pollfd pfd;
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
+	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
+	if (ret < 0) {
+		nl_cb_put(cb);
+		return ret;
+	}
+
+	ctx->event_received = false;
+
+	pfd.fd = nl_socket_get_fd(ctx->sock);
+	pfd.events = POLLIN;
+	pfd.revents = 0;
+
+	ret = poll(&pfd, 1, timeout_ms);
+	if (ret == 0) {
+		nl_cb_put(cb);
+		return -ETIMEDOUT;
+	}
+
+	if (ret < 0) {
+		ret = -errno;
+		nl_cb_put(cb);
+		return ret;
+	}
+
+	ret = nl_recvmsgs(ctx->sock, cb);
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
index c44486ffa..b04221a23 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -24,6 +24,10 @@ struct app_context {
 	uint32_t error_id;
 	uint32_t error_value;
 	uint32_t error_threshold;
+	uint32_t event_node_id;
+	uint32_t event_error_id;
+	uint32_t event_error_value;
+	bool event_received;
 	int family_id;
 };
 
@@ -34,6 +38,8 @@ int init_nl_socket(struct app_context *ctx);
 int get_error_counter(struct app_context *ctx);
 int get_error_threshold(struct app_context *ctx);
 int set_error_threshold(struct app_context *ctx);
+int subscribe_error_notify(struct app_context *ctx, const char *notify_group_name);
+int wait_for_error_notify_event(struct app_context *ctx, int timeout_ms);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

