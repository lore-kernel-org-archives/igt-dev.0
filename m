Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC8606A320
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yh+6BAbO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DFA10F804;
	Tue, 10 Nov 2026 16:14:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DF610E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326887; x=1825862887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ORTCv2avMuFZZkDGSNTTJHsTwX4y2C0EZcbnCiOAXY=;
 b=Yh+6BAbOcMM7XtFdBaF1NjBdn0p3/Gl3Lb+eMkhket2Oq5n3s72xWYRW
 yGPPOYw6MHC7UgUmMU8TWbw5Jho8XmFsP6iJ24/UO99yLW0P7rbRa+xkR
 sEH9vReKHtGD3WxGWC/wp1wr0m6BQu8BX2M1Gs2WEqgH3NHU9ssk1OcpA
 Y9P9yKlnvSfa1kw5Pj+A6pBW0BT9ATyT1xr5gKN9QvVbb8Fer1TFlcbfC
 b7w9+E4HVIz8DiDfAhItYJ6LXoqezExi4M3ONkEckZqwaUovE8lA7vhyI
 wn4gUJj4OyofZEo3HQUt9qlWndBCrjqSaFP8Fcg3wiHBTDEHJfwDIhP/P Q==;
X-CSE-ConnectionGUID: QfAoLgIMTfeoGfM7nOygjw==
X-CSE-MsgGUID: SwckXFRQTsuXB/PH+sTBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079326"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:40 -0800
X-CSE-ConnectionGUID: iDghuZJMS+iRlCJ3EZIhuA==
X-CSE-MsgGUID: wWqPdnMSRS6Xu+EhZCczSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781827"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:38 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 05/10] lib/igt_drm_ras_nl: add get_error_threshold command
 support
Date: Tue, 10 Nov 2026 21:34:59 +0530
Message-Id: <20261110160504.1315160-6-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
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

Add support for GET_ERROR_THRESHOLD to fetch the current value of error
threshold

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v6:Removed normalize_nl_error() for standard errno in igt_drm_ras_nl_get_error_threshold()
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
v2:Added a check whether error_threshold updated by valid callback or not
---
 lib/igt_drm_ras_nl.c | 52 +++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_ras_nl.h |  4 ++++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 10a433525..3ce04dda7 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -77,6 +77,14 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
 		break;
 	}
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
+		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
+			return NL_SKIP;
+
+		ctx->error_threshold =
+			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
+		break;
+	}
 	default:
 		return NL_SKIP;
 	}
@@ -266,6 +274,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 	}
 
 	switch (cmd) {
+	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
 		ret = nla_put_u32(msg,
@@ -316,6 +325,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->reply_received = false;
 	ctx->ack_received = false;
 	ctx->response_required = false;
+	ctx->error_threshold = 0;
 	ctx->family_id = -1;
 }
 
@@ -362,10 +372,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 	return 0;
 }
 
-int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
+static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 {
-	int ret;
-
 	if (!ctx || !ctx->sock || ctx->family_id < 0) {
 		igt_warn("Invalid DRM RAS netlink context\n");
 		return -EINVAL;
@@ -379,6 +387,17 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
 		return -EINVAL;
 	}
 
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
 	ctx->error_value = UINT32_MAX;
 
 	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
@@ -397,3 +416,30 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
 
 	return 0;
 }
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
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index f51784524..86cfd79d0 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -44,11 +44,15 @@ struct igt_drm_ras_nl_context {
 
 	/** @family_id: Generic netlink family ID */
 	int family_id;
+
+	/** @error_threshold: Error threshold value to query/set */
+	uint32_t error_threshold;
 };
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
-- 
2.34.1

