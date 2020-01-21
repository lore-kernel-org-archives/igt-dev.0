Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 11:55:05 -0000
Message-ID: <157960770529.11479.3810710869645187768@emeril.freedesktop.org>
References: <20200121111738.127417-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200121111738.127417-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Clean_up_quickly_if_the_kernel_OOPSed_during_a_test?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Clean up quickly if the kernel OOPSed during a test
URL   : https://patchwork.freedesktop.org/series/72330/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783 -> IGTPW_3957
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/index.html

Known issues
------------

  Here are the changes found in IGTPW_3957 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#563])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([fdo#111407])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][7] -> [DMESG-WARN][8] ([i915#44])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [DMESG-WARN][9] ([i915#889]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-6700k2:      [INCOMPLETE][11] ([i915#671]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#889]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [INCOMPLETE][15] ([i915#151]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [INCOMPLETE][17] ([i915#45] / [i915#999]) -> [INCOMPLETE][18] ([i915#45])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [DMESG-WARN][19] ([fdo#111764]) -> [INCOMPLETE][20] ([i915#283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (44 -> 44)
------------------------------

  Additional (5): fi-glk-dsi fi-gdg-551 fi-bsw-kefka fi-bsw-nick fi-snb-2600 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3957

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3957: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3957/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
