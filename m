Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 16:01:31 -0000
Message-ID: <158256009161.28360.18333457408597859971@emeril.freedesktop.org>
References: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/perf=3A_add_some_debug_p?=
 =?utf-8?q?rints?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/perf: add some debug prints
URL   : https://patchwork.freedesktop.org/series/73854/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7997 -> IGTPW_4218
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html

Known issues
------------

  Here are the changes found in IGTPW_4218 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [INCOMPLETE][2] ([i915#694] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][5] -> [INCOMPLETE][6] ([i915#45])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload:
    - fi-ilk-650:         [PASS][7] -> [DMESG-WARN][8] ([i915#116])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-ilk-650/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-ilk-650/igt@i915_module_load@reload.html

  * igt@i915_selftest@live_active:
    - fi-bxt-dsi:         [PASS][9] -> [DMESG-FAIL][10] ([i915#666])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-bxt-dsi/igt@i915_selftest@live_active.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-bxt-dsi/igt@i915_selftest@live_active.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([CI#94] / [i915#402]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][13] -> [FAIL][14] ([fdo#111407])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-kbl-x1275:       [DMESG-FAIL][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-kbl-x1275/igt@i915_selftest@live_gt_lrc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-kbl-x1275/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_perf:
    - fi-apl-guc:         [INCOMPLETE][19] ([fdo#103927]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-apl-guc/igt@i915_selftest@live_perf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-apl-guc/igt@i915_selftest@live_perf.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [SKIP][21] ([fdo#109271]) -> [FAIL][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#116]: https://gitlab.freedesktop.org/drm/intel/issues/116
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (50 -> 45)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5463 -> IGTPW_4218

  CI-20190529: 20190529
  CI_DRM_7997: 3d3098d1384ee777baa141f69112669fed5ea90e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4218: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html
  IGT_5463: d519c80219ebe558cd2fa378f26f9d73f9e35310 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
