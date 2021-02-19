Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480376EB3C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 14:01:44 +0000 (UTC)
Date: Fri, 19 Feb 2021 16:01:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YC/E0qSB3G6w+4dL@platvala-desk.ger.corp.intel.com>
References: <20210219114108.29110-1-venkata.sai.patnana@intel.com>
 <161373757716.700.2101265706392377178@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161373757716.700.2101265706392377178@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Restrict_the_test_execution_to_two_pipes_=28re?=
 =?utf-8?b?djMp?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 12:26:17PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_setmode: Restrict the test execution to two pipes (rev3)
> URL   : https://patchwork.freedesktop.org/series/87178/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9789 -> IGTPW_5539
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5539 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5539, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5539:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-tgl-u2:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-tgl-u2/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-tgl-u2/igt@i915_selftest@live@gt_pm.html

Lakshmi, false positive here for you.

-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5539 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_basic@userptr:
>     - fi-byt-j1900:       NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html
> 
>   * igt@debugfs_test@read_all_entries:
>     - fi-tgl-y:           [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-tgl-y/igt@debugfs_test@read_all_entries.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-tgl-y/igt@debugfs_test@read_all_entries.html
> 
>   * igt@i915_module_load@reload:
>     - fi-kbl-7500u:       [PASS][6] -> [DMESG-WARN][7] ([i915#2605])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-kbl-7500u/igt@i915_module_load@reload.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-kbl-7500u/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][8] -> [INCOMPLETE][9] ([i915#2940])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - fi-snb-2600:        NOTRUN -> [SKIP][10] ([fdo#109271]) +34 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - fi-snb-2600:        NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@runner@aborted:
>     - fi-bsw-nick:        NOTRUN -> [FAIL][12] ([i915#1436])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-bsw-nick/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_mmap_gtt@basic:
>     - fi-tgl-y:           [DMESG-WARN][13] ([i915#402]) -> [PASS][14] +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-tgl-y/igt@gem_mmap_gtt@basic.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-tgl-y/igt@gem_mmap_gtt@basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-byt-j1900:       [INCOMPLETE][15] ([i915#142] / [i915#2405]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
>   [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
>   [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
> 
> 
> Participating hosts (45 -> 40)
> ------------------------------
> 
>   Additional (1): fi-snb-2600 
>   Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6009 -> IGTPW_5539
> 
>   CI-20190529: 20190529
>   CI_DRM_9789: 0cde40e2430f7995d97d15c35092bc6d2ffc6a48 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_5539: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/index.html
>   IGT_6009: a4dccf189b34a55338feec9927dac57c467c4100 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5539/index.html

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
