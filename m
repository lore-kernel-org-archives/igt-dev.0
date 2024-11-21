Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6C2D78765
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B6A10E970;
	Thu, 21 Nov 2024 14:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIZl2AIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1610E970
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198739; x=1763734739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t4qEg71ON//BioqoiXklCCJ4Q9SqCHlbFGw2eUKvKUc=;
 b=YIZl2AIcJP4uH6ZdiGC3hugt4eqlmmLPU+ZYjk1l0HHddtK27yBklynd
 0FPz3gm9sfyn+/gHjtINt615AsKDfimpG+rqYQyI+oxqcllYnObOGFM03
 sMQ0u3k2tOaWkHEb75aMx6vZc27P9GW+MwjR8zL5sO9R8okYBdL1EWdaH
 EP+8Fz2QKVJXam25XaE5RjnHenPpv7f2zdHpucBc6xFFyjh5pnu0NQm1n
 gHvlS2XQSmPMdPoTZ6XRzlBkSBUc6biejJIMLXiPkgVCTB/zszqQIGcKw
 dRKnjpyAVRsiUFFt52jkIRXgns3fg7rB2iRfR/89k2QQcahVllvJJpZjs g==;
X-CSE-ConnectionGUID: J3TXX10ETEa/jxtdLi8rGA==
X-CSE-MsgGUID: 8uHkh8VbQm6OKyegoTlYXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57711124"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="57711124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:18:59 -0800
X-CSE-ConnectionGUID: faPc8FxoTwSH66sJClu23w==
X-CSE-MsgGUID: nQDpjbDsTgiEp0fVfaDDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94710906"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.98.7])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:18:56 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 0/4] Improvements for xe_sriov_flr test and xe_mmio
 lib
Date: Thu, 21 Nov 2024 15:18:47 +0100
Message-Id: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Enhance code maintainability, improve error handling, and provide clearer
debugging information.

lib/xe/xe_mmio: Replace open-coded init/cleanup with existing functions

Use intel_register_access_init and intel_register_access_fini to handle
initialization and cleanup, reducing code duplication. This improves
maintainability and ensures consistency, including handling forcewake
for Xe.

lib/xe/xe_sriov_provisioning: Refactor range handling and logging

Introduce an append_range helper to reduce code duplication in handling
provisioned PTE ranges. Limit debug logs to the first 70 entries for
clarity and improved reasoning. Enhance error handling by propagating
realloc failures.

tests/xe/xe_sriov_flr: Use SKIP for unmet subcheck prerequisites

Handle missing prerequisites by marking subchecks as SKIP instead of FAIL.
This avoids misleading results suggesting FLR issues when tests haven't
started or conditions aren't met.

v2: Handle missing prerequisites by consistently marking subchecks as
    SKIP instead of FAIL when conditions aren't met. (Lukasz)
    Update range-checking logic to iterate only within valid PTE offsets
    based on MAX_WOPCM_SIZE and GUC_GGTT_TOP.
v3: Moved the fix for updating range-check logic to iterate within
    valid PTE offsets into a separate patch.

Marcin Bernatowicz (4):
  lib/xe/xe_mmio: Replace open-coded init/cleanup with existing
    functions
  lib/xe/xe_sriov_provisioning: Refactor range handling and logging
  tests/xe/xe_sriov_flr: Use SKIP for unmet subcheck prerequisites
  lib/xe/xe_sriov_provisioning: Iterate only within valid PTE offsets

 lib/xe/xe_mmio.c               | 10 +----
 lib/xe/xe_sriov_provisioning.c | 78 +++++++++++++++++++++++-----------
 tests/intel/xe_sriov_flr.c     | 21 +++++----
 3 files changed, 68 insertions(+), 41 deletions(-)

-- 
2.31.1

