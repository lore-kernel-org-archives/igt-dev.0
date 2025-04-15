Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DF7C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 17:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1692710E805;
	Tue, 15 Apr 2025 17:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqzTyePn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E079F10E805
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744736536; x=1776272536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CUxp2fFHHUz3n5G4EaluMRKQFiYPoBVGI2J36E9ikhQ=;
 b=iqzTyePn077qXHDNO1n8O6HMd1KIiGy2G5MfF1IZ7lqA03AWftUappTY
 CnkDxN8IGPZdCblzYIZNxJiNhQzZ/s6UCXs9kMNSTu4Vjkh7mQCxc2hE8
 TzDIn1Pqv9DJOB0qOu9AXaxQDcWzM9t3CN8K2Hs5qMzRg13P+iQ9tdoHw
 19GeaRwCPwruNFKSUitNJpUtQcExI66iHt/PTBlV32w20OkUv2ljDzxZz
 /fzO6CBhUraqLJfgmVRxTVa07H6r3UDgd6tSixlIlCbsfxHEV8Ln6pXe6
 HY0D0nFqlZ5oOF+wbmP7hemtZizwYl+L9MckBwTSlEUUnKtKzPiB4ev0U g==;
X-CSE-ConnectionGUID: EvaZKNcAT9mHuKXjp2C5iA==
X-CSE-MsgGUID: bdgxsyhvS7mVx5uggISl/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33876445"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="33876445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:15 -0700
X-CSE-ConnectionGUID: GPE3psowRrmaSZ0EFnkBdA==
X-CSE-MsgGUID: AqIAABhqRDW+z8/+PRWuUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135030420"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:14 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v6 0/2] rename drm_fdinfo into i915_fdinfo
Date: Tue, 15 Apr 2025 19:02:06 +0200
Message-ID: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

      This test opens i915 drm card and will not work for other drivers.
Hence rename it to avoid confusion.

See also discussion at
https://patchwork.freedesktop.org/series/139451/
i915/drm_fdinfo: Quiesce GPU prior to running some tests

v2: corrected Tvrtko e-mail and corrected xe.blocklist
v3: squashed patch 2 into 1, resulting in removing drm_fdinfo
  from xe.blocklist, added r-b (Lucas)
v4: corrected dependency for lib in meson.build (Kamil)
v5: drop sorting other tests in meson.build (Kamil)
v6: use i915_drm_fdinfo as there is already xe_drm_fdinfo
  (Lucas), fix documentation in TEST: (Kamil)
  changed HAX patch to test only new renamed test (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Kamil Konieczny (2):
  tests/intel: rename drm_fdinfo into i915_drm_fdinfo
  HAX/DO_NOT_MERGE: test i915_drm_fdinfo

 tests/intel-ci/fast-feedback.testlist         | 28 +++++++++++++++++++
 tests/intel-ci/xe.blocklist.txt               |  1 -
 .../intel/{drm_fdinfo.c => i915_drm_fdinfo.c} |  2 +-
 tests/meson.build                             |  4 +--
 4 files changed, 31 insertions(+), 4 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_drm_fdinfo.c} (99%)

-- 
2.49.0
