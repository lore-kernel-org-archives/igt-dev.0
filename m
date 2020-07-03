Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jul 2020 11:57:41 -0000
Message-ID: <159377746180.25591.10826034625843300825@emeril.freedesktop.org>
References: <20200703103352.24738-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200703103352.24738-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3N3?=
 =?utf-8?q?=5Fsync=3AFixing_modprobe_for_sw=5Fsync_to_return_if_not_suppor?=
 =?utf-8?q?ted?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/sw_sync:Fixing modprobe for sw_sync to return if not supported
URL   : https://patchwork.freedesktop.org/series/79087/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8706 -> IGTPW_4732
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4732 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4732, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4732:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic@flip:
    - fi-cml-s:           [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cml-s/igt@kms_busy@basic@flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cml-s/igt@kms_busy@basic@flip.html
    - fi-tgl-u2:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-u2/igt@kms_busy@basic@flip.html
    - fi-icl-y:           [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-icl-y/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-icl-y/igt@kms_busy@basic@flip.html
    - fi-icl-u2:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-icl-u2/igt@kms_busy@basic@flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-icl-u2/igt@kms_busy@basic@flip.html
    - fi-tgl-y:           [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-y/igt@kms_busy@basic@flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-y/igt@kms_busy@basic@flip.html
    - fi-cml-u2:          [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cml-u2/igt@kms_busy@basic@flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cml-u2/igt@kms_busy@basic@flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_busy@basic@flip:
    - {fi-tgl-dsi}:       [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-dsi/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-dsi/igt@kms_busy@basic@flip.html
    - {fi-ehl-1}:         [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-ehl-1/igt@kms_busy@basic@flip.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-ehl-1/igt@kms_busy@basic@flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4732 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_busy@basic@flip:
    - fi-byt-n2820:       [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-byt-n2820/igt@kms_busy@basic@flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-byt-n2820/igt@kms_busy@basic@flip.html
    - fi-bxt-dsi:         [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bxt-dsi/igt@kms_busy@basic@flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bxt-dsi/igt@kms_busy@basic@flip.html
    - fi-hsw-4770:        [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-hsw-4770/igt@kms_busy@basic@flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-hsw-4770/igt@kms_busy@basic@flip.html
    - fi-whl-u:           [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-whl-u/igt@kms_busy@basic@flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-whl-u/igt@kms_busy@basic@flip.html
    - fi-snb-2600:        [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-snb-2600/igt@kms_busy@basic@flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-snb-2600/igt@kms_busy@basic@flip.html
    - fi-bsw-n3050:       [PASS][31] -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bsw-n3050/igt@kms_busy@basic@flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bsw-n3050/igt@kms_busy@basic@flip.html
    - fi-skl-guc:         [PASS][33] -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-skl-guc/igt@kms_busy@basic@flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-skl-guc/igt@kms_busy@basic@flip.html
    - fi-ivb-3770:        [PASS][35] -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-ivb-3770/igt@kms_busy@basic@flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-ivb-3770/igt@kms_busy@basic@flip.html
    - fi-elk-e7500:       [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-elk-e7500/igt@kms_busy@basic@flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-elk-e7500/igt@kms_busy@basic@flip.html
    - fi-blb-e6850:       [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-blb-e6850/igt@kms_busy@basic@flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-blb-e6850/igt@kms_busy@basic@flip.html
    - fi-cfl-8700k:       [PASS][41] -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cfl-8700k/igt@kms_busy@basic@flip.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cfl-8700k/igt@kms_busy@basic@flip.html
    - fi-pnv-d510:        [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-pnv-d510/igt@kms_busy@basic@flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-pnv-d510/igt@kms_busy@basic@flip.html
    - fi-kbl-x1275:       [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-kbl-x1275/igt@kms_busy@basic@flip.html
    - fi-bwr-2160:        [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bwr-2160/igt@kms_busy@basic@flip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bwr-2160/igt@kms_busy@basic@flip.html
    - fi-gdg-551:         [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-gdg-551/igt@kms_busy@basic@flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-gdg-551/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - fi-apl-guc:         [PASS][51] -> [SKIP][52] ([fdo#109271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-apl-guc/igt@kms_busy@basic@modeset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-apl-guc/igt@kms_busy@basic@modeset.html
    - fi-snb-2520m:       [PASS][53] -> [SKIP][54] ([fdo#109271]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-snb-2520m/igt@kms_busy@basic@modeset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-snb-2520m/igt@kms_busy@basic@modeset.html
    - fi-cfl-guc:         [PASS][55] -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cfl-guc/igt@kms_busy@basic@modeset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cfl-guc/igt@kms_busy@basic@modeset.html
    - fi-skl-6600u:       [PASS][57] -> [SKIP][58] ([fdo#109271]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-skl-6600u/igt@kms_busy@basic@modeset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-skl-6600u/igt@kms_busy@basic@modeset.html
    - fi-cml-s:           [PASS][59] -> [SKIP][60] ([fdo#109278] / [i915#533])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cml-s/igt@kms_busy@basic@modeset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cml-s/igt@kms_busy@basic@modeset.html
    - fi-kbl-soraka:      [PASS][61] -> [SKIP][62] ([fdo#109271]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-kbl-soraka/igt@kms_busy@basic@modeset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-kbl-soraka/igt@kms_busy@basic@modeset.html
    - fi-tgl-u2:          [PASS][63] -> [SKIP][64] ([fdo#112015])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-u2/igt@kms_busy@basic@modeset.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-u2/igt@kms_busy@basic@modeset.html
    - fi-ilk-650:         [PASS][65] -> [SKIP][66] ([fdo#109271]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-ilk-650/igt@kms_busy@basic@modeset.html
    - fi-glk-dsi:         [PASS][67] -> [SKIP][68] ([fdo#109271]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-glk-dsi/igt@kms_busy@basic@modeset.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-glk-dsi/igt@kms_busy@basic@modeset.html
    - fi-bsw-kefka:       [PASS][69] -> [SKIP][70] ([fdo#109271]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bsw-kefka/igt@kms_busy@basic@modeset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bsw-kefka/igt@kms_busy@basic@modeset.html
    - fi-tgl-y:           [PASS][71] -> [SKIP][72] ([fdo#112015])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-y/igt@kms_busy@basic@modeset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-y/igt@kms_busy@basic@modeset.html
    - fi-cfl-8109u:       [PASS][73] -> [SKIP][74] ([fdo#109271]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cfl-8109u/igt@kms_busy@basic@modeset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cfl-8109u/igt@kms_busy@basic@modeset.html
    - fi-icl-y:           [PASS][75] -> [SKIP][76] ([fdo#109278])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-icl-y/igt@kms_busy@basic@modeset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-icl-y/igt@kms_busy@basic@modeset.html
    - fi-icl-u2:          [PASS][77] -> [SKIP][78] ([fdo#109278])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-icl-u2/igt@kms_busy@basic@modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-icl-u2/igt@kms_busy@basic@modeset.html
    - fi-cml-u2:          [PASS][79] -> [SKIP][80] ([fdo#109278] / [i915#533])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-cml-u2/igt@kms_busy@basic@modeset.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-cml-u2/igt@kms_busy@basic@modeset.html
    - fi-byt-j1900:       [PASS][81] -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-byt-j1900/igt@kms_busy@basic@modeset.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-byt-j1900/igt@kms_busy@basic@modeset.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-tgl-y:           [DMESG-WARN][83] ([i915#402]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-y/igt@gem_exec_store@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-y/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][85] ([i915#1888]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload:
    - fi-bsw-kefka:       [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bsw-kefka/igt@i915_module_load@reload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bsw-kefka/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-n2820:       [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-byt-n2820/igt@i915_pm_rpm@module-reload.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-byt-n2820/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [DMESG-WARN][93] ([i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][97] ([i915#62] / [i915#92]) -> [DMESG-WARN][98] ([i915#62] / [i915#92] / [i915#95]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@kms_busy@basic@modeset:
    - fi-kbl-x1275:       [DMESG-WARN][99] ([i915#62] / [i915#92]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-kbl-x1275/igt@kms_busy@basic@modeset.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-kbl-x1275/igt@kms_busy@basic@modeset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][101] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][102] ([i915#62] / [i915#92]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (45 -> 38)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5721 -> IGTPW_4732

  CI-20190529: 20190529
  CI_DRM_8706: 7839b66a1c775fce16da3297056ccee2e81bc4c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4732: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/index.html
  IGT_5721: df9004c501b203c1b418781ad2c94dfe36892ef5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4732/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
