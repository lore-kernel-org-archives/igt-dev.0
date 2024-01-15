Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 15 Jan 2024 14:46:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?B?bC94ZV9jY3M6?= Fix block-multicopy-inplace subtest (rev2)
Message-ID: <20240115134658.fyj7infcrr5yso3f@kamilkon-desk.igk.intel.com>
References: <cover.1705103321.git.akshata.jahagirdar@intel.com>
 <170507689332.338258.15501372162373139150@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170507689332.338258.15501372162373139150@5338d5abeb45>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-12 at 16:28:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_ccs: Fix block-multicopy-inplace subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/128391/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14118_full -> IGTPW_10524_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10524_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10524_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10524_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@gem-mmap-type@wb-smem0:
>     - shard-tglu:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14118/shard-tglu-3/igt@i915_pm_rpm@gem-mmap-type@wb-smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/shard-tglu-3/igt@i915_pm_rpm@gem-mmap-type@wb-smem0.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
>     - shard-tglu:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14118/shard-tglu-10/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/shard-tglu-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
> 

This is unrelated to Xe test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10524_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/shard-rkl-3/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/shard-dg1-12/igt@api_intel_bb@crc32.html
> 

...cut..

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7671 -> IGTPW_10524
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14118: 962785f4613664f29663206aa3355dc292a252c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10524: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/index.html
>   IGT_7671: 7671
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10524/index.html
