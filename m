Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02AF9D0D2
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 14:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E110E34F;
	Tue, 14 Apr 2026 14:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8qnceWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B084210E34F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776175732; x=1807711732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oc5f5HglNBlzM1r/tr+hzjTyMxd7x0h6VT5WSOnlnn0=;
 b=U8qnceWhG+q0vGWmUwJ+OrhxwZLl9RKRkvHanHgi1HbQuL8YRLcYKZng
 lg7iwFGpiV74M+i7DqHtM/VWaeBDGZs+7F+72SuactYAE4LrfBmBiUU3E
 SpaCVmAx7YmLE4hfA7EiqAbep0GRUuTJmwiVWkS4l4H8QngOyo/XQf+v2
 GWp2g/CIKTvXwLUWZa3sHVvD5fM/QRQTEEWXVUoifTO5vAPHv5pT/iHpA
 YlOnElZRUqHHFnYpGlPMND76ortYkMDGFSwdq5VHyvg23CeyX8hip62v9
 9VhnoUaVJrRzcyoG2rwcRG+CXoRmyRoBpQ7RYOM+hlZk2lIrzFcn02WcE g==;
X-CSE-ConnectionGUID: X2wtEVz/R1aixpVNlgUtkw==
X-CSE-MsgGUID: jgZ/QhcvQRCWJtKrnLYuag==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88210388"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88210388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:08:52 -0700
X-CSE-ConnectionGUID: CZKVaXz+RU6oyYOCi0i8xQ==
X-CSE-MsgGUID: TAHluc/ZQGiQ9+DWAXQIdg==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:08:49 -0700
Date: Tue, 14 Apr 2026 17:08:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/16] igt: clean up typedef usage, use
 for_each_output() more
Message-ID: <ad5KbvOAgWfOiyG6@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 14, 2026 at 10:14:20AM +0300, Jani Nikula wrote:
> This series spiraled into a few things:
> 
> - use typedefs like igt_foo_t more consistently instead of struct
>   igt_foo

I'm not a huge fan of the typedefs but getting rid of them now
would involve a gargantuan patch. So best to just accept them
I guess.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
> - rename the structs to have underscore prefix to discourage usage like
>   struct _igt_foo
> 
> - convert open coded output loops to use for_each_output()
> 
> BR,
> Jani.
> 
> Jani Nikula (16):
>   tests: prefer igt_plane_t over struct igt_plane
>   lib/kms: rename struct igt_plane to _igt_plane
>   tests: prefer igt_display_t over struct igt_display
>   lib/kms: rename struct igt_display to _igt_display
>   lib/kms: rename struct igt_crtc to _igt_crtc
>   lib/kms: drop struct igt_colorop definition
>   tests/amdgpu/amd_abm: use for_each_output()
>   tests/amdgpu/amd_hotplug: use for_each_output()
>   tests/amdgpu/amd_subvp: use for_each_output()
>   tests/amdgpu/amd_dp_dsc: use for_each_output()
>   tests/amdgpu/amd_plane: use for_each_output()
>   tests/kms_atomic_transition: use for_each_output()
>   tests/kms_colorop: use for_each_output()
>   tests/kms_content_protection: use for_each_output()
>   tests/kms_getfb: use for_each_output()
>   tests/kms_writeback: use for_each_output()
> 
>  lib/igt_kms.c                           |  2 +-
>  lib/igt_kms.h                           | 16 ++++++++--------
>  tests/amdgpu/amd_abm.c                  |  8 ++++----
>  tests/amdgpu/amd_dp_dsc.c               | 10 ++++++----
>  tests/amdgpu/amd_hotplug.c              |  8 +++++---
>  tests/amdgpu/amd_plane.c                |  8 +++++---
>  tests/amdgpu/amd_subvp.c                |  9 +++++----
>  tests/intel/kms_dp_link_training.c      |  4 ++--
>  tests/intel/kms_dp_linktrain_fallback.c | 12 ++++++------
>  tests/kms_atomic_transition.c           |  6 +++---
>  tests/kms_colorop.c                     |  6 ++----
>  tests/kms_content_protection.c          |  6 +++---
>  tests/kms_getfb.c                       | 13 +++++++------
>  tests/kms_writeback.c                   | 10 ++++------
>  14 files changed, 61 insertions(+), 57 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
