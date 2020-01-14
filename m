Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jan 2020 14:22:18 -0000
Message-ID: <157901173809.24908.4684285865905017246@emeril.freedesktop.org>
References: <1579008904-22441-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579008904-22441-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: validate color tests using chamelium.
URL   : https://patchwork.freedesktop.org/series/72006/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7739 -> IGTPW_3922
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/index.html

Known issues
------------

  Here are the changes found in IGTPW_3922 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#770])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][5] ([fdo#112271] / [i915#816]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_fence@basic-wait-default:
    - {fi-ehl-1}:         [INCOMPLETE][7] ([i915#937]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [INCOMPLETE][9] ([i915#671]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][11] ([i915#178]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (53 -> 42)
------------------------------

  Missing    (11): fi-hsw-4770r fi-ilk-m540 fi-hsw-4200u fi-glk-dsi fi-byt-squawks fi-bsw-cyan fi-ilk-650 fi-ctg-p8600 fi-elk-e7500 fi-tgl-y fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5365 -> IGTPW_3922

  CI-20190529: 20190529
  CI_DRM_7739: 757c25a357ea6e34d5eba9b6efee6f45e7961334 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3922: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/index.html
  IGT_5365: e9ec0ed63b25c86861ffac3c8601cc4d1b910b65 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_color_chamelium@pipe-a-ctm-0-5
+igt@kms_color_chamelium@pipe-a-ctm-0-25
+igt@kms_color_chamelium@pipe-a-ctm-0-75
+igt@kms_color_chamelium@pipe-a-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-a-ctm-green-to-red
+igt@kms_color_chamelium@pipe-a-ctm-limited-range
+igt@kms_color_chamelium@pipe-a-ctm-max
+igt@kms_color_chamelium@pipe-a-ctm-negative
+igt@kms_color_chamelium@pipe-a-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-a-degamma
+igt@kms_color_chamelium@pipe-a-gamma
+igt@kms_color_chamelium@pipe-b-ctm-0-5
+igt@kms_color_chamelium@pipe-b-ctm-0-25
+igt@kms_color_chamelium@pipe-b-ctm-0-75
+igt@kms_color_chamelium@pipe-b-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-b-ctm-green-to-red
+igt@kms_color_chamelium@pipe-b-ctm-limited-range
+igt@kms_color_chamelium@pipe-b-ctm-max
+igt@kms_color_chamelium@pipe-b-ctm-negative
+igt@kms_color_chamelium@pipe-b-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-b-degamma
+igt@kms_color_chamelium@pipe-b-gamma
+igt@kms_color_chamelium@pipe-c-ctm-0-5
+igt@kms_color_chamelium@pipe-c-ctm-0-25
+igt@kms_color_chamelium@pipe-c-ctm-0-75
+igt@kms_color_chamelium@pipe-c-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-c-ctm-green-to-red
+igt@kms_color_chamelium@pipe-c-ctm-limited-range
+igt@kms_color_chamelium@pipe-c-ctm-max
+igt@kms_color_chamelium@pipe-c-ctm-negative
+igt@kms_color_chamelium@pipe-c-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-c-degamma
+igt@kms_color_chamelium@pipe-c-gamma
+igt@kms_color_chamelium@pipe-d-ctm-0-5
+igt@kms_color_chamelium@pipe-d-ctm-0-25
+igt@kms_color_chamelium@pipe-d-ctm-0-75
+igt@kms_color_chamelium@pipe-d-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-d-ctm-green-to-red
+igt@kms_color_chamelium@pipe-d-ctm-limited-range
+igt@kms_color_chamelium@pipe-d-ctm-max
+igt@kms_color_chamelium@pipe-d-ctm-negative
+igt@kms_color_chamelium@pipe-d-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-d-degamma
+igt@kms_color_chamelium@pipe-d-gamma
+igt@kms_color_chamelium@pipe-e-ctm-0-5
+igt@kms_color_chamelium@pipe-e-ctm-0-25
+igt@kms_color_chamelium@pipe-e-ctm-0-75
+igt@kms_color_chamelium@pipe-e-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-e-ctm-green-to-red
+igt@kms_color_chamelium@pipe-e-ctm-limited-range
+igt@kms_color_chamelium@pipe-e-ctm-max
+igt@kms_color_chamelium@pipe-e-ctm-negative
+igt@kms_color_chamelium@pipe-e-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-e-degamma
+igt@kms_color_chamelium@pipe-e-gamma
+igt@kms_color_chamelium@pipe-f-ctm-0-5
+igt@kms_color_chamelium@pipe-f-ctm-0-25
+igt@kms_color_chamelium@pipe-f-ctm-0-75
+igt@kms_color_chamelium@pipe-f-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-f-ctm-green-to-red
+igt@kms_color_chamelium@pipe-f-ctm-limited-range
+igt@kms_color_chamelium@pipe-f-ctm-max
+igt@kms_color_chamelium@pipe-f-ctm-negative
+igt@kms_color_chamelium@pipe-f-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-f-degamma
+igt@kms_color_chamelium@pipe-f-gamma
+igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes
+igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes
+igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3922/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
