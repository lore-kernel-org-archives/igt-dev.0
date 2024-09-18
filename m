Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF4CCCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3310E237;
	Wed, 18 Sep 2024 12:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOsIqDdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786EE10E237
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661154; x=1758197154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e+beUZWsfGUrrlBCxvy3jfUnkGyKcmZtfYZfEPwdbSA=;
 b=iOsIqDdTBGC5F5FE5dIpVKyasEQP4k4sdTCyf7T5eXptU2ivRT/+XrEK
 LmarlI0qFP6Cw5h2mNl9tkURVG0PLHBqptkouVQ74TVJQvMwxScpaCvj8
 im0JRnpXzHzoE1NeinCe1+oUEVkg1NgJc6PMpZ/acuxFlE5VJqeVY1BfU
 an7XgOO+Wqy/D3NK3gUw4id6FXIc1F3mEnoFkdZ1KpafsobpFXZb4+GEy
 7VA84fvMfQTPkoSa4rJL3hfI7/eHjOaVswJeqHx0Qlv8GHQCIKa8w0/FA
 PPYzOiV3K1vkdh3ex52+LokKOAhXrqYIDiNzUFafKJZB84MiPSfyG02Te w==;
X-CSE-ConnectionGUID: TN4V4chnRXGm5aYo3iqpOg==
X-CSE-MsgGUID: +tqNChKuT3GHSHzVS47RIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687543"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:54 -0700
X-CSE-ConnectionGUID: GJZcICmCTcydHv6buliRPQ==
X-CSE-MsgGUID: taiZz4oYTAqXqqQPxBYX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634452"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 11/18] lib/igt_fb: Treat 2:10:10:10 properly
Date: Wed, 18 Sep 2024 15:05:11 +0300
Message-ID: <20240918120518.30258-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Populate buf->depth for 10bpc formats so that rendercopy and veboxcopy
know to use the correct hardware format for these.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0a30148ef5df..d70c26e58848 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2684,6 +2684,18 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				    DEFAULT_MOCS_INDEX);
 	intel_buf_set_name(buf, name);
 
+	/* only really needed for proper CCS handling */
+	switch (fb->drm_format) {
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_XRGB2101010:
+		buf->depth = 30;
+		break;
+	default:
+		break;
+	}
+
 	/* Make sure we close handle on destroy path */
 	intel_buf_set_ownership(buf, true);
 
-- 
2.44.2

