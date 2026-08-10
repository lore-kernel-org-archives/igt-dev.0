Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D4C5AE49
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 13:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECA810E841;
	Mon, 10 Aug 2026 13:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8bXhO03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109B10E864
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786368742; x=1817904742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRHSKQPsS2ANH795zBTpc4lEBgcVSyDqcmaui+ImJWY=;
 b=b8bXhO031P4giy7Zqxe1YoZq1JZl6Fauhlh4oK/l6JqBOS+Oe48L1ffs
 kZ7Gt+1tqoMiJH2u4E4AQREU2fzdPh0/8R7jX+sSpiYXZFteteIKnV6MJ
 ZB1xLX4Yb3660cYLLZA9+oGoSG4Sf4r1eh5HlAPE8LyHapHLDcB3wk4py
 wQLjPbQzKPe3tK9q35FqY8PKQwzYCHVUPjD1pmP+FvmRtLtb6pJzQPdsg
 julTwbD+uYgZuJvUqVQpeIfMfiq9bYm9V4P8nlHZY9mUT+lQXUw4GJx3d
 s8vyjlmtS49Wk/VsAyQpuDF7SUdmOJVK1vGxU6g+jGv3JHHv23cd26wfL g==;
X-CSE-ConnectionGUID: p0ZGqev6Qv297AAyc0u3ww==
X-CSE-MsgGUID: tk2vN5xeS42GmZa8O83+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98396766"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="98396766"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:22 -0700
X-CSE-ConnectionGUID: R4fCujYzTHqqIDYVqgtq6Q==
X-CSE-MsgGUID: +THNHS+fRLaCY3l5gZ76OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266534846"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:20 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 0/3] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Date: Mon, 10 Aug 2026 19:02:08 +0530
Message-ID: <20260810133212.829168-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

    DP 2.x links use 128b/132b channel encoding for UHBR rates
(UHBR10/13.5/20) and 8b/10b for legacy HBR3 and below. The transition
between the two encodings goes through a port-slice reset on the
source side. The existing dp-fallback subtest only covers 8b/10b-to-8b/10b
fallback; this series adds a dedicated subtest for the UHBR->HBR direction.

Adds two library helpers to lib/i915/i915_dp:
  - i915_dp_is_uhbr_rate(): mirrors the kernel's drm_dp_is_uhbr_rate()
  - i915_dp_get_next_lower_rate(): parses the force_link_rate debugfs list
    with proper strtok_r/strtol/errno handling

const char * signature for i915_dp_set_link_params() so string literals
can be passed directly without a writable-array workaround.

Fixes a pre-existing bug where the file-static traversed_mst_output_count
was never reset between subtests, causing all MST outputs to be silently
skipped as "already visited" in a full-binary run.

Adds the uhbr-to-hbr-fallback subtest. The subtest pins the link at the
highest sustainable UHBR rate (stepping down if the cable cannot sustain
the sink's max), forces repeated LT_FAILURE_REDUCED_CAPS failures, and
asserts the rate drops below UHBR10. MST topologies are supported since
all siblings share the physical link. The existing run_lt_fallback_test()
is extended with force_uhbr parameter to avoid ~45 lines of duplication.

v2: Resets MST traversal state per test run
v3:
  - Drop "exercising the port slice reset path" from SUBTEST description
  - Revert unrelated cosmetic hunk in setup_mst_outputs()
  - Single UHBR capability gate using i915_dp_get_max_link_rate()
  - remove duplicate gate using i915_dp_get_max_supported_rate()
  - Fix link rate log units (10 kbit/s, not kbps)
  - Add igt_reset_connectors() to pin-loop early-return path
  - Replace UHBR10_LINK_RATE define with i915_dp_is_uhbr_rate() helper
  - Replace open-coded strtok() parsing with i915_dp_get_next_lower_rate()
  - Hard-assert "fallback not reached" instead of returning false
  - Remove dead traversed_mst_output_count reset in run_dsc path
  - Merge run_uhbr_to_hbr_fallback_test() into run_lt_fallback_test()
  - Use "auto" string literal directly (const char * param fix)
  - Move reset before UHBR capability gate read in run_lt_fallback_test()
  - Document force_uhbr parameter and "clear the pin" reset behaviour

Sowmiya S (3):
  lib/i915/i915_dp: Add UHBR helpers and const-correct set_link_params
  tests/intel/kms_dp_linktrain_fallback: Reset traversed MST output
    count
  tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback
    subtest

 lib/i915/i915_dp.c                      |  58 ++++++-
 lib/i915/i915_dp.h                      |  24 ++-
 tests/intel/kms_dp_linktrain_fallback.c | 201 +++++++++++++++++++++---
 3 files changed, 259 insertions(+), 24 deletions(-)

-- 
2.51.0

