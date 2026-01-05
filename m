Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBD9CD0402
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 20:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7110E445;
	Mon,  5 Jan 2026 20:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoWwP880";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C3D10E380
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767646666; x=1799182666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+iJP2Z3gk/EJmk76u/mFaPhVNU0n8Ba4vZqlzcZwDk=;
 b=HoWwP880J7Lu1QCvI6scFT+LQhquIq+QNf2iQPWp5AzvAU7FK2I4C5Sy
 8H7Ydp6M82/wXXZ6xn0bW3V8Bs1M7V1CQ8HtdGK9fCs/yKJ6hhyqx52SC
 i9suI7P5ujiICK7uQup6G/yfuXLOaNV5qdyFWR41t6oyMqIunpfRmkjVz
 FqYm8/7y3e/uuZ6TeV4f6Sb9SUFh+GvgXo/cg0SX0FCzh8hCxo0vtXAhz
 C1j+RRncNZOlh3iFWBElnGveJzjkrtLR2YWa7EE9qp5w9XlgoBLO0B/gi
 1IktqCfcxeuskQn1WNm7jJCRMzXqsSKsE4yzpfi62V39SC0NA8v4uezvv g==;
X-CSE-ConnectionGUID: DkV4glndTdernDet4bApww==
X-CSE-MsgGUID: z+li6mfFRdy80G5EkwdOxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68029718"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68029718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:57:45 -0800
X-CSE-ConnectionGUID: Slf5ec3mRAm2Au9T9SCv1g==
X-CSE-MsgGUID: 4fr2iuSmRBCPiUky3CU6LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202381574"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:57:44 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v9 2/5] tests/kms_colorop_helper: Add helpers to clear colorops data
Date: Tue,  6 Jan 2026 02:36:00 +0530
Message-Id: <20260105210603.62170-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260105210603.62170-1-swati2.sharma@intel.com>
References: <20260105210603.62170-1-swati2.sharma@intel.com>
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

