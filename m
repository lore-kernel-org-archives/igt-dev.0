Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADE1FD7F92
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B30E10EAF9;
	Fri, 27 Feb 2026 10:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxWdpn0u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1610EAF9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772189736; x=1803725736;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=TtNC0CgMB4o4Dp5ZMPlRie+FZSAL4RPO1Yc33ZIUqbI=;
 b=FxWdpn0u/ObLcH3hyWnjRhue2Y0x9jUErhy0fsnfEEwp62SOkOjJeKY4
 mEc7sxAnV0LKK8tcd7M0gvfF3RAYRLSoy+N9dhF0HSi9WoF62S9LCOZiy
 lBnal1dM+IuTE30vAj1B4lIxkXrC/FR+/ocmt7Ds1Lk+HYTR0Q0+ScVto
 RndzjmOFmIn1X8UoBl8+4inPngWIvKdwFDLAAtqVnjTfVzHztYS9tlEk2
 Ls652sH1GZ7gyz8+x0sRv2XKxgfRxAna9A+VRu2Dqwsjrl8UsaqTWhSKA
 xQFstSf2GmmsLdwGubF0vpi0IkMOqzbbN0WIKlJssA/Q7dR8hCHKZIB9V Q==;
X-CSE-ConnectionGUID: 7UiF+IwERoOmQ3Be2E94TA==
X-CSE-MsgGUID: gjfq1PTATcqAHG9rDonB3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95890595"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="95890595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:55:36 -0800
X-CSE-ConnectionGUID: 0OCuz+mYQtCgcrR+C4pyQA==
X-CSE-MsgGUID: 86EVvSAxTpioHGLyPIfdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221015451"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:55:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/17] lib/kms: Finish the igt_crtc_t API refactoring
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
Date: Fri, 27 Feb 2026 12:55:31 +0200
Message-ID: <68b9e62f67a3c1ebdc9269f6ae8b2ce44912b74e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 27 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert the remaining (more or less) igt_kms APIs to
> igt_crtc_t* from enum pipe.
>
> To get rid of the kmstest_vbl*() stuff from most places I=20
> did some (technically functional) pipe to crtc_index conversions,
> and then added the igt_crtc_t* based igt_crtc_vbl*() wrappers.

There are a few issues with invalid CRTCs, mentioned inline. Also some
nitpicks. With the issues fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Felt like some of the places could've gone more directly to
igt_crtc_vblank(), but I'm guessing step by step is easier with cocci.

There are also some lefover kmstest_get_vblank() that I think could've
been converted, but overall this is good forward progress.

>
> There are also some cleanups of a few random leftovers from
> earlier conversion attempts.
>
> I also did a bunch of renaming across the tree, just to
> reduce the appearance of the word "pipe". That should hopefully
> make it a bit easier to see which parts of the codebase still
> need work.
>
> Ville Syrj=C3=A4l=C3=A4 (17):
>   lib/kms: Replace igt_pipe_has_valid_output() with
>     igt_crtc_has_valid_output()
>   lib/kms: Replace igt_display_require_output_on_pipe() with
>     igt_display_require_output_on_crtc()
>   lib/kms: Replace igt_get_single_output_for_pipe() with
>     igt_get_single_output_for_crtc()
>   lib/kms: Make the igt_*_bpc_*() interfaces more abstract
>   tests/kms: Use igt_crtc_name()
>   tests/kms: Clean up crtc->pipe comparions
>   tests/vmwgfx/vmw_prime: Replace igt_pipe_crc_new() with
>     igt_crtc_crc_new()
>   lib/kms: Prefer "crtc" over "pipe" in function names
>   tests/kms_color*: Prefer "crtc" over "pipe" in function names
>   tests/kms: Prefer "crtc" over "pipe" in function names
>   tests/kms_tiled_display: Remove mention of PIPE_NONE
>   tests/kms: Remove hand rolled get_vblank() stuff
>   lib/kms: Fix kmstest_get_vblank() docs
>   tests/kms: Pass crtc_index to kmstest_get_vbl_flag()
>   tests/kms: Pass crtc_index to kmstest_get_vblank()
>   lib/kms: Introduce igt_crtc_get_vbl_flag()
>   lib/kms: Introduce igt_crtc_get_vblank()
>
>  lib/igt_kms.c                                 | 120 ++++++++++--------
>  lib/igt_kms.h                                 |  19 +--
>  tests/amdgpu/amd_abm.c                        |   3 +-
>  tests/amdgpu/amd_bypass.c                     |   5 +-
>  tests/amdgpu/amd_color.c                      |   3 +-
>  tests/amdgpu/amd_dp_dsc.c                     |   7 +-
>  tests/amdgpu/amd_freesync_video_mode.c        |   6 +-
>  tests/amdgpu/amd_max_bpc.c                    |   4 +-
>  tests/amdgpu/amd_multidisplay_modeset.c       |   2 +-
>  tests/amdgpu/amd_psr.c                        |   3 +-
>  tests/amdgpu/amd_replay.c                     |   3 +-
>  tests/chamelium/kms_chamelium_color.c         |  22 ++--
>  .../kms_chamelium_sharpness_filter.c          |   4 +-
>  tests/drm_read.c                              |   4 +-
>  tests/intel/gem_eio.c                         |   2 +-
>  tests/intel/kms_busy.c                        |  10 +-
>  tests/intel/kms_ccs.c                         |   3 +-
>  tests/intel/kms_dsc.c                         |   4 +-
>  tests/intel/kms_dsc_helper.c                  |   2 +-
>  tests/intel/kms_flip_tiling.c                 |   4 +-
>  tests/intel/kms_pipe_b_c_ivb.c                |  40 +++---
>  tests/intel/kms_pipe_stress.c                 |  28 +---
>  tests/intel/perf_pmu.c                        |   2 +-
>  tests/kms_async_flips.c                       |   8 +-
>  tests/kms_atomic.c                            |  26 ++--
>  tests/kms_atomic_interruptible.c              |  16 +--
>  tests/kms_atomic_transition.c                 |   6 +-
>  tests/kms_bw.c                                |   3 +-
>  tests/kms_color.c                             |  24 ++--
>  tests/kms_color_helper.c                      |  34 ++---
>  tests/kms_color_helper.h                      |   8 +-
>  tests/kms_color_pipeline.c                    |   2 +-
>  tests/kms_cursor_legacy.c                     | 119 ++++++++++-------
>  tests/kms_display_modes.c                     |   2 +-
>  tests/kms_dither.c                            |   4 +-
>  tests/kms_hdr.c                               |  31 +++--
>  tests/kms_pipe_crc_basic.c                    |  10 +-
>  tests/kms_plane.c                             |   9 +-
>  tests/kms_plane_alpha_blend.c                 |  10 +-
>  tests/kms_plane_multiple.c                    |   2 +-
>  tests/kms_plane_scaling.c                     |  40 +++---
>  tests/kms_properties.c                        |  20 +--
>  tests/kms_rotation_crc.c                      |  10 +-
>  tests/kms_tiled_display.c                     |   3 +-
>  tests/kms_universal_plane.c                   |  32 ++---
>  tests/kms_vblank.c                            |  24 ++--
>  tests/kms_vrr.c                               |   8 +-
>  tests/nouveau_crc.c                           |   6 +-
>  tests/prime_vgem.c                            |  28 +---
>  tests/vmwgfx/vmw_prime.c                      |   4 +-
>  50 files changed, 397 insertions(+), 392 deletions(-)

--=20
Jani Nikula, Intel
