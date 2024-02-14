Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B154C4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB6310E480;
	Wed, 14 Feb 2024 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmaW+amJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6B10E639
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893172; x=1739429172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BME/9eCYPqu5HyeL62ggZP5m6J/VYkkdkB59vz8fkCM=;
 b=CmaW+amJJIyTOECDRvzN3oeNpaWh247N3exZTKpDmolZ7JfmSAPQFSAN
 nFzdB6em3idXr9gOqNtTCYQndAvRshHSFmNT6JXx7TN2VJEsPCzxpfDqN
 a14FmDD/qhx3qZMFANXg8zji2xqPGP0pOy8+axDLFEmoD7PJDeuzcH0WQ
 u+m2UKRc20R6uuJHmpHmeb8QgW/y5VT73cAPy8UZgqsXxV4b15PkYmMQy
 +XW6O4+A37SwMEJskcW9iRq189spKtifp0tJILv+bUPVPOM9qEhaV2TTl
 16n9p+BbHME3Yl/O+HxaJ2Vos2czk2lEtJWXb69TX8NL7TnT5hYPwa7eE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645516"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427689"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:11 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 21/22] tests/kms_color_helper: Add helpers to clear colorops
 data
Date: Wed, 14 Feb 2024 12:09:52 +0530
Message-ID: <20240214063953.1285495-22-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

- Clear the DATA blob
- Ser the BYPASS prop true

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 29 +++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index e6aead743..bdca87bf8 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -468,6 +468,24 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display,
 	return colorop;
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
+		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
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
 	igt_assert(colorop->colorop);
@@ -504,6 +522,17 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
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
index 9cb8cdc4c..c13198fa8 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -191,6 +191,9 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
 void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
 void igt_colorop_set_custom_lut_1d(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const kms_colorop_custom_lut1d_info_t custom_lut1d_info);
-- 
2.43.0

