Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BBC88E64
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 09:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5740110E0B4;
	Mon, 14 Sep 2026 09:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZADrfaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E9010E0B4
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789379066; x=1820915066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kS+Uv4UM4s7XcBRa+qEoeoST9CoWqntM25oUxN9PRVk=;
 b=mZADrfaqjswrEvXbut1hgmOyvFKrCwyem6lSx7fEX2OHh+rio5ND2KE9
 0hSQEze0m4tMqReZXNamJXP0VkPfO3OXbCF78UNfJZaqHDhgU9X+tMRSi
 6gTuEvZoVAm3BJoZgNSVhEgn2TQ1+bS46GWA8Yh9ukjzdvT/d0aFso2sK
 bMVvq4XhR+GQq5gXVdAo54KwiCXWiy+An9I4lggMmvcAJX4+xd7G6ovRC
 Q86pdb+a6dub0v7wjsh6/n1NMN1b7XqpxP0elTeDQ5goHRfxcsQ+BMNxH
 Dyp6GyU/S6IDImh27MtGkOXkhccpDPhec85Xgy2C5obJhuIdifjsoHYv1 A==;
X-CSE-ConnectionGUID: NKl6YKJSRSy9mMbszf8YkA==
X-CSE-MsgGUID: Mb+qSwKnRsGU6wcco5GNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100390062"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="100390062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:26 -0700
X-CSE-ConnectionGUID: 4VrF31DWS+CoECxRJkTxog==
X-CSE-MsgGUID: n2VanlryTd2hhU7Du0bfhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="271184137"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property
Date: Mon, 14 Sep 2026 11:44:13 +0200
Message-ID: <20260914094415.10899-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
References: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
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

From: Maarten Lankhorst <dev@lankhorst.se>

The background color is a 64-bits property that contains the ARGB values
of the background with 16 bits for each component.

Add support for the BACKGROUND_COLOR property, and set to pitch black
as the default.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e622d7bcd..c1a7ff4b1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -49,6 +49,7 @@
 #include <time.h>
 #include <ctype.h>
 
+#include "linux_scaffold.h"
 #include <i915_drm.h>
 
 #include "drmtest.h"
@@ -740,6 +741,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2742,6 +2744,10 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
 		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR,
+					DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+
 	crtc->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 601218c70..e9bb08cf0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -174,6 +174,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_BACKGROUND_COLOR,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.55.0

