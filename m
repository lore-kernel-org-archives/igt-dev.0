Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1BCD37495
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5C10EBAC;
	Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzFUINgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17410EBA5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963979; x=1796499979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XmlD6jzf6xvp+zQFza/MP6ST62M1AoqNKJwLWwY04ME=;
 b=HzFUINgGSKEpJaoNbUBYeSiK0vmJOuTNUiOY5MnY+DxLy5xPTdGBJk5P
 UPq0KLmWiGFdYM9Z7ofW66EBZRGm2InIMO3ztR9A0UDDSPQaOaJKGFk+E
 ArndpCrGZH8G4wsCAKMFbDfdqf/GKSVcT9BHDGbOPpRJsn6qTqViMSbek
 6B6BuKjqvMugI/IePTWNqzG3TqDSCjh42WqdTa7Osz3QPvcuHiAj6LTUE
 SK0m4NHrCRQf8hApiuATt1lh+dY8NDTziTYm8OstCww8CamYDPCXZPx69
 f+HgZuaAoLGs+heesm5H8JueU1WJJZL+hY02o0o51VKh82J4tmTgaGlF2 g==;
X-CSE-ConnectionGUID: L+ICzIlFTy+y1TUw0N7vzg==
X-CSE-MsgGUID: 48ZSK7naTcWZtqHp31ceyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606652"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:19 -0800
X-CSE-ConnectionGUID: 06X1wSkpTKuXy+Fp6WfmKA==
X-CSE-MsgGUID: r1Gfg2OARea7QPKhL/Bv+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624872"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:17 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 02/13] tests/kms_colorop_helper: Add helpers to clear colorops data
Date: Sat,  6 Dec 2025 01:23:01 +0530
Message-Id: <20251205195312.1234330-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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

Add new helper functions `clear_colorop()` and `clear_color_pipeline()` to
reset color operations and entire color pipelines to their default/bypass
state. These functions:
 - Set the colorop to bypass mode.
 - Clear associated data blobs for CTM, LUT1D, LUT3D.
 - Reset multiplier values where applicable.

This will be useful for tests that need to restore the pipeline to a clean
state between configurations.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 31 +++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 8ef43461d..b5951cfc1 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -401,3 +401,34 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
 {
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 }
+
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop)
+{
+	igt_assert(colorop->colorop);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 1);
+
+	switch (colorop->type) {
+	case KMS_COLOROP_CTM_3X4:
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_LUT3D:
+		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
+		break;
+	case KMS_COLOROP_MULTIPLIER:
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
+		break;
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+	default:
+		return;
+	}
+}
+
+void clear_color_pipeline(igt_display_t *display,
+			  igt_plane_t *plane,
+			  kms_colorop_t *colorops[],
+			  igt_colorop_t *color_pipeline)
+{
+	int i;
+
+	for(i = 0; colorops[i]; i++)
+		clear_colorop(display, colorops[i]);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 41c4f0046..79bd5db3e 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -110,5 +110,8 @@ void set_color_pipeline(igt_display_t *display,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
 void set_color_pipeline_bypass(igt_plane_t *plane);
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			  kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.25.1

