Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDCCCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 15:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B600410E630;
	Tue,  4 Nov 2025 15:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/u34b13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A010E62F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762270322; x=1793806322;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8oGD20X/oMqtukpc0kYZqbeHTiJvJQskhjjfQyTm4rA=;
 b=Y/u34b13q7JO7HwBIfcQlmwqe4N7B0Al1nkqgrZLu28tk9rWN87iOqLE
 h9v286aE4j+431D6TKUH/iR/bPnnC530dXSa6XVIQIbTZW6P3TwqjO92w
 UnbRwTpKbWrefQ2Y14mIQf9F0ArGVAekMZizb97lh02kL+dfqFJuuKd4F
 kCoeA1Q+RCYujfdDEUPcaWIZ1gLVDi0BcaUHUNsXhfHGbQ7Tm/uzM135m
 rpDu8kPIHPTzdjNjnI6SARtdKqNYBbmXYG7d6kflTBifNQ33jMbOzWzhb
 XzGWEjD0PN/qY0PuAhYd/AMFsv0m3MMakokQZ1sjbRV5GNQkTOZFH9v0o Q==;
X-CSE-ConnectionGUID: 8/e4jzTIRt28Gr7s+XIVpQ==
X-CSE-MsgGUID: L7rJUfZpS7OQUmYEFssXtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64272366"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64272366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:32:01 -0800
X-CSE-ConnectionGUID: +f5NIlW1Q3WP96JN9ZvDBQ==
X-CSE-MsgGUID: JtyFtlpMSZ6XCjFKJVQkag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186480253"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.72])
 by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 07:32:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 0/7] Madvise feature in SVM for Multi-GPU configs
Date: Tue,  4 Nov 2025 15:31:52 +0000
Message-ID: <20251104153201.677938-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series adds comprehensive SVM multi-GPU IGT test coverage for
madvise and prefetch functionality.

ver2:
- Test name changed in commits
- In patchwork v1 patch is missing due to last patch was not sent

Cc: thomas.hellstrom@intel.com

Nishit Sharma (7):
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU cross-GPU memory
    access test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU conflicting madvise
    test

 lib/xe/xe_ioctl.c             |     40 +
 lib/xe/xe_ioctl.h             |      5 +
 tags                          | 263672 +++++++++++++++++++++++++++++++
 tests/intel/xe_multi_gpusvm.c |   1379 +
 tests/intel/xe_multisvm.c     |     41 +-
 tests/meson.build             |      1 +
 6 files changed, 265100 insertions(+), 38 deletions(-)
 create mode 100644 tags
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

