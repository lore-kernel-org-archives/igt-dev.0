Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4212610E6A6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 14:21:17 +0000 (UTC)
Date: Fri, 25 Aug 2023 16:21:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230825142112.2vyceaii2imoqeun@kamilkon-desk.igk.intel.com>
References: <20230823062049.1755138-1-priyanka.dandamudi@intel.com>
 <169277789548.16629.11238935722078204042@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169277789548.16629.11238935722078204042@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIHhlL3hl?=
 =?utf-8?q?=5Fsysfs=3A_Update_test_documentation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below is unrelated to change in documentation (comments),
no need for respin.

Regards,
Kamil

On 2023-08-23 at 08:04:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe/xe_sysfs: Update test documentation
> URL   : https://patchwork.freedesktop.org/series/122775/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13549 -> IGTPW_9642
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9642 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9642, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9642:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_addfb_basic@bad-pitch-256:
>     - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13549/fi-kbl-soraka/igt@kms_addfb_basic@bad-pitch-256.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/fi-kbl-soraka/igt@kms_addfb_basic@bad-pitch-256.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9642 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - bat-dg2-9:          [PASS][3] -> [INCOMPLETE][4] ([i915#6311])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13549/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-adlp-9:         NOTRUN -> [INCOMPLETE][5] ([i915#7443])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
>     - bat-dg2-11:         NOTRUN -> [INCOMPLETE][6] ([i915#4817])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-adlp-9:         [INCOMPLETE][7] ([i915#4983] / [i915#7913]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13549/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
>     - bat-dg2-11:         [INCOMPLETE][9] ([i915#7609] / [i915#7913]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13549/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-rplp-1:         [ABORT][11] ([i915#8442] / [i915#8668] / [i915#8860]) -> [ABORT][12] ([i915#8860])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13549/bat-rplp-1/igt@kms_psr@primary_page_flip.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/bat-rplp-1/igt@kms_psr@primary_page_flip.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
>   [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
>   [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8860]: https://gitlab.freedesktop.org/drm/intel/issues/8860
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7451 -> IGTPW_9642
> 
>   CI-20190529: 20190529
>   CI_DRM_13549: daa7b246575041e069f151cfbc69d07e321bdc01 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/index.html
>   IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9642/index.html
