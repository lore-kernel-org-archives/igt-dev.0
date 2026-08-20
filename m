Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A77C5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 12:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F10210F01A;
	Thu, 20 Aug 2026 12:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpBTDtaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDD010E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787228198; x=1818764198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F98BsqO+9BrboCl41C0HIA4ZK2/DtqWcgcjmhGMV9nQ=;
 b=QpBTDtaE8X80PZ7V+7oEHCooaT9heqQOkpo7W6NKsGOkq1cm+gwR0QS/
 Cg5JYHXKJSujx5zFL16Uf92ilspi0V7sNf3VL+v5gxsnfDOstIfenJml7
 PMTM26s299vYhSpE/BIz/V58lvdG9JKb6Tfws6ZPn575rUpVsFWUHuMF6
 7iZvqPiqCzYYpKul9NPWTUoQsjuuXJCP+jsSbF/PWtxm/QscZJG4WXlTc
 DGh6ShQKs0CwWdZJ8gFLI0GvIBM0ZE7LLPRLdhPmY4YH8c1ZQQBePdrHZ
 R7uFRvC8cAa5cgfpqFUi4DSMK+cGEaK8P/14xkD9T9V83H8ufSbuJzqMO g==;
X-CSE-ConnectionGUID: HT3RrXciQwmcDLqyqqQclg==
X-CSE-MsgGUID: DBXSoSuCQyuI8h9LTBa+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98917293"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98917293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:38 -0700
X-CSE-ConnectionGUID: LFMG9ZilT3yckzodVFrwOg==
X-CSE-MsgGUID: lSh3PlsFSCKimacXoY2ntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264675950"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:37 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 4/8] lib/igt_drm_netlink: add set_error_threshold command
 support
Date: Thu, 20 Aug 2026 17:45:56 +0530
Message-Id: <20260820121600.75052-5-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
References: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
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

Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Marked this command as response not required
---
---
 lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index c530076a6..c32e10f2f 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -29,6 +29,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	gnlh = nlmsg_data(nlh);
 
 	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -180,6 +182,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx->node_id);
@@ -195,6 +198,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return ret;
 		}
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
 		break;
 	default:
 		nlmsg_free(msg);
@@ -317,6 +330,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 		return -EINVAL;
 	}
 
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
+	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
+		igt_warn("Invalid error_threshold (%u) provided. "
+			 "error_threshold should be >= 1 and <= 16.\n",
+			 ctx->error_threshold);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -371,3 +392,21 @@ int get_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int set_error_threshold(struct app_context *ctx)
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
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index 08ef4eed0..045dae403 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -38,6 +38,7 @@ void cleanup_nl_socket(struct app_context *ctx);
 int init_nl_socket(struct app_context *ctx);
 int get_error_counter(struct app_context *ctx);
 int get_error_threshold(struct app_context *ctx);
+int set_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

