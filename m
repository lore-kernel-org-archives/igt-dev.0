Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E48CD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 21:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D297F10E6A0;
	Tue,  2 Jun 2026 21:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ii6yyT++";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC30910E681
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVBNd98LkmFLXuwcmPS0mJGKcvcchNrHhkaiK2eR9eM=; b=ii6yyT++xh1TUQkSRwJykN1/ew
 YAUrwEcSAJU2XnKARBFriwfY9pEO9rEg05eLx35JZy1OQgyqoj6IWZkoh9rpLtUwEd2Vt8VHAF9KF
 ZpCmvcjMIJN1DF3T2oa0OX4uo0wvwozFbaWTsoZSRNn9lJ5bPt8tFsoW1O9GUHShqLaHKvzuBavav
 E/ICotThZAhkgac217Ezi6rVHq2sEicVTu1dmEXE6S8b89t1OKgXAnUFd1FG4gwQ+zVOH26k6sF4W
 k6k3f6PEn1QBHgOdP3Xh147AbKzAy1JWkxMju657RTp9qflocTp5iiwYDtHLcEftPYYjll+q1zDP2
 u4FNwvIA==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wUWS6-00BtIm-6Y; Tue, 02 Jun 2026 23:15:10 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v2 2/4] test/kms_colorop_helper: only check if a given
 enum value exist
Date: Tue,  2 Jun 2026 23:06:43 +0200
Message-ID: <20260602211259.898147-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602211259.898147-1-mwen@igalia.com>
References: <20260602211259.898147-1-mwen@igalia.com>
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

Don't trigger unnecessary colorop property changes to just probe that a
prop enum exists and can be apply. Make can_use_colorop() read-only.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 lib/igt_kms.c              | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h              |  4 ++++
 tests/kms_colorop_helper.c |  4 +++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d46f15c01..ef27feb89 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4502,6 +4502,32 @@ igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_pr
 	igt_colorop_set_prop_changed(colorop, prop);
 }
 
+/**
+ * igt_colorop_has_prop_enum_value:
+ * @colorop: Target colorop.
+ * @prop: Enum property to check.
+ * @val: Enum value (as string) to look up.
+ *
+ * Read-only counterpart to igt_colorop_try_prop_enum(): returns whether
+ * @colorop's @prop accepts the enum value @val, without setting it or
+ * marking @prop as changed in IGT's cache.
+ *
+ * Returns: true if @val is a valid value of the enum @prop on @colorop.
+ */
+bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
+				     enum igt_atomic_colorop_properties prop,
+				     const char *val)
+{
+	igt_display_t *display = colorop->plane->crtc->display;
+	uint64_t uval;
+
+	igt_assert(colorop->props[prop]);
+
+	return igt_mode_object_get_prop_enum_value(display->drm_fd,
+						   colorop->props[prop],
+						   val, &uval);
+}
+
 /**
  * igt_colorop_try_prop_enum:
  * @colorop: Target colorop.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de..f080bd09c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -954,6 +954,10 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
 	} while (0)
 
 
+extern  bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
+					     enum igt_atomic_colorop_properties prop,
+					     const char *val);
+
 extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
 				      enum igt_atomic_colorop_properties prop,
 				      const char *val);
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..5b79fe789 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -205,7 +205,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
-		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
+		    igt_colorop_has_prop_enum_value(colorop,
+						    IGT_COLOROP_CURVE_1D_TYPE,
+						    kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
 			return true;
 		return false;
 	case KMS_COLOROP_CTM_3X4:
-- 
2.53.0

