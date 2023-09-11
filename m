Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5806F10E18F
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 08:17:13 +0000 (UTC)
Date: Mon, 11 Sep 2023 10:17:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230911081632.vf3k7jtuzfxczko2@zkempczy-mobl2>
References: <20230911060345.324372-1-zbigniew.kempczynski@intel.com>
 <169441588284.31367.3262959690591391987@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169441588284.31367.3262959690591391987@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRXh0ZW5k?=
 =?utf-8?q?_compute_square_to_i915_and_Xe_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 07:04:42AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend compute square to i915 and Xe (rev3)                    
>    URL:     https://patchwork.freedesktop.org/series/122568/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9760/index.html 
> 
>               CI Bug Log - changes from CI_DRM_13617 -> IGTPW_9760
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9760 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9760, please notify your bug team
>    (lgci.bug.filing@intel.com) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9760/index.html
> 
> Participating hosts (38 -> 39)
> 
>    Additional (2): fi-kbl-soraka bat-dg2-8
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_9760:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_suspend@basic-s0@smem:
>           * bat-dg2-8: NOTRUN -> INCOMPLETE

Unrelated to the change. May I ask for resume full run?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_9760 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_lmem_swapping@basic:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 other
>             tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_gtt@basic:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * fi-kbl-soraka: NOTRUN -> DMESG-FAIL (i915#1886 / i915#7913)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#6645)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4212) +7 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271) +8 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * fi-bsw-nick: PASS -> FAIL (i915#9276)
>      * igt@kms_psr@cursor_plane_move:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#1072) +3 other tests skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#3555)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@basic-write:
> 
>           * bat-dg2-8: NOTRUN -> SKIP (i915#3291 / i915#3708) +2 other tests
>             skip
> 
>     Possible fixes
> 
>      * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>           * bat-rplp-1: ABORT (i915#8668) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7478 -> IGTPW_9760
> 
>    CI-20190529: 20190529
>    CI_DRM_13617: 232c052bbad9247620eb164d559c1e0a9eae0353 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9760: 9760
>    IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> Testlist changes
> 
>    +igt@gem_compute@compute-square
