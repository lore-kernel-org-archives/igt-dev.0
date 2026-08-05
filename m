Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34874C55822
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 08:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A1C10ED87;
	Wed,  5 Aug 2026 08:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMu2/nX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4821710ED8F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785919479; x=1817455479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ugR92T6gdNtPSDapAN7GoAeSeBQG9wmAMlC25WkHK/o=;
 b=eMu2/nX4yzvWPa/Sur5qCoeS3vOgfh0MNkeUISQgBxQffBg2sFwrOqZD
 JaXHi+BEc9IqSTzE39q55zcGqfplwFcAysAkrEzf+T2Uh5zC8xwzI7ju+
 Fjb5A1l2EIpg+ajyOtocdsr1ZGxi9MtfWU0fb/rqFWrKG5fj82PpqpVKV
 uYftSHlKP7GtrZ9qh2JSFShb/tZdi0nfMLfvKYaNVC/NdFeSbHmnhSw+6
 yTtN644g7A+w+s5/CeNOP9D1nGjyAj1TPOCLlF4U/B2CYAqnkytZnR6PQ
 8vMMQrQplzaBidItXpdpuub6iE/3S6pp2BlzE7xz+hMw1yVAcj9W9i9x0 Q==;
X-CSE-ConnectionGUID: YfDOGKo1SDCqVSZhyIfiLQ==
X-CSE-MsgGUID: nGJC0V+TTBC1M6m7hV1bNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97647235"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97647235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:39 -0700
X-CSE-ConnectionGUID: RPofvLFESFul6RE+8BHjDA==
X-CSE-MsgGUID: uHtc5NRaSLexNf+/8Y+K7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="261186763"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:37 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 0/3] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Date: Wed,  5 Aug 2026 14:14:24 +0530
Message-ID: <20260805084428.708501-1-sowmiya.s@intel.com>
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

DP 2.x links use 128b/132b channel encoding for UHBR rates (UHBR10/13.5/20,
i.e. link rate >= 10 Gbps) and 8b/10b for legacy HBR3 and below. The
transition between the two encodings goes through a port-slice reset on the
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
  lib/i915/i915_dp: add UHBR helpers and const-correct set_link_params
  tests/intel/kms_dp_linktrain_fallback: fix MST traversal state leak
    between subtests
  tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback
    subtest

 lib/i915/i915_dp.c                      |  62 +++++++-
 lib/i915/i915_dp.h                      |   4 +-
 tests/intel/kms_dp_linktrain_fallback.c | 201 +++++++++++++++++++++---
 3 files changed, 243 insertions(+), 24 deletions(-)

-- 
2.51.0

