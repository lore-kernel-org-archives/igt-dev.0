Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A3CE8D66
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DD810EAE9;
	Fri, 14 Nov 2025 17:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lc7UeXPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B8010EAE9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140954; x=1794676954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMupPAYZsnQrR8sCWXLhPqHjznkQogNdPYcgr9vHJ9w=;
 b=lc7UeXPk6mer1OXuAvvm2bJ56CIyJeIVE4ffuZfibOAU9BVzsL+WTymE
 eIFSg8QYCNMah7dB75ROTi5PtCSQA8S1uSoHaP6W+qOo+jJW4fI2VCJ0+
 80C5tFSeY1jqhpcJZlaOXWgTrH5ls07QeQSFvn28tIBmb7v0o3jV6mkJH
 IbdlI9uBrKRo4WOn3zbSKtx8YjNE0qmm5WAMTj1Ais3hFzItrbMCfW6Td
 7yhFGytmf2ipegLmSJp7+P4GXmIjZjRWEiM5YNhjhqKbcy2MD3H0OQMQt
 qmyb9JIb+HI3g6/F6GMPdn4gRnvuIYORQsfmTLu1CqTwzgns49vIsLqSr A==;
X-CSE-ConnectionGUID: V2xYS+SKQoqBePtQ5q6B8Q==
X-CSE-MsgGUID: EE4OMdpTRNuUqD84JbZnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871443"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:34 -0800
X-CSE-ConnectionGUID: epz/0cRcRaGQzjfNRa5C+A==
X-CSE-MsgGUID: SAxCqXxdQbiAPL3/A89rUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981421"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:32 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 06/23] tests/kms_color: Add helper to prepare LUT data for colorops
Date: Fri, 14 Nov 2025 22:58:51 +0530
Message-Id: <20251114172908.1027816-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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
 tests/kms_color.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

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
-- 
2.25.1

