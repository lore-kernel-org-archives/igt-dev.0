Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA4CFD064E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 08:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAF710E863;
	Wed, 11 Mar 2026 08:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtIjBfA2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22710E85D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773216829; x=1804752829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zy12Ek22yfkfr4lr9Bw/la9QAVxflW5oxPDR/Zt9Xqg=;
 b=YtIjBfA2Q1hgrFGdAi6V/aW4B6wREF8ca8fGmkk4kaIFJYEhBD9o0+tp
 9yIktpsDFfGcobrFl+UVSZ9crzwDTEQCtP/1bINOsiyrioxnHO5ORAddW
 2NErgNz/Y8mKW268Nv7PM535BablQR/XYuUPuKusJA03sdALsQJgXxWh4
 /5QT31qZeAzzJnlv5NYmBH7CpsamXf/ciXkl3UB448bNgFvCmkuRwZvDc
 XJmQw1lwB/XXQrL96/fU7jXKR+ICJxiVaobCAfwGxLyhCA359pDLEOyIo
 j42U8TrA/SCMJFzESKW1UFSDSW5uJlaUTYbf4Y7ddMNk7Q0Xs7XXwEW0z g==;
X-CSE-ConnectionGUID: 6WfO5Ye/SXWzbD5f3+OH8Q==
X-CSE-MsgGUID: /KU6w6G+RgKP1SHdg509Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74318901"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74318901"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:13:48 -0700
X-CSE-ConnectionGUID: ljHfMxArTN2ejwmYs++Pjw==
X-CSE-MsgGUID: T8OxEfjvQFCBRB1Lq4rerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="215642406"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:13:46 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1] lib/igt_kms: Fix invalid mode timing in
 igt_kms_get_full_edid()
Date: Wed, 11 Mar 2026 13:40:49 +0530
Message-ID: <20260311081049.3220303-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

The mode timing values for 2288x1287 were invalid,
causing an incorrect refresh rate to be calculated.

Fixed by using proper timing values with correct blanking periods.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..01e61904b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -162,16 +162,17 @@ const struct edid *igt_kms_get_full_edid(void)
 	static struct edid edid;
 	drmModeModeInfo mode = {};
 
-	mode.clock = 148500;
+	/* 2288x1287 @ 60Hz with proper timing values */
+	mode.clock = 193882;
 	mode.hdisplay = 2288;
-	mode.hsync_start = 2008;
-	mode.hsync_end = 2052;
-	mode.htotal = 2200;
+	mode.hsync_start = 2336;
+	mode.hsync_end = 2368;
+	mode.htotal = 2448;
 	mode.vdisplay = 1287;
-	mode.vsync_start = 1084;
-	mode.vsync_end = 1089;
-	mode.vtotal = 1125;
-	mode.vrefresh = 144;
+	mode.vsync_start = 1290;
+	mode.vsync_end = 1295;
+	mode.vtotal = 1320;
+	mode.vrefresh = 60;
 	edid_init_with_mode(&edid, &mode);
 
 	std_timing_set(&edid.standard_timings[0], 256, 60, STD_TIMING_16_10);
-- 
2.48.1

