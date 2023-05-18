Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C85310E516
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 12:04:24 +0000 (UTC)
Date: Thu, 18 May 2023 14:04:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230518120420.ee33mi2vnobtsjnd@kamilkon-desk1>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
 <168436172207.6588.8991507454506960980@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168436172207.6588.8991507454506960980@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIFBNVTog?=
 =?utf-8?q?multi-tile_support_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-05-17 at 22:15:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: PMU: multi-tile support (rev4)
> URL   : https://patchwork.freedesktop.org/series/117406/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13160 -> IGTPW_8990
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8990 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8990, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
> 
> Participating hosts (36 -> 37)
> ------------------------------
> 
>   Additional (2): fi-kbl-soraka bat-mtlp-6 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8990:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@vgem_basic@setversion:
>     - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@vgem_basic@setversion.html

This is unrelated to perf_pmu and tools,

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8990 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@i915_module_load@reload:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-WARN][4] ([i915#1982] / [i915#8189])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-11:         [PASS][6] -> [DMESG-WARN][7] ([i915#7699])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13160/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-dg2-11/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [PASS][8] -> [ABORT][9] ([i915#7911] / [i915#7920])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13160/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         NOTRUN -> [DMESG-WARN][10] ([i915#6367])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-rpls-2/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-2:         NOTRUN -> [ABORT][11] ([i915#6687])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][12] ([fdo#109271]) +14 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4579])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         [ABORT][14] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13160/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
>     - bat-dg2-8:          [FAIL][16] ([i915#7932]) -> [PASS][17] +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13160/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7294 -> IGTPW_8990
> 
>   CI-20190529: 20190529
>   CI_DRM_13160: 2147c8fcc283c183aba29e5f51b653332d90a3ed @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8990: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
>   IGT_7294: e1ab60dc90fc49f6b2ec1b37f14b021e59455e73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@perf_pmu@rc6-all-gts
> -igt@perf_pmu@frequency-idle
> -igt@perf_pmu@rc6-runtime-pm
> -igt@perf_pmu@rc6-runtime-pm-long
> -igt@xe_eudebug@basic-client
> -igt@xe_eudebug@basic-close
> -igt@xe_eudebug@basic-connect
> -igt@xe_eudebug@basic-read-event
> -igt@xe_eudebug@basic-vms
> -igt@xe_eudebug@discovery-empty
> -igt@xe_eudebug@discovery-empty-clients
> -igt@xe_eudebug@discovery-race
> -igt@xe_eudebug@multiple-sessions
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8990/index.html
