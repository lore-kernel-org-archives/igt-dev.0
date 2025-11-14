Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FCDCE8D60
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BC110EAD9;
	Fri, 14 Nov 2025 17:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJXyAmuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F59010EAE3
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140949; x=1794676949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4rg0HCWmrKCWtTkFXVnYhm/TdGS0p79LRYyVrXU7R0=;
 b=CJXyAmuGaZcYOOpbFZnBDZN6ZXd2Y+sadWl147V5h1FQUOf1mHwcM74P
 sQMUyN6K+SX0C+1k2+XzbrOMAHwPdkWO94DYgKtjEbyn4HMXNNMb3Bgq+
 VlYguzX8gXW3+fdeLVyeyOlWIw8Yv3V3J9h+l4Ig9qskD9uek09Bt4EUS
 BG62IcexI3Smc4XI7869+xfffsPt3FV2buc7VzprhfAmH+vRsOAUyNdIp
 fcTyb2WnK/UQzcxSDdJO4yNGKis1d3LVKY+G8V3SIM2W2IvnAa91gEEtE
 4+aB4q2w+1v0vGSrj69+N7EO5Hf0AmxKHdn9sIsQ7PZWMJa0jlq0QksCJ g==;
X-CSE-ConnectionGUID: 03o1nidrQ9mByUNfhaBUmw==
X-CSE-MsgGUID: dtfW/zz3SpGC5KpB9SMpGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871437"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:29 -0800
X-CSE-ConnectionGUID: TPEI1eNbTVaCZpN5RHb1SA==
X-CSE-MsgGUID: EKHzb9AOSNOcSX/IcoPHeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981388"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:27 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 03/23] tests/kms_color_helper: Add helpers to clear colorops data
Date: Fri, 14 Nov 2025 22:58:48 +0530
Message-Id: <20251114172908.1027816-4-swati2.sharma@intel.com>
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add new helper functions `clear_colorop()` and `clear_color_pipeline()` to
reset color operations and entire color pipelines to their default/bypass
state. These functions:
 - Set the colorop to bypass mode.
 - Clear associated data blobs for CTM, LUT1D, LUT3D.
 - Reset multiplier values where applicable.

This will be useful for tests that need to restore the pipeline to a clean
state between configurations.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 31 +++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 40431a855..1a0a6090d 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -590,3 +590,34 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
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
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index eb56c0586..694168b45 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -169,5 +169,9 @@ void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 		        kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 void set_color_pipeline_bypass(igt_plane_t *plane);
 
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			  kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+
 #endif
 
-- 
2.25.1

