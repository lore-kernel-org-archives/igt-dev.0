Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD02D6E2DC
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FFC10E48C;
	Thu, 18 Dec 2025 19:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVs2dvts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E51810E466
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086685; x=1797622685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlN7RMfaAQEOW5srsLLQddcJUsE+sS/1SgtI5YwLw1Q=;
 b=JVs2dvtsiQvApI/WNdTz02HdCh32gLBcYcG93MZXx/nVdv9Fe99ybysW
 DRgHzv+m3N78AFFo9nR0eEsRjlychJ/r8gu5eCZpZtcDlqio8d841eNwG
 U7Octl2sKJdwE4R8guHE/SRQNBcqRNINcodP2YWQdqRncJf6foUmtECqO
 WoN99RJ3XlgKlo8EDdjNzSMIzb6FGd/rzWnKzc/fZCngQnUIRYUhpq9DE
 3Csre5Uy2hP6tGGP0T4Lij1k7ynKiHpqrUnh8D/HogIweKJCZ9ah6/bvF
 TH3lDyD6YrEYxQDqWnAf72mHEI12tqBZzednLnl+haK13IBlgzdDe+509 A==;
X-CSE-ConnectionGUID: ncTD/qM3S1C41nEPFW0zZA==
X-CSE-MsgGUID: dsoiFsL/RDedwu83XzzYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67244715"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67244715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:38:05 -0800
X-CSE-ConnectionGUID: W8+gOqc6SxCYU4tMhPb5Nw==
X-CSE-MsgGUID: DJvbhleAQXaqiib5tmq3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198680617"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:38:03 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 2/8] tests/kms_colorop_helper: Add helpers to clear colorops data
Date: Fri, 19 Dec 2025 01:14:56 +0530
Message-Id: <20251218194502.1306975-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218194502.1306975-1-swati2.sharma@intel.com>
References: <20251218194502.1306975-1-swati2.sharma@intel.com>
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

