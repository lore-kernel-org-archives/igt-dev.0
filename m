Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Dec 2019 23:28:31 -0000
Message-ID: <157714371104.16936.2664176920765325397@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev3=29?=
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

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev3)
URL   : https://patchwork.freedesktop.org/series/71194/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7630 -> IGTPW_3884
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3884 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3884, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3884:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_3884 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [INCOMPLETE][2] ([i915#505]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][4] ([i915#725]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-soraka:      [DMESG-FAIL][6] ([i915#656]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-kbl-soraka/igt@i915_selftest@live_execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-kbl-soraka/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_memory_region:
    - fi-bwr-2160:        [FAIL][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-bwr-2160/igt@i915_selftest@live_memory_region.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-bwr-2160/igt@i915_selftest@live_memory_region.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][10] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][11] ([i915#62] / [i915#92]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][12] ([i915#62] / [i915#92]) -> [DMESG-WARN][13] ([i915#62] / [i915#92] / [i915#95]) +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7630/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (43 -> 38)
------------------------------

  Additional (8): fi-byt-j1900 fi-skl-6770hq fi-glk-dsi fi-whl-u fi-gdg-551 fi-ivb-3770 fi-bsw-nick fi-snb-2600 
  Missing    (13): fi-ilk-m540 fi-bdw-5557u fi-skl-guc fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-elk-e7500 fi-bsw-kefka fi-skl-lmem fi-bdw-samus fi-tgl-y fi-byt-clapper fi-skl-6600u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5352 -> IGTPW_3884

  CI-20190529: 20190529
  CI_DRM_7630: 28a2aa0ebf1520ea8a0dd89299f7ceea80dfd96f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3884: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/index.html
  IGT_5352: 0586d205f651674e575351c2d5a7d0760716c9f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_huc_copy@huc-copy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3884/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
