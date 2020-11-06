Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Nov 2020 09:33:48 -0000
Message-ID: <160465522860.19146.13028281947451522007@emeril.freedesktop.org>
References: <20201106082955.8939-1-tzimmermann@suse.de>
In-Reply-To: <20201106082955.8939-1-tzimmermann@suse.de>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1079807482=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1079807482==
Content-Type: multipart/alternative;
 boundary="===============4391785429979935673=="

--===============4391785429979935673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test cases for fbdev (rev2)
URL   : https://patchwork.freedesktop.org/series/83424/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9278 -> IGTPW_5138
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5138 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5138, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5138:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@mmap:
    - fi-tgl-u2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-u2/igt@fbdev@mmap.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-u2/igt@fbdev@mmap.html
    - fi-tgl-y:           [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@fbdev@mmap.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@fbdev@mmap.html
    - fi-cml-s:           [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cml-s/igt@fbdev@mmap.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cml-s/igt@fbdev@mmap.html
    - fi-icl-y:           [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-y/igt@fbdev@mmap.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-y/igt@fbdev@mmap.html
    - fi-icl-u2:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@fbdev@mmap.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@fbdev@mmap.html
    - fi-cml-u2:          [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cml-u2/igt@fbdev@mmap.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cml-u2/igt@fbdev@mmap.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@mmap:
    - {fi-ehl-1}:         [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ehl-1/igt@fbdev@mmap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ehl-1/igt@fbdev@mmap.html

  
Known issues
------------

  Here are the changes found in IGTPW_5138 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@mmap:
    - fi-skl-lmem:        [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-lmem/igt@fbdev@mmap.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-lmem/igt@fbdev@mmap.html
    - fi-ivb-3770:        [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ivb-3770/igt@fbdev@mmap.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ivb-3770/igt@fbdev@mmap.html
    - fi-ilk-650:         [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ilk-650/igt@fbdev@mmap.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ilk-650/igt@fbdev@mmap.html
    - fi-bsw-n3050:       [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-n3050/igt@fbdev@mmap.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-n3050/igt@fbdev@mmap.html
    - fi-cfl-guc:         [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-guc/igt@fbdev@mmap.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-guc/igt@fbdev@mmap.html
    - fi-snb-2600:        [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-snb-2600/igt@fbdev@mmap.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-snb-2600/igt@fbdev@mmap.html
    - fi-kbl-x1275:       [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-x1275/igt@fbdev@mmap.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-x1275/igt@fbdev@mmap.html
    - fi-kbl-soraka:      [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-soraka/igt@fbdev@mmap.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-soraka/igt@fbdev@mmap.html
    - fi-glk-dsi:         [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-glk-dsi/igt@fbdev@mmap.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-glk-dsi/igt@fbdev@mmap.html
    - fi-bsw-kefka:       [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-kefka/igt@fbdev@mmap.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-kefka/igt@fbdev@mmap.html
    - fi-kbl-r:           [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-r/igt@fbdev@mmap.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-r/igt@fbdev@mmap.html
    - fi-blb-e6850:       [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-blb-e6850/igt@fbdev@mmap.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-blb-e6850/igt@fbdev@mmap.html
    - fi-kbl-7500u:       [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-7500u/igt@fbdev@mmap.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-7500u/igt@fbdev@mmap.html
    - fi-cfl-8109u:       [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8109u/igt@fbdev@mmap.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8109u/igt@fbdev@mmap.html
    - fi-gdg-551:         [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-gdg-551/igt@fbdev@mmap.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-gdg-551/igt@fbdev@mmap.html
    - fi-bwr-2160:        [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bwr-2160/igt@fbdev@mmap.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bwr-2160/igt@fbdev@mmap.html
    - fi-skl-guc:         [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-guc/igt@fbdev@mmap.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-guc/igt@fbdev@mmap.html
    - fi-skl-6600u:       [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-6600u/igt@fbdev@mmap.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-6600u/igt@fbdev@mmap.html
    - fi-pnv-d510:        [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-pnv-d510/igt@fbdev@mmap.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-pnv-d510/igt@fbdev@mmap.html
    - fi-bdw-5557u:       [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bdw-5557u/igt@fbdev@mmap.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bdw-5557u/igt@fbdev@mmap.html
    - fi-snb-2520m:       [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-snb-2520m/igt@fbdev@mmap.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-snb-2520m/igt@fbdev@mmap.html
    - fi-apl-guc:         [PASS][57] -> [SKIP][58] ([fdo#109271] / [i915#1635])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@fbdev@mmap.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@fbdev@mmap.html
    - fi-hsw-4770:        [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-hsw-4770/igt@fbdev@mmap.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-hsw-4770/igt@fbdev@mmap.html
    - fi-cfl-8700k:       [PASS][61] -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8700k/igt@fbdev@mmap.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8700k/igt@fbdev@mmap.html
    - fi-bxt-dsi:         [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1635])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bxt-dsi/igt@fbdev@mmap.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bxt-dsi/igt@fbdev@mmap.html
    - fi-skl-6700k2:      [PASS][65] -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-6700k2/igt@fbdev@mmap.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-6700k2/igt@fbdev@mmap.html
    - fi-elk-e7500:       [PASS][67] -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-elk-e7500/igt@fbdev@mmap.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-elk-e7500/igt@fbdev@mmap.html
    - fi-byt-j1900:       [PASS][69] -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-byt-j1900/igt@fbdev@mmap.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-byt-j1900/igt@fbdev@mmap.html

  * igt@gem_exec_create@basic:
    - fi-tgl-y:           [PASS][71] -> [DMESG-WARN][72] ([i915#402]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@gem_exec_create@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@gem_exec_create@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][73] -> [DMESG-WARN][74] ([i915#1982]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-apl-guc:         [PASS][75] -> [DMESG-WARN][76] ([i915#1635] / [i915#1982])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [PASS][77] -> [DMESG-WARN][78] ([i915#1982]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-blb-e6850:       [INCOMPLETE][79] ([i915#2540]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [DMESG-WARN][81] ([i915#1982] / [k.org#205379]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-u2/igt@i915_module_load@reload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-u2/igt@i915_module_load@reload.html
    - fi-tgl-y:           [DMESG-WARN][83] ([i915#1982] / [k.org#205379]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@i915_module_load@reload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][85] ([fdo#109271]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [INCOMPLETE][87] ([i915#2089]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [INCOMPLETE][89] ([i915#1635]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-soraka:      [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-soraka/igt@kms_busy@basic@flip.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-soraka/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [DMESG-WARN][93] ([i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [DMESG-WARN][97] ([i915#402]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2089]: https://gitlab.freedesktop.org/drm/intel/issues/2089
  [i915#2540]: https://gitlab.freedesktop.org/drm/intel/issues/2540
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (43 -> 40)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5836 -> IGTPW_5138

  CI-20190529: 20190529
  CI_DRM_9278: 4004b239e7a4a8c1bfba86208e71021a74be2a57 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5138: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@fbdev@eof
+igt@fbdev@nullptr
+igt@fbdev@read
+igt@fbdev@unaligned-read
+igt@fbdev@unaligned-write
+igt@fbdev@write
-igt@fbdev@mmap

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html

--===============4391785429979935673==
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
<tr><td><b>Series:</b></td><td>Test cases for fbdev (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83424/">https://patchwork.freedesktop.org/series/83424/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9278 -&gt; IGTPW_5138</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5138 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5138, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5138:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@mmap:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cml-s/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cml-s/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-y/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-y/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cml-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cml-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@fbdev@mmap:<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ehl-1/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ehl-1/igt@fbdev@mmap.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5138 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@mmap:</p>
<ul>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-lmem/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-lmem/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ivb-3770/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ivb-3770/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-ilk-650/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-ilk-650/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-n3050/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-n3050/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-snb-2600/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-snb-2600/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-x1275/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-x1275/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-soraka/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-soraka/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-glk-dsi/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-glk-dsi/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-kefka/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-kefka/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-r/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-r/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-blb-e6850/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-blb-e6850/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-7500u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-7500u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8109u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8109u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-gdg-551/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-gdg-551/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bwr-2160/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bwr-2160/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-6600u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-6600u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-pnv-d510/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-pnv-d510/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bdw-5557u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bdw-5557u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-snb-2520m/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-snb-2520m/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-hsw-4770/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-hsw-4770/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8700k/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8700k/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bxt-dsi/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bxt-dsi/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-skl-6700k2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-skl-6700k2/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-elk-e7500/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-elk-e7500/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-byt-j1900/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-byt-j1900/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@gem_exec_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@gem_exec_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2540">i915#2540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-u2/igt@i915_module_load@reload.html">PASS</a></p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@i915_module_load@reload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2089">i915#2089</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-kbl-soraka/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-kbl-soraka/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9278/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5836 -&gt; IGTPW_5138</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9278: 4004b239e7a4a8c1bfba86208e71021a74be2a57 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5138: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5138/index.html<br />
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@fbdev@eof<br />
+igt@fbdev@nullptr<br />
+igt@fbdev@read<br />
+igt@fbdev@unaligned-read<br />
+igt@fbdev@unaligned-write<br />
+igt@fbdev@write<br />
-igt@fbdev@mmap</p>

</body>
</html>

--===============4391785429979935673==--

--===============1079807482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1079807482==--
