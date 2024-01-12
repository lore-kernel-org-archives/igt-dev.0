Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:46:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing?= with [1/2] lib/amdgpu: add secure flag to sdma packet
Message-ID: <20240112174622.2c66ryh5vfuxgk4i@kamilkon-desk.igk.intel.com>
References: <20240111192553.113902-1-vitaly.prosyak@amd.com>
 <170501638837.331655.1865480720535597088@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170501638837.331655.1865480720535597088@5338d5abeb45>
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

Hi igt-dev,
On 2024-01-11 at 23:39:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] lib/amdgpu: add secure flag to sdma packet
> URL   : https://patchwork.freedesktop.org/series/128689/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14116_full -> IGTPW_10514_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10514_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10514_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10514_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ppgtt@blt-vs-render-ctxn:
>     - shard-tglu:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/shard-tglu-9/igt@gem_ppgtt@blt-vs-render-ctxn.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/shard-tglu-3/igt@gem_ppgtt@blt-vs-render-ctxn.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/shard-dg1-15/igt@kms_fbcon_fbt@fbc-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/shard-dg1-13/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_psr@psr2-cursor-mmap-cpu@edp-1}:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/shard-mtlp-8/igt@kms_psr@psr2-cursor-mmap-cpu@edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/shard-mtlp-6/igt@kms_psr@psr2-cursor-mmap-cpu@edp-1.html
> 

Unrelated to amdgpu test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10514_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7670 -> IGTPW_10514
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10514: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/index.html
