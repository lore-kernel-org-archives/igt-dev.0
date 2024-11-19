Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7503ED4417A
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 15:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2622410E66F;
	Tue, 19 Nov 2024 15:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/7RZ3dF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0A510E66F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732031748; x=1763567748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxeT5PaPjNxzHLRbCJJVycYcLOmhhp7sV/ThJPky2Do=;
 b=I/7RZ3dF4eldFB9oIE6hR8c5MzSAi59oVNB3pOSzvySm8qHIW10EwVog
 q5te/4tHpTlErVvsVqqhHwTGggkQCWJglz3PrZrtVC98lmKtGorp4r6+f
 FzKvWI/lX8G6P+e1Pzdw85zBch2+Qzzo5vbDDi5LCI0eqZLLZL5KRmz3Z
 9kWAtOg+RlGQnzhsTGDcdSPwGc47nglpHjUbfyxEvjkGC0CbSoamm3u48
 fyT0uTTrvYzMfMLaSacmv5J43hL/6VrGd8465UsrB8dXU0i1kCC4Dw4IW
 OvbC2S/zcknWwZLvMB1YohuuiC+NFnLNDy9+Vwe6b5fg4/UG0LWadf5Tl Q==;
X-CSE-ConnectionGUID: dM/sK5ujRTyWzCTzaPWOBg==
X-CSE-MsgGUID: SpW/p2RbRQ6mg1ZJUhLwzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57448825"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="57448825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:55:47 -0800
X-CSE-ConnectionGUID: orKzNCXWT16kYLNbdd2rcA==
X-CSE-MsgGUID: 4/7US1aETWK0TpwC7nW99g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127126868"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:55:44 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/3] Improvements for xe_sriov_flr test and xe_mmio lib
Date: Tue, 19 Nov 2024 16:55:35 +0100
Message-Id: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
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

tests/xe/xe_sriov_flr: Improve clear-ggtt subcheck initialization

Mark the ggtt-clear subcheck as SKIP when prerequisites, such as scanning
GGTT provisioned offsets, are not met. Asserting in these cases falsely
implies that FLR is broken, while the test has not even started.

Marcin Bernatowicz (3):
  lib/xe/xe_mmio: Replace open-coded init/cleanup with existing
    functions
  lib/xe/xe_sriov_provisioning: Refactor range handling and logging
  tests/xe/xe_sriov_flr: Improve clear-ggtt subcheck initialization

 lib/xe/xe_mmio.c               | 10 +----
 lib/xe/xe_sriov_provisioning.c | 71 ++++++++++++++++++++++------------
 tests/intel/xe_sriov_flr.c     | 11 ++++--
 3 files changed, 57 insertions(+), 35 deletions(-)

-- 
2.31.1

