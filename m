Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 7 Dec 2023 15:04:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?=
 for fixed malformed pipectrl command in PXP IGT tests
Message-ID: <20231207140435.bys3rz2syyvfyxn3@kamilkon-desk.igk.intel.com>
References: <20231205025537.1528864-1-vivaik.balasubrawmanian@intel.com>
 <170177941597.24286.2748771044898856281@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170177941597.24286.2748771044898856281@emeril.freedesktop.org>
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

this are unrelated to gem_pxp test,

Regards,
Kamil

On 2023-12-05 at 12:30:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: fixed malformed pipectrl command in PXP IGT tests
> URL   : https://patchwork.freedesktop.org/series/127336/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13977_full -> IGTPW_10334_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10334_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10334_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   Additional (1): shard-mtlp0 
>   Missing    (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10334_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][1] +6 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-dg2-10/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [ABORT][2] +4 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-rkl:          NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-rkl-4/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_selftest@mock@sanitycheck:
>     - shard-tglu:         NOTRUN -> [ABORT][4] +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-tglu-8/igt@i915_selftest@mock@sanitycheck.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][5] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-dg2-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-dg2-7/igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-tglu-8/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglu:         [INCOMPLETE][9] ([i915#9200]) -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13977/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-snb:          [SKIP][11] ([fdo#109271]) -> [INCOMPLETE][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13977/shard-snb6/igt@kms_content_protection@mei-interface.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/shard-snb7/igt@kms_content_protection@mei-interface.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10334_full that come from known issues:
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7618 -> IGTPW_10334
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13977: b51da5b972248612a7659b780ccbf89d3500328c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/index.html
>   IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/index.html
