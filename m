Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEA06E8C4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 14:28:59 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Fri, 13 Dec 2019 14:28:56 +0000
Message-ID: <7e3de784cc2e203b56dce5728096225a2700aa2e.camel@intel.com>
References: <20191212181556.30059-1-stanislav.lisovskiy@intel.com>
 <157617764879.32010.6290937616704960873@emeril.freedesktop.org>
In-Reply-To: <157617764879.32010.6290937616704960873@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <C6ED47F80F4B06429E1B295C94D77C2A@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_i915_pipe_stress_test_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2019-12-12 at 19:07 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce i915 pipe stress test (rev3)
> URL   : https://patchwork.freedesktop.org/series/70815/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7551 -> IGTPW_3859
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3859 absolutely need to
> be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_3859, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false
> positives in CI.
> 
>   External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in
> IGTPW_3859:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_close_race@basic-threads:
>     - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2]
>    [1]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-byt-n2820/igt@gem_close_race@basic-threads.html
>    [2]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-byt-n2820/igt@gem_close_race@basic-threads.html
> 
>   * igt@runner@aborted:
>     - fi-byt-n2820:       NOTRUN -> [FAIL][3]
>    [3]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-byt-n2820/igt@runner@aborted.html
> 
>   

...and one more,

igt@runner aborts caused by some stuff in DSI and of course
one gem failure which is orthogonal to stress test case...



> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_3859 that come from known
> issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live_blt:
>     - fi-ivb-3770:        [PASS][4] -> [DMESG-FAIL][5] ([i915#725])
>    [4]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-ivb-3770/igt@i915_selftest@live_blt.html
>    [5]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-ivb-3770/igt@i915_selftest@live_blt.html
>     - fi-hsw-4770r:       [PASS][6] -> [DMESG-FAIL][7] ([i915#725])
>    [6]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-hsw-4770r/igt@i915_selftest@live_blt.html
>    [7]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-hsw-4770r/igt@i915_selftest@live_blt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_sync@basic-each:
>     - {fi-tgl-u}:         [INCOMPLETE][8] ([i915#472] / [i915#707])
> -> [PASS][9]
>    [8]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-tgl-u/igt@gem_sync@basic-each.html
>    [9]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-tgl-u/igt@gem_sync@basic-each.html
> 
>   * igt@i915_selftest@live_gem_contexts:
>     - fi-hsw-peppy:       [DMESG-FAIL][10] ([i915#722]) -> [PASS][11]
>    [10]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
>    [11]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
> 
>   * igt@kms_chamelium@hdmi-edid-read:
>     - fi-kbl-7500u:       [FAIL][12] ([i915#217]) -> [PASS][13]
>    [12]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
>    [13]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - fi-kbl-x1275:       [DMESG-WARN][14] ([fdo#107139] / [i915#62]
> / [i915#92]) -> [DMESG-WARN][15] ([fdo#107139] / [i915#62] /
> [i915#92] / [i915#95])
>    [14]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html
>    [15]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-x1275:       [DMESG-WARN][16] ([i915#62] / [i915#92]) ->
> [SKIP][17] ([fdo#109271])
>    [16]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [17]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - fi-kbl-x1275:       [DMESG-WARN][18] ([i915#62] / [i915#92]) ->
> [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) +3 similar
> issues
>    [18]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html
>    [19]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>     - fi-kbl-x1275:       [DMESG-WARN][20] ([i915#62] / [i915#92] /
> [i915#95]) -> [DMESG-WARN][21] ([i915#62] / [i915#92]) +3 similar
> issues
>    [20]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>    [21]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when
> computing
>           the status of the difference (SUCCESS, WARNING, or
> FAILURE).
> 
>   [fdo#107139]: https://bugs.freedesktop.org/show_bug.cgi?id=107139
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
>   [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
>   [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
>   [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (52 -> 46)
> ------------------------------
> 
>   Additional (1): fi-gdg-551 
>   Missing    (7): fi-icl-1065g7 fi-ilk-m540 fi-byt-squawks fi-bsw-
> cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5346 -> IGTPW_3859
> 
>   CI-20190529: 20190529
>   CI_DRM_7551: e60aa4ffc106f910452d28f2ea49ae2ff44d85d5 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3859: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html
>   IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
> 
> == Testlist changes ==
> 
> +igt@i915_pipe_stress@stress-xrgb8888-untiled
> 
> == Logs ==
> 
> For more details see: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
