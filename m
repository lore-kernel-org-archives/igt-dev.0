Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37468C369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 05:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D110E1D4;
	Wed, 23 Apr 2025 05:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHhfpbRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8573610E3FE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 05:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745385080; x=1776921080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6fm+1PyKxwMaCfJ2uFylMjDADowX5/+hl2vILRJJdXY=;
 b=dHhfpbRfNB0axYt2Ra1RpuFrK1u9KmskUoAYaV5QyC3uJ1icV9fHMPfZ
 CwWFC0ny0wqTX+w5W73Tgg9+vQXfUGsx6wvR+8Jpl5n3mFZ0Qz1vMns8w
 Ly/msQsIzROnnlspGAfUH/o2+9jYZTTT/6UOArBTYP4eQpTwLYHKzGE8s
 f9U7hpcck7UAteL/xAeaFOacVGIw432OURTs9jiHR1Jwn0+sLhRbe7gZn
 XpEamhNkeV7R1Czp/k2y89eb6pOocSZ7zDVjlcC4postP7tspeoeoB3o8
 PkRFKIwSnI/HywiST5HoSmiQXrXiqmcejmeJigXngtnR8LlT68Oydj0+W g==;
X-CSE-ConnectionGUID: C5bi+RXuTQelu30dfgeWhw==
X-CSE-MsgGUID: BKQ5iNNfQk+bdZoXXQPbJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47060795"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47060795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:11:19 -0700
X-CSE-ConnectionGUID: ha2b/4Q5ROaYWmWwkKXmKw==
X-CSE-MsgGUID: qrqZ1NxqRPyPgzoyw5495g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136993312"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 22:11:16 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_vrr: Reclassify DRRS subtest under general
 display features
Date: Wed, 23 Apr 2025 10:41:18 +0530
Message-Id: <20250423051118.1622586-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

As DRRS isn't a standalone feature, add a mega feature label to the
seamless-rr-switch-drrs subtest as General Display Features to
highlight its relevance to general display functionality.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_vrr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1e174262c..d371d9d7f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -64,6 +64,7 @@
  *
  * SUBTEST: seamless-rr-switch-drrs
  * Description: Test to switch RR seamlessly without modeset.
+ * Mega feature: General Display Features
  *
  * SUBTEST: seamless-rr-switch-virtual
  * Description: Test to create a Virtual Mode in VRR range and switch to it
-- 
2.34.1

