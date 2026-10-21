Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34858606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=WArkk2iV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6910E317;
	Wed, 21 Oct 2026 15:21:11 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2CD10E1AC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=hFimBO3AaWoW1dTPVQeQ8TN0T7+frrw9KkwXnZCTkjY=; b=
 WArkk2iVBA5nV9u+1FJmD79uVx16PydvvAgoBWvl+iEoTWPKBij9JYxRbvsJ33kQUpElQAerOuUzF
 6hQz/iDyHXDLkuCqVHZZaqhbCFGRemum6vAMWnG7YwOjARZrlkYivfVWLjsP25r1KDwsWP9iubpsT
 oYsXtnTMrgVEq58SYh5fGYkmK5oaPWDomkzYV2tiOAM2XOZnGO6MGnkv5Mx8UOFQueQfiFnNgJ0+D
 uyWzsIMyZaF6+JVuztv7HQmmF+KB2cP9N/fK/pzCcHAo1yVssSPiCt14flmoRFrU6pk9PS1rLiQZJ
 WFGMKy9h2NCr3rIYiIcdhFZRgYBUs9BwMw==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6j-005l0E-KS; Wed, 21 Oct 2026 17:20:01 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH i-g-t v6 2/8] tests/kms_colorop_helper: only check if a given
 enum value exists
Date: Wed, 21 Oct 2026 17:18:26 +0200
Message-ID: <20261021151929.62529-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
References: <20261021151929.62529-1-mwen@igalia.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Don't trigger unnecessary colorop property changes just to probe that a
prop enum exists and can be applied. Make can_use_colorop() read-only,
preventing atomic commit rejections after test skips.

Assisted-by: Claude:claude-opus-4-7
Tested-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 lib/igt_kms.c              | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h              |  4 ++++
 tests/kms_colorop_helper.c |  4 +++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 365fb0cc3..dcd62d46a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4515,6 +4515,32 @@ igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_pr
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
index 9b8779a62..0949862dc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1032,6 +1032,10 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
 	} while (0)
 
 
+extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
+					    enum igt_atomic_colorop_properties prop,
+					    const char *val);
+
 extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
 				      enum igt_atomic_colorop_properties prop,
 				      const char *val);
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 5c0baeb12..e612859f9 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -259,7 +259,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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

