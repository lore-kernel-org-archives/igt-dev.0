Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7032DC282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 20:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490A110E11B;
	Thu,  6 Mar 2025 20:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj1SU5WI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780DA10E11B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741291287; x=1772827287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOzB4huRTrrzmnumARh/s1GLWQpV7s/N90iMKZ5ILac=;
 b=dj1SU5WI/c5UO52hYqLEaY17mx0OLrllNNIYcN4Khpwze2rXBJsNRQ0+
 LpFlibk4CfAzo8uB5GqdlKgABbZD4LIDU4c1JlcjV9j83TsWhtMDYXnvf
 atLpcUl3cnniziZXMCxNq6KjYu41G5PCMcvxj8V9FMtz9SpsoRfD6oIBE
 cWGLHIUz4axwmG6xmxcAyPrhJ41kIlWBfGX0nmeW3gsCpb1xAiKcsyM/H
 xpBAg3yl+UvucX3Y6IVb71QmPp4bALHrf58vX5F9wtg6Yq9jWHSXfnXdO
 ah2zqcVPCg10/YGJYBzflB/7fsHa46Poli4AVvQEbiWd2+3TgPFH2gCGU g==;
X-CSE-ConnectionGUID: d/+BS4XFRo6LkPrDiGT5pA==
X-CSE-MsgGUID: HYfPKw9kQ42E+i/vqYblGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42211410"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42211410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:26 -0800
X-CSE-ConnectionGUID: bR0/OQSiSmKtOJiWDqE+IQ==
X-CSE-MsgGUID: 2WY0aKkgQg6gL4PjxFEn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149913969"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.143])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:25 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 0/2] tests/xe_drm_fdinfo: Check prerequisites for
 utilization tests
Date: Thu,  6 Mar 2025 21:01:16 +0100
Message-Id: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series ensures that utilization tests correctly check for
required utilization data before execution.

The first patch initially introduced an igt_subtest_group with a fixture
to verify utilization data availability. However, as pointed out by Kamil,
the fixture would still execute even if no test from the group was
selected, leading to potential log messages about unmet requirements when
running unrelated tests.

To address this, v2 introduces a helper function,
require_engine_utilization_data(), which is explicitly
called in each utilization-related subtest.

The second patch remains unchanged and replaces igt_require with
igt_assert in basic_engine_utilization, ensuring the test fails
explicitly when utilization data is missing.

V2:
- Dropped igt_subtest_group, as its fixture executed unconditionally.
- Introduced require_engine_utilization_data() helper to check
  prerequisites in each subtest.
- Extended the requirement checks for the presence of engine utilization
  cycles.

Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Marcin Bernatowicz (2):
  tests/intel/xe_drm_fdinfo: Check prerequisites for utilization
    subtests
  tests/intel/xe_drm_fdinfo: Fail basic_engine_utilization if no
    utilization data

 tests/intel/xe_drm_fdinfo.c | 56 +++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 12 deletions(-)

-- 
2.31.1

