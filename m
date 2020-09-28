Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Sep 2020 15:28:56 -0000
Message-ID: <160130693679.8775.13200867706804425061@emeril.freedesktop.org>
References: <20200928150614.23097-1-swati2.sharma@intel.com>
In-Reply-To: <20200928150614.23097-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Faddfb=5Fbasic=3A_Renaming_tests_as_legacy_tiling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1802650501=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1802650501==
Content-Type: multipart/alternative;
 boundary="===============3939864831715640357=="

--===============3939864831715640357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_addfb_basic: Renaming tests as legacy tiling
URL   : https://patchwork.freedesktop.org/series/82156/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9064 -> IGTPW_5015
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5015 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5015, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5015:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-x-tiled:
    - fi-cml-s:           [PASS][1] -> [SKIP][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cml-s/igt@kms_addfb_basic@addfb25-x-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cml-s/igt@kms_addfb_basic@addfb25-x-tiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch:
    - fi-cml-u2:          [PASS][3] -> [SKIP][4] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cml-u2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cml-u2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html

  * igt@kms_addfb_basic@addfb25-yf-tiled:
    - fi-icl-y:           [PASS][5] -> [SKIP][6] +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-y/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-y/igt@kms_addfb_basic@addfb25-yf-tiled.html

  * igt@kms_addfb_basic@basic-x-tiled:
    - fi-icl-u2:          [PASS][7] -> [SKIP][8] +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_addfb_basic@basic-x-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_addfb_basic@basic-x-tiled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-y-tiled:
    - {fi-ehl-1}:         [PASS][9] -> [SKIP][10] +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ehl-1/igt@kms_addfb_basic@addfb25-y-tiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ehl-1/igt@kms_addfb_basic@addfb25-y-tiled.html

  * igt@kms_addfb_basic@addfb25-yf-tiled:
    - {fi-tgl-dsi}:       [PASS][11] -> [SKIP][12] +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-tgl-dsi/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-tgl-dsi/igt@kms_addfb_basic@addfb25-yf-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_5015 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_addfb_basic@addfb25-x-tiled:
    - fi-cfl-guc:         [PASS][15] -> [SKIP][16] ([fdo#109271]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-guc/igt@kms_addfb_basic@addfb25-x-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-guc/igt@kms_addfb_basic@addfb25-x-tiled.html
    - fi-snb-2600:        [PASS][17] -> [SKIP][18] ([fdo#109271]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-snb-2600/igt@kms_addfb_basic@addfb25-x-tiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-snb-2600/igt@kms_addfb_basic@addfb25-x-tiled.html
    - fi-bxt-dsi:         [PASS][19] -> [SKIP][20] ([fdo#109271] / [i915#1635]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bxt-dsi/igt@kms_addfb_basic@addfb25-x-tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bxt-dsi/igt@kms_addfb_basic@addfb25-x-tiled.html
    - fi-skl-6600u:       [PASS][21] -> [SKIP][22] ([fdo#109271]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch:
    - fi-ilk-650:         [PASS][23] -> [SKIP][24] ([fdo#109271]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
    - fi-bsw-n3050:       [PASS][25] -> [SKIP][26] ([fdo#109271]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
    - fi-hsw-4770:        [PASS][27] -> [SKIP][28] ([fdo#109271]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
    - fi-skl-6700k2:      [PASS][29] -> [SKIP][30] ([fdo#109271]) +6 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-6700k2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-6700k2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
    - fi-elk-e7500:       [PASS][31] -> [SKIP][32] ([fdo#109271]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
    - fi-ivb-3770:        [PASS][33] -> [SKIP][34] ([fdo#109271]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html

  * igt@kms_addfb_basic@addfb25-y-tiled:
    - fi-kbl-r:           [PASS][35] -> [SKIP][36] ([fdo#109271]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-r/igt@kms_addfb_basic@addfb25-y-tiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-r/igt@kms_addfb_basic@addfb25-y-tiled.html
    - fi-kbl-guc:         [PASS][37] -> [SKIP][38] ([fdo#109271]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled.html
    - fi-kbl-7500u:       [PASS][39] -> [SKIP][40] ([fdo#109271]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-y-tiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-y-tiled.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small:
    - fi-skl-lmem:        [PASS][41] -> [SKIP][42] ([fdo#109271]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-lmem/igt@kms_addfb_basic@addfb25-y-tiled-small.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-lmem/igt@kms_addfb_basic@addfb25-y-tiled-small.html
    - fi-glk-dsi:         [PASS][43] -> [SKIP][44] ([fdo#109271]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-glk-dsi/igt@kms_addfb_basic@addfb25-y-tiled-small.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-glk-dsi/igt@kms_addfb_basic@addfb25-y-tiled-small.html

  * igt@kms_addfb_basic@addfb25-yf-tiled:
    - fi-bsw-nick:        [PASS][45] -> [SKIP][46] ([fdo#109271]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-nick/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-nick/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-gdg-551:         [PASS][47] -> [SKIP][48] ([fdo#109271]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-gdg-551/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-gdg-551/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-apl-guc:         [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1635]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-apl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-apl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-snb-2520m:       [PASS][51] -> [SKIP][52] ([fdo#109271]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-snb-2520m/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-snb-2520m/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-skl-guc:         [PASS][53] -> [SKIP][54] ([fdo#109271]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-blb-e6850:       [PASS][55] -> [SKIP][56] ([fdo#109271]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-blb-e6850/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-blb-e6850/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-kbl-x1275:       [PASS][57] -> [SKIP][58] ([fdo#109271]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled.html
    - fi-bsw-kefka:       [PASS][59] -> [SKIP][60] ([fdo#109271]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-kefka/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-kefka/igt@kms_addfb_basic@addfb25-yf-tiled.html

  * igt@kms_addfb_basic@basic-x-tiled:
    - fi-cfl-8700k:       [PASS][61] -> [SKIP][62] ([fdo#109271]) +6 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-8700k/igt@kms_addfb_basic@basic-x-tiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-8700k/igt@kms_addfb_basic@basic-x-tiled.html
    - fi-pnv-d510:        [PASS][63] -> [SKIP][64] ([fdo#109271]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-pnv-d510/igt@kms_addfb_basic@basic-x-tiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-pnv-d510/igt@kms_addfb_basic@basic-x-tiled.html

  * igt@kms_addfb_basic@basic-y-tiled:
    - fi-cfl-8109u:       [PASS][65] -> [SKIP][66] ([fdo#109271]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-8109u/igt@kms_addfb_basic@basic-y-tiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-8109u/igt@kms_addfb_basic@basic-y-tiled.html
    - fi-bwr-2160:        [PASS][67] -> [SKIP][68] ([fdo#109271]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bwr-2160/igt@kms_addfb_basic@basic-y-tiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bwr-2160/igt@kms_addfb_basic@basic-y-tiled.html
    - fi-bdw-5557u:       [PASS][69] -> [SKIP][70] ([fdo#109271]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bdw-5557u/igt@kms_addfb_basic@basic-y-tiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bdw-5557u/igt@kms_addfb_basic@basic-y-tiled.html
    - fi-byt-j1900:       [PASS][71] -> [SKIP][72] ([fdo#109271]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-byt-j1900/igt@kms_addfb_basic@basic-y-tiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-byt-j1900/igt@kms_addfb_basic@basic-y-tiled.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [PASS][73] -> [DMESG-WARN][74] ([i915#1982])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [PASS][75] -> [DMESG-WARN][76] ([i915#1982])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [DMESG-WARN][77] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@vgem_basic@unload:
    - fi-skl-guc:         [DMESG-WARN][83] ([i915#2203]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-guc/igt@vgem_basic@unload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-guc/igt@vgem_basic@unload.html
    - fi-kbl-x1275:       [DMESG-WARN][85] ([i915#62] / [i915#92]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@vgem_basic@unload.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][87] ([i915#62] / [i915#92]) -> [DMESG-WARN][88] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-FAIL][89] ([i915#62] / [i915#95]) -> [DMESG-FAIL][90] ([i915#62])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-kbl-x1275:       [DMESG-WARN][91] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][92] ([i915#62] / [i915#92]) +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (46 -> 39)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5790 -> IGTPW_5015

  CI-20190529: 20190529
  CI_DRM_9064: 522915a5295e60ee46192e13bc0601678adc5a5a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-legacy-mismatch
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
-igt@kms_addfb_basic@addfb25-x-tiled
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch
-igt@kms_addfb_basic@addfb25-yf-tiled
-igt@kms_addfb_basic@addfb25-y-tiled
-igt@kms_addfb_basic@addfb25-y-tiled-small
-igt@kms_addfb_basic@basic-x-tiled
-igt@kms_addfb_basic@basic-y-tiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html

--===============3939864831715640357==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_addfb_basic: Renaming tests as legacy tiling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82156/">https://patchwork.freedesktop.org/series/82156/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9064 -&gt; IGTPW_5015</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5015 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5015, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5015:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cml-s/igt@kms_addfb_basic@addfb25-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cml-s/igt@kms_addfb_basic@addfb25-x-tiled.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cml-u2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cml-u2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-y/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-y/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_addfb_basic@basic-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_addfb_basic@basic-x-tiled.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled:</p>
<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ehl-1/igt@kms_addfb_basic@addfb25-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ehl-1/igt@kms_addfb_basic@addfb25-y-tiled.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-tgl-dsi/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-tgl-dsi/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5015 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-guc/igt@kms_addfb_basic@addfb25-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-guc/igt@kms_addfb_basic@addfb25-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-snb-2600/igt@kms_addfb_basic@addfb25-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-snb-2600/igt@kms_addfb_basic@addfb25-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bxt-dsi/igt@kms_addfb_basic@addfb25-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bxt-dsi/igt@kms_addfb_basic@addfb25-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-6700k2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-6700k2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled:</p>
<ul>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-r/igt@kms_addfb_basic@addfb25-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-r/igt@kms_addfb_basic@addfb25-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-guc/igt@kms_addfb_basic@addfb25-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small:</p>
<ul>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-lmem/igt@kms_addfb_basic@addfb25-y-tiled-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-lmem/igt@kms_addfb_basic@addfb25-y-tiled-small.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-glk-dsi/igt@kms_addfb_basic@addfb25-y-tiled-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-glk-dsi/igt@kms_addfb_basic@addfb25-y-tiled-small.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-nick/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-nick/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-gdg-551/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-gdg-551/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-apl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-apl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +6 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-snb-2520m/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-snb-2520m/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-guc/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-blb-e6850/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-blb-e6850/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-kefka/igt@kms_addfb_basic@addfb25-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-kefka/igt@kms_addfb_basic@addfb25-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-8700k/igt@kms_addfb_basic@basic-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-8700k/igt@kms_addfb_basic@basic-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-pnv-d510/igt@kms_addfb_basic@basic-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-pnv-d510/igt@kms_addfb_basic@basic-x-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-cfl-8109u/igt@kms_addfb_basic@basic-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-cfl-8109u/igt@kms_addfb_basic@basic-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bwr-2160/igt@kms_addfb_basic@basic-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bwr-2160/igt@kms_addfb_basic@basic-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bdw-5557u/igt@kms_addfb_basic@basic-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bdw-5557u/igt@kms_addfb_basic@basic-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-byt-j1900/igt@kms_addfb_basic@basic-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-byt-j1900/igt@kms_addfb_basic@basic-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-skl-guc/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@vgem_basic@unload.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9064/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 39)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5790 -&gt; IGTPW_5015</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9064: 522915a5295e60ee46192e13bc0601678adc5a5a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5015/index.html<br />
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_addfb_basic@addfb25-x-tiled-legacy<br />
+igt@kms_addfb_basic@addfb25-x-tiled-legacy-mismatch<br />
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy<br />
+igt@kms_addfb_basic@addfb25-y-tiled-legacy<br />
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy<br />
+igt@kms_addfb_basic@basic-x-tiled-legacy<br />
+igt@kms_addfb_basic@basic-y-tiled-legacy<br />
-igt@kms_addfb_basic@addfb25-x-tiled<br />
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch<br />
-igt@kms_addfb_basic@addfb25-yf-tiled<br />
-igt@kms_addfb_basic@addfb25-y-tiled<br />
-igt@kms_addfb_basic@addfb25-y-tiled-small<br />
-igt@kms_addfb_basic@basic-x-tiled<br />
-igt@kms_addfb_basic@basic-y-tiled</p>

</body>
</html>

--===============3939864831715640357==--

--===============1802650501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1802650501==--
