Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 13 Dec 2023 16:14:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?=
 failure for Initial SR-IOV validation (rev8)
Message-ID: <20231213151421.wnqbaf5duqpwamh2@kamilkon-desk.igk.intel.com>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
 <170180549273.24283.10848125298099811670@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170180549273.24283.10848125298099811670@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below regressions are unrelated to new libs and tests for sr-iov (sriov)
while skips are ok (as there are no sr-iov configs now).

Regards,
Kamil

On 2023-12-05 at 19:44:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Initial SR-IOV validation (rev8)
> URL   : https://patchwork.freedesktop.org/series/126034/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13981_full -> IGTPW_10335_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10335_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10335_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10335_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-tglu:         NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-tglu-6/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_lmem_swapping@parallel-multi@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][2] +9 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-dg2-2/igt@gem_lmem_swapping@parallel-multi@lmem0.html
>     - shard-dg1:          NOTRUN -> [ABORT][3] +8 other tests abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-dg1-19/igt@gem_lmem_swapping@parallel-multi@lmem0.html
> 
>   * igt@i915_selftest@live@guc_multi_lrc:
>     - shard-mtlp:         [PASS][4] -> [DMESG-WARN][5] +3 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13981/shard-mtlp-2/igt@i915_selftest@live@guc_multi_lrc.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-mtlp-1/igt@i915_selftest@live@guc_multi_lrc.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][6] +8 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][7] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

New tests for sriov - skips are ok.

> 
>   * igt@sriov_basic@bind-unbind-vf (NEW):
>     - shard-dg1:          NOTRUN -> [SKIP][8] +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-dg1-15/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off (NEW):
>     - shard-rkl:          NOTRUN -> [SKIP][9] +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on (NEW):
>     - shard-tglu:         NOTRUN -> [SKIP][10] +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - shard-dg1:          [ABORT][11] ([i915#4391] / [i915#4423]) -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13981/shard-dg1-19/igt@gem_lmem_swapping@basic@lmem0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-dg1-15/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-snb:          [SKIP][13] ([fdo#109271]) -> [INCOMPLETE][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13981/shard-snb2/igt@kms_content_protection@srm.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/shard-snb7/igt@kms_content_protection@srm.html
> 
>   
> #### Suppressed ####
> 

[...cut...]
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7620 -> IGTPW_10335
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13981: aaf3a2f69283b9783afb92c0aa5463f7176d20dd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html
>   IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html
