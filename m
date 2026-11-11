Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E795606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TgbyhFtT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055C410E2FC;
	Wed, 11 Nov 2026 13:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4710E908
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794402416; x=1825938416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTySqEIEO29YUe07gubfSl2nPzln09/Xy87rVCAKMSs=;
 b=TgbyhFtTjb6SDyf4pn3FxHhUrI9nNbnFIAV9YV54D11kTCi7wcE37XuJ
 xqLpgsWhodPmpYSpAkAcE4kTUwpJwEPYVdcggqRj61HdqxFdL2DA2P+NN
 yNF1iS7V3Sx4SdZ+YHZK6KmnLrijQfDSKngFS9O+1ZBpFFlOZD6o1UIWL
 qWqsIhz89III7J3tlI41qCJVDwLBaEEgA71d6tzqYiwexaszCGB5wd/m4
 BY1zVf7N7Kbf4mzuTjrohZUAreaDeNkRuEjt2HyScI3QLBOAEtzC1YD9O
 3q3tEfH7jZykHdcJ2GoVq58iH+RWchH6WmToUNZJ0Ln8jNzf2YOnjigOH Q==;
X-CSE-ConnectionGUID: gFGD9D7gTvGtsxDqUT0bJg==
X-CSE-MsgGUID: Iyf3aXF8QzC2Yxi9dvbCsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054415"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:56 -0800
X-CSE-ConnectionGUID: PsebE7XiRc6QVi3mctZ/Lg==
X-CSE-MsgGUID: w1y7orArSF6I/mwloHd/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8413450"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:54 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v8 08/10] lib/igt_drm_ras_nl: add event notify subscription
 and event wait support
Date: Wed, 11 Nov 2026 18:36:22 +0530
Message-Id: <20261111130624.1446908-9-ravi.kishore.koppuravuri@intel.com>
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

Added event notification support with subscribe for an error-notify event
and wait for the event notification functionalities.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v7:
  - Added support to ensure that tests pass on all available compute nodes
  - Added a one-second delay between semaphore acquisition attempts
v6:
  - Updated aquire steering semaphore logic (Soham & Riana)
  - Removed enum to string mappings for test names (Riana)
  - Updated metadata in the file (Riana)
v5:
  - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
  - Prefixed all register address and bit value names with "XE_" (Riana)
  - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
  - Added error handling logic for function calls
  - Changed test name comparisons from strings to enums (Riana)
  - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
v4:
  - Added Steer Semaphore for disabling and enabling multicast
    operation(soham)
  - Increased device recovery check timeout from 5secs to 10secs
  - Used updated library names with igt_drm_netlink_* prefix (Nikula
    Jani & Kamil)
---
 lib/igt_drm_ras_nl.c | 190 +++++++++++++++++++++++++++++++++++++++++--
 lib/igt_drm_ras_nl.h |  18 ++++
 2 files changed, 201 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index b34986333..f7ee3e373 100644
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
@@ -338,7 +392,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
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
@@ -481,3 +540,120 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
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

