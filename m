Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575F4C83F03
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0A810E3CF;
	Sun,  6 Jul 2025 19:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R07h3m4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0410E3CF
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831701; x=1783367701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/tt8BhoPX78iC1dzAcQaYxvMEvUU8w5s96E/bzYcaIE=;
 b=R07h3m4hgbCablwY9j651ZJax/k8le9o58QN4Wqtq4gkCpJoqDSAa00s
 NaNZVgoFd08kaSu56jckmy5hXZ4oAc0ZdQjuX2ITkovw79/5HX6h4J5Z4
 DD4nJjfzlIL/p6j+rapjRhtwpUG3k+ppbbDFvL59MUNQo+WrxoMS+Vbg6
 iwqpdprWWsHbXpn3qBUtK68EXjRFaX4OVWXGUR/tUh+yWqlqvLghgMznE
 yO9WhuiCJICtSSTyL7g8AAxBNHeMd0PXf3dl1lREC6YII5IQjCtXDau2Y
 IuBuzrhgkkS9mi1a5lbbkIsHOaOgOfEtH9D3EjJ0IBD6+E8RNw4x7wCDR Q==;
X-CSE-ConnectionGUID: fpVDw368S+S1luK1IwwZ2g==
X-CSE-MsgGUID: EYGU2Sf8SqmDXEe8RHQ4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983014"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983014"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:55:01 -0700
X-CSE-ConnectionGUID: TNLf8rGRS0C55m+0ltwhkw==
X-CSE-MsgGUID: XM3uAoTESKKJ7WmEkBFDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064786"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:55:00 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 7/9] tests/kms_color_helper: Add helpers to clear
 colorops data
Date: Mon,  7 Jul 2025 01:31:23 +0530
Message-Id: <20250706200125.35741-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
References: <20250706200125.35741-1-swati2.sharma@intel.com>
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
 tests/kms_color_helper.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index c5f2dcc20..9ca96919f 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -499,6 +499,27 @@ static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
 	}
 }
 
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
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
@@ -533,6 +554,17 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
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
index 29efb7e7b..c384de8a2 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -208,6 +208,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 void igt_colorop_set_multseg_1dlut(igt_display_t *display,
 				   igt_colorop_t *colorop,
 				   const kms_colorop_multseg_lut1d_info_t custom_lut1d_info);
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			  kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 
 #define set_color_pipeline_bypass(plane)  igt_plane_set_prop_enum((plane), IGT_PLANE_COLOR_PIPELINE, "Bypass")
 
-- 
2.25.1

