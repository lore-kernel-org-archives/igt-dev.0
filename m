Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFCC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 08:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF1D10E6A9;
	Mon,  7 Sep 2026 08:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INGSkOeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1075010E6A9
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788768545; x=1820304545;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TSTuGBeqrr+kGmJRUvnNQJ9da4jqRDr2JlYY5Q42Fk4=;
 b=INGSkOeYD0TscE0Lx/0JrKMUV7lD1e6SpfCMQfAAvmCJGgMGa/S5uvuW
 fBaIuy8lGrPoHeOBp3LpzD9dHnXQxHoQ9uDYNOthHRouO4VphY0xi9VDl
 cWnMDvbFhjqpAh6yDroAYOQRv9XnDkhjlFT9YQO++JZUsJgGUVLMeRmgR
 rtZ6z5d0KQz6TlErTcz6MgBBWZlsK9C+bXtXJipGUOp529MUdheFHtFMK
 lMJZ/cyI+NUYBRn3bv2fjmzSIo99Eu3EI+goFprH20ojm8lqJSa6FCVzm
 uUWMP8kvVe3vda/Byvhm40b+46p9Dzf1PwnjPqVitD1CDzr1PW6z9xEqm Q==;
X-CSE-ConnectionGUID: aEZjbqXMSQOqyXQOYWBnuw==
X-CSE-MsgGUID: o4F9oRCUTy+I5zqnhtu1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="114709883"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114709883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:09:05 -0700
X-CSE-ConnectionGUID: ZMUXmkqaQtKEfaXeKoyCQg==
X-CSE-MsgGUID: 8VxjzmNCQbOEE6sON6Bx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274446399"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:09:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/4] igt: rename pipe to hardware_pipe
In-Reply-To: <cover.1788252273.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1788252273.git.jani.nikula@intel.com>
Date: Mon, 07 Sep 2026 11:09:00 +0300
Message-ID: <7cc180c9ed099f630129fe9f268b45ed7ae6553a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 01 Sep 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> To emphasize the enum pipe and crtc->pipe are vendor-specific hardware
> concepts, rename them to hardware_pipe. Further explanations in patch 3.

Ville, ack?

>
> Jani Nikula (4):
>   tests/kms_chamelium_color_pipeline: prefer igt_crtc_name() over
>     kmstest_pipe_name()
>   tests/intel/kms_joiner_helper: iterate CRTCs instead of pipes
>   lib/kms: rename enum pipe to hardware_pipe, crtc->pipe to
>     crtc->hardware_pipe
>   lib/kms: use enum hardware_pipe for __intel_get_pipe_from_crtc_index()
>     return type
>
>  lib/igt_kms.c                                 | 40 ++++++++++---------
>  lib/igt_kms.h                                 | 22 ++++++----
>  .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
>  tests/intel/kms_busy.c                        | 16 ++++----
>  tests/intel/kms_dp_link_training.c            |  2 +-
>  tests/intel/kms_dsc.c                         |  2 +-
>  tests/intel/kms_dsc_helper.c                  |  4 +-
>  tests/intel/kms_dsc_helper.h                  |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c        |  2 +-
>  tests/intel/kms_joiner.c                      | 32 +++++++--------
>  tests/intel/kms_joiner_helper.c               | 15 +++----
>  tests/intel/kms_mst.c                         |  2 +-
>  tests/intel/kms_pipe_b_c_ivb.c                |  4 +-
>  tests/intel/kms_pipe_stress.c                 | 24 +++++------
>  tests/intel/kms_pm_dc.c                       |  8 ++--
>  tests/intel/kms_pm_lpsp.c                     |  2 +-
>  tests/intel/kms_psr2_sf.c                     |  4 +-
>  tests/intel/perf_pmu.c                        |  2 +-
>  tests/kms_cursor_crc.c                        |  2 +-
>  tests/kms_cursor_edge_walk.c                  |  2 +-
>  tests/kms_display_modes.c                     |  2 +-
>  tests/kms_panel_fitting.c                     |  2 +-
>  tests/kms_plane_scaling.c                     |  2 +-
>  23 files changed, 102 insertions(+), 93 deletions(-)

-- 
Jani Nikula, Intel
