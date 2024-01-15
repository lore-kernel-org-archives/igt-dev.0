Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 15 Jan 2024 14:39:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_serie?=
 =?utf-8?Q?s?= starting with [i-g-t,1/2] build: Build xe tests by default
Message-ID: <20240115133914.qdyzbbbh4k3e4tdp@kamilkon-desk.igk.intel.com>
References: <20240111213358.1656641-1-lucas.demarchi@intel.com>
 <170502791987.331936.4998809070151488985@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170502791987.331936.4998809070151488985@5338d5abeb45>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-12 at 02:51:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] build: Build xe tests by default
> URL   : https://patchwork.freedesktop.org/series/128693/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14116_full -> IGTPW_10516_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10516_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10516_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10516_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/shard-dg2-1/igt@i915_pm_rps@waitboost.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/shard-dg2-5/igt@i915_pm_rps@waitboost.html
>     - shard-dg1:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/shard-dg1-15/igt@i915_pm_rps@waitboost.html
> 

This is unrelated to change in meson file, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10516_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html

[...cut...]

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/index.html
