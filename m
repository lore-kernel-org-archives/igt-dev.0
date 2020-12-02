Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 02 Dec 2020 10:00:49 -0000
Message-ID: <160690324955.4089.6918156740088146540@emeril.freedesktop.org>
References: <20201202091747.409-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201202091747.409-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hlY2sg?=
 =?utf-8?q?for_available_outputs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0626801547=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0626801547==
Content-Type: multipart/alternative;
 boundary="===============0709778892601785073=="

--===============0709778892601785073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check for available outputs
URL   : https://patchwork.freedesktop.org/series/84493/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9418 -> IGTPW_5244
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5244 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5244, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5244:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-tgl-y:           [PASS][1] -> [SKIP][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-tgl-u2:          [PASS][3] -> [SKIP][4] +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#1982]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5244 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_store@basic:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@gem_exec_store@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@gem_exec_store@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-skl-guc:         [PASS][11] -> [SKIP][12] ([fdo#109271]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-cfl-guc:         [PASS][13] -> [SKIP][14] ([fdo#109271]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-ilk-650:         [PASS][15] -> [SKIP][16] ([fdo#109271]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-icl-y:           [PASS][17] -> [SKIP][18] ([fdo#109278]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-bsw-kefka:       [PASS][19] -> [SKIP][20] ([fdo#109271]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-icl-u2:          [PASS][21] -> [SKIP][22] ([fdo#109278]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-kbl-x1275:       [PASS][23] -> [SKIP][24] ([fdo#109271]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-gdg-551:         [PASS][25] -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-cfl-8700k:       [PASS][27] -> [SKIP][28] ([fdo#109271]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-cfl-8109u:       [PASS][29] -> [SKIP][30] ([fdo#109271]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-bdw-5557u:       [PASS][31] -> [SKIP][32] ([fdo#109271]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bdw-5557u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bdw-5557u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-bwr-2160:        [PASS][33] -> [SKIP][34] ([fdo#109271]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-kbl-soraka:      [PASS][35] -> [SKIP][36] ([fdo#109271]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-cml-s:           [PASS][37] -> [SKIP][38] ([fdo#109278]) +7 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-s/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-s/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - fi-elk-e7500:       [PASS][39] -> [SKIP][40] ([fdo#109271]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-ivb-3770:        [PASS][41] -> [SKIP][42] ([fdo#109271]) +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-snb-2600:        [PASS][43] -> [SKIP][44] ([fdo#109271]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-snb-2600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-snb-2600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-kbl-r:           [PASS][45] -> [SKIP][46] ([fdo#109271]) +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-r/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-r/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-bxt-dsi:         [PASS][47] -> [SKIP][48] ([fdo#109271]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bxt-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bxt-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
    - fi-snb-2520m:       [PASS][49] -> [SKIP][50] ([fdo#109271]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-snb-2520m/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-snb-2520m/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
    - fi-apl-guc:         [PASS][51] -> [SKIP][52] ([fdo#109271]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-skl-6600u:       [PASS][53] -> [SKIP][54] ([fdo#109271]) +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-cml-u2:          [PASS][55] -> [SKIP][56] ([fdo#109278]) +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-pnv-d510:        [PASS][57] -> [SKIP][58] ([fdo#109271]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-byt-j1900:       [PASS][59] -> [SKIP][60] ([fdo#109271]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-bsw-n3050:       [PASS][61] -> [SKIP][62] ([fdo#109271]) +6 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-skl-6700k2:      [PASS][63] -> [SKIP][64] ([fdo#109271]) +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-6700k2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-6700k2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-hsw-4770:        [PASS][65] -> [SKIP][66] ([fdo#109271]) +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-glk-dsi:         [PASS][67] -> [SKIP][68] ([fdo#109271]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-glk-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-glk-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-kbl-7500u:       [PASS][69] -> [SKIP][70] ([fdo#109271]) +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-7500u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-7500u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
    - fi-blb-e6850:       [PASS][71] -> [SKIP][72] ([fdo#109271]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [PASS][73] -> [DMESG-WARN][74] ([i915#1982])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-tgl-y:           [PASS][75] -> [DMESG-WARN][76] ([i915#1982]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
    - fi-bsw-kefka:       [PASS][77] -> [DMESG-WARN][78] ([i915#1982])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
    - fi-kbl-soraka:      [PASS][79] -> [DMESG-WARN][80] ([i915#1982])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
    - fi-tgl-u2:          [PASS][81] -> [DMESG-WARN][82] ([i915#1982])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - fi-byt-j1900:       [PASS][83] -> [DMESG-WARN][84] ([i915#1982])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-bsw-n3050:       [PASS][85] -> [DMESG-WARN][86] ([i915#1982])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-icl-y:           [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-y/igt@core_hotunplug@unbind-rebind.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-y/igt@core_hotunplug@unbind-rebind.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][91] ([i915#402]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-ehl-1}:         [DMESG-WARN][93] ([i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-byt-j1900:       [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-tgl-y:           [DMESG-WARN][97] ([i915#1982] / [i915#2411]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][99] ([i915#2291] / [i915#541]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
    - fi-bsw-kefka:       [DMESG-FAIL][101] ([i915#2675] / [i915#541]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@i915_selftest@live@gt_heartbeat.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [DMESG-FAIL][103] ([i915#2675]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [DMESG-WARN][105] ([i915#1982] / [i915#262]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [DMESG-WARN][107] ([i915#1982]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-byt-j1900:       [DMESG-WARN][109] ([i915#1982]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-kbl-soraka:      [DMESG-WARN][111] ([i915#1982]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-icl-u2:          [DMESG-WARN][113] ([i915#1982]) -> [SKIP][114] ([fdo#109278]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [DMESG-WARN][115] ([i915#1982]) -> [SKIP][116] ([fdo#109271])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-apl-guc:         [DMESG-WARN][117] ([i915#1982]) -> [SKIP][118] ([fdo#109271])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2675]: https://gitlab.freedesktop.org/drm/intel/issues/2675
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5878 -> IGTPW_5244

  CI-20190529: 20190529
  CI_DRM_9418: 5ef90940f82646746fbc78f3af9cdfa503355ab0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_cursor_legacy@dual-output-tests
-igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic
-igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy
-igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic
-igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy
-igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic
-igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy
-igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic
-igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy
-igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic
-igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size
-igt@kms_cursor_legacy@cursora-vs-flipa-legacy
-igt@kms_cursor_legacy@cursora-vs-flipa-toggle
-igt@kms_cursor_legacy@cursora-vs-flipa-varying-size
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
-igt@kms_cursor_legacy@cursora-vs-flipb-legacy
-igt@kms_cursor_legacy@cursora-vs-flipb-toggle
-igt@kms_cursor_legacy@cursora-vs-flipb-varying-size
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
-igt@kms_cursor_legacy@cursorb-vs-flipa-legacy
-igt@kms_cursor_legacy@cursorb-vs-flipa-toggle
-igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size
-igt@kms_cursor_legacy@cursorb-vs-flipb-legacy
-igt@kms_cursor_legacy@cursorb-vs-flipb-toggle
-igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size
-igt@kms_cursor_legacy@cursor-vs-flip-atomic
-igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions
-igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size
-igt@kms_cursor_legacy@cursor-vs-flip-legacy
-igt@kms_cursor_legacy@cursor-vs-flip-toggle
-igt@kms_cursor_legacy@cursor-vs-flip-varying-size
-igt@kms_cursor_legacy@flip-vs-cursor-atomic
-igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions
-igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
-igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic
-igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy
-igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic
-igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy
-igt@kms_cursor_legacy@flip-vs-cursor-legacy
-igt@kms_cursor_legacy@flip-vs-cursor-toggle
-igt@kms_cursor_legacy@flip-vs-cursor-varying-size
-igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
-igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
-igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
-igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
-igt@kms_cursor_legacy@short-flip-after-cursor-toggle
-igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
-igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
-igt@kms_cursor_legacy@short-flip-before-cursor-toggle

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html

--===============0709778892601785073==
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
<tr><td><b>Series:</b></td><td>Check for available outputs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84493/">https://patchwork.freedesktop.org/series/84493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9418 -&gt; IGTPW_5244</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5244 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5244, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5244:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5244 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@gem_exec_store@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +5 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bdw-5557u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bdw-5557u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-s/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-s/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +7 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ivb-3770/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-snb-2600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-snb-2600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-r/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-r/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bxt-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bxt-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-snb-2520m/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-snb-2520m/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-cml-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-cml-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +7 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-skl-6700k2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-skl-6700k2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-hsw-4770/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-glk-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-glk-dsi/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-7500u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-7500u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-y/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-y/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-ehl-1/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2675">i915#2675</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2675">i915#2675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9418/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5878 -&gt; IGTPW_5244</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9418: 5ef90940f82646746fbc78f3af9cdfa503355ab0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5244/index.html<br />
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_cursor_legacy@dual-output-tests<br />
-igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic<br />
-igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy<br />
-igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy<br />
-igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic<br />
-igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy<br />
-igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy<br />
-igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic<br />
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy<br />
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic<br />
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy<br />
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size<br />
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic<br />
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy<br />
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-legacy<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-toggle<br />
-igt@kms_cursor_legacy@cursora-vs-flipa-varying-size<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-legacy<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-toggle<br />
-igt@kms_cursor_legacy@cursora-vs-flipb-varying-size<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-legacy<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-toggle<br />
-igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-legacy<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-toggle<br />
-igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size<br />
-igt@kms_cursor_legacy@cursor-vs-flip-atomic<br />
-igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions<br />
-igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@cursor-vs-flip-legacy<br />
-igt@kms_cursor_legacy@cursor-vs-flip-toggle<br />
-igt@kms_cursor_legacy@cursor-vs-flip-varying-size<br />
-igt@kms_cursor_legacy@flip-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions<br />
-igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic<br />
-igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy<br />
-igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic<br />
-igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy<br />
-igt@kms_cursor_legacy@flip-vs-cursor-legacy<br />
-igt@kms_cursor_legacy@flip-vs-cursor-toggle<br />
-igt@kms_cursor_legacy@flip-vs-cursor-varying-size<br />
-igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic<br />
-igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions<br />
-igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@short-flip-after-cursor-toggle<br />
-igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions<br />
-igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size<br />
-igt@kms_cursor_legacy@short-flip-before-cursor-toggle</p>

</body>
</html>

--===============0709778892601785073==--

--===============0626801547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0626801547==--
