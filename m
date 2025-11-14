Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEB9CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEE610EAD9;
	Fri, 14 Nov 2025 17:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kU0lCADK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9107E10EAD9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140977; x=1794676977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7iU2DvMOghYH/kaXkGYtnq2vJSU97Nvx2YX87M17FYM=;
 b=kU0lCADKlWWnFYMZBs74dcaDTa+AbjbAwi9KkuKWdWpEBOuFLU387p3Y
 7UEGjy/vfxyKi7u0I/mcNnj5uBzl1xfSkQM+JluJtM8v5ijYw3iJlbwv4
 LS+D00OMV3UUlReBncWCDj/XDkbGTpgr08/7SCdIIAdFdVKKb+SYNFfNL
 dyBImLc1SPiHjQbHx1KQFQh4XUikMDDoA0bwumGuwYx4b6Hprs6S/jChW
 iHMZGi+JzeATXX56iyOAmMOV9vyW6WOJL2fsK4D2KUAXp68GYKKQEckDw
 JYeaaWi97KQyueatuPQiOE/Epbmb3zHepN5U4MU+QMSeQEHyxdtY9ZOkT w==;
X-CSE-ConnectionGUID: Ajza2b/CQ8yFkEHIu/mn5A==
X-CSE-MsgGUID: KnNpv7yFRgab5PL6c4LFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871459"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:57 -0800
X-CSE-ConnectionGUID: I+ZghchPRsSKBsP3lVqUJg==
X-CSE-MsgGUID: 90udxGhPQ0+teQIyiMLqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981620"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:55 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 18/23] lib/igt_color: Add helper to set multisegment 1D LUT
Date: Fri, 14 Nov 2025 22:59:03 +0530
Message-Id: <20251114172908.1027816-19-swati2.sharma@intel.com>
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

Add igt_colorop_set_multseg_1dlut() helper to configure DRM multisegment
1D LUT blobs and log the LUT entries for debugging.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_color.c | 13 +++++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index e66d6fe54..b822993df 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -682,3 +682,16 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 {
 	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut3d, lut_size);
 }
+
+void igt_colorop_set_multseg_1dlut(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_multseg_lut1d_info_t lut_info)
+{
+	/* set blob property */
+	for (int i = 0; i < lut_info.lut_size; i++)
+		igt_debug("Lut[%d]: 0x%08x 0x%08x 0x%08x\n",
+			 i, lut_info.lut[i].red, lut_info.lut[i].green, lut_info.lut[i].blue);
+
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA,
+			lut_info.lut, sizeof(struct drm_color_lut32) * lut_info.lut_size);
+}
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 42267ac1f..8b1fa66f1 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -118,6 +118,10 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 			   const igt_3dlut_norm_t *lut3d,
 			   const size_t lut_size);
 
+void igt_colorop_set_multseg_1dlut(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_multseg_lut1d_info_t custom_lut1d_info);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
-- 
2.25.1

