Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3636E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 01:52:47 +0000 (UTC)
Date: Thu, 12 Dec 2019 17:54:08 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20191213015408.GG24342@intel.com>
References: <20191209035118.6658-1-karthik.b.s@intel.com>
 <157586542255.14781.2843347797755979503@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157586542255.14781.2843347797755979503@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Ftiled=5Fdisplay=3A_Request_a_mode_on_resolution_that?=
 =?utf-8?q?_matches_tile_size?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This looks like an unrelated failure and a false positive

Manasi

On Mon, Dec 09, 2019 at 04:23:42AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_dp_tiled_display: Request a mode on resolution that matches tile size
> URL   : https://patchwork.freedesktop.org/series/70606/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7511 -> IGTPW_3827
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3827 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_3827, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3827/index.html
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_3827 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_basic@bad-close:
>     - fi-bxt-dsi:         [PASS][1] -> [INCOMPLETE][2] ([fdo#103927])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7511/fi-bxt-dsi/igt@gem_basic@bad-close.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3827/fi-bxt-dsi/igt@gem_basic@bad-close.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live_gem_contexts:
>     - fi-byt-n2820:       [INCOMPLETE][3] ([i915#45]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7511/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3827/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
> 
>   
>   [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
>   [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
> 
> 
> Participating hosts (26 -> 9)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in IGTPW_3827 prevented too many machines from booting.
> 
>   Missing    (17): fi-kbl-soraka fi-ilk-m540 fi-bdw-5557u fi-bdw-gvtdvm fi-glk-dsi fi-byt-squawks fi-bwr-2160 fi-apl-guc fi-bsw-cyan fi-ctg-p8600 fi-kbl-guc fi-ivb-3770 fi-pnv-d510 fi-bsw-kefka fi-byt-clapper fi-bdw-samus fi-snb-2600 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5339 -> IGTPW_3827
> 
>   CI-20190529: 20190529
>   CI_DRM_7511: 04ca2c0fb47c3d394a364f5f71943ca9f440dda7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3827: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3827/index.html
>   IGT_5339: d45e11f8e10a4c5775372002ec89974ce3d97b27 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3827/index.html
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
