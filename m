Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649CBD711CF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627C10E162;
	Wed, 20 Nov 2024 17:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur3kkFZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09CB10E162
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732124278; x=1763660278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=swN9hG3bxRmmE+yyKg8ekAbRuUnRG5XR28buViRCGiA=;
 b=Ur3kkFZI8zkQyW2l0HIIcCADW9Ja06CblBaZzHlUQHWJTvO3NVbVpWsm
 eRpTc8q2RSupQhVua0LoCiu9M14RNH9yGoaG+36JYrRBCdPopjW/HSzeR
 AP7ajnSfcROsUVI1JbB1Uhqt1472xK1wE8sr5ChzAmGtWca5TtawlYQ5L
 ulpT3+BVf7IFFqv+wJ7RAKKiEAlm9DpA0E7xh4uSvQhn0hGy9goRrGZSi
 RW48k1FPTfxs8rr/4rKjH2Wn4B7U3ms4jp6F/62RQ6p4+RmnFS19dlbhq
 GOrP2osZQlZOU9RbGDJgG2AJxIZgBqufrK5tuBmuKx2Uj/F9heUd/A7po A==;
X-CSE-ConnectionGUID: WBJgVzfzSsuKJRU6eKbvPQ==
X-CSE-MsgGUID: y7fkc+RXQZOGr6eCevA7uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35058693"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="35058693"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:37:57 -0800
X-CSE-ConnectionGUID: a16KjeJcREmL8moz7bzdSA==
X-CSE-MsgGUID: nnJ3wn9SRraXydGA8umzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90395662"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:37:54 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/3] Improvements for xe_sriov_flr test and xe_mmio
 lib
Date: Wed, 20 Nov 2024 18:37:46 +0100
Message-Id: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
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

Marcin Bernatowicz (3):
  lib/xe/xe_mmio: Replace open-coded init/cleanup with existing
    functions
  lib/xe/xe_sriov_provisioning: Refactor range handling and logging
  tests/xe/xe_sriov_flr: Use SKIP for unmet subcheck prerequisites

 lib/xe/xe_mmio.c               | 10 +----
 lib/xe/xe_sriov_provisioning.c | 78 +++++++++++++++++++++++-----------
 tests/intel/xe_sriov_flr.c     | 21 +++++----
 3 files changed, 68 insertions(+), 41 deletions(-)

-- 
2.31.1

