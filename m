Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Nov 2020 14:05:12 -0000
Message-ID: <160518991212.29796.523470649658853414@emeril.freedesktop.org>
References: <20201112132837.502142-1-mika.kahola@intel.com>
In-Reply-To: <20201112132837.502142-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0422238732=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0422238732==
Content-Type: multipart/alternative;
 boundary="===============8206116354079057916=="

--===============8206116354079057916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test
URL   : https://patchwork.freedesktop.org/series/83766/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5848 -> IGTPW_5161
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5161 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5161, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5161:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - fi-cfl-8700k:       [PASS][1] -> [CRASH][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html
    - fi-cfl-8109u:       [PASS][3] -> [CRASH][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html
    - fi-kbl-guc:         [PASS][5] -> [CRASH][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-guc/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-guc/igt@gem_render_linear_blits@basic.html
    - fi-skl-lmem:        [PASS][7] -> [CRASH][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-lmem/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-lmem/igt@gem_render_linear_blits@basic.html
    - fi-kbl-7500u:       [PASS][9] -> [CRASH][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html
    - fi-kbl-x1275:       [PASS][11] -> [CRASH][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html
    - fi-tgl-y:           [PASS][13] -> [CRASH][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_render_linear_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-skl-6700k2:      [PASS][15] -> [CRASH][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-soraka:      [PASS][17] -> [CRASH][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html
    - fi-cfl-guc:         [PASS][19] -> [CRASH][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html
    - fi-icl-u2:          [PASS][21] -> [CRASH][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@gem_render_tiled_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@gem_render_tiled_blits@basic.html
    - fi-skl-6600u:       [PASS][23] -> [CRASH][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html
    - fi-icl-y:           [PASS][25] -> [CRASH][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-y/igt@gem_render_tiled_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-y/igt@gem_render_tiled_blits@basic.html
    - fi-skl-guc:         [PASS][27] -> [CRASH][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-guc/igt@gem_render_tiled_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-guc/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-8809g:       [PASS][29] -> [CRASH][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-tgl-u2:          [PASS][31] -> [CRASH][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html
    - fi-cml-s:           [PASS][33] -> [CRASH][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html
    - fi-cml-u2:          [PASS][35] -> [CRASH][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
    - fi-glk-dsi:         [PASS][37] -> [CRASH][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_linear_blits@basic:
    - {fi-kbl-7560u}:     [PASS][39] -> [CRASH][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7560u/igt@gem_render_linear_blits@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7560u/igt@gem_render_linear_blits@basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-ehl-1}:         [PASS][41] -> [CRASH][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html
    - {fi-tgl-dsi}:       [PASS][43] -> [CRASH][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5161 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-icl-u2:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_gttfill@basic:
    - fi-tgl-y:           [PASS][47] -> [DMESG-WARN][48] ([i915#402]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_exec_gttfill@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][49] -> [FAIL][50] ([i915#1888])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [PASS][51] -> [CRASH][52] ([i915#1635]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][53] -> [DMESG-WARN][54] ([i915#1982])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bxt-dsi:         [PASS][55] -> [CRASH][56] ([i915#1635]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-hsw-4770:        [PASS][57] -> [INCOMPLETE][58] ([i915#2055])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_create@basic:
    - fi-tgl-y:           [DMESG-WARN][61] ([i915#402]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_ctx_create@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_ctx_create@basic.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bxt-dsi:         [DMESG-WARN][63] ([i915#1635] / [i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-bxt-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-bxt-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-byt-j1900:       [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-tgl-dsi}:       [DMESG-FAIL][67] ([i915#2601]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - {fi-kbl-7560u}:     [DMESG-FAIL][69] ([i915#2524]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7560u/igt@i915_selftest@live@gt_pm.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7560u/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][71] ([i915#1161] / [i915#262]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2524]: https://gitlab.freedesktop.org/drm/intel/issues/2524
  [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (46 -> 41)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5848 -> IGTPW_5161

  CI-20190529: 20190529
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html
  IGT_5848: 1e2525da258aab5e0e3a7705ea8e89b521d5bf88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html

--===============8206116354079057916==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: CCS Clear Color test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83766/">https://patchwork.freedesktop.org/series/83766/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5848 -&gt; IGTPW_5161</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5161 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5161, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5161:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-guc/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-guc/igt@gem_render_linear_blits@basic.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-lmem/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-lmem/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-y/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-y/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-skl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-skl-guc/igt@gem_render_tiled_blits@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html">CRASH</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7560u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7560u/igt@gem_render_linear_blits@basic.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-dsi/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5161 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-y/igt@gem_ctx_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-y/igt@gem_ctx_create@basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-bxt-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-bxt-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2601">i915#2601</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7560u/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2524">i915#2524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7560u/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5848/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 41)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5848 -&gt; IGTPW_5161</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5161/index.html<br />
  IGT_5848: 1e2525da258aab5e0e3a7705ea8e89b521d5bf88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8206116354079057916==--

--===============0422238732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0422238732==--
