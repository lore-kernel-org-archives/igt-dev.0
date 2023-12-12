Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 12 Dec 2023 09:29:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 intel/xe_exec_store.c: Fix the execution of basic-all test.
Message-ID: <20231212082944.cdfvsckhmr3ajvfc@kamilkon-desk.igk.intel.com>
References: <20231211130735.10497-1-sai.gowtham.ch@intel.com>
 <170232811737.19579.14674337072112286082@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170232811737.19579.14674337072112286082@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below is unrelated to Xe test.

Regards,
Kamil

On 2023-12-11 at 20:55:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel/xe_exec_store.c: Fix the execution of basic-all test.
> URL   : https://patchwork.freedesktop.org/series/127630/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14007_full -> IGTPW_10392_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10392_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10392_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/index.html
> 
> Participating hosts (9 -> 7)
> ------------------------------
> 
>   Missing    (2): shard-snb-0 shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10392_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@fairslice:
>     - shard-dg1:          NOTRUN -> [ABORT][1] +2 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-dg1-13/igt@gem_exec_balancer@fairslice.html
> 
>   * igt@gem_exec_balancer@full-late-pulse:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][2] +7 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-tglu-4/igt@gem_exec_balancer@full-late-pulse.html
> 
>   * igt@gem_exec_whisper@basic-fds-forked-all:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][3] +8 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-mtlp:         NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
>     - shard-mtlp:         NOTRUN -> [ABORT][5] +12 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
>     - shard-dg2:          NOTRUN -> [ABORT][6] +1 other test abort
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
> 
>   * igt@perf@invalid-oa-metric-set-id:
>     - shard-glk:          NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-glk1/igt@perf@invalid-oa-metric-set-id.html
> 
>   * igt@perf_pmu@busy-hang@rcs0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][8] +4 other tests incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-dg2-10/igt@perf_pmu@busy-hang@rcs0.html
>     - shard-rkl:          NOTRUN -> [ABORT][9] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-rkl-3/igt@perf_pmu@busy-hang@rcs0.html
> 
>   * igt@perf_pmu@most-busy-check-all@rcs0:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][10] +11 other tests incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-snb5/igt@perf_pmu@most-busy-check-all@rcs0.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][11] +4 other tests incomplete
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][12] +6 other tests incomplete
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@full-late-pulse:
>     - shard-rkl:          [ABORT][13] -> [INCOMPLETE][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14007/shard-rkl-5/igt@gem_exec_balancer@full-late-pulse.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/shard-rkl-7/igt@gem_exec_balancer@full-late-pulse.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14007_full and IGTPW_10392_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@i915_power:
>     - Statuses : 2 incomplete(s)
>     - Exec time: [0.0] s
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7635 -> IGTPW_10392
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14007: e888b3a5196ef64c917c30f387276bdcedc9d23b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10392: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/index.html
>   IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10392/index.html
