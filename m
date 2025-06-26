Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C55C7EE32
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 10:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4C10E031;
	Thu, 26 Jun 2025 10:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOOwJDvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5F410E031
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750934645; x=1782470645;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uDUGdzcXrlJkpoXE0p8+FbJqVFxY2RUJu8P4phHNUHU=;
 b=LOOwJDvJWTe53AQJmsNVU9x1DPiit8WTxK9Jmsx+Qc3du66yElVbpL71
 0tA0VbjA8Ms3y+VjzFsNJkHxxQMc187KKL5SNeH/H5KHHNGTIVog8x3qS
 h/o8MF5EfQOjIynxVehFfWxGXTzc7vSTV7Jby6EXZYeoOP1vjpaZ68mGm
 ErzrSJfJmvVGBRrh/EssgvzDVgQb8dpqNILwDn2HF5goCa3Ui1FeIUan+
 S11fk3ED90Ddczg1/IiUhU79wh60eMockQHMdyg+G/PYngVwfNhSfW/NQ
 5QXl2JXQEBvvnLs+DsrhKrxiGe+rRQL5wK4HfRNNtt7AnNGK/x4kq1uL1 w==;
X-CSE-ConnectionGUID: pl44eKEITvGb/Wz38zTprA==
X-CSE-MsgGUID: uJkbuQVwSyyNMaL3YU4TPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53164567"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53164567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 03:44:05 -0700
X-CSE-ConnectionGUID: 7iStuwX/S36rEmBSx7uckg==
X-CSE-MsgGUID: E1XL2XbYTSK//6uSy+GjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="189671178"
Received: from unknown (HELO himanshu-H97M-D3H.iind.intel.com) ([10.223.55.10])
 by orviesa001.jf.intel.com with ESMTP; 26 Jun 2025 03:44:02 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 jari.tahvanainen@intel.com, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_live_ktest: Adjust test documentation
Date: Thu, 26 Jun 2025 16:14:01 +0530
Message-Id: <20250626104401.19370-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Change mega feature and sub-category for xe_eudebug subtest so that it
can be fetched under EUdebug Feature.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 tests/intel/xe_live_ktest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 164c90501..d64d6a12c 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -40,6 +40,8 @@
  * Description:
  *	Kernel dynamic selftests to check eudebug functionality.
  * Functionality: eudebug kunit
+ * Mega feature: EUdebug
+ * Sub-category: kunit eudebug
  */
 
 static const char *live_tests[] = {
-- 
2.40.0

