Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7AB10E63F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 16:07:42 +0000 (UTC)
Date: Wed, 8 Mar 2023 17:07:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230308160738.3qzcbwt3mzehhcox@kamilkon-desk1>
References: <20230224200941.9867-1-pallavi.mishra@intel.com>
 <167828359514.20407.7705623429182818269@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167828359514.20407.7705623429182818269@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_i915/sysfs=5Fheartbeat=5Finter?=
 =?utf-8?q?val=3A_Update_test_to_work_with_GuC_submission?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai Nandan,

below regressions are unrelated to change,

Regards,
Kamil

On 2023-03-08 at 13:53:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2,i-g-t] i915/sysfs_heartbeat_interval: Update test to work with GuC submission
> URL   : https://patchwork.freedesktop.org/series/114842/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7185 -> IGTPW_8576
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8576 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8576, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html
> 
> Participating hosts (35 -> 35)
> ------------------------------
> 
>   Additional (1): bat-kbl-2 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8576:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - fi-kbl-7567u:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/fi-kbl-7567u/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/fi-kbl-7567u/igt@i915_module_load@load.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8576 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-rpls-1:         NOTRUN -> [SKIP][3] ([i915#7828])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-rpls-1:         NOTRUN -> [SKIP][4] ([i915#1845])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-adlp-9:         [DMESG-FAIL][5] ([i915#7699]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/bat-adlp-9/igt@i915_selftest@live@migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/bat-adlp-9/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [ABORT][7] ([i915#4983] / [i915#7694] / [i915#7911] / [i915#7981]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         [ABORT][9] ([i915#4983] / [i915#7913]) -> [ABORT][10] ([i915#4983] / [i915#7913] / [i915#7981])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#7694]: https://gitlab.freedesktop.org/drm/intel/issues/7694
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7185 -> IGTPW_8576
> 
>   CI-20190529: 20190529
>   CI_DRM_12827: b794b8d84dc0470ee58467386f41870e81a86580 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html
>   IGT_7185: 6707461ddb214bb8a75c5fcf2747941c9d9b11ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html
