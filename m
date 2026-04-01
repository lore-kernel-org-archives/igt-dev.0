Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DF010F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E3D10EDBD;
	Wed,  1 Apr 2026 15:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JG5/f0ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844A810E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058309; x=1806594309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N1etiSNh+6ZqrvfeT9u0t9w2dbxPZRLiFzpvKLUAI+M=;
 b=JG5/f0ftY7kfhKKlFPCG0ur8MiOgEqpJR7fKJoInAx46OkvfQl+KEesy
 9NsSO4DFXGOYybODQ04JQZDKtlBCjOCVaoQp6txN1jAtpISO0GXoRBpdT
 JSMx0fYbT38MxOrzPNZacY2MiYcQiJWL7r2o4oMEeROc/TbB6a7Xl17jY
 A7ntGi4vZjLMBkLsx9EorBNz6xAddWgW1ChQEekaIi869NkSCppCy4yCM
 q7d6m2PyJI+rL2Z5UjQFGVs/HPCttKdtsbDmoOEQBfir2EgCXHvZtDSUn
 xLRNeIHNHivO2U9VXVzl0LIzFKbztX7SQbLkA8oixP4p3ahuF9a1ZD2e5 A==;
X-CSE-ConnectionGUID: mU2lWCjbRCuL97xLFlHlYw==
X-CSE-MsgGUID: Qw95ivfTTI2Y7w3O8363TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988958"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:08 -0700
X-CSE-ConnectionGUID: iz6U36OuR2WYA/Qu0qA/4w==
X-CSE-MsgGUID: fw97SVtxQFa6L2JdWSZbrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960019"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:07 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Date: Wed,  1 Apr 2026 21:36:20 +0530
Message-Id: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

This patch series introduces MST suspend-resume test
to kms_mst. The MST test validates there
is no corruption/blank out across suspend/resume cycles
for all possible subsets.

Note : Subtest is now part of new binary kms_mst
       Didn't change subject to avoid new patch series

Kunal Joshi (7):
  tests/intel/kms_mst_helper: Add kernel-doc for existing function
  tests/intel/kms_mst_helper: Add helper to check for MST outputs
  lib/igt_kms: Fix max_non_joiner_mode_found
  lib/igt_kms: Export get_max_pipe_hdisplay as
    intel_get_max_pipe_hdisplay
  tests/intel/kms_joiner_helper: Move max_non_joiner_mode_found
  tests/intel/kms_joiner: Require boundary mode for basic-max-non-joiner
  tests/intel/kms_mst: Add MST suspend-resume test

 lib/igt_kms.c                   |  39 +---
 lib/igt_kms.h                   |   3 +-
 tests/intel/kms_joiner.c        |   4 +
 tests/intel/kms_joiner_helper.c |  36 ++++
 tests/intel/kms_joiner_helper.h |   2 +
 tests/intel/kms_mst.c           | 349 ++++++++++++++++++++++++++++++++
 tests/intel/kms_mst_helper.c    |  24 ++-
 tests/intel/kms_mst_helper.h    |   1 +
 tests/meson.build               |   4 +
 9 files changed, 423 insertions(+), 39 deletions(-)
 create mode 100644 tests/intel/kms_mst.c

-- 
2.25.1

