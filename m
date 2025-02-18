Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB9C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 14:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BCF10E70D;
	Tue, 18 Feb 2025 14:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7ZF483t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2010E6DB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739889942; x=1771425942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vsviiTrPxM4rdr1z3fYDnt0NNiB5UlALmBora+jslq8=;
 b=L7ZF483tFh1KrWy0gd7/BFxTAtQUhG1iq+wiii3vBUaJLrChPDerYhO3
 Bcs/Z1W2JNx6mc3BcXZmoIhehnpE7cRsumh+aGp1d5xcIYuj5KW9yLHrR
 SPm5Nh7vhibvvzmqUhvJNXoXDwU4bTdDAyhQzTyAD+xpJErkEUIjenqx7
 P0uvgw6O4aoKuzQPa3CazAMCRpJLtuc/AkE1lKzGL2FJdaczo1EqYP5g3
 TM6E4U8gO2zdFpWqlLYq3JiK7IBH9uznCFMlEopdRb0oDEnEK5ofBHCeS
 vR5VzpFTH8x7tcwo4LGRjuxFi5/WpwEjlz7QKnma/Oi4HbOHspaArFwYR g==;
X-CSE-ConnectionGUID: ZxGB4TYYRKSkKsSgHSzV0A==
X-CSE-MsgGUID: 6ye7U+yzT+Gcd0UgehAiOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40296272"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40296272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:45:41 -0800
X-CSE-ConnectionGUID: PBUTABy5QVOD4KwDOfJAEA==
X-CSE-MsgGUID: X1TY0YAMTvKiBPr69tap4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="145268915"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 06:45:40 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] add test to validate uhbr/non-uhbr over sst/mst
Date: Tue, 18 Feb 2025 20:31:17 +0530
Message-Id: <20250218150121.2132934-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add new test kms_dp_link_training to validate both
UHBR and non-UHBR link rates over SST and MST configurations.
Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
to check if the link rates match the expected UHBR or NON-UHBR capability
and whether the outputs are MST or SST.

Kunal Joshi (4):
  tests/intel/kms_joiner: refactor set_all_master_pipes_for_platform
  tests/intel/kms_joiner_helper: add helper for joiner-related functions
  lib/igt_kms: add function to set link params
  tests/intel/kms_dp_link_training: add tests for UHBR/NON-UHBR over
    SST/MST

 lib/igt_kms.c                      |  33 +++
 lib/igt_kms.h                      |   2 +
 tests/intel/kms_dp_link_training.c | 384 +++++++++++++++++++++++++++++
 tests/intel/kms_joiner.c           |  15 +-
 tests/intel/kms_joiner_helper.c    | 181 ++++++++++++++
 tests/intel/kms_joiner_helper.h    |  20 ++
 tests/meson.build                  |   5 +
 7 files changed, 627 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/kms_dp_link_training.c
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h

-- 
2.25.1

