Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jan 2020 19:14:41 -0000
Message-ID: <157868368156.30838.5257145964482642689@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev4=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev4)
URL   : https://patchwork.freedesktop.org/series/71194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7719 -> IGTPW_3915
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3915:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc_copy} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-cml-u2/igt@gem_huc_copy@huc_copy.html
    - fi-icl-guc:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-icl-guc/igt@gem_huc_copy@huc_copy.html
    - fi-icl-dsi:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-icl-dsi/igt@gem_huc_copy@huc_copy.html
    - fi-icl-y:           NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-icl-y/igt@gem_huc_copy@huc_copy.html
    - fi-icl-u3:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-icl-u3/igt@gem_huc_copy@huc_copy.html
    - {fi-tgl-u}:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-tgl-u/igt@gem_huc_copy@huc_copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-icl-u2/igt@gem_huc_copy@huc_copy.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7719 and IGTPW_3915:

### New IGT tests (1) ###

  * igt@gem_huc_copy@huc_copy:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3915 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][8] -> [INCOMPLETE][9] ([i915#671])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-bxt-dsi:         [PASS][10] -> [INCOMPLETE][11] ([fdo#103927])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][12] -> [DMESG-FAIL][13] ([i915#725])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-bsw-nick:        [PASS][14] -> [DMESG-FAIL][15] ([i915#723])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-bsw-nick/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][16] ([i915#816]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [TIMEOUT][18] ([i915#816]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][20] ([i915#178]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][22] ([i915#770]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (50 -> 45)
------------------------------

  Additional (1): fi-hsw-4770r 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-tgl-y fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5363 -> IGTPW_3915

  CI-20190529: 20190529
  CI_DRM_7719: 8be213204694b671bd894aced16be510d84d16d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3915: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html
  IGT_5363: 2d453ec48fbda1f4f7ddaf69060be3992f28f680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_huc_copy@huc-copy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
