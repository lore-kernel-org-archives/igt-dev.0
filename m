Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F72CCD183
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682010E8FC;
	Fri,  3 Oct 2025 12:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmwkNXwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2BC10E8FC
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493958; x=1791029958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xl3yyZtOl8dlYkNaiZUYAGT/m2LMRZA0zfAfH1U5Jgo=;
 b=BmwkNXwkLcgHbeIC14pXFMivdbCxni+AgHdVGH0sTRcuheIEMGjeI8G6
 0ZxDGU7Yvl8riK3CqnF8KFcrZfI5RTv7i+CioqZDMqPANh1mKDl3yA0zo
 vQ+4pKMDUzn0hgJwZr5TsYySvfybXsE7JkClP5Tr2CgJ/e0wkPj0To8U6
 j882uYRBDVEE+TGfj0CegyT8tqmELDGd9e8zMLPJe3NK5e4m8pDyua4kS
 r0mzQrbT/PE2mAJBktHjCJj2g44wMSmu4eabjWpRqEpinw8T3KR1i85h2
 Pyw+3jbBelMK9rB9Qp7W4CZVY6/beXsq3P4VFAm+64wa8smcS+kphSFn6 g==;
X-CSE-ConnectionGUID: wQqZFpO2TTqCgiCedVOL4g==
X-CSE-MsgGUID: hAZPPAXzQq2HWcCyEEeZgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399233"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:18 -0700
X-CSE-ConnectionGUID: NzlrXgq3TfWZXGsqJZCYbg==
X-CSE-MsgGUID: MXLueXdkSHeYTju33RExxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300156"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:16 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 7/9] tests/kms_color_helper: Add helpers to clear
 colorops data
Date: Fri,  3 Oct 2025 17:55:48 +0530
Message-Id: <20251003122550.729242-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003122550.729242-1-swati2.sharma@intel.com>
References: <20251003122550.729242-1-swati2.sharma@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 32 ++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ebb93f0e2..d34e6527f 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -677,3 +677,35 @@ segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id)
 
 	return info;
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
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 696cb0fb3..f4a120894 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -183,5 +183,9 @@ void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 		        kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 void set_color_pipeline_bypass(igt_plane_t *plane);
 
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			  kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+
 #endif
 
-- 
2.25.1

