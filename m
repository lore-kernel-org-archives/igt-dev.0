Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66D4C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 13:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BB110E387;
	Mon,  6 Jul 2026 13:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxvtiljI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DA510E3A7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783345580; x=1814881580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jlZdlT/yZ3K6a4Tkm6PC0lcnVSQFvT1MWFqBrmPu+L0=;
 b=HxvtiljI+inmmohPbUVyYsEIW/HJyFt+Lah2DlhU0FYFS597nxhciqRA
 lj2MWlJgvdSO0dimSIhjkC5IMWwUTh/bnxuDvU6z579SCw3yNaiU1uo6k
 TSqUEqvO3A+59muWn6BBkXvp0PtUkJgz2kaLS89g47MDhOqUdT84KACGx
 BTaDX3gFdNxqUw1zqVxz/2CM8ASNvmKKCegXCZQmh9dajBcKhM6OuIYd1
 BNN2ReL5RqiUnVCwPfpxB0oKVTyAEga3wX9iLo3oclyPfvHA8ZiuJYez7
 ie8qfBDOfBoBlCQ7mPA1EP4JfwQtOgRVCKFhpMmUZDkUH+B8XlV0wRxBM w==;
X-CSE-ConnectionGUID: Z9PFWvEoTxCjsMG/6vXKKg==
X-CSE-MsgGUID: 6SfMsluvRS+f5aN9Fyhqiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="106777243"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="106777243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:46:19 -0700
X-CSE-ConnectionGUID: ylrL+v6nR4itBxQypf8c6A==
X-CSE-MsgGUID: vfsIBujcR4+TLiyjuWQn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="291876587"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:46:17 -0700
Date: Mon, 6 Jul 2026 15:46:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 3/7] lib/amdgpu: Add AMD platform filtering backend
Message-ID: <20260706134615.rlqcfqrlge3s4il6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-3-vitaly.prosyak@amd.com>
 <20260702134233.joyngzudno5jenk7@kamilkon-DESK.igk.intel.com>
 <448ec82f897ee4a3f7a2ab9bcae2e1734d9349a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <448ec82f897ee4a3f7a2ab9bcae2e1734d9349a2@intel.com>
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

Hi Jani,
On 2026-07-02 at 16:48:10 +0300, Jani Nikula wrote:
> On Thu, 02 Jul 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi vitaly.prosyak,
> > On 2026-06-29 at 23:23:22 -0400, vitaly.prosyak@amd.com wrote:
> >> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >> 
> >> Implement the AMD-specific backend for the generic platform filtering
> >> framework, providing:
> >> 
> >> - ASIC identification via amdgpu family_id and chip_rev ranges
> >> - ASIC name table mapping (navi10, navi48, arcturus, etc.)
> >> - AMD-specific built-in skip rules
> >> - amd_platform_filter_init() convenience function for AMD tests
> >> 
> >> This is a pluggable backend accessed through platform_filter_ops
> >> callbacks. The core framework has zero AMD-specific knowledge.
> >> 
> >> To add support for another vendor (e.g., Intel):
> >> 1. Create lib/i915/intel_platform.c/h
> >> 2. Implement platform_filter_ops callbacks
> >> 3. Define Intel platform data (platform_id, stepping ranges)
> >> 4. Call intel_platform_filter_init() from Intel tests
> >> 
> >> Usage in AMD tests:
> >>     amd_platform_filter_init(&gpu_info);
> >>     igt_platform_require(igt_test_name(), "my-subtest");
> >> 
> >> Example skip via environment variable:
> >>     export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:unstable
> >> 
> >> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> Cc: Jesse Zhang <jesse.zhang@amd.com>
> >> Cc: Christian König <christian.koenig@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> >> ---
> >>  lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++++++++++++++++
> >>  lib/amdgpu/amd_platform.h |  53 +++++++
> >>  lib/meson.build           |   1 +
> >>  3 files changed, 372 insertions(+)
> >>  create mode 100644 lib/amdgpu/amd_platform.c
> >>  create mode 100644 lib/amdgpu/amd_platform.h
> >
> > Please make sure that you patch series compile patch after patch,
> > so it will not break bisecting. For example run:
> >
> > git rebase origin -x ./compile.sh
> >
> > with script which will remove build folder before each build.
> 
> Why should the build folder be removed? Is there reason to believe
> dependency tracking and incremental builds are failing?

In few cases when there are new files/folders, or they are
removed, incremental build fails. Then removing builds helps.
But you have a point, maybe I should make it two-step, remove
only after a fail and retry to make sure it is a real fail.

Regards,
Kamil

> 
> I only ever do git rebase -i origin -x 'ninja -C build'.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
