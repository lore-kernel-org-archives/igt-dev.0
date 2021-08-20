Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1273B6EA4A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 09:23:29 +0000 (UTC)
Date: Fri, 20 Aug 2021 12:26:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YR91OtKHfHR/Qutn@platvala-desk.ger.corp.intel.com>
References: <20210819152507.25912-1-petri.latvala@intel.com>
 <162939016830.746.8888430732982681777@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162939016830.746.8888430732982681777@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_kms=5Fccs=3A_Require_a_connect?=
 =?utf-8?q?ed_output?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 04:22:48PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] kms_ccs: Require a connected output
> URL   : https://patchwork.freedesktop.org/series/93837/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6179 -> IGTPW_6140
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6140 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6140, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6140:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_prop_blob@basic:
>     - fi-tgl-1115g4:      [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-tgl-1115g4/igt@kms_prop_blob@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-tgl-1115g4/igt@kms_prop_blob@basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-rkl-11600:       [PASS][3] -> [WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
> 


Lakshmi, false failures here.


-- 
Petri Latvala





>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6140 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fence@basic-busy@bcs0:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271]) +6 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-n3050:       [PASS][7] -> [INCOMPLETE][8] ([i915#2940])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886] / [i915#2291])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - fi-rkl-guc:         [PASS][10] -> [DMESG-WARN][11] ([i915#3967])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#533])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@runner@aborted:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][14] ([fdo#109271] / [i915#1436] / [i915#2722])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-bsw-n3050/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-tgl-1115g4:      [DMESG-WARN][15] ([i915#4002]) -> [PASS][16] +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - fi-bsw-n3050:       [DMESG-FAIL][17] -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-kbl-7500u:       [FAIL][19] ([i915#1372]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - fi-tgl-1115g4:      [DMESG-WARN][21] ([i915#4002]) -> [FAIL][22] ([i915#1888])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-tgl-1115g4:      [INCOMPLETE][23] ([i915#1385] / [i915#4006]) -> [INCOMPLETE][24] ([i915#4006])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6179/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
>   [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
>   [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
>   [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
>   [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
>   [i915#3967]: https://gitlab.freedesktop.org/drm/intel/issues/3967
>   [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002
>   [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
> 
> 
> Participating hosts (40 -> 36)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6179 -> IGTPW_6140
> 
>   CI-20190529: 20190529
>   CI_DRM_10498: b66f2ed13db3f8f7bcf616cea0e59ebe8728b131 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/index.html
>   IGT_6179: e41ebfddab3031b7765cc7cbcbf73b03c3c46bd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6140/index.html
