Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C29FEC0E6
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 17:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3BA10E604;
	Tue, 24 Mar 2026 17:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjhbE0Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7516310E5EF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774374847; x=1805910847;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7gp54jeynN+xn0RYAHBHmnO1hBFbYmoC5x8D/BYXbKI=;
 b=QjhbE0Cx3k96VLMXpzvGxjRszQjAB10q0NK11jRXSFiOqjs7S8cIiQfy
 YH3dKNV2oQOKxT4SILDUPO3yTWbTV/0bVtV33vZNYFADFLSg5gOBkzgXI
 ebg77/6LMxV/cejyFMC7Jh2NlmYiR+9wcXV0ewj2lSS8MmDoZ5cxuU6kz
 dXoKLnevaVHlZ8ar4zL/UQ1rPuArAdbTPQI5X6dI64kwSYIVAHkrB5Cbf
 EzNnu5MLCwYXNwMOBZ16DXLLGe0rgaE6aW/CE2r8sr0p1aI4fbhZQq4H4
 ZIAW2BNol0f/sK36B8fxNNk5pHM9hIPOeB3Y4wxDzTEJkK4dhjtrJVjra g==;
X-CSE-ConnectionGUID: DWkL8+1hS6SP53qJLrWKbA==
X-CSE-MsgGUID: b7mEp7BsQ9iNH9hvZcZYaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74426690"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74426690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 10:54:07 -0700
X-CSE-ConnectionGUID: zip4Cw5pQbC9oxlfb4Y6vw==
X-CSE-MsgGUID: 2y5gpnMATRmnhs5VWV8BaA==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 10:54:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t 0/7] tests: lots of s/crtc->pipe/crtc->crtc_index/
In-Reply-To: <73471ab7-347a-473f-a238-5129bf297200@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1774005763.git.jani.nikula@intel.com>
 <73471ab7-347a-473f-a238-5129bf297200@amd.com>
Date: Tue, 24 Mar 2026 19:54:02 +0200
Message-ID: <efb8a4969ce1ca90890f98b04c4038b6fc95c72f@intel.com>
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

On Tue, 24 Mar 2026, Alex Hung <alex.hung@amd.com> wrote:
> This series is Reviewed-by: Alex Hung <alex.hung@amd.com>

Thanks a lot, pushed to master.

As a tip, putting the Reviewed-by on a line of its own helps 'b4 shazam'
pick up the trailers from the mailing list while applying.

BR,
Jani.

>
> On 3/20/26 05:24, Jani Nikula wrote:
>> Do a bunch of s/crtc->pipe/crtc->crtc_index/ where the crtc->pipe isn't
>> actually needed or relevant, e.g. basically all of amdgpu tests.
>> 
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> 
>> Jani Nikula (7):
>>    tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
>>    tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
>>    tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
>>    tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
>>    tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
>>    tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
>>    tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/
>> 
>>   tests/amdgpu/amd_dp_dsc.c               | 142 ++++++++++++------------
>>   tests/amdgpu/amd_hotplug.c              |  52 +++++----
>>   tests/amdgpu/amd_multidisplay_modeset.c |  30 ++---
>>   tests/amdgpu/amd_plane.c                |  27 ++---
>>   tests/amdgpu/amd_subvp.c                |  16 +--
>>   tests/amdgpu/amd_vrr_range.c            |   4 +-
>>   tests/kms_atomic_transition.c           |  18 +--
>>   7 files changed, 144 insertions(+), 145 deletions(-)
>> 
>

-- 
Jani Nikula, Intel
