Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB213C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 12:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD5B10E45A;
	Wed, 14 Aug 2024 12:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2faxrKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A854210E45A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723638493; x=1755174493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IOLRo8J1gvfTNyZXqN0fXypIni5tpczut+J3YK++ijk=;
 b=C2faxrKLKNokxUXL96uPz3SCeslsN1ga/I7Gozm5ihMsrbHq5X/gdeIz
 bG0vBMxox68lLPl6S5vRcyslBNp9lwwORkwfbjca+cvJyNcYrg8rwlWAM
 OkQfVDViOVBTgTqwH9UOpDdPPbe8WbNlPnpKU7zRQJROGQvU2ao8ErFgW
 tx1dXEAcURoWKI7NgO/tz5FskI4BKHiMgpTryBIkkfqQ3Y5RYXJDxiUiX
 d8lS3ckkUml8dfVDCkEVM4nYRGGDxXypeu9ZVlZeT4m62RiPW66LG8vJD
 afQnpfWZIVoL6h4+NTdAOLLGHF9Q6lkjMV+HpjxJpPj7FlBTf0COebLTT Q==;
X-CSE-ConnectionGUID: R8HOBUyEQ8i+xdtvisWLeQ==
X-CSE-MsgGUID: of3N8AXjRhi5HHx4KOTGPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33256518"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="33256518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:28:12 -0700
X-CSE-ConnectionGUID: KcWf0cifQU2XDCxbnDf0aA==
X-CSE-MsgGUID: ijGADdb+Sq6Ls5YgzncjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="59758293"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa008.jf.intel.com with ESMTP; 14 Aug 2024 05:28:09 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, himanshu.girotra@intel.com,
 riana.tauro@intel.com
Subject: [PATCH i-g-t,
 v6 0/2] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt
 test in xe
Date: Wed, 14 Aug 2024 17:58:27 +0530
Message-Id: <20240814122829.3878605-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Adding preempt_timeout test in xe similar to i915 to check preemption
for different preemption_timeout like 50, 100 ms

v5: removing random engines using using hwe from gt and class according
to lib changes in igt_sysfs_engines in igt_sysfs file, correcting
comments,including and sorting system headers

Adding test in fast_feedback to check Bat runs directly to check test success before full
run

Nakshtra Goyal (2):
  tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_sysfs_preempt_timeout

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_sysfs_preempt_timeout.c   | 219 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 222 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

-- 
2.34.1

