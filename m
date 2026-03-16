Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869EFF4644C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342C910E4AB;
	Mon, 16 Mar 2026 11:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euZc7pPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1549E10E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659974; x=1805195974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j8nt6M5Cuzd0K/yPBq6pTFV9Zpi5aEsBLJYHYcnpwU8=;
 b=euZc7pPyTEtgOBePf9vpS6RmHi1FYO8RdDDWPYNZ4Mhi2wJyjrAuD4jO
 0rgJI0e7K4+zOK0Ga4iHmu73TEDyBbAn+GqvAdkq1hVocY+JDQMkT/7Gk
 IK2Copt+7Q3Hg/rKg8wd/dHe9BjMBlQliOl7S4v/QM4Nz/IqiH0ND5nvN
 LTdIiFnJinyBoeHEnUii1vm2Y7SLH0eJ6dJMFyhBXbs/MlYUG+BKasIN/
 Z6GFN5u2OSB1hPP9LXg7KvoYfRCha8jV2loae4N7shpJjtOlYAd9nV+3/
 9rXMUm6mjRRv5GGGb9m4unszRMh66BFTLJNsa17xpmvcogQihkGWl1mIh A==;
X-CSE-ConnectionGUID: btzOS5zZTb++XXBFs6uDZw==
X-CSE-MsgGUID: pnjoPOhzRRaOjEvcIuHsOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78277163"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78277163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:33 -0700
X-CSE-ConnectionGUID: iisL3EURRdOnCN4scjxQRA==
X-CSE-MsgGUID: zO/CBF0/R3GkKdC86GEZTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226002131"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 00/12] Prepare for returning NULL from
 igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:02 +0200
Message-ID: <cover.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

We want to return NULL for invalid pipes from igt_crtc_for_pipe(), so
that we don't need to have igt_crtc_t objects with crtc->valid == false
around.

The primary way to prepare for this is to avoid using
igt_crtc_for_pipe() altogether. We've done a *lot* of that already, and
continue to do so here.

For the remaining ones, start off by ensuring crtc->valid == true, one
way or other. This ensures the test logic is sane and actually operates
on valid CRTCs. Once this prep is done, we can actually return NULL from
igt_crtc_for_pipe(), and check for crtc != NULL instead of crtc->valid
== true.

BR,
Jani.


Jani Nikula (12):
  tests/amdgpu/amd_mode_switch: Prepare for returning NULL from
    igt_crtc_for_pipe()
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
 tests/amdgpu/amd_mode_switch.c          |  2 +
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +
 tests/intel/kms_cdclk.c                 | 10 ++--
 tests/intel/kms_joiner.c                | 66 ++++++++++++++++++-------
 tests/intel/kms_joiner_helper.c         | 16 +++---
 tests/intel/kms_pipe_b_c_ivb.c          | 28 +++++++----
 tests/intel/kms_pipe_stress.c           |  4 ++
 tests/kms_bw.c                          | 48 +++++++++---------
 tests/kms_explicit_fence.c              | 14 +++---
 11 files changed, 131 insertions(+), 75 deletions(-)

-- 
2.47.3

