Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367AB10E02F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 19:10:21 +0000 (UTC)
Date: Fri, 7 Oct 2022 21:10:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0B5mK6QEx7VzQzG@kamilkon-desk1>
References: <20221007145241.44592-1-jfree@freebsd.org>
 <166515695927.15727.5762049736947581069@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166515695927.15727.5762049736947581069@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3Rl?=
 =?utf-8?q?sts/igt=5Ffork=2Ec=3A_Fix_error_in_mmap=28=29_flags?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 2022-10-07 at 15:35:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/tests/igt_fork.c: Fix error in mmap() flags
> URL   : https://patchwork.freedesktop.org/series/109482/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12225 -> IGTPW_7923
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7923 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7923, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/index.html
> 
> Participating hosts (46 -> 44)
> ------------------------------
> 
>   Missing    (2): fi-ctg-p8600 fi-hsw-4200u 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7923:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/fi-apl-guc/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-apl-guc/igt@i915_selftest@live@gt_pm.html
> 

These are unrelated to lib/tests/igt_fork.c

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7923 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][4] ([fdo#111827])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-dg1-5:          NOTRUN -> [SKIP][6] ([i915#4078])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@runner@aborted:
>     - fi-apl-guc:         NOTRUN -> [FAIL][7] ([fdo#109271] / [i915#4312] / [i915#6641])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-apl-guc/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - {bat-adlm-1}:       [DMESG-WARN][8] ([i915#2867]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html
>     - {bat-rpls-1}:       [DMESG-WARN][10] ([i915#6687]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-dg1-5:          [INCOMPLETE][12] ([i915#4418]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-bxt-dsi:         [DMESG-FAIL][14] ([i915#5334]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-4770:        [INCOMPLETE][16] ([i915#4785]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@slpc:
>     - {bat-rpls-1}:       [DMESG-FAIL][18] ([i915#6367]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-rpls-1/igt@i915_selftest@live@slpc.html
>     - {bat-adln-1}:       [DMESG-FAIL][20] ([i915#6997]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/bat-adln-1/igt@i915_selftest@live@slpc.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/bat-adln-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-bdw-5557u:       [INCOMPLETE][22] ([i915#146] / [i915#6712]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12225/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
>   [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
>   [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
>   [i915#6641]: https://gitlab.freedesktop.org/drm/intel/issues/6641
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#6712]: https://gitlab.freedesktop.org/drm/intel/issues/6712
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7003 -> IGTPW_7923
> 
>   CI-20190529: 20190529
>   CI_DRM_12225: 31426dd8e9677d64141dcf5546927c6c23e994bd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7923: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/index.html
>   IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7923/index.html
