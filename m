Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:52:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/perf_pmu: Set defaults before frequency test
Message-ID: <20240112175207.6t2h5q4cfgae4fpo@kamilkon-desk.igk.intel.com>
References: <20240111222054.2403101-1-vinay.belgaumkar@intel.com>
 <170501605878.290000.2720917775519946602@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170501605878.290000.2720917775519946602@5338d5abeb45>
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
On 2024-01-11 at 23:34:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/perf_pmu: Set defaults before frequency test
> URL   : https://patchwork.freedesktop.org/series/128695/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14116 -> IGTPW_10517
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10517 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10517, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html
> 
> Participating hosts (37 -> 26)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (12): fi-rkl-11600 fi-skl-guc fi-tgl-1115g4 bat-dg2-9 fi-cfl-guc fi-snb-2520m fi-ivb-3770 fi-elk-e7500 bat-rplp-1 fi-blb-e6850 bat-dg2-11 bat-jsl-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10517:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@coherency:
>     - bat-adlm-1:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-adlm-1/igt@i915_selftest@live@coherency.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-adlm-1/igt@i915_selftest@live@coherency.html
> 

Unrelated to perf_pmu test, please respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10517 that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7670 -> IGTPW_10517
> 
>   CI-20190529: 20190529
>   CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html
