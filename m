Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:41:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fschedule=3A?= Update for MTL RCS/CCS w/a (rev3)
Message-ID: <20240112174129.t2fwax4gg6bx4tf6@kamilkon-desk.igk.intel.com>
References: <20240111185645.4056250-1-John.C.Harrison@Intel.com>
 <170500264616.290001.12543351368731359269@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170500264616.290001.12543351368731359269@5338d5abeb45>
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
On 2024-01-11 at 19:50:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_schedule: Update for MTL RCS/CCS w/a (rev3)
> URL   : https://patchwork.freedesktop.org/series/128342/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14116 -> IGTPW_10513
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10513 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10513, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Additional (1): bat-mtlp-8 
>   Missing    (3): bat-rpls-2 bat-dg2-9 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10513:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-skl-guc:         [PASS][3] -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 

This is unrelated to gem_exec_schedule, please respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10513 that come from known issues:
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7670 -> IGTPW_10513
> 
>   CI-20190529: 20190529
>   CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10513: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/index.html
