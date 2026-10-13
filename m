Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F3CC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0D110E5E5;
	Tue, 13 Oct 2026 19:15:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079310E8DD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918474; x=1823454474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QiW3519jPKUDuxwYt+vJJLNsiW1IqtWkBNPx4Ot8CZM=;
 b=KXTL/EQdAWj2Ezf49D2CTEpVWKOMGiXp0HiWkLhkbRFOcQ0CN9frs7eo
 C14ztIGg7NBH5tT9ijT7c5phK5eLHk7qzd6TyT3dEVv8Fz9sbuFn2k6rZ
 D6umGVm10FYhFgZkTRqfxiQEZO/VvokguX+EIrr1u353UPhE7NoJgKS99
 oKTNuG79w1biO8o/jSsZd0B/s1CdKSJz5XGEoC+2MgRbVooAR1JjapOZw
 23z7YKzlZxl+kCLAoA2JOPGUpMeTZJifXcvIVg6+6LE64wXunnOOI+5hw
 0juUJp0GPVgWfcJXhQIkF9K2bsbWl/vdRWfpUQZZMRNjABlKdeTYFo182 Q==;
X-CSE-ConnectionGUID: maI8xH6cQCuAU4h+B8dR/Q==
X-CSE-MsgGUID: cBjbfjq3RaWKyNAa1fUcHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687265"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687265"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:54 -0700
X-CSE-ConnectionGUID: LkBDs8N3SyaOeTRRz4Y4KA==
X-CSE-MsgGUID: a9495QcGTa+hcK5wR2CluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004476"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:50 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 06/10] lib/igt_drm_netlink: add set_error_threshold command
 support
Date: Wed, 14 Oct 2026 00:36:47 +0530
Message-Id: <20261013190651.897241-7-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
v2:Marked this command as response not required
---
 lib/igt_drm_ras_nl.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index f8f289329..94fcc40ac 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -68,6 +68,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 		return NL_SKIP;
 
 	switch (gnlh->cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
 			return NL_SKIP;
@@ -237,6 +239,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx->node_id);
@@ -252,6 +255,16 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return normalize_nl_error(ret);
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
@@ -347,6 +360,14 @@ static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
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
 
@@ -401,3 +422,21 @@ int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
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
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 86cfd79d0..5c9be5b17 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -53,6 +53,7 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
-- 
2.34.1

