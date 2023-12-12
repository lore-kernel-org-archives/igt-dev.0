Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 12 Dec 2023 09:33:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/xe: Remove xe_perf_pmu
Message-ID: <20231212083323.yphatwpawfnvvg7o@kamilkon-desk.igk.intel.com>
References: <20231211162536.2790126-1-ashutosh.dixit@intel.com>
 <170233032154.19580.15921412078527510142@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170233032154.19580.15921412078527510142@emeril.freedesktop.org>
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

below is unrelated to remove of Xe test, no need for respin.

Regards,
Kamil

On 2023-12-11 at 21:32:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe: Remove xe_perf_pmu
> URL   : https://patchwork.freedesktop.org/series/127638/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14007_full -> IGTPW_10393_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10393_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10393_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10393_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@bonded-chain:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][1] +7 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-rkl-2/igt@gem_exec_balancer@bonded-chain.html
> 
>   * igt@gem_exec_balancer@semaphore:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][2] +7 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-dg1-17/igt@gem_exec_balancer@semaphore.html
> 
>   * igt@gem_exec_whisper@basic-queues:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][3] +13 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-snb4/igt@gem_exec_whisper@basic-queues.html
> 
>   * igt@i915_pm_rps@engine-order:
>     - shard-dg1:          NOTRUN -> [ABORT][4] +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-dg1-13/igt@i915_pm_rps@engine-order.html
> 
>   * igt@perf@create-destroy-userspace-config:
>     - shard-rkl:          NOTRUN -> [ABORT][5] +2 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-rkl-3/igt@perf@create-destroy-userspace-config.html
> 
>   * igt@perf_pmu@all-busy-check-all:
>     - shard-dg2:          NOTRUN -> [ABORT][6] +2 other tests abort
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-dg2-7/igt@perf_pmu@all-busy-check-all.html
> 
>   * igt@perf_pmu@busy-hang@rcs0:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][7] +10 other tests incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-glk4/igt@perf_pmu@busy-hang@rcs0.html
>     - shard-mtlp:         NOTRUN -> [ABORT][8] +10 other tests abort
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-mtlp-2/igt@perf_pmu@busy-hang@rcs0.html
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][9] +4 other tests incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-dg2-5/igt@perf_pmu@busy-hang@rcs0.html
> 
>   * igt@perf_pmu@idle-no-semaphores@rcs0:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][10] +8 other tests incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/shard-tglu-8/igt@perf_pmu@idle-no-semaphores@rcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10393_full that come from known issues:
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7635 -> IGTPW_10393
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14007: e888b3a5196ef64c917c30f387276bdcedc9d23b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10393: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/index.html
>   IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10393/index.html
