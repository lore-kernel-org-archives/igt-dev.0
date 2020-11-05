Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432826E15F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 08:00:15 +0000 (UTC)
Date: Thu, 5 Nov 2020 10:00:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201105080011.GT7444@platvala-desk.ger.corp.intel.com>
References: <20201105060820.11057-1-nidhi1.gupta@intel.com>
 <160456139090.14958.17992783598351392471@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160456139090.14958.17992783598351392471@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_subtests_for_accurate_reporting_=28rev3=29?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: nidhi1.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 07:29:50AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Added dynamic subtests for accurate reporting (rev3)
> URL   : https://patchwork.freedesktop.org/series/82743/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5833 -> IGTPW_5134
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5134 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5134, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5134:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-bsw-n3050:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html


Lakshmi, false positive here.


-- 
Petri Latvala


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5134 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_module_load@reload:
>     - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982] / [k.org#205379])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-tgl-u2/igt@i915_module_load@reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-tgl-u2/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-bsw-kefka:       [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-byt-j1900:       [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - fi-icl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-tgl-u2:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@debugfs_test@read_all_entries:
>     - fi-bsw-nick:        [INCOMPLETE][13] ([i915#1250] / [i915#1436]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
> 
>   * igt@i915_module_load@reload:
>     - fi-icl-u2:          [DMESG-WARN][15] ([i915#1982]) -> [PASS][16] +2 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-icl-u2/igt@i915_module_load@reload.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-icl-u2/igt@i915_module_load@reload.html
>     - fi-byt-j1900:       [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-byt-j1900/igt@i915_module_load@reload.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-byt-j1900/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - {fi-ehl-1}:         [DMESG-WARN][19] ([i915#1982]) -> [PASS][20] +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_selftest@live@execlists:
>     - {fi-kbl-7560u}:     [INCOMPLETE][21] ([i915#794]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-kbl-7560u/igt@i915_selftest@live@execlists.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-kbl-7560u/igt@i915_selftest@live@execlists.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-kbl-7500u:       [FAIL][23] ([i915#1161] / [i915#262]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
>   [i915#1250]: https://gitlab.freedesktop.org/drm/intel/issues/1250
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
>   [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
>   [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
>   [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379
> 
> 
> Participating hosts (44 -> 40)
> ------------------------------
> 
>   Missing    (4): fi-ctg-p8600 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5833 -> IGTPW_5134
> 
>   CI-20190529: 20190529
>   CI_DRM_9265: 4152d4ab08d937cfb9254d0e880f1daea64db549 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_5134: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html
>   IGT_5833: 212e55b9aa9e98a3ef63f37a50fd5b69761fbecd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
