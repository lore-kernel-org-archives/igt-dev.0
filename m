Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D275C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC89010EBFA;
	Tue,  1 Sep 2026 08:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmZXTk3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF41C10E3D4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788252433; x=1819788433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oAJoqO7DBjYgwiYO8A1cvDbZLKIlEvObSQeFVdekkq8=;
 b=YmZXTk3Kg26rtMlIfrEtIn14t/sf7REWX9NEF8fUvI0KcajccUns/C1f
 eD7plHLcqxpRz9rybWgXYQDdsfJlfurH2lFI8fhB+SLSCmAZASuRKERJ9
 Lumxn2SGv1CXGjRpacJiVu5Ma2r4f214T7orngqlp5ElaqgLZQPR0Un++
 iIoykpoZi/pzfc18FbkR4clNKBzn/62OqKvAYtEPGJ1bU5naEMgOsvfo+
 PgWdB2YaBWxSo1Wpw74gTxRuKgU1LfCFk57SLPJTx89u3boFKcwyeo7Ez
 A/oxl+BBWtvOoz3Z2sTeyZ6DFGhrvjRRVQoUKQUsLML3UDOvpYggXLQ7K g==;
X-CSE-ConnectionGUID: OzgqFnZ0RWuRovpzXF5j3A==
X-CSE-MsgGUID: FWDNuYzlQaWMix3XNSjGDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88723266"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88723266"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:50 -0700
X-CSE-ConnectionGUID: kluDwVPjRV2cNzLBzydJYA==
X-CSE-MsgGUID: +hTUXv/GSs+WHwNDmME+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="268507329"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/4] igt: rename pipe to hardware_pipe
Date: Tue,  1 Sep 2026 11:46:36 +0300
Message-ID: <cover.1788252273.git.jani.nikula@intel.com>
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

To emphasize the enum pipe and crtc->pipe are vendor-specific hardware
concepts, rename them to hardware_pipe. Further explanations in patch 3.

Jani Nikula (4):
  tests/kms_chamelium_color_pipeline: prefer igt_crtc_name() over
    kmstest_pipe_name()
  tests/intel/kms_joiner_helper: iterate CRTCs instead of pipes
  lib/kms: rename enum pipe to hardware_pipe, crtc->pipe to
    crtc->hardware_pipe
  lib/kms: use enum hardware_pipe for __intel_get_pipe_from_crtc_index()
    return type

 lib/igt_kms.c                                 | 40 ++++++++++---------
 lib/igt_kms.h                                 | 22 ++++++----
 .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
 tests/intel/kms_busy.c                        | 16 ++++----
 tests/intel/kms_dp_link_training.c            |  2 +-
 tests/intel/kms_dsc.c                         |  2 +-
 tests/intel/kms_dsc_helper.c                  |  4 +-
 tests/intel/kms_dsc_helper.h                  |  2 +-
 tests/intel/kms_frontbuffer_tracking.c        |  2 +-
 tests/intel/kms_joiner.c                      | 32 +++++++--------
 tests/intel/kms_joiner_helper.c               | 15 +++----
 tests/intel/kms_mst.c                         |  2 +-
 tests/intel/kms_pipe_b_c_ivb.c                |  4 +-
 tests/intel/kms_pipe_stress.c                 | 24 +++++------
 tests/intel/kms_pm_dc.c                       |  8 ++--
 tests/intel/kms_pm_lpsp.c                     |  2 +-
 tests/intel/kms_psr2_sf.c                     |  4 +-
 tests/intel/perf_pmu.c                        |  2 +-
 tests/kms_cursor_crc.c                        |  2 +-
 tests/kms_cursor_edge_walk.c                  |  2 +-
 tests/kms_display_modes.c                     |  2 +-
 tests/kms_panel_fitting.c                     |  2 +-
 tests/kms_plane_scaling.c                     |  2 +-
 23 files changed, 102 insertions(+), 93 deletions(-)

-- 
2.47.3

