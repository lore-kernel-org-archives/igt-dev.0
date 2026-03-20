Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C4108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40310E97C;
	Fri, 20 Mar 2026 10:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RF7hgJYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57EE10E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003177; x=1805539177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5hRcJ0+/1Ct3Zh8xP4j6dscYam6Gv+JuvgFvCfIqCs=;
 b=RF7hgJYPTBRDbmrzn332xsmdZ7p/AcR7Rayva4m20gKXAJ9e4hZcgGqE
 1uOPpeGSjeqG0EQ4O+iJ1oPgvRKnbSmo8U6VUW5daMo/uKN2blQW+ysJl
 +ItKES9hSfr7o3uIcsxLWGFB6oeosXBQn9unVGSf6fVNKizdTp8vp0vl3
 xc0ux8xYcBHrbTCy8b1Eyv6VHtgXYGvX5WaL0VF90KBjDMLJEdbPXbutv
 VMZZyP6n0ygiGW51+CRcIb4e2IrtrPVR2poifAfOnYJL3ZwPq0w9Y+RSs
 PRqEPTFujVFj532XGAg82UzIXd4JOY0itlnJMees5SfAN8PxNFwPFq7th w==;
X-CSE-ConnectionGUID: OuUuREDjQUi4poWEU+OWmg==
X-CSE-MsgGUID: 7F297eg4TECqJsWJTinSsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75158992"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75158992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:36 -0700
X-CSE-ConnectionGUID: 8gE/Xxz3Tsmh6XTazIG5hg==
X-CSE-MsgGUID: HNP1PN+0SwapH9WZXrLu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222473322"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t v2 00/11] Prepare for returning NULL from
 igt_crtc_for_pipe()
Date: Fri, 20 Mar 2026 12:39:20 +0200
Message-ID: <cover.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

v2 of [1]. Patch 1 dropped, as it was handled through other means. Commit
messages amended slightly here and there to explain the logic.

The idea is:

1. In this series, we check crtc->valid for each CRTC returned by
   igt_crtc_for_pipe(). It currently always returns a non-NULL CRTC, but
   crtc->valid may be false. Such CRTCs should never be used by tests,
   obviously. So we check that here, to ensure the tests are sane. (Plus reduce
   igt_crtc_for_pipe() usage in general.)

2. In follow-up, sent separately, we change igt_crtc_for_pipe() to return NULL
   instead of igt_crtc_t objects that have crtc->valid == false, *and* change
   all the crtc->valid to just !NULL checks. After the series at hand, this will
   be a non-functional change.

So the point of this series is to do the test crtc->valid sanity checks commit
by commit for easy bisectability in case there are any issues. After a few more
patches, we'll only ever have valid igt_crtc_t objects around, and can simplify
more.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1773659680.git.jani.nikula@intel.com

Jani Nikula (11):
  tests/amdgpu/amd_multidisplay_modeset: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_cdclk: use igt_next_crtc()
  tests/intel/kms_joiner: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_joiner_helper: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_pipe_b_c_ivb: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_pipe_stress: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/kms_bw: fix misleading indent
  tests/kms_bw: clarify what's going on with proper variable naming
  tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
  tests/kms_explicit_fence: store igt_crtc_t* instead of pipe in data
  lib/kms: convert igt_crtc_for_pipe() into a proper function

 lib/igt_kms.c                           |  8 +++
 lib/igt_kms.h                           |  8 +--
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +
 tests/intel/kms_cdclk.c                 | 10 ++--
 tests/intel/kms_joiner.c                | 66 ++++++++++++++++++-------
 tests/intel/kms_joiner_helper.c         | 16 +++---
 tests/intel/kms_pipe_b_c_ivb.c          | 28 +++++++----
 tests/intel/kms_pipe_stress.c           |  4 ++
 tests/kms_bw.c                          | 48 +++++++++---------
 tests/kms_explicit_fence.c              | 14 +++---
 10 files changed, 129 insertions(+), 75 deletions(-)

-- 
2.47.3

