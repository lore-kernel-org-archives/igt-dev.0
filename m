Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Nov 2020 15:45:30 -0000
Message-ID: <160502313035.11376.297659353090689661@emeril.freedesktop.org>
References: <20201110075102.5033-1-tzimmermann@suse.de>
In-Reply-To: <20201110075102.5033-1-tzimmermann@suse.de>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0547155230=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0547155230==
Content-Type: multipart/alternative;
 boundary="===============5145991281959544514=="

--===============5145991281959544514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test cases for fbdev
URL   : https://patchwork.freedesktop.org/series/83677/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9301 -> IGTPW_5153
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5153 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5153, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5153:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@mmap:
    - fi-tgl-u2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2/igt@fbdev@mmap.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/igt@fbdev@mmap.html
    - fi-tgl-y:           NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-y/igt@fbdev@mmap.html
    - fi-cml-s:           [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-s/igt@fbdev@mmap.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-s/igt@fbdev@mmap.html
    - fi-icl-y:           [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-y/igt@fbdev@mmap.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-y/igt@fbdev@mmap.html
    - fi-icl-u2:          [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2/igt@fbdev@mmap.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/igt@fbdev@mmap.html
    - fi-cml-u2:          [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-u2/igt@fbdev@mmap.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-u2/igt@fbdev@mmap.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@mmap:
    - {fi-ehl-1}:         [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ehl-1/igt@fbdev@mmap.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ehl-1/igt@fbdev@mmap.html
    - {fi-tgl-dsi}:       [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-dsi/igt@fbdev@mmap.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-dsi/igt@fbdev@mmap.html

  
Known issues
------------

  Here are the changes found in IGTPW_5153 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@mmap:
    - fi-skl-lmem:        [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-lmem/igt@fbdev@mmap.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-lmem/igt@fbdev@mmap.html
    - fi-ivb-3770:        [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ivb-3770/igt@fbdev@mmap.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ivb-3770/igt@fbdev@mmap.html
    - fi-ilk-650:         [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ilk-650/igt@fbdev@mmap.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ilk-650/igt@fbdev@mmap.html
    - fi-bsw-n3050:       [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-n3050/igt@fbdev@mmap.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-n3050/igt@fbdev@mmap.html
    - fi-cfl-guc:         [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-guc/igt@fbdev@mmap.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-guc/igt@fbdev@mmap.html
    - fi-snb-2600:        [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-2600/igt@fbdev@mmap.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-2600/igt@fbdev@mmap.html
    - fi-kbl-x1275:       [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-x1275/igt@fbdev@mmap.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-x1275/igt@fbdev@mmap.html
    - fi-kbl-soraka:      [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-soraka/igt@fbdev@mmap.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-soraka/igt@fbdev@mmap.html
    - fi-glk-dsi:         [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-glk-dsi/igt@fbdev@mmap.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-glk-dsi/igt@fbdev@mmap.html
    - fi-bsw-kefka:       [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-kefka/igt@fbdev@mmap.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kefka/igt@fbdev@mmap.html
    - fi-kbl-r:           [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-r/igt@fbdev@mmap.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-r/igt@fbdev@mmap.html
    - fi-kbl-8809g:       [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-8809g/igt@fbdev@mmap.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-8809g/igt@fbdev@mmap.html
    - fi-blb-e6850:       [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-blb-e6850/igt@fbdev@mmap.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-blb-e6850/igt@fbdev@mmap.html
    - fi-kbl-7500u:       [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-7500u/igt@fbdev@mmap.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-7500u/igt@fbdev@mmap.html
    - fi-cfl-8109u:       [PASS][44] -> [SKIP][45] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-8109u/igt@fbdev@mmap.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-8109u/igt@fbdev@mmap.html
    - fi-gdg-551:         [PASS][46] -> [SKIP][47] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-gdg-551/igt@fbdev@mmap.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-gdg-551/igt@fbdev@mmap.html
    - fi-bwr-2160:        [PASS][48] -> [SKIP][49] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bwr-2160/igt@fbdev@mmap.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bwr-2160/igt@fbdev@mmap.html
    - fi-skl-guc:         [PASS][50] -> [SKIP][51] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-guc/igt@fbdev@mmap.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-guc/igt@fbdev@mmap.html
    - fi-skl-6600u:       [PASS][52] -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-6600u/igt@fbdev@mmap.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-6600u/igt@fbdev@mmap.html
    - fi-pnv-d510:        [PASS][54] -> [SKIP][55] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-pnv-d510/igt@fbdev@mmap.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-pnv-d510/igt@fbdev@mmap.html
    - fi-bdw-5557u:       [PASS][56] -> [SKIP][57] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bdw-5557u/igt@fbdev@mmap.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bdw-5557u/igt@fbdev@mmap.html
    - fi-snb-2520m:       [PASS][58] -> [SKIP][59] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-2520m/igt@fbdev@mmap.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-2520m/igt@fbdev@mmap.html
    - fi-apl-guc:         [PASS][60] -> [SKIP][61] ([fdo#109271] / [i915#1635])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-guc/igt@fbdev@mmap.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc/igt@fbdev@mmap.html
    - fi-hsw-4770:        [PASS][62] -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-hsw-4770/igt@fbdev@mmap.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-hsw-4770/igt@fbdev@mmap.html
    - fi-cfl-8700k:       [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-8700k/igt@fbdev@mmap.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-8700k/igt@fbdev@mmap.html
    - fi-bxt-dsi:         [PASS][66] -> [SKIP][67] ([fdo#109271] / [i915#1635])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bxt-dsi/igt@fbdev@mmap.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bxt-dsi/igt@fbdev@mmap.html
    - fi-skl-6700k2:      [PASS][68] -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-6700k2/igt@fbdev@mmap.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-6700k2/igt@fbdev@mmap.html
    - fi-elk-e7500:       [PASS][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-elk-e7500/igt@fbdev@mmap.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-elk-e7500/igt@fbdev@mmap.html
    - fi-byt-j1900:       [PASS][72] -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-byt-j1900/igt@fbdev@mmap.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-byt-j1900/igt@fbdev@mmap.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [PASS][74] -> [DMESG-WARN][75] ([i915#1982] / [k.org#205379])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2/igt@i915_module_load@reload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-soraka:      [PASS][76] -> [DMESG-WARN][77] ([i915#1982])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-soraka/igt@kms_busy@basic@flip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-soraka/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [PASS][78] -> [DMESG-WARN][79] ([i915#1982]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-apl-guc:         [DMESG-WARN][82] ([i915#1635] / [i915#1982]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (46 -> 42)
------------------------------

  Additional (1): fi-tgl-y 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5839 -> IGTPW_5153

  CI-20190529: 20190529
  CI_DRM_9301: 886b2b2d05ec4cb1b21cf7a311f186b5df1b78c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5153: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@fbdev@eof
+igt@fbdev@nullptr
+igt@fbdev@read
+igt@fbdev@unaligned-read
+igt@fbdev@unaligned-write
+igt@fbdev@write
-igt@fbdev@mmap

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html

--===============5145991281959544514==
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
<tr><td><b>Series:</b></td><td>Test cases for fbdev</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83677/">https://patchwork.freedesktop.org/series/83677/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9301 -&gt; IGTPW_5153</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5153 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5153, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5153:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@mmap:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-y/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-s/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-s/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-y/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-y/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-u2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-u2/igt@fbdev@mmap.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@fbdev@mmap:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ehl-1/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ehl-1/igt@fbdev@mmap.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-dsi/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-dsi/igt@fbdev@mmap.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5153 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@mmap:</p>
<ul>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-lmem/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-lmem/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ivb-3770/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ivb-3770/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ilk-650/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ilk-650/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-n3050/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-n3050/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-2600/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-2600/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-x1275/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-x1275/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-soraka/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-soraka/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-glk-dsi/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-glk-dsi/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-kefka/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kefka/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-r/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-r/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-8809g/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-8809g/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-blb-e6850/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-blb-e6850/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-7500u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-7500u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-8109u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-8109u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-gdg-551/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-gdg-551/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bwr-2160/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bwr-2160/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-6600u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-6600u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-pnv-d510/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-pnv-d510/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bdw-5557u/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bdw-5557u/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-2520m/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-2520m/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-guc/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-hsw-4770/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-hsw-4770/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-8700k/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-8700k/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bxt-dsi/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bxt-dsi/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-6700k2/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-6700k2/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-elk-e7500/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-elk-e7500/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-byt-j1900/igt@fbdev@mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-byt-j1900/igt@fbdev@mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-soraka/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-soraka/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 42)</h2>
<p>Additional (1): fi-tgl-y <br />
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5839 -&gt; IGTPW_5153</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9301: 886b2b2d05ec4cb1b21cf7a311f186b5df1b78c5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5153: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html<br />
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
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

--===============5145991281959544514==--

--===============0547155230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0547155230==--
