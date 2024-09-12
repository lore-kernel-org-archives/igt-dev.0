Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE753EED606
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051210E229;
	Thu, 12 Sep 2024 14:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEnmj9/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A5310E229
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149884; x=1757685884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0bmWl7/LbmpFI/PsAOFP6hv80kW/xE2gRorz5G521EY=;
 b=CEnmj9/o2FRahdeWR089nuh9LCu8otKCqIY34habNlTl/Zye+Q4zoeya
 2bhX0nc7/IpOqYrmd7EVDDJzeK4NgsAB3fKpZdQhK6xJjYIZqPd/wfqAR
 +e2FT9I3F2Pe2u/T9JS8w7ik8UtXSSK5y4m+vCP083M6uX6eTrl60za2J
 lBGX+0K7wpKjIHCe1KQaMth0iDpkRKyLSPywaEn3LHicUohE+glRt1/Uy
 06rkdgKB3NFT1U82y+l9+7wBJIuP3y8gfwCCgSVDZvCRcr2I+f/9dRHgj
 EukHotJ+4Va02ZKSalMEHNj2t10h7u6UFRFwuZBh5yxezTQpO73DuTMII A==;
X-CSE-ConnectionGUID: 0E/uP/VaQDuAFi3Q7qhpjw==
X-CSE-MsgGUID: dkgk2azKRFmLxBtm+4iXcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24538949"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24538949"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:04:10 -0700
X-CSE-ConnectionGUID: KDylNzGKRPigyGJb8Uc3oQ==
X-CSE-MsgGUID: xBcC1W10SDuI+1kZfC533Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67425335"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost)
 ([10.245.244.245])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:04:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t 0/1] relax doc generation for non-compiled tests
Date: Thu, 12 Sep 2024 16:04:00 +0200
Message-ID: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

New tests added with conditional compilation result in error reported
when generating testlist. For example, with a recent series with new
eudebug igt tests from here:
https://patchwork.freedesktop.org/series/136623/
("Test coverage for GPU debug support")

when --exclude-files option was removed from version 6:
https://patchwork.freedesktop.org/series/136623/#rev6

then compiling with testplan report warnings:

xe_eudebug.testlist: Testlist file not found.
xe_eudebug_online.testlist: Testlist file not found.
xe_exec_sip_eudebug.testlist: Testlist file not found.
Warning: Documented igt@xe_eudebug@attach-debug-metadata doesn't exist on source files
Warning: Documented igt@xe_eudebug@basic-client doesn't exist on source files
Warning: Documented igt@xe_eudebug@basic-client-th doesn't exist on source files
[...rest omitted...]

and exits with an error.

Relax that check to only report error on missing documentation, and treat
new added tests without a compiled binary as a new tests under development
or as tests outside a compilation scope (such as chamelium). This should
allow to have new tests in documentation and track them.

With dropped --exclude-files patch and dropped changes in docs/testplan/meson.build
generation of testplan succeeds and in report it can be find:

[1897/1905] Generating docs/testplan/xe_tests.rst with a custom command
xe_eudebug.testlist: Testlist file not found.
xe_eudebug_online.testlist: Testlist file not found.
xe_exec_sip_eudebug.testlist: Testlist file not found.
xe_eudebug: No binary found, test was not compiled.
xe_eudebug_online: No binary found, test was not compiled.
xe_exec_sip_eudebug: No binary found, test was not compiled.
Info: Documented igt@xe_eudebug@attach-debug-metadata don't have a binary xe_eudebug
Info: Documented igt@xe_eudebug_online@basic-breakpoint don't have a binary xe_eudebug_online
Info: Documented igt@xe_exec_sip_eudebug@breakpoint-waitsip don't have a binary xe_exec_sip_eudebug
[1898/1905] Generating docs/testplan/i915_tests.rst with a custom command
[1899/1905] Generating docs/testplan/kms_tests.rst with a custom command
[1900/1905] Generating docs/testplan/intel-ci-tests with a custom command
[1901/1905] Generating docs/testplan/xe_tests.html with a custom command
[1902/1905] Generating docs/testplan/i915_tests.html with a custom command
[1903/1905] Compiling C object runner/runner_test.p/runner_tests.c.o
[1904/1905] Generating docs/testplan/kms_tests.html with a custom command
[1905/1905] Linking target runner/runner_test


Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Kamil Konieczny (1):
  scripts/test_list: relax treatment of non-compiled tests

 scripts/test_list.py | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.43.0

