Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B5FEFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8810E319;
	Mon, 16 Mar 2026 08:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1aX5o90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBD610E319
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649427; x=1805185427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OuluGx1k5Lx3sc0JwtW3IFPsCEakkNZqaQ5gjfup224=;
 b=b1aX5o909h6jdhmpcCgUN6kiOrvwcGOOW7CdeCOf8iWU13zP7YvTLFCL
 qj/foyaf+qPeLvMrXvZK0RLGcffiXl9cml43sAmJqKREcnIOYD1mGoDKv
 36I3uqLnZ5vuklwhDxS+7Yx+ddaVh7j3CPMpfOMl53dW+wlTW6dNft4oQ
 HLdOlJpSjhKqp5VX0bXkkYiZetnznj2XQw3lSX6CxunMV7T6TxECaAois
 F2Xn0017GKQRSoUJ2knuxfOVGICIuKkqUXR/yrvTLOXSOY8rPcYLruaA3
 zApssxqbLbFjoct60p2tDSF+BZ+zyWa34miY8wFVHrqsrjZ41KofV4lzk Q==;
X-CSE-ConnectionGUID: nyktLJFdQtmH07jfA22ZzQ==
X-CSE-MsgGUID: /u+Yh19FQBiz8kCG+tiMbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74576971"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74576971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:23:47 -0700
X-CSE-ConnectionGUID: RwEM1hecSHuF/Rqk4HoqAQ==
X-CSE-MsgGUID: IW2EJWmMSxet2dizHvGiBg==
X-ExtLoop1: 1
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:23:46 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Fix invalid mode timing in
 igt_kms_get_full_edid()
Date: Mon, 16 Mar 2026 13:50:53 +0530
Message-ID: <20260316082053.3333398-1-mohammed.bilal@intel.com>
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

v2:
-Update value based on cvt

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..da7297669 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -162,16 +162,17 @@ const struct edid *igt_kms_get_full_edid(void)
 	static struct edid edid;
 	drmModeModeInfo mode = {};
 
-	mode.clock = 148500;
+	/* 2288x1287 @ 60Hz with proper timing values */
+	mode.clock = 194250;
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
+	mode.vtotal = 1324;
+	mode.vrefresh = 60;
 	edid_init_with_mode(&edid, &mode);
 
 	std_timing_set(&edid.standard_timings[0], 256, 60, STD_TIMING_16_10);
-- 
2.48.1

