Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7288C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 21:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7C910E023;
	Fri,  5 Jul 2024 21:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7LsP7Iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB7010E023
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720215808; x=1751751808;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BPHslyraYKjj9qSYCdwh5rLdCahL8RwO7GiK2Vj1SM4=;
 b=J7LsP7IwMn8KttNehrSMakNWOvqzx9xXHVIvzUo7X266SDs2n2joz4e0
 pqsZ5dmqSAtZiHyozWN0xakifpmIYCmJacouqPAx1pPVJ113skGCqul75
 Btnc0nHTcRknH4A/bmitNLbD8S5WoWuPCQMc9V9i1tLxs3J2J3aAiwI91
 jIvF6h1dYVD28JEsTB3NwyMNDPPhkK4m6/1pMZBCn6pkGF7FujIss/shr
 Lfcn5OASeGCM2/tW8cdQwUuTY1iLUvY+GNvsGOXcXpFIGDKRcc2M6jyPx
 MWAutULpBn3l8YI+6/i0gofrm+OXVbPwsz6rCntEnoHPNzRQ1zUqZyn/9 g==;
X-CSE-ConnectionGUID: xa0EW9rIT6SvFdHioa5jXA==
X-CSE-MsgGUID: BcZuHd5TSuGZrFEtFA69lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28907011"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="28907011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 14:43:28 -0700
X-CSE-ConnectionGUID: PPzGfp+yRhSlAa0i4vyDqw==
X-CSE-MsgGUID: +5qBgA7hROKxlSYzfEjZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="46902532"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 14:43:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v11 00/15] Intel Xe OA IGT's
Date: Fri,  5 Jul 2024 14:43:01 -0700
Message-ID: <20240705214316.2695090-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

The Xe OA lib's and tools have already been merged. This series now
contains the remaining Xe OA IGT's which are yet to be merged.

v7: Add PVC support in IGT lib
v8: Sync with kernel uapi change to rename xe perf layer as xe observation
    layer
v9: Re-test
v10: Run on Xe2+ only
v11: Fix bug in v10

Ashutosh Dixit (15):
  drm-uapi/xe: Sync with Perf/Observation layer uapi updates
  lib/xe/oa: Add PVC support
  tests/intel/xe_oa: Add first tests
  tests/intel/xe_oa: Add some negative tests
  tests/intel/xe_oa: Add "oa-formats" subtest
  tests/intel/xe_oa: Add oa exponent tests
  tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
  tests/intel/xe_oa: blocking and polling tests
  tests/intel/xe_oa: OAR/OAC tests
  tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open
    close
  tests/intel/xe_oa: add remove OA config tests
  tests/intel/xe_oa: OA buffer mmap tests
  tests/intel/xe_oa: Register whitelisting and MMIO trigger tests
  tests/intel/xe_oa: Drop "xe-ref-count" subtest
  HAX: Add Xe OA tests to xe-fast-feedback.testlist

 include/drm-uapi/xe_drm.h                |  102 +-
 lib/meson.build                          |    5 +-
 lib/xe/oa-configs/oa-pvc.xml             | 1018 +++++
 lib/xe/xe_oa.c                           |   22 +-
 lib/xe/xe_oa.h                           |    6 +-
 tests/intel-ci/xe-fast-feedback.testlist |   40 +
 tests/intel/xe_oa.c                      | 4710 ++++++++++++++++++++++
 tests/meson.build                        |    2 +
 tools/xe-perf/xe_perf_configs.c          |    2 +-
 tools/xe-perf/xe_perf_recorder.c         |    4 +-
 10 files changed, 5843 insertions(+), 68 deletions(-)
 create mode 100644 lib/xe/oa-configs/oa-pvc.xml
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

