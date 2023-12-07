Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 7 Dec 2023 12:27:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGli?=
 =?utf-8?Q?=2Fintel=5Fbatchbuffer?= =?utf-8?Q?=3A?= Use COMPUTE instead of
 RENDER engine for Xe if missing
Message-ID: <20231207112723.sybptrdlghl32si2@kamilkon-desk.igk.intel.com>
References: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
 <170190027739.26425.191154403520019232@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170190027739.26425.191154403520019232@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below regressions are unrelated to change in Xe path.

On 2023-12-06 at 22:04:37 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_batchbuffer: Use COMPUTE instead of RENDER engine for Xe if missing
> URL   : https://patchwork.freedesktop.org/series/127451/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7626_full -> IGTPW_10356_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10356_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10356_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10356_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-multi@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][1] +10 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-dg2-1/igt@gem_lmem_swapping@parallel-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@random@lmem0:
>     - shard-dg1:          NOTRUN -> [ABORT][2] +7 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-dg1-16/igt@gem_lmem_swapping@random@lmem0.html
> 
>   * igt@gem_spin_batch@legacy@render:
>     - shard-snb:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7626/shard-snb4/igt@gem_spin_batch@legacy@render.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-snb4/igt@gem_spin_batch@legacy@render.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          NOTRUN -> [ABORT][5] +3 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>     - shard-tglu:         NOTRUN -> [WARN][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>   * igt@i915_selftest@mock@sanitycheck:
>     - shard-tglu:         NOTRUN -> [ABORT][7] +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-tglu-4/igt@i915_selftest@mock@sanitycheck.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-mtlp:         NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-mtlp-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-tglu:         NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-snb:          [SKIP][10] ([fdo#109271]) -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7626/shard-snb2/igt@kms_content_protection@atomic-dpms.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/shard-snb7/igt@kms_content_protection@atomic-dpms.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10356_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7626 -> IGTPW_10356
> 
>   CI-20190529: 20190529
>   CI_DRM_13988: 6ae23377ae459d8506ecdd2f538bfee2f52652f6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10356: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html
>   IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10356/index.html
