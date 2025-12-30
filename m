Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D313E94110
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 06:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42310E82D;
	Tue, 30 Dec 2025 06:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFxq7oaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0AF10E82D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767076671; x=1798612671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+iJP2Z3gk/EJmk76u/mFaPhVNU0n8Ba4vZqlzcZwDk=;
 b=ZFxq7oaMJjM/PLK2383QjDUIgq9xPYtUy5JxwixHlHrPQYkvKIm2zReF
 jG9Qnej/361wBPqbmLezTm/VJKCtxqM/ypzP40ewjxG2zjrd2xzylNUVY
 YaL/R38D2aCWROtCT/2DxFgzdNspb3HaAzFra0RjRzLEmIkBi+ZzQLrOz
 c2qb98dAamlyy3yRhwq5Gyqu/+mCKoIs/WqpsVGnuD73s/9v+YVJ6mdLQ
 Bck/L3nMf2zTZPsd9jMGF2oGEJHo2LjVnyB4ZLjHtjdkUmybShQzeA+9J
 HDtYANOI0k5ukAGDvfaWKs+Y8V49FJWW3MjWJxFq49eozzs+K4v66EgvL A==;
X-CSE-ConnectionGUID: qWtmuADUQtS3MHP+AOeFBw==
X-CSE-MsgGUID: ShevTFAgRjOkhneO7tY7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67672909"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="67672909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 22:37:51 -0800
X-CSE-ConnectionGUID: vapHEs57RcKkTXScb4B1gQ==
X-CSE-MsgGUID: bvYKrlaDS5mrszuyQVeZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="224644608"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:37:38 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v8 2/5] tests/kms_colorop_helper: Add helpers to clear colorops data
Date: Tue, 30 Dec 2025 12:15:49 +0530
Message-Id: <20251230064552.22909-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230064552.22909-1-swati2.sharma@intel.com>
References: <20251230064552.22909-1-swati2.sharma@intel.com>
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

Add new helper function to reset color operations
to their default/bypass state. These functions:
 - Set the colorop to bypass mode.
 - Clear associated data blobs for CTM, LUT1D, LUT3D.
 - Reset multiplier values where applicable.

v2: -make internal helper static (Chaitanya)
    -rename func() to clear_colorops() (Chaitanya)
v3: -remove unused var (Chaitanya)
    -rename func name to reset_colorops() (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_colorop_helper.c | 28 ++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 6869590f3..76728b47b 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -400,3 +400,31 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
 {
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 }
+
+static void reset_colorop(kms_colorop_t *colorop)
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
+void reset_colorops(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for(i = 0; colorops[i]; i++)
+		reset_colorop(colorops[i]);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index b807f122d..2ded22c8f 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -102,5 +102,6 @@ void set_color_pipeline(igt_display_t *display,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
 void set_color_pipeline_bypass(igt_plane_t *plane);
+void reset_colorops(kms_colorop_t *colorops[]);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.25.1

