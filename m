Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Jul 2020 19:48:08 -0000
Message-ID: <159363288824.16669.8738966000843012611@emeril.freedesktop.org>
References: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev11=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev11)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8688 -> IGTPW_4725
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4725:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intel-bb-blit-x} (NEW):
    - fi-gdg-551:         NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-gdg-551/igt@api_intel_bb@intel-bb-blit-x.html

  * {igt@api_intel_bb@intel-bb-blit-y} (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-pnv-d510/igt@api_intel_bb@intel-bb-blit-y.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-blb-e6850/igt@api_intel_bb@intel-bb-blit-y.html
    - fi-tgl-u2:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-tgl-u2/igt@api_intel_bb@intel-bb-blit-y.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8688 and IGTPW_4725:

### New IGT tests (11) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 34 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 35 pass(s)
    - Exec time: [1.57, 16.31] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 1 fail(s) 34 pass(s)
    - Exec time: [0.45, 15.69] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 3 fail(s) 1 incomplete(s) 31 pass(s)
    - Exec time: [0.0, 15.15] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 34 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 35 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 32 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4725 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-bsw-n3050/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-bsw-n3050/igt@i915_module_load@reload.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [DMESG-WARN][9] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][16] ([i915#62] / [i915#92]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (44 -> 37)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5719 -> IGTPW_4725

  CI-20190529: 20190529
  CI_DRM_8688: e732088e2eb2bbb1ca72c1f68d0405f17477d446 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4725: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html
  IGT_5719: 54731f017df8660f29cc8f5db0b570239729e808 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@full-batch
+igt@api_intel_bb@intel-bb-blit-none
+igt@api_intel_bb@intel-bb-blit-x
+igt@api_intel_bb@intel-bb-blit-y
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@simple-bb
+igt@api_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
