Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD15910E033
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 16:29:33 +0000 (UTC)
Date: Thu, 27 Apr 2023 18:29:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230427162928.76xbyy5rtepg23yc@kamilkon-desk1>
References: <20230426062248.3110901-1-janga.rahul.kumar@intel.com>
 <168249377835.17154.10777945430201018335@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168249377835.17154.10777945430201018335@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIGludGVs?=
 =?utf-8?q?-ci/xe-fast-feedback=2Etestlist=3A_Add_eviction_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 janga.rahul.kumar@intel.com, SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

this is unrelated to xe testlist change,

Regards,
Kamil

On 2023-04-26 at 07:22:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci/xe-fast-feedback.testlist: Add eviction tests
> URL   : https://patchwork.freedesktop.org/series/116971/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7271 -> IGTPW_8864
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8864 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8864, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/index.html
> 
> Participating hosts (39 -> 36)
> ------------------------------
> 
>   Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8864:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8864 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         [PASS][3] -> [FAIL][4] ([i915#8308])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-dg2-11/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-11:         [PASS][5] -> [FAIL][6] ([i915#7913])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-dg2-11/igt@i915_selftest@live@migrate.html
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - bat-adlp-9:         NOTRUN -> [SKIP][7] ([i915#3546]) +1 similar issue
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][8] ([i915#1845] / [i915#5354]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         [SKIP][9] ([i915#5354]) -> [SKIP][10] ([i915#1845] / [i915#5354])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7271 -> IGTPW_8864
> 
>   CI-20190529: 20190529
>   CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8864: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/index.html
>   IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8864/index.html
