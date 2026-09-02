Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC700C624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8567310F304;
	Wed,  2 Sep 2026 18:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ioyu7/fh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C900E10F315
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=nqSzzgVWQ6o1yd1Ka4gGaJUjvnZlypbYD2S6ViI5Gns=; b=
 ioyu7/fhNlgAB63SzPoR1VJjDTYx/grQkTsHZbk1ZBiPUtTOTCx+cSy24WGzm5JfO7w/iNu9JC0F5
 /XprFXRyiAxJTHLfqDTLLC9rkQ+myJPXFk6IH1c9hb4Oj5y33KKgUZNTJl55oKNluYXKQLozm2/5a
 vqbzyVZF1gqsFmyWR0w+tauchXf9fcnz5XB+P8etGQ3qhsMjTrYPuyyKIxONUkVYYXOPhF3+sq1ug
 fJjhIFC2lVl8B02msQqnM6BNoHO+Tj02yz6MvdA7UyRnwRy34NsmdrQN490Tj0/WuKvpnm7vYfUzK
 b2r7RbcdOQdomiMK+ycyExMgqxFcoRQFhg==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGG-00DxQx-Ad; Wed, 02 Sep 2026 20:00:36 +0200
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
Subject: [PATCH i-g-t v5 2/8] tests/kms_colorop_helper: only check if a given
 enum value exists
Date: Wed,  2 Sep 2026 19:58:02 +0200
Message-ID: <20260902180016.303482-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180016.303482-1-mwen@igalia.com>
References: <20260902180016.303482-1-mwen@igalia.com>
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

Don't trigger unnecessary colorop property changes just to probe that a
prop enum exists and can be applied. Make can_use_colorop() read-only,
preventing atomic commit rejections after test skips.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v2:
- remove extra space (Chaitanya)
---
 lib/igt_kms.c              | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h              |  4 ++++
 tests/kms_colorop_helper.c |  4 +++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cd0a42840..6039ad18a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4507,6 +4507,32 @@ igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_pr
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
index 695f666ba..23615dd91 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1028,6 +1028,10 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
 	} while (0)
 
 
+extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
+					    enum igt_atomic_colorop_properties prop,
+					    const char *val);
+
 extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
 				      enum igt_atomic_colorop_properties prop,
 				      const char *val);
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 3243d01d3..da234410e 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -248,7 +248,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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

