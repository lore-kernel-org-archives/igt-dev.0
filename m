Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961A606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGsDR+VP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC620112106;
	Thu, 29 Oct 2026 09:07:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7271210E7B0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264437; x=1824800437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofwI2VbZhYM7DztxYY1V6tLWWqzWgc3h+B1Jp5bYDGo=;
 b=lGsDR+VP1e6dG28H7wJcw6xld46Dx9Cra0HJ3/IhzZn/UIZ5x1vCjXJL
 gi7uVCOI22xLUX6CTkk1pOgqXi+rNSfjP262UWcLlYjPMhdN1Y5p3uGlJ
 RgCn+jdMrLKTPHxzYRKTl8uQqfloVVYAd4dc85dJ0ZXBOVtIZo3CWlgCO
 MI5nBfP5wJsFWc4lBE/foYhNMC15/Y6x0wXHwcNqqtqKWc2lvAc+NgRZ5
 YyatY27v3Uj90e/wxylnAnzBiudhaN/I52wTo7VywD197c/O93Xs/icaI
 /evQWRHGd4IOrZe45qxGgD77tO8LZ7gsRhfeJMcHWxarLXpCNaDp1EvEz w==;
X-CSE-ConnectionGUID: JX4z38N8Q8aO8znWzcvj+A==
X-CSE-MsgGUID: A4jd2TATQGKoDUkmGR3JGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991706"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:37 -0700
X-CSE-ConnectionGUID: jyZ/dYsEQrSiY/J0bxSGJg==
X-CSE-MsgGUID: jh5PXrj1QV+LvfzmMrGT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092962"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:34 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 06/10] lib/igt_drm_ras_nl: add set_error_threshold command
 support
Date: Thu, 29 Oct 2026 14:29:51 +0530
Message-Id: <20261029085955.1232163-7-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
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

Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v6: Added normalize_nl_error() for SET_ERROR_THRESHOLD in send_command() (Soham)
v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
   Jani & Kamil)
v2:Marked this command as response not required
---
 lib/igt_drm_ras_nl.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index d930b6e33..d23fce08f 100644
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
@@ -241,6 +243,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx->response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx->node_id);
@@ -256,6 +259,16 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
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
+				return normalize_nl_error(ret);
+			}
+		}
 		break;
 	default:
 		nlmsg_free(msg);
@@ -351,6 +364,14 @@ static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
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
 
@@ -407,3 +428,21 @@ int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
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

