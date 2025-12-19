Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5612D767DB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E2C10EBA1;
	Fri, 19 Dec 2025 11:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RetxvgQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784610E453
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143145; x=1797679145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlN7RMfaAQEOW5srsLLQddcJUsE+sS/1SgtI5YwLw1Q=;
 b=RetxvgQKIR0vI1S9rbt+LsoXLUpNQ70GJ8xe1xHmPS6SuzUgiSuNQwkh
 LNdrbBACJpKyIWPco6PSV2fSoHdtPSNoB/O6rXQiS5I1LM2eIa7ghlIyW
 pagSyo2uewXfp+e0o10rirPOj9JMLt7+bMd7e5VNcJU+t6+O/7amxhDjx
 /iT6zTopVrSEdQEpYtUy2t3GCwt38+Q31M4cs7HGRzFiBj0Lm8a4jGb3X
 Fnk7eTX0roKcH/TqS1Pc3Ael7Ephkwr1zlSilguSJ2Avrj/tAm+N2b/mi
 gZgDo0xDIyfv72PPtvXHc9IHXHrEaXhqUZiZIGMoWvlu2Opuepw2td/vx Q==;
X-CSE-ConnectionGUID: 3xYpMr6tReWqOSBNg/F1Qw==
X-CSE-MsgGUID: VpLJExTwSaSkqhYN+PoqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816165"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816165"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:05 -0800
X-CSE-ConnectionGUID: s/pBWE/fTtmnIAaFYJzRfQ==
X-CSE-MsgGUID: gc+PcowgRdCzCgLXYARGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235476"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:04 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 2/8] tests/kms_colorop_helper: Add helpers to clear colorops data
Date: Fri, 19 Dec 2025 16:56:00 +0530
Message-Id: <20251219112606.1330425-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

Add new helper function `clear_colorops()` to reset color operations
to their default/bypass state. These functions:
 - Set the colorop to bypass mode.
 - Clear associated data blobs for CTM, LUT1D, LUT3D.
 - Reset multiplier values where applicable.

v2: -make internal helper static (Chaitanya)
    -rename func() to clear_colorops() (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 30 ++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 6869590f3..da95ec72d 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -400,3 +400,33 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
 {
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 }
+
+static void clear_colorop(igt_display_t *display, kms_colorop_t *colorop)
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
+void clear_colorops(igt_display_t *display,
+		    igt_plane_t *plane,
+		    kms_colorop_t *colorops[])
+{
+	int i;
+
+	for(i = 0; colorops[i]; i++)
+		clear_colorop(display, colorops[i]);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index b807f122d..bdc812baa 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -102,5 +102,6 @@ void set_color_pipeline(igt_display_t *display,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
 void set_color_pipeline_bypass(igt_plane_t *plane);
+void clear_colorops(igt_display_t *display, igt_plane_t *plane, kms_colorop_t *colorops[]);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.25.1

