Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CCFFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 14:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C43F10E7DA;
	Wed, 25 Feb 2026 14:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n71CWY8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70C610E7DA
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772028477; x=1803564477;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=z51GSeu3nhIOhD7rt75c3GU1fqOKZPxyN5DjU5C0v7w=;
 b=n71CWY8NTl+ph1eDtU1OlKG4cIN7OMPFRoy/WKxMRjW7713aBDoeO2+S
 5GFWih8bEsU4SbgFoTvOG+rcX1XvJe9RYm3HL8JQ0zOdzEuTu5oMXHkCS
 Da7f1+Q+EwsMoDIVfuExDJ7WMN3yyMvExvDwsx1Jn1Ldoi8xzixNbNYpo
 vPgOVJdMobbsyb9fAN4dFGChEVxy5KeWvc33kE2TkboCRf9JqLW2iL+vK
 w7yLDcXExEMjdWmzHxkrBEeog52tU/9g6kmgIdwm/8yGgGsmYzk+ueoKh
 2N5z3y7tIut1tvxAdHYBOw4i4Q21BTFv8DC6rztssTa6vLbIOTZy0h1Zh A==;
X-CSE-ConnectionGUID: pk7Ugs+1Tru3kndwyRN6JQ==
X-CSE-MsgGUID: vz5qwc4cROuTItKJY4bMFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98534130"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="98534130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:07:56 -0800
X-CSE-ConnectionGUID: YGEQN0oQRRurfwQhgOHexw==
X-CSE-MsgGUID: T6pJctDHTPqGu6LYYk28CA==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:07:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/19] lib/kms: Clean up more of igt_kms API
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 16:07:52 +0200
Message-ID: <8dbdb0294d1741024d41c6130597891d398e67fc@intel.com>
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

On Wed, 25 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Adjust more of the igt_kms API to pass around igt_crtc_t*
> instead of enum pipe.
>
> I also wanted to have a better idea where in the tests we're
> still using igt_crtc_for_pipe(), so there's some cleanup
> around that. And then I added some new functions into igt_kms
> to replace some of those with more sensible things.
>
> This was supposed to be the last treewide series I'd do, but
> it naturally became too big. So I cut it roughly in the middle,
> and this is the first part. The second part is already done,
> but I'll hang on to it until this gets in.

Apart from a handful of comments inline, mostly about typos and cocci
being silly with whitespace or braces,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Good stuff. I think all of this underlines the importance setting a good
example in the codebase, because the worst stuff gets copied around
everywhere.


>
> Ville Syrj=C3=A4l=C3=A4 (19):
>   tests/kms_plane_multiple: Clean up n_planes stuff
>   tests/kms_async_flips: Remove redundant data.crtc_id
>   tests/kms_lease: Consolidate igt_crtc_for_pipe() calls
>   tests/kms: Consolidate igt_crtc_for_pipe() calls
>   lib/kms: Introduce igt_first_crtc_with_single_output()
>   tests/kms: Use igt_first_crtc_with_single_output()
>   lib/kms: Introduce and use igt_first_crtc()
>   tests/kms: Stop using igt_require_pipe()
>   lib/kms: Replace get_num_scalers() with igt_crtc_num_scalers()
>   lib/kms: Pass igt_crtc_t* to igt_max_bpc_constraint()
>   lib/kms: Introduce for_each_plane_on_crtc()
>   tests/kms: Use for_each_plane_on_crtc()
>   lib/kms: Nuke for_each_plane_on_pipe()
>   tests/kms: Switch to for_each_valid_output_on_crtc_local()
>   tests/kms: Replace igt_pipe_connector_valid() with
>     igt_crtc_connector_valid()
>   lib/kms: Intreoduce for_each_valid_output_on_crtc()
>   tests/intel/kms_frontbuffer_tracking: Use
>     for_each_valid_output_on_crtc()
>   tests/kms: Use for_each_valid_output_on_crtc()
>   lib/kms: Nuke for_each_valid_output_on_pipe()
>
>  lib/igt_kms.c                                 | 83 +++++++++++++------
>  lib/igt_kms.h                                 | 60 ++++----------
>  tests/amdgpu/amd_abm.c                        | 20 +++--
>  tests/amdgpu/amd_assr.c                       |  2 +-
>  tests/amdgpu/amd_bypass.c                     |  2 +-
>  tests/amdgpu/amd_color.c                      |  2 +-
>  tests/amdgpu/amd_cursor_overlay.c             |  2 +-
>  tests/amdgpu/amd_freesync_video_mode.c        |  2 +-
>  tests/amdgpu/amd_ilr.c                        |  2 +-
>  tests/amdgpu/amd_link_settings.c              |  2 +-
>  tests/amdgpu/amd_mall.c                       |  2 +-
>  tests/amdgpu/amd_max_bpc.c                    |  2 +-
>  tests/amdgpu/amd_mem_leak.c                   |  2 +-
>  tests/amdgpu/amd_mode_switch.c                |  5 +-
>  tests/amdgpu/amd_multidisplay_modeset.c       |  7 +-
>  tests/amdgpu/amd_odm.c                        |  6 +-
>  tests/amdgpu/amd_psr.c                        |  2 +-
>  tests/amdgpu/amd_replay.c                     |  2 +-
>  tests/chamelium/kms_chamelium_color.c         |  8 +-
>  .../kms_chamelium_sharpness_filter.c          |  6 +-
>  tests/intel/gem_eio.c                         | 11 ++-
>  tests/intel/gem_exec_reloc.c                  |  9 +-
>  tests/intel/gem_pxp.c                         |  4 +-
>  tests/intel/kms_big_fb.c                      |  3 +-
>  tests/intel/kms_busy.c                        |  3 +-
>  tests/intel/kms_ccs.c                         |  3 +-
>  tests/intel/kms_cdclk.c                       | 14 ++--
>  tests/intel/kms_dirtyfb.c                     |  4 +-
>  tests/intel/kms_dp_linktrain_fallback.c       |  2 +-
>  tests/intel/kms_fbc_dirty_rect.c              | 15 ++--
>  tests/intel/kms_flip_scaled_crc.c             |  8 +-
>  tests/intel/kms_frontbuffer_tracking.c        |  5 +-
>  tests/intel/kms_legacy_colorkey.c             |  5 +-
>  tests/intel/kms_pipe_stress.c                 | 30 ++++---
>  tests/intel/kms_pm_lpsp.c                     |  2 +-
>  tests/intel/xe_pxp.c                          |  6 +-
>  tests/kms_async_flips.c                       | 29 +++----
>  tests/kms_atomic.c                            |  3 +-
>  tests/kms_atomic_transition.c                 | 36 +++++---
>  tests/kms_bw.c                                |  5 +-
>  tests/kms_color.c                             | 11 +--
>  tests/kms_colorop.c                           |  3 +-
>  tests/kms_content_protection.c                |  2 +-
>  tests/kms_cursor_legacy.c                     |  6 +-
>  tests/kms_debugfs.c                           |  7 +-
>  tests/kms_display_modes.c                     | 11 +--
>  tests/kms_dither.c                            |  4 +-
>  tests/kms_feature_discovery.c                 |  4 +-
>  tests/kms_hdr.c                               |  6 +-
>  tests/kms_lease.c                             | 31 ++++---
>  tests/kms_plane.c                             |  9 +-
>  tests/kms_plane_alpha_blend.c                 |  8 +-
>  tests/kms_plane_lowres.c                      |  6 +-
>  tests/kms_plane_multiple.c                    | 25 +++---
>  tests/kms_plane_scaling.c                     | 78 +++++++++--------
>  tests/kms_properties.c                        | 16 ++--
>  tests/kms_rmfb.c                              |  6 +-
>  tests/kms_rotation_crc.c                      | 19 +++--
>  tests/kms_tiled_display.c                     |  2 +-
>  tools/amd_hdmi_compliance.c                   |  2 +-
>  60 files changed, 378 insertions(+), 294 deletions(-)

--=20
Jani Nikula, Intel
