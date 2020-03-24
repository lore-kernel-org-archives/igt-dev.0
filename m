Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 14:08:55 -0000
Message-ID: <158505893585.5746.11629703677035837287@emeril.freedesktop.org>
References: <20200324130630.9388-1-anshuman.gupta@intel.com>
In-Reply-To: <20200324130630.9388-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev4=29?=
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

Series: lpsp platform agnostic support (rev4)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5534 -> IGTPW_4346
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4346 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4346, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4346:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-hsw-4770r:       [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-glk-dsi:         [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-hsw-peppy:       [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u2:          [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-byt-n2820:       [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       [PASS][17] -> [FAIL][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        [PASS][19] -> [FAIL][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-cml-u2:          [PASS][21] -> [FAIL][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-byt-j1900:       [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
    - fi-hsw-4770:        [PASS][27] -> [FAIL][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][29] -> [FAIL][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][31] -> [FAIL][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6600u:       [PASS][33] -> [FAIL][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][35] -> [FAIL][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-icl-dsi:         [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][43] -> [FAIL][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][45] -> [FAIL][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][47] -> [FAIL][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][49] -> [FAIL][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][51] -> [FAIL][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][53] -> [FAIL][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cml-s/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bwr-2160:        [SKIP][55] ([fdo#109271]) -> [FAIL][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-snb-2600:        [SKIP][57] ([fdo#109271]) -> [FAIL][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-gdg-551:         [SKIP][59] ([fdo#109271]) -> [FAIL][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-gdg-551/igt@i915_pm_rpm@basic-rte.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-gdg-551/igt@i915_pm_rpm@basic-rte.html
    - fi-ivb-3770:        [SKIP][61] ([fdo#109271]) -> [FAIL][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html
    - fi-snb-2520m:       [SKIP][63] ([fdo#109271]) -> [FAIL][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-snb-2520m/igt@i915_pm_rpm@basic-rte.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-snb-2520m/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-pnv-d510:        [SKIP][65] ([fdo#109271]) -> [FAIL][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
    - fi-ilk-650:         [SKIP][67] ([fdo#109271]) -> [FAIL][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
    - fi-blb-e6850:       [SKIP][69] ([fdo#109271]) -> [FAIL][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
    - fi-elk-e7500:       [SKIP][71] ([fdo#109271]) -> [FAIL][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
    - fi-icl-u2:          [DMESG-WARN][73] ([i915#289]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][75] -> [FAIL][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][77] -> [FAIL][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4346 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-8809g:       [PASS][79] -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][81] -> [DMESG-WARN][82] ([IGT#4])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [DMESG-FAIL][83] ([i915#481]) -> [DMESG-FAIL][84] ([i915#730] / [i915#933])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
    - fi-cfl-guc:         [INCOMPLETE][85] ([fdo#106070] / [i915#424]) -> [DMESG-FAIL][86] ([i915#481])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5534/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#481]: https://gitlab.freedesktop.org/drm/intel/issues/481
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (46 -> 44)
------------------------------

  Additional (3): fi-kbl-soraka fi-kbl-7560u fi-bdw-5557u 
  Missing    (5): fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5534 -> IGTPW_4346

  CI-20190529: 20190529
  CI_DRM_8182: e5245084567cd7f6f93b07baaebf8a2b4d914620 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4346: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/index.html
  IGT_5534: cc5d8b4a1bd398fc68271fd9fefc939181db6a2d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4346/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
