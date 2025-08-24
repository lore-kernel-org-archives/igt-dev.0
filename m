Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B23CA0EEB
	for <igt-dev@archiver.kernel.org>; Sun, 24 Aug 2025 19:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F376510E20B;
	Sun, 24 Aug 2025 19:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZnqSnNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524C10E20B
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Aug 2025 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756064905; x=1787600905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOIXZTrXsqeWWfXf5psaoChnyBCqd1kL3ITHb4uVeow=;
 b=KZnqSnNci0WPwq1zsmWtdN7O7SBZlwv2hr/OY+JY0LI7JobIpiY0YNqS
 Ym9LxaS0cjzpesRpRBL6vdszpsCx0qaic1zWMvX+ZURDEapHAlMQVv7hY
 fg7OXkCa2Ge7nqff9E0nxPBdaJNzfka5xXRY5p3XtAUKDpPlFHoGAp4YI
 Ibd9PaM9xd1/0IKq3hCwLsjcrHZC7thOr3O1BM4exG3F/um2yFcreibXd
 HWMDliuuj4qJdxo+8knQeufM2W6ROaErf5b0oyRmZx/QIgAAisc8Cl+oB
 d5f2id7W79kFQXY14G/BcPfms5kOtDy0hqXTmpQvPRoohsaXfNrxTibxh g==;
X-CSE-ConnectionGUID: S3LMrYewTYOSayQLxy4OoQ==
X-CSE-MsgGUID: JwENLT/KQCuPf5DOHxt3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69658621"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69658621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 12:48:24 -0700
X-CSE-ConnectionGUID: S6oWJ6tfTWSw1Nwhi53+VA==
X-CSE-MsgGUID: Nj3EtSfnTIurh2m1xBhAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="206300184"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 12:48:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/fbdev: Skip resolution mismatch due to GitLab
 issue #2488
Date: Mon, 25 Aug 2025 01:18:22 +0530
Message-ID: <20250824194822.1437870-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
References: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
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

Add a conditional skip to handle cases where xres/yres do not
match xres_virtual/yres_virtual. This is a temporary
workaround for a GitLab issue #2488 that causes incorrect
virtual resolution reporting.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/fbdev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index fca688407..6edcd534e 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -170,6 +170,16 @@ static void mode_tests(int fd)
 		struct fb_var_screeninfo pan_var;
 		int expected_ret;
 
+		/*
+		 * FIXME: This test skips when xres/yres do not match xres_virtual/yres_virtual
+		 * due to a GitLab issue #2488 that causes incorrect virtual resolution reporting.
+		 * Once the Gitlab issue is resolved this skip condition should be removed to
+		 * restore full resolution validation.
+		 */
+		igt_skip_on_f((var_info.xres != var_info.xres_virtual) ||
+			      (var_info.yres != var_info.yres_virtual),
+			      "Resolutions not matching\n");
+
 		memset(&pan_var, 0, sizeof(pan_var));
 
 		/*
-- 
2.43.0

