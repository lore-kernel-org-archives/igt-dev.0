Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70DE6EE91
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 12:16:00 +0000 (UTC)
Date: Fri, 11 Jun 2021 15:17:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMNUbQrzZVNxcVPR@platvala-desk.ger.corp.intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
 <162340290982.29312.16219397476696348985@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162340290982.29312.16219397476696348985@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/17=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering?=
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

On Fri, Jun 11, 2021 at 09:15:09AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering
> URL   : https://patchwork.freedesktop.org/series/91371/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10209_full -> IGTPW_5910_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5910_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5910_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5910_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@kms_addfb_basic@invalid-smem-bo-on-discrete} (NEW):
>     - shard-tglb:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-kbl:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-iclb:         NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

gem_has_lmem() doesn't work quite right.


-- 
Petri Latvala



> 
>   * {igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip} (NEW):
>     - shard-snb:          NOTRUN -> [FAIL][4] +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-snb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * {igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip} (NEW):
>     - shard-apl:          NOTRUN -> [FAIL][5] +6 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>     - shard-glk:          NOTRUN -> [FAIL][6] +9 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * {igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a} (NEW):
>     - shard-iclb:         NOTRUN -> [SKIP][7] +29 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb1/igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a.html
> 
>   * {igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888} (NEW):
>     - shard-tglb:         NOTRUN -> [SKIP][8] +36 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb7/igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a2:
>     - shard-glk:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-glk5/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a2.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a2.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_10209_full and IGTPW_5910_full:
> 
> ### New IGT tests (90) ###
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - Statuses : 5 fail(s)
>     - Exec time: [0.01, 0.12] s
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>     - Statuses : 6 pass(s)
>     - Exec time: [1.01, 2.01] s
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.00, 2.02] s
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
>     - Statuses : 6 pass(s)
>     - Exec time: [1.12, 2.18] s
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.12, 2.07] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
>     - Statuses : 6 pass(s)
>     - Exec time: [1.01, 1.91] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.46, 1.41] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.02, 1.45] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - Statuses : 3 fail(s) 2 pass(s)
>     - Exec time: [0.07, 0.47] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
>     - Statuses : 6 pass(s)
>     - Exec time: [1.02, 1.88] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.45, 1.40] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.03, 1.45] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - Statuses : 4 fail(s) 2 pass(s)
>     - Exec time: [0.02, 0.55] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
>     - Statuses : 4 pass(s)
>     - Exec time: [1.16, 2.11] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.73, 2.26] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.07, 1.75] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - Statuses : 3 fail(s) 2 pass(s)
>     - Exec time: [0.02, 1.65] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.13, 2.05] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.69, 2.59] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.05, 1.61] s
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - Statuses : 3 fail(s) 2 pass(s)
>     - Exec time: [0.01, 1.47] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.04, 2.02] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.51] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.0, 1.48] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.74] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.01] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.64] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.0, 1.48] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - Statuses : 1 fail(s) 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.73] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.11] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.55] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.10, 1.43] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - Statuses : 2 fail(s) 2 pass(s)
>     - Exec time: [0.03, 2.25] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.05] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.74] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - Statuses : 2 pass(s) 4 skip(s)
>     - Exec time: [0.0, 1.47] s
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.33] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - Statuses : 3 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.86] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.38] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - Statuses : 1 pass(s) 4 skip(s)
>     - Exec time: [0.0, 1.45] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - Statuses : 3 fail(s) 1 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.71] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - Statuses : 4 pass(s) 2 skip(s)
>     - Exec time: [0.0, 1.91] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - Statuses : 3 pass(s) 2 skip(s)
>     - Exec time: [0.0, 2.01] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - Statuses : 3 fail(s) 1 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.77] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@kms_cdclk@basic:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cdclk@mode-transition:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cdclk@plane-scaling:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dither@fb-16bpc-vs-panel-12bpc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dither@fb-16bpc-vs-panel-12bpc@dp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.04, 0.08] s
> 
>   * igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.04, 0.05] s
> 
>   * igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-1-pipe-a:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-2-pipe-a:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.16, 0.22] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [1.16, 1.20] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.17, 0.21] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
>     - Statuses : 2 skip(s)
>     - Exec time: [1.15, 1.16] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.34] s
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_dp_dsc@basic-dsc-enable:
>     - Statuses : 4 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-a:
>     - Statuses : 1 dmesg-warn(s) 1 pass(s)
>     - Exec time: [1.47, 1.54] s
> 
>   * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b:
>     - Statuses : 1 dmesg-warn(s) 1 pass(s)
>     - Exec time: [1.14, 1.15] s
> 
>   * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-c:
>     - Statuses : 1 dmesg-warn(s) 1 pass(s)
>     - Exec time: [1.15] s
> 
>   * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-d:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.14] s
> 
>   * igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888:
>     - Statuses : 4 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888:
>     - Statuses : 4 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888:
>     - Statuses : 4 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5910_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@render:
>     - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#2410])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-hostile@render.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-hostile@render.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +5 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +4 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
>     - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842]) +4 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#2842]) +3 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_reloc@basic-wide-active@rcs0:
>     - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#2389]) +4 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl6/igt@gem_exec_reloc@basic-wide-active@rcs0.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-xy:
>     - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#307])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
> 
>   * igt@gem_mmap_offset@clear:
>     - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#3160])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-iclb5/igt@gem_mmap_offset@clear.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb8/igt@gem_mmap_offset@clear.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-kbl:          NOTRUN -> [WARN][27] ([i915#2658])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-apl2/igt@gem_softpin@noreloc-s3.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl8/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112306])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb6/igt@gen9_exec_parse@cmd-crossing-page.html
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#112306])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb8/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * {igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip} (NEW):
>     - shard-kbl:          NOTRUN -> [FAIL][32] ([fdo#109052]) +8 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * {igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0} (NEW):
>     - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +242 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#2705])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb3/igt@kms_big_joiner@basic.html
>     - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2705])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb4/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo:
>     - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271]) +401 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-snb6/igt@kms_ccs@pipe-a-ccs-on-another-bo.html
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk9/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>     - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +22 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
>     - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +9 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-25:
>     - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +23 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl8/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-max:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max.html
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-max.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#3116])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3116])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109300] / [fdo#111066]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb5/igt@kms_content_protection@legacy.html
>     - shard-kbl:          NOTRUN -> [TIMEOUT][47] ([i915#1319]) +2 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl7/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-apl:          NOTRUN -> [TIMEOUT][48] ([i915#1319]) +2 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl1/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111828]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb3/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
>     - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#3444])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
>     - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#3444])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
>     - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#3444])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3359]) +2 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3319])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278]) +7 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109279] / [i915#3359])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274] / [fdo#109278]) +1 similar issue
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * {igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b} (NEW):
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][61] ([i915#1226]) +2 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b.html
> 
>   * {igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888} (NEW):
>     - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271]) +64 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk9/igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274]) +2 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
>     - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#79])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@c-dp1:
>     - shard-kbl:          NOTRUN -> [FAIL][66] ([i915#2122])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate@c-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#49])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>     - shard-apl:          [PASS][69] -> [FAIL][70] ([i915#49])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>     - shard-kbl:          [PASS][71] -> [FAIL][72] ([i915#2546] / [i915#49])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10209/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +175 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +4 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111825]) +9 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#1187])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb5/igt@kms_hdr@static-toggle-suspend.html
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#1187])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
>     - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>     - shard-apl:          NOTRUN -> [FAIL][79] ([fdo#108145] / [i915#265]) +1 similar issue
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-glk:          NOTRUN -> [FAIL][80] ([i915#265])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
>     - shard-kbl:          NOTRUN -> [FAIL][81] ([i915#265]) +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
>     - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111615]) +1 similar issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>     - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +2 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
>     - shard-apl:
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5910/index.html

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
