Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 06:41:39 -0000
Message-ID: <158641449943.11550.10610545415372521109@emeril.freedesktop.org>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
In-Reply-To: <20200409053951.26929-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev7=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev7)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5582 -> IGTPW_4438
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4438 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4438, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4438:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-glk-dsi:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-hsw-peppy:       [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u2:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-byt-n2820:       [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-soraka:      [PASS][15] -> [FAIL][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       [PASS][17] -> [FAIL][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        [PASS][19] -> [FAIL][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-cml-u2:          [PASS][21] -> [FAIL][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-byt-j1900:       [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
    - fi-whl-u:           [PASS][27] -> [FAIL][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-whl-u/igt@i915_pm_rpm@basic-rte.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-whl-u/igt@i915_pm_rpm@basic-rte.html
    - fi-kbl-x1275:       [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][31] -> [FAIL][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][33] -> [FAIL][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6600u:       [PASS][35] -> [FAIL][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-y:           [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-icl-dsi:         [PASS][43] -> [FAIL][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][45] -> [FAIL][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][47] -> [FAIL][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][49] -> [FAIL][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][51] -> [FAIL][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][53] -> [FAIL][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][55] -> [FAIL][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cml-s/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-snb-2600:        [SKIP][57] ([fdo#109271]) -> [FAIL][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-ilk-650:         [SKIP][59] ([fdo#109271]) -> [FAIL][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
    - fi-elk-e7500:       [SKIP][61] ([fdo#109271]) -> [FAIL][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][63] -> [FAIL][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][65] -> [FAIL][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-dsi}:       [PASS][67] -> [FAIL][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-tgl-dsi/igt@i915_pm_rpm@basic-rte.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-tgl-dsi/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4438 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-whl-u:           [PASS][69] -> [FAIL][70] ([i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-whl-u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-whl-u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-x1275:       [PASS][71] -> [FAIL][72] ([i915#62] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][73] ([IGT#4]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][75] ([fdo#109271]) -> [FAIL][76] ([i915#62])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (53 -> 45)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-kbl-8809g fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5582 -> IGTPW_4438

  CI-20190529: 20190529
  CI_DRM_8281: 4d6c69198d6840226f92f2c4645e2c8260ca3e83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4438: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/index.html
  IGT_5582: 66a7b20f4a1f95320c0d7c8c9704749001487783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pm_lpsp@kms-lpsp
-igt@i915_pm_lpsp@edp-native
-igt@i915_pm_lpsp@edp-panel-fitter
-igt@i915_pm_lpsp@non-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4438/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
