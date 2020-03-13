Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 03:54:16 -0000
Message-ID: <158407165699.30353.9906534111380975651@emeril.freedesktop.org>
References: <20200312135642.13845-1-anshuman.gupta@intel.com>
In-Reply-To: <20200312135642.13845-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev2=29?=
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

Series: lpsp platform agnostic support (rev2)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8132 -> IGTPW_4300
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4300 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4300, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4300:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-glk-dsi:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-hsw-peppy:       [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u2:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-soraka:      [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       [PASS][15] -> [FAIL][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        [PASS][17] -> [FAIL][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-cml-u2:          [PASS][19] -> [FAIL][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][21] -> [FAIL][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-byt-j1900:       [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
    - fi-hsw-4770:        [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][27] -> [FAIL][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][29] -> [FAIL][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6600u:       [PASS][31] -> [FAIL][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][33] -> [FAIL][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       [PASS][35] -> [FAIL][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-icl-dsi:         [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][43] -> [FAIL][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][45] -> [FAIL][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           NOTRUN -> [FAIL][47] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][48] -> [FAIL][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-cml-s/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][50] -> [FAIL][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [SKIP][52] ([fdo#109271]) -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bsw-nick:        [SKIP][54] ([fdo#109271]) -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bsw-nick/igt@i915_pm_rpm@basic-pci-d3-state.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bsw-nick/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bwr-2160:        [SKIP][56] ([fdo#109271]) -> [FAIL][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-snb-2600:        [SKIP][58] ([fdo#109271]) -> [FAIL][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-skl-6770hq:      [SKIP][60] ([fdo#109271]) -> [FAIL][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-gdg-551:         [SKIP][62] ([fdo#109271]) -> [FAIL][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-gdg-551/igt@i915_pm_rpm@basic-rte.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-gdg-551/igt@i915_pm_rpm@basic-rte.html
    - fi-kbl-guc:         [SKIP][64] ([fdo#109271]) -> [CRASH][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-bsw-nick:        [SKIP][66] ([fdo#109271]) -> [CRASH][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bsw-nick/igt@i915_pm_rpm@basic-rte.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bsw-nick/igt@i915_pm_rpm@basic-rte.html
    - fi-ivb-3770:        [SKIP][68] ([fdo#109271]) -> [FAIL][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html
    - fi-snb-2520m:       [SKIP][70] ([fdo#109271]) -> [FAIL][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-snb-2520m/igt@i915_pm_rpm@basic-rte.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-snb-2520m/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-6770hq:      [SKIP][72] ([fdo#109271]) -> [CRASH][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-6770hq/igt@i915_pm_rpm@basic-rte.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-6770hq/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-pnv-d510:        [SKIP][74] ([fdo#109271]) -> [FAIL][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
    - fi-ilk-650:         [SKIP][76] ([fdo#109271]) -> [FAIL][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
    - fi-blb-e6850:       [SKIP][78] ([fdo#109271]) -> [FAIL][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
    - fi-elk-e7500:       [SKIP][80] ([fdo#109271]) -> [FAIL][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6770hq:      [DMESG-WARN][82] ([i915#92]) -> [FAIL][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
    - fi-icl-u2:          [DMESG-WARN][84] ([i915#289]) -> [FAIL][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][86] -> [FAIL][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][88] -> [FAIL][89] +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-dsi}:       [PASS][90] -> [FAIL][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-tgl-dsi/igt@i915_pm_rpm@basic-rte.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-tgl-dsi/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4300 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-y:           [PASS][92] -> [FAIL][93] ([CI#94]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-guc:         [PASS][94] -> [FAIL][95] ([i915#596])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-8809g:       [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][98] -> [FAIL][99] ([fdo#109635] / [i915#217])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-icl-y:           [INCOMPLETE][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-icl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-icl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [INCOMPLETE][102] ([fdo#103927] / [i915#656]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8132/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#596]: https://gitlab.freedesktop.org/drm/intel/issues/596
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (48 -> 42)
------------------------------

  Missing    (6): fi-hsw-4200u fi-skl-guc fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4300

  CI-20190529: 20190529
  CI_DRM_8132: 72014335c2758a20db6107314352afb5951f1c55 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4300: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4300/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
