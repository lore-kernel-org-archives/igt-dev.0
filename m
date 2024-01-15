Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 15 Jan 2024 14:48:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/intel/xe_exec_reset: Do not validate data on GT reset
Message-ID: <20240115134824.ex4yhbqdwlcupmpa@kamilkon-desk.igk.intel.com>
References: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
 <170509325987.338258.15409905944563078388@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170509325987.338258.15409905944563078388@5338d5abeb45>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-12 at 21:00:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Do not validate data on GT reset
> URL   : https://patchwork.freedesktop.org/series/128730/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7672_full -> IGTPW_10526_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10526_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10526_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10526_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy@gt0:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7672/shard-dg2-10/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/shard-dg2-10/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7672/shard-glk4/igt@perf@non-zero-reason@0-rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/shard-glk4/igt@perf@non-zero-reason@0-rcs0.html
> 

This is unrelated to Xe test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10526_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7672 -> IGTPW_10526
> 
>   CI-20190529: 20190529
>   CI_DRM_14118: 962785f4613664f29663206aa3355dc292a252c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/index.html
>   IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/index.html
