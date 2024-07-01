Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A301C27C4F
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 02:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441D10E2E5;
	Mon,  1 Jul 2024 02:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpMxsxzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133C510E2E3
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 02:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719802393; x=1751338393;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgzN4qwyj5MytFpggvuq1R/pXwDUD1fAvOGPiex2Q8s=;
 b=OpMxsxzLOw/rA9P8ueYWzVWx8mDTSj3/8N5zdhXXqbRB9uOeVeWohqVk
 lkH03tTkCHFTZVNZdbqfNP0ufJ4QU2Mos4ZPDOdi6/0blvMGkLbT3pDxZ
 pSUFghn1m7ZwOqYJvAiLOUQh0Bvp3ELo7YfPX58N/XD6YBIlQWgsgCZyx
 fi94/s6rVlyWfy0jjUL09wlbiuTBKaeZkWjvD2zHwlTVJmUsaT2q2LPr/
 yJYGm8vcnpu8JUH1PaqrVlwB6b+jL4ggFLlcDWkpUnrx9gBCBFxiszhKk
 fFWNNLU8RRGK0xQvEmWTQEhT2e5xLEn7AyrMHqo54uMG0hAU63hK9K75P Q==;
X-CSE-ConnectionGUID: BbChUwbVTNS8QCyMMvltlw==
X-CSE-MsgGUID: dEckLq2rRQmI7QXbT036+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="16574736"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="16574736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 19:53:13 -0700
X-CSE-ConnectionGUID: mieFcZh4T0aqJOQqasj5GQ==
X-CSE-MsgGUID: ypTHVQ23R4uQpAftPFunQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46101645"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 19:53:13 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 00/14] Intel Xe OA IGT's
Date: Sun, 30 Jun 2024 19:52:55 -0700
Message-ID: <20240701025309.2416653-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (14):
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

 lib/meson.build                          |    5 +-
 lib/xe/oa-configs/oa-pvc.xml             | 1018 +++++
 lib/xe/xe_oa.c                           |    4 +
 lib/xe/xe_oa.h                           |    2 +-
 tests/intel-ci/xe-fast-feedback.testlist |   40 +
 tests/intel/xe_oa.c                      | 4707 ++++++++++++++++++++++
 tests/meson.build                        |    2 +
 7 files changed, 5774 insertions(+), 4 deletions(-)
 create mode 100644 lib/xe/oa-configs/oa-pvc.xml
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

