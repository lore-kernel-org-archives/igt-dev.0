Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 7 Dec 2023 14:59:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?=
 failure for Add some missing descriptions (rev2)
Message-ID: <20231207135940.gr2oh26ehxvsk3mk@kamilkon-desk.igk.intel.com>
References: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
 <170188799688.26423.6450949813781651146@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170188799688.26423.6450949813781651146@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi

below regressions are unrelated to Xe tests descriptions,

Regards,
Kamil

On 2023-12-06 at 18:39:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add some missing descriptions (rev2)
> URL   : https://patchwork.freedesktop.org/series/127419/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13988_full -> IGTPW_10353_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10353_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10353_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10353_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][1] +5 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [ABORT][2] +2 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@i915_selftest@live@gem:
>     - shard-mtlp:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13988/shard-mtlp-3/igt@i915_selftest@live@gem.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-mtlp-1/igt@i915_selftest@live@gem.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-tglu:         NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-tglu-5/igt@kms_pm_backlight@fade.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-rkl:          NOTRUN -> [ABORT][6] +1 other test abort
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-rkl-3/igt@perf_pmu@module-unload.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@type1:
>     - shard-snb:          [SKIP][7] ([fdo#109271]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13988/shard-snb5/igt@kms_content_protection@type1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-snb7/igt@kms_content_protection@type1.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-mtlp:         [ABORT][9] ([i915#8668]) -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13988/shard-mtlp-7/igt@perf_pmu@module-unload.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/shard-mtlp-1/igt@perf_pmu@module-unload.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10353_full that come from known issues:

[...cut...]
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10353/index.html

