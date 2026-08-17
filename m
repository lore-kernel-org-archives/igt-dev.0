Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F9C5CFC1
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 08:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233310E3E4;
	Mon, 17 Aug 2026 08:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNh9aaJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E134710E3E3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786955185; x=1818491185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RH4R27kuwGZg9qdSrXaYVmb5DZpWGe23PB3A13rUzVo=;
 b=DNh9aaJ74iwWS3QdyTCVPHLxNmOEJwWPikOHoo8Z4niwsLCulJdaCjlJ
 AFyDJ94RmLBEAN4GlPTitwFG5bqqp+K/ovGS7P9yXVF2OwduZKzGgtTb1
 2Y2qeIuRZJa7xuYfdI/t+UsfdrRKG+5UI23XRxM2R5Z7InGzYXNbwpaTV
 MEWUYgTf/h6Suzr/o//nAwaXt3l6hb7J/NY93u89SJWP0P5e5zTTVGyIY
 MIz/h8+wTMZFYEABf+3mFUm9eJk1vp+YgQQ8869fIW8bWl5zZYnJpPj4c
 ouWiJGHtJ+PD68DBYtALDHDETgzht3lWsQbZ4SKXalUp41TdBOQ+1rwzN A==;
X-CSE-ConnectionGUID: Z5VVqhbpTBiJnzk8uJbfwg==
X-CSE-MsgGUID: thBKsRT2TfaKroVAGzZ2Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104959190"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104959190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:24 -0700
X-CSE-ConnectionGUID: 7Tn6FLF5QtS5CD5JexWcjg==
X-CSE-MsgGUID: +kqb15yhTmGzez32AKmDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="265463949"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:23 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Date: Mon, 17 Aug 2026 13:56:08 +0530
Message-ID: <20260817082612.1101382-1-sowmiya.s@intel.com>
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
v4:
  - name the UHBR10 threshold and make i915_dp_is_uhbr_rate() a
    static inline in the header to avoid a cross-TU call
  - parse intel_dp_allowed_link_configs instead of the source-only
    i915_dp_force_link_rate list in i915_dp_get_next_lower_rate()
  - avoid the implicit long to int narrowing on the return value 
v5: commit display reset before fallback 

Sowmiya S (4):
  lib/i915/i915_dp: Add UHBR helpers and const-correct set_link_params
  tests/intel/kms_dp_linktrain_fallback: Reset traversed MST output
    count
  tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback
    subtest
  tests/intel/kms_dp_linktrain_fallback: commit display reset before
    fallback

 lib/i915/i915_dp.c                      |  58 ++++++-
 lib/i915/i915_dp.h                      |  24 ++-
 tests/intel/kms_dp_linktrain_fallback.c | 202 +++++++++++++++++++++---
 3 files changed, 260 insertions(+), 24 deletions(-)

-- 
2.43.0

