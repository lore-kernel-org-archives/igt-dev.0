Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC8FCD5BB3
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 15:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C25B10E262;
	Fri, 22 May 2026 15:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="E/IRHL+J";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6E010E262
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779465419;
 bh=dzq8yT6dH8zCERCPeffJGvTmKXFc8ipaI2rA+waHKCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E/IRHL+JpiiXyWqJxyGddRckPHy8+NHgajItHA4n5oNddJuOD5ElbLhcHJOilD/ze
 cFCq9EPAiUfoznNW+etYjENO/FJf9XDJjvxNE+0+BHM8qwBE6Abeu3feJsD4zq9N9D
 FlbWcQNiJNlj1i3WH0fHDJfrqXryackjl/O9MiDJtoWerADj6sQpA6sjzM4kUjkFRW
 Ld1+ex4A80cOuOh5QCo6HgBxW6/eSbpEgh/9CCDlQN9U/WhwNFRoPgQGFnp4mTQrbs
 PIHUy/l1hIm+ScSV2NIfd4tG5nuj331IFiowqx5QXuwiy5VOmPF2W2N7s1XPR9fN/L
 1huf33cP+vKlg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH v2 2/3] lib/igt_kms: Add support for the BACKGROUND_COLOR
 property.
Date: Fri, 22 May 2026 17:56:34 +0200
Message-ID: <20260522155635.1215421-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522155635.1215421-1-dev@lankhorst.se>
References: <20260522155635.1215421-1-dev@lankhorst.se>
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
index e203079235..8998ecbc3e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -49,6 +49,7 @@
 #include <time.h>
 #include <ctype.h>
 
+#include "linux_scaffold.h"
 #include <i915_drm.h>
 
 #include "drmtest.h"
@@ -739,6 +740,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2739,6 +2741,10 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
 		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR,
+					DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+
 	crtc->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de4..2d9aacb304 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -166,6 +166,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_BACKGROUND_COLOR,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.53.0

