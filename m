Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A852C88E56
	for <igt-dev@archiver.kernel.org>; Sat, 12 Sep 2026 20:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8BF10E00B;
	Sat, 12 Sep 2026 20:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjRSZMuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C65610E00B
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Sep 2026 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789243790; x=1820779790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rWngnMW1Hp3B7ntUl3fZj3di85qkEsfkcGlQ/2MtTvw=;
 b=OjRSZMuo8Plnl9VlU3F6ofVX73RewuIVou1ztI83toLcQRofei9a6R2e
 8pN6Ok2p/nbUyD0bPtX+7odUokEeYaFamLC3FXzr9IFuSRJzens0Xy0Eg
 xmROKsHEfJkfr3qwRsyNvMk3xhjPvpj7jQusMcHtWreDKPT0ejG+Zmuri
 DOaZ6+AmjjhrsjhIarkf4dfQOTKBHc2Q4tHsX8461pP/VeG680JoVJ4fP
 W9i9YjidMI9asZ8cfL0Zi6iXlkHT8utlMcd4k5yJdxkB/T0KNVXVl0fPt
 JGD1yBmnhnVJ68pv5sT3d6bW4UNbSuI5N82vxzeV68g2kjSGGy1E4rKJt A==;
X-CSE-ConnectionGUID: Tk0VBVICS3GLbvtcgT34JA==
X-CSE-MsgGUID: idwHsv/aSaSOOtKxhYim0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89682407"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89682407"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 13:09:50 -0700
X-CSE-ConnectionGUID: 2lC9CvzmQcu6LKS5uuY6VA==
X-CSE-MsgGUID: qAeGY9M+S8SbyMkJsxDCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; d="scan'208";a="274162367"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 13:09:48 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 4/4] HAX patch do not merge
Date: Sun, 13 Sep 2026 01:39:43 +0530
Message-ID: <20260912200945.3263106-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
References: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
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

HAX patch do not merge.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 59d1cff2e..1dd725816 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -67,6 +67,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@cmrr-desktop-mode
+igt@kms_vrr@cmrr-video-mode
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@xe_ccs@block-copy-compressed
-- 
2.43.0

