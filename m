Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 20:21:37 -0000
Message-ID: <158058849702.32691.11077447650343302963@emeril.freedesktop.org>
References: <20200201193347.7432-1-ayaz.siddiqui@intel.com>
In-Reply-To: <20200201193347.7432-1-ayaz.siddiqui@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGNo?=
 =?utf-8?q?eck_for_FENCE_based_tiling_support?=
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
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add check for FENCE based tiling support
URL   : https://patchwork.freedesktop.org/series/72870/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7854 -> IGTPW_4071
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/index.html

Known issues
------------

  Here are the changes found in IGTPW_4071 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
    - fi-bsw-nick:        [PASS][3] -> [INCOMPLETE][4] ([CI#80])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-bsw-nick/igt@gem_exec_parallel@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-bsw-nick/igt@gem_exec_parallel@contexts.html

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#289]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-icl-u2/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-icl-u2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#563])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][9] ([i915#178]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][11] ([i915#263]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [SKIP][13] ([fdo#109271]) -> [FAIL][14] ([i915#704])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][15] ([i915#323]) -> [DMESG-WARN][16] ([IGT#4] / [i915#263])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7854/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704


Participating hosts (48 -> 40)
------------------------------

  Additional (4): fi-hsw-peppy fi-skl-lmem fi-gdg-551 fi-ivb-3770 
  Missing    (12): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ilk-650 fi-snb-2520m fi-cfl-8109u fi-blb-e6850 fi-byt-clapper fi-skl-6600u fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4071

  CI-20190529: 20190529
  CI_DRM_7854: 727605cdef77d1e7eafb7e4c05b0ee74132a0930 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4071: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4071/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
