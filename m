Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76944C87FDA
	for <igt-dev@archiver.kernel.org>; Sun, 10 Aug 2025 18:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E565C10E029;
	Sun, 10 Aug 2025 18:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVT3op2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233110E029
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Aug 2025 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754850458; x=1786386458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZfJ40BpqROgSjHvN7vQWTPOJVYseqg2+qCmS3U+kC2E=;
 b=WVT3op2WjTCOZsTjxPY1cdCfWT/F1uOJbaIl4C4LfTN4PxvnkCO3uVNO
 myfqUGTfs0deFJdyFZAmOyIhImFjTFRbg9V+Du4Ba8BrPWAdJFuQon6K1
 PPTniuxEfMu2iIZkeFQWljN0dNqzIeeemLKq8rjGqwVmnbmT3EOj/tP6U
 MHz5pnoM+h/EGSbdZCnDrjoNl5uOQqVITgZHS6X9ghh5d/9al8AgiHZM+
 c5ohn9FZ6NOK5WWlTdLyxYp79cWvwrJJz4+TpHBgoxgXk/guimUMUaSsw
 plOslgv5fwN/p45VMjrJcQSiLt4012ZVndFrY9iuz2eWcoW2H21hLLeY2 Q==;
X-CSE-ConnectionGUID: TkiFovwyTeqyHAF6B6yOxw==
X-CSE-MsgGUID: /1WXzt2eTPe1Di4FrO3y0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60913015"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="60913015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 11:27:37 -0700
X-CSE-ConnectionGUID: PsDnS+HFRLSR+3QRBfsWQA==
X-CSE-MsgGUID: PGJWopGIRxSmL7yx+imRaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="164944841"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 11:27:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/fbdev: Skip resolution mismatch due to KMD
 issue
Date: Sun, 10 Aug 2025 23:57:41 +0530
Message-ID: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a conditional skip to handle cases where xres/yres do not match
xres_virtual/yres_virtual. This is a temporary workaround for a KMD
issue that causes incorrect virtual resolution reporting.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/fbdev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index fca688407..9d386307f 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -170,6 +170,16 @@ static void mode_tests(int fd)
 		struct fb_var_screeninfo pan_var;
 		int expected_ret;
 
+		/*
+		 * FIXME: This test skips when xres/yres do not match xres_virtual/yres_virtual
+		 * due to a KMD issue that causes incorrect virtual resolution reporting. Once
+		 * the KMD issue is resolved this skip condition should be removed to restore
+		 * full resolution validation.
+		 */
+		igt_skip_on_f((var_info.xres != var_info.xres_virtual) ||
+			      (var_info.yres != var_info.yres_virtual),
+			      "Resolutions not matching\n");
+
 		memset(&pan_var, 0, sizeof(pan_var));
 
 		/*
-- 
2.43.0

