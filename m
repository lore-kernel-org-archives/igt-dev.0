Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB2C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9410E2A5;
	Fri,  5 Jul 2024 18:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHFHOQWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751D10E1AD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720204000; x=1751740000;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fkn2JsuywD3uHcvxridfLW9FPRHFbeSqN9JUbSZpaRA=;
 b=kHFHOQWtVq6AdeGTL7GCJkmmXZY3TWA5MWnF1MZv6r2ggNZvenrqnB5U
 weJw1wOSggSijObEVxsbHpkEXnyhwKP2FJ3oiRp2sxzPnVv+zpPmS3oB2
 cHKxet/CfJgGZnSPulzGIJX71A5Xex8O1yjQqBP1phZkIthydHa3itLXq
 LrAAa2Z438OVjVCm2PQzjUTU7XKLva+nDlwNFPrzeaTvcX5ViFxNSMY1s
 i8bCR0ygiNuMyifHrC1gXbm16NykUvo4IsQyY/5Ei9p/A9cd8TJO/De2I
 fqFFvJjhqBo/i58vD3UZc8BFQLTqBxwRyAr5q5py8pscAhfCKLT1jn05o Q==;
X-CSE-ConnectionGUID: odlwJxqYR9S0+9ymOS4/MQ==
X-CSE-MsgGUID: mFyzh1faT5SVBu/m0h4lew==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17146537"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17146537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:40 -0700
X-CSE-ConnectionGUID: XrWSa6sMTbyIQCbyZFJ5GA==
X-CSE-MsgGUID: dIaP1Ek3T6ql+wPgspoMvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="47011690"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v9 00/15] Intel Xe OA IGT's
Date: Fri,  5 Jul 2024 11:26:21 -0700
Message-ID: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
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
v9: Run on Xe2+ only

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

