Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10413D37492
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15D610EBA7;
	Fri,  5 Dec 2025 19:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cfwt9Hjw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920EB10EBA7
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963984; x=1796499984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ugRf7heHmlYEZsShwvKAuNjeSfkTn8DO+XdkowQVUI=;
 b=Cfwt9HjwV2W8CEZbRPaNWfCNERb8jpv2blUTcvRMdJXkcArRZw94daxy
 X0dafRLpMLl7U3AyJSSkaoArMkVeArgUrEbF1On0WFbeKwj0yMDdT+UL8
 rkVaCCV283zbnz0Ny2jeGqh/nabduUXCe38ZrFFuiMxLL55IqqprYeed2
 GFZaJqGafk7FiOb2kwEj0Ae3a5zi7OnNwMDtWITZ0xmreVZe/42Yjc1do
 7o7CpmVOH0e8FCfq1MPYdMXXM/Qo9vPnTc3hbRDZ0dS2GthZdcSSKPoRT
 cL002SE/2cepUz8rCnYmv6tK54527ypplgNLDvymDl0CeyKSRwd5FSX8O A==;
X-CSE-ConnectionGUID: Z641T98SRGqUZSxVFDBHlQ==
X-CSE-MsgGUID: X/J4GU4GQFqagiJue23w8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606658"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:24 -0800
X-CSE-ConnectionGUID: Cqb+Jr4wQSCYmNOtg/u/yw==
X-CSE-MsgGUID: 5L8cNKnmQ9e/QuVQU0j04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624883"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:22 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 05/13] tests/kms_color: Add helper to prepare LUT data for colorops
Date: Sat,  6 Dec 2025 01:23:04 +0530
Message-Id: <20251205195312.1234330-6-swati2.sharma@intel.com>
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

Introduce prepare_lut_data(), a utility to populate LUT data for
KMS_COLOROP_CUSTOM_LUT1D colorops based on the LUT type.

This function generates the appropriate LUT using existing helper
tables and converts coefficients into drm_color_lut32 entries for
driver consumption.

Marked __maybe_unused until integrated with color pipeline setup.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c        | 38 ++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c424083b7..56d2b282b 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -724,6 +724,44 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+__maybe_unused
+static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D) {
+			unsigned int size;
+			gamma_lut_t *lut;
+			struct drm_color_lut32 *lut_32;
+
+			size = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_SIZE);
+			igt_assert_f(size <= MAX_COLOR_LUT_ENTRIES,
+				"LUT size %u exceeds max %u\n", size, MAX_COLOR_LUT_ENTRIES);
+
+			switch (colorops[i]->lut_type) {
+			case KMS_COLOROP_LUT1D_ZERO:
+				lut = generate_table(size, 0.0);
+				break;
+			case KMS_COLOROP_LUT1D_LINEAR:
+				lut = generate_table(size, 1.0);
+				break;
+			case KMS_COLOROP_LUT1D_MAX:
+			default:
+				lut = generate_table_max(size);
+			}
+
+			lut_32 = coeffs_to_lut32(data, lut, 32, 0);
+			igt_assert(lut_32);
+			colorops[i]->lut1d = calloc(1, sizeof(struct igt_1dlut));
+			igt_assert(colorops[i]->lut1d);
+
+			memcpy(colorops[i]->lut1d->lut, lut_32, size * sizeof(struct drm_color_lut32));
+			free_lut(lut);
+		}
+	}
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 8acc7722e..c1b5bd5eb 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -38,6 +38,7 @@
 #include "igt.h"
 #include "igt_edid.h"
 
+#include "kms_colorop_helper.h"
 
 /* Internal */
 typedef struct {
-- 
2.25.1

