Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3845C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9510E4A1;
	Tue,  2 Jul 2024 23:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXlbTdKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52C10E4A1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962981; x=1751498981;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ByGAXLxQvLigPGuyW3vvwVxYvOpvOJZVGtUvfCH7y8M=;
 b=gXlbTdKSauoroSSgZVB7YlnlKj927vxZ8IKd5MxUS9VBTWr85MTkj6Zt
 xnFKW8/OE+pKiML+eC00FoPGqZig7GkgoFIekXpI9xolLmuXADGi9ltlM
 eNGZrZ9dl7nxxOI8jumbcjYd9pIScUSAENp3XqWD2lKzyvFPr4atnIL0X
 xkHNYSKcr0PCIt2Nv9XpkVYl6nZqjJC4OSiHy3pxaTkbPwlFu3DWfvw01
 bWM39ETW+9HIg+LAXqdjCPWoW3KCJRThPaLyoHGHtlpMZnLTybkcAersD
 1NV9mSD3InMDX7fjvJ/zg5fP799XtZpPVIYXCeZ3vUVfsXKqSTWexjx1F w==;
X-CSE-ConnectionGUID: aBfMppq8QdWTARH/T3W4bg==
X-CSE-MsgGUID: 1LEpk3dSRUaf0p4WkRe9FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559674"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:41 -0700
X-CSE-ConnectionGUID: 9I1T7DgxR0q3BiilSuzMNg==
X-CSE-MsgGUID: gFE/QCBbSJGtpaC0jddJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 29/37] lib/igt_fb: Treat 2:10:10:10 properly
Date: Wed,  3 Jul 2024 02:28:09 +0300
Message-ID: <20240702232817.31147-30-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Populate buf->deoth for 10bpc formats so that rendercopy and veboxcopy
know to use the correct hardware format for these.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab04733fef61..c92997449c3f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2657,6 +2657,18 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
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

