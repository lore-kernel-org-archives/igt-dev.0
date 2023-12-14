Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 14 Dec 2023 19:00:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_benchmarks?=
 =?utf-8?B?L2dlbV93c2lt?= =?utf-8?Q?=3A?= Fix array index issue in xe_sync
 object referencing (rev2)
Message-ID: <20231214180046.k4g7timyxle72pc5@kamilkon-desk.igk.intel.com>
References: <20231208102438.12894-1-marcin.bernatowicz@linux.intel.com>
 <170253909575.19959.11927629674232020302@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170253909575.19959.11927629674232020302@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-12-14 at 07:31:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/gem_wsim: Fix array index issue in xe_sync object referencing (rev2)
> URL   : https://patchwork.freedesktop.org/series/127512/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13998_full -> IGTPW_10382_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10382_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10382_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10382_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [ABORT][2] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][3] +17 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][4] +17 other tests incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][5] +21 other tests incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-mtlp:         NOTRUN -> [ABORT][6] +14 other tests abort
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][7] +15 other tests incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][8] +16 other tests incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-glk8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_lease@simple-lease@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [ABORT][9] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-glk1/igt@kms_lease@simple-lease@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_lease@simple-lease@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][10] +12 other tests incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-rkl-1/igt@kms_lease@simple-lease@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_sequence@get-busy@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [ABORT][11] +2 other tests abort
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-rkl-5/igt@kms_sequence@get-busy@pipe-a-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-snb:          [INCOMPLETE][12] ([i915#9851]) -> [INCOMPLETE][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13998/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   
> #### Suppressed ####

This is unrelated to benchmark patch and is already merged
so no need for respin.

Regards,
Kamil

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7628 -> IGTPW_10382
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13998: 25a1f5a87b8a320992918d224a548bb13a68c378 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10382: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
>   IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
