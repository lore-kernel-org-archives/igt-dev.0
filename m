Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DCC31D97
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F187E10E31C;
	Thu,  4 Jul 2024 01:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iS+VBA1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A6510E00B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055506; x=1751591506;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0gghNt4mxjWpNqTic47gdHk0LBWnzcXJoCndTDE1Wnk=;
 b=iS+VBA1IgV6N65daZk26HGJYdkKdQndpWuq+jKGUDVRV2YG42IeuWDbo
 UVSmSUEGaZuaJdLy4u3FdQ9WbnCZCpm6KvSyyhm1i92LLXwnuXL7GVz5q
 WVv9XZDIny2XzulT8c+zttC6q8aIJhL1o3kaKhkWKOchG1SVL//mOOEWN
 0JZ8X5s8tOeffCvNbJluKkcnNs+QCTKnsO0p/VT5QqnbiTUkJYnCnXRX8
 GN4BetmhhVe4gTwuhhhCw73+V0Ww/nQR8ua1Sy6WLGYAZiys5ehrQujur
 PeQia+pJOCEEY803CcXdOHVtyKNLQfmWmGAqswB8dg/zueuc3jY+v54YJ g==;
X-CSE-ConnectionGUID: YDV39GipRzivn/46hTlhxg==
X-CSE-MsgGUID: 621sfwxgQ++vw0Yr+eKGnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450008"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
X-CSE-ConnectionGUID: XBj+MxfFTNS6fagbL+bXPA==
X-CSE-MsgGUID: 4b5jGTgkR8mkPapU/LmlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320125"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v8 00/15] Intel Xe OA IGT's
Date: Wed,  3 Jul 2024 18:11:27 -0700
Message-ID: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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
 tests/intel/xe_oa.c                      | 4707 ++++++++++++++++++++++
 tests/meson.build                        |    2 +
 tools/xe-perf/xe_perf_configs.c          |    2 +-
 tools/xe-perf/xe_perf_recorder.c         |    4 +-
 10 files changed, 5840 insertions(+), 68 deletions(-)
 create mode 100644 lib/xe/oa-configs/oa-pvc.xml
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

