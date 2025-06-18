Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FBC7115F
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCF410E825;
	Wed, 18 Jun 2025 12:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6Z49hQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7579A10E822
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250619; x=1781786619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vng9Mn4WSdQjcTsOux5cvrpBH1dwzYXfevc5ZwY6q0=;
 b=C6Z49hQQC3KiMu49Q+zjJhw5NM8CKBEkdGcOMCPsxY6bQiENIw3DI+JR
 EGEJ5TBIW66X/WXsP+aAI/DOdIFQm0Xy0a6aDk38LNwY/K00NdJ1aPA99
 UHJD8Ose9/wXUfVCHWR7FOysgR8O6gMchAb1rf89EPHv25Pt0DKhkIefr
 mUQg1MFSBeB5H1lLoP9WOT+hYVGXcweV2cg1Leiw1/70CuDDvtKDJHgTv
 6C4ylV39P3hTDQmNLk1ws+r75kQoIKcbHtnqKBmcGJVMeAaZ4XCmGRVL5
 fMqBQVplIT2DTOkE00meErfUB7EvGHuPyoHcrjap6AF5gKTaJ/Aw1a/bo w==;
X-CSE-ConnectionGUID: pcgzzz2IQBiz+QTUW6HJbQ==
X-CSE-MsgGUID: 7CmiwEV3Rv60O9vg2v2TxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690554"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:37 -0700
X-CSE-ConnectionGUID: UKau7iEARR6OMfUe/Jnrsg==
X-CSE-MsgGUID: Mk5QJfsbRn6lzgxQr0Kj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150266217"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 8/9] tests/kms_color_helper: Add helpers to clear
 colorops data
Date: Wed, 18 Jun 2025 18:18:48 +0530
Message-Id: <20250618124849.1587767-9-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618124849.1587767-1-swati2.sharma@intel.com>
References: <20250618124849.1587767-1-swati2.sharma@intel.com>
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Clear the DATA blob
- Set the BYPASS prop true

v2:
 - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 33 +++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 374362b98..30a1cacf9 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -501,6 +501,28 @@ static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
 	}
 }
 
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop)
+{
+	igt_assert(colorop->colorop);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 1);
+
+	switch (colorop->type) {
+	case KMS_COLOROP_CTM_3X3:
+	case KMS_COLOROP_CTM_3X4:
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
+		break;
+	case KMS_COLOROP_MULTIPLIER:
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
+		break;
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+	case KMS_COLOROP_LUT3D:
+	default:
+		return;
+	}
+}
+
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
@@ -538,6 +560,17 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 	}
 }
 
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
+
 void set_color_pipeline(igt_display_t *display,
 			igt_plane_t *plane,
 			kms_colorop_t *colorops[],
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 95a557fea..2b5f9d44c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -196,6 +196,9 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
 void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 void igt_colorop_set_ctm_3x3(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const struct drm_color_ctm *matrix);
-- 
2.25.1

