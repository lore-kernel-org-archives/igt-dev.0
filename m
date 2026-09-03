Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA43C624D7
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245DC10F438;
	Thu,  3 Sep 2026 07:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfBC+1uN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4713B10F424
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420864; x=1819956864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fbs+l6NCboNiMB3gYw1/IP+wI041NkKari2TS3k2bqA=;
 b=JfBC+1uNDbpXKEuNPrD71hj0HWZoUxK+0QcdxEVo9Sc6EaQkwBKquco3
 Nge/mbBDrLptQc5G/16lb0IJlPTfZ2MIXIY/VwsTUfN+Dl1MWdXM7M9U2
 iKHr6k5tHcdHGI9f5C4CM77lQ2tgvVMTxBqLI8oKOKPOFfxcywNdIohQx
 +T4Bbm+ATwk4hv/IGhBqLiUZaXEDBOpzM50tjQhk33L/GhSZKruwhlIPK
 GkzPW/Jr835ifCGy5kQ4HNxMe3fUX2wakAVnJ3G5JAgWvr27KD3rWLLze
 7UIbmIsV/LtylzzZd6nUlqujxqmiw1GP8powkVbi7qexY9QFKWnOl2+bM A==;
X-CSE-ConnectionGUID: AqQjuvwaRuSKNKmVuNhzXw==
X-CSE-MsgGUID: wgENBFw0S4uslkwChrlPuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655718"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:24 -0700
X-CSE-ConnectionGUID: E92BwI81RX6f/aIn1xEZ1A==
X-CSE-MsgGUID: 778gZldfQxmu/6ZDYe/jWg==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:21 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 06/10] lib/igt_drm_netlink: add set_error_threshold command
 support
Date: Thu,  3 Sep 2026 13:03:31 +0530
Message-Id: <20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2:Marked this command as response not required
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
---
 lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 1be7d4361..c0e3aff9b 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -26,6 +26,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	gnlh = nlmsg_data(nlh);
 
 	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -201,6 +203,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx->node_id);
@@ -216,6 +219,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
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
@@ -314,6 +327,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
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
 
@@ -368,3 +389,21 @@ int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
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
index 89ef58243..9376e3dee 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -26,6 +26,7 @@ void igt_drm_netlink_cleanup(struct app_context *ctx);
 int igt_drm_netlink_init(struct app_context *ctx);
 int igt_drm_netlink_get_error_counter(struct app_context *ctx);
 int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
-- 
2.34.1

