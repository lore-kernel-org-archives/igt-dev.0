Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC08C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 09:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD3A10E488;
	Tue, 11 Feb 2025 09:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daH0rwpY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB3110E488
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 09:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739265103; x=1770801103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xZwygo8lD9CPVSiKGWmRWeGwq8/Pc5lUlPv7G04ahN8=;
 b=daH0rwpY7pn9dh7n3Dm0Xp2fJz1uzDrMKHK3JxiyiRitWCMzAa49u0sf
 BXYZ66yRshjHdyiVIltBX4RNMVmY5ylWr+0oHteHoEWwo67lXy7AHuYtb
 w2fgQN7vgnxJMzKnWBVR8saYbz/+U5EJhYJKYGXR0Jss4Cxv8QjY7w26G
 aiR3ZthRy4VAAVd5DHCK0r4J+bJ3w63O4KxwWXc8mmDsCsZ+jr3A8ghpi
 5YXiaudcjdzTXmNLhe78CKphwsexB9XWUMBc62/oDrJ0MAAFyu69k/mUx
 3ihGJKkEbDFp0XXhJlv4DtpxDTErCdqIfsDkJY3RKxabdkkIN3IdozpSr g==;
X-CSE-ConnectionGUID: vLvaIxBNQD6l99FT/jR05w==
X-CSE-MsgGUID: fzB0kc4PRUGfQCd3nRyQtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39894576"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39894576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:11:42 -0800
X-CSE-ConnectionGUID: QgNMMnSpT7+BYKQYXivRxQ==
X-CSE-MsgGUID: a9Pr88/MSZawcIumRu6X6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="117534297"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:11:40 -0800
Date: Tue, 11 Feb 2025 10:11:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test
 category' from documentation
Message-ID: <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210105646.307902-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-02-10 at 16:26:46 +0530, Swati Sharma wrote:
> 'Functionality' solely depends upon developer's interpretation and
> 'Test category' is not used. Let's remove them from the kms tests
> documentation so that documentation can be made precise which
> is easy to maintain.
> 

+cc Jari and Katarzyna
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>

One more thing is that such change should also update *json
for example:

grep Functionality tests/intel/*json

tests/intel/i915_test_config.json: "Functionality": {
tests/intel/kms_test_config.json:  "Functionality": {
tests/intel/xe_test_config.json:   "Functionality": {

Regards,
Kamil

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c   |   5 -
>  tests/chamelium/kms_chamelium_color.c   |   2 -
>  tests/chamelium/kms_chamelium_edid.c    |  11 --
>  tests/chamelium/kms_chamelium_frames.c  |  11 --
>  tests/chamelium/kms_chamelium_hpd.c     |  26 -----
>  tests/fbdev.c                           |   2 -
>  tests/intel/i915_pipe_stress.c          |   3 -
>  tests/intel/kms_big_fb.c                |  11 --
>  tests/intel/kms_busy.c                  |   3 -
>  tests/intel/kms_ccs.c                   |   4 -
>  tests/intel/kms_cdclk.c                 |   2 -
>  tests/intel/kms_dirtyfb.c               |   3 -
>  tests/intel/kms_dp_linktrain_fallback.c |   2 -
>  tests/intel/kms_draw_crc.c              |   2 -
>  tests/intel/kms_dsc.c                   |   2 -
>  tests/intel/kms_fb_coherency.c          |   2 -
>  tests/intel/kms_fbcon_fbt.c             |   5 -
>  tests/intel/kms_fence_pin_leak.c        |   2 -
>  tests/intel/kms_flip_scaled_crc.c       |  12 --
>  tests/intel/kms_flip_tiling.c           |   2 -
>  tests/intel/kms_frontbuffer_tracking.c  | 147 ------------------------
>  tests/intel/kms_joiner.c                |   2 -
>  tests/intel/kms_legacy_colorkey.c       |   2 -
>  tests/intel/kms_mmap_write_crc.c        |   2 -
>  tests/intel/kms_pipe_b_c_ivb.c          |   2 -
>  tests/intel/kms_pm_backlight.c          |   5 -
>  tests/intel/kms_pm_dc.c                 |   8 --
>  tests/intel/kms_pm_lpsp.c               |   2 -
>  tests/intel/kms_pm_rpm.c                |  15 ---
>  tests/intel/kms_psr.c                   |  33 ------
>  tests/intel/kms_psr2_sf.c               |  25 ----
>  tests/intel/kms_psr_stress_test.c       |   2 -
>  tests/intel/kms_pwrite_crc.c            |   2 -
>  tests/kms_3d.c                          |   2 -
>  tests/kms_addfb_basic.c                 |  17 ---
>  tests/kms_async_flips.c                 |   4 -
>  tests/kms_atomic.c                      |   4 -
>  tests/kms_atomic_interruptible.c        |   6 -
>  tests/kms_atomic_transition.c           |   4 -
>  tests/kms_bw.c                          |   2 -
>  tests/kms_color.c                       |   2 -
>  tests/kms_concurrent.c                  |   2 -
>  tests/kms_content_protection.c          |   7 --
>  tests/kms_cursor_crc.c                  |   5 -
>  tests/kms_cursor_edge_walk.c            |   2 -
>  tests/kms_cursor_legacy.c               |   2 -
>  tests/kms_display_modes.c               |   3 -
>  tests/kms_dither.c                      |   2 -
>  tests/kms_dp_aux_dev.c                  |   2 -
>  tests/kms_feature_discovery.c           |   7 --
>  tests/kms_flip.c                        |  14 ---
>  tests/kms_flip_event_leak.c             |   2 -
>  tests/kms_force_connector_basic.c       |   3 -
>  tests/kms_getfb.c                       |   4 -
>  tests/kms_hdmi_inject.c                 |   3 -
>  tests/kms_hdr.c                         |  10 --
>  tests/kms_invalid_mode.c                |   2 -
>  tests/kms_lease.c                       |   2 -
>  tests/kms_multipipe_modeset.c           |   2 -
>  tests/kms_panel_fitting.c               |   2 -
>  tests/kms_pipe_crc_basic.c              |   5 -
>  tests/kms_plane.c                       |   7 --
>  tests/kms_plane_alpha_blend.c           |   2 -
>  tests/kms_plane_cursor.c                |   2 -
>  tests/kms_plane_lowres.c                |   3 -
>  tests/kms_plane_multiple.c              |   3 -
>  tests/kms_plane_scaling.c               |   6 -
>  tests/kms_prop_blob.c                   |   2 -
>  tests/kms_properties.c                  |   2 -
>  tests/kms_rotation_crc.c                |   5 -
>  tests/kms_scaling_modes.c               |   2 -
>  tests/kms_selftest.c                    |   2 -
>  tests/kms_sequence.c                    |   2 -
>  tests/kms_setmode.c                     |   3 -
>  tests/kms_sysfs_edid_timing.c           |   2 -
>  tests/kms_tiled_display.c               |   3 -
>  tests/kms_tv_load_detect.c              |   2 -
>  tests/kms_vblank.c                      |  10 --
>  tests/kms_vrr.c                         |   9 --
>  tests/kms_writeback.c                   |   2 -
>  tests/testdisplay.c                     |   2 -
>  81 files changed, 552 deletions(-)
> 

...cut...

