Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 22 Sep 2020 12:35:35 -0000
Message-ID: <160077813534.13389.13920958115664473007@emeril.freedesktop.org>
References: <20200922115229.28371-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200922115229.28371-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?benchmarks=3A_Libdrm_removal_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1166887278=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1166887278==
Content-Type: multipart/alternative;
 boundary="===============2286656187727244850=="

--===============2286656187727244850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/benchmarks: Libdrm removal (rev4)
URL   : https://patchwork.freedesktop.org/series/81782/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9033 -> IGTPW_5003
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5003 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5003, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5003:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - fi-snb-2600:        NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-snb-2600/igt@gem_pipe_control_store_loop@reused-buffer.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-snb-2520m/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - fi-blb-e6850:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-blb-e6850/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-pnv-d510/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_blits@basic:
    - fi-elk-e7500:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-elk-e7500/igt@gem_tiled_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-elk-e7500/igt@gem_tiled_blits@basic.html
    - fi-ilk-650:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - fi-byt-j1900:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-byt-j1900/igt@gem_tiled_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-byt-j1900/igt@gem_tiled_blits@basic.html
    - fi-pnv-d510:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-pnv-d510/igt@gem_tiled_blits@basic.html
    - fi-blb-e6850:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-blb-e6850/igt@gem_tiled_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-blb-e6850/igt@gem_tiled_blits@basic.html
    - fi-bwr-2160:        [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-bwr-2160/igt@gem_tiled_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-bwr-2160/igt@gem_tiled_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5003 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_blits@basic:
    - fi-apl-guc:         [PASS][17] -> [FAIL][18] ([i915#1635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-apl-guc/igt@gem_tiled_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-apl-guc/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@objects:
    - fi-apl-guc:         [PASS][19] -> [INCOMPLETE][20] ([i915#1635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-apl-guc/igt@i915_selftest@live@objects.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-apl-guc/igt@i915_selftest@live@objects.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [PASS][21] -> [DMESG-WARN][22] ([i915#62] / [i915#92] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [PASS][23] -> [DMESG-WARN][24] ([i915#2203])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][29] ([i915#1982]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-FAIL][31] ([i915#62] / [i915#95]) -> [DMESG-FAIL][32] ([i915#62])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][33] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][34] ([i915#62] / [i915#92]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][35] ([i915#62] / [i915#92]) -> [DMESG-WARN][36] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (43 -> 37)
------------------------------

  Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_5003

  CI-20190529: 20190529
  CI_DRM_9033: afeb3835029ad70d17802a9c7148a8372fb08479 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5003: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html

--===============2286656187727244850==
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
<tr><td><b>Series:</b></td><td>tests/benchmarks: Libdrm removal (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81782/">https://patchwork.freedesktop.org/series/81782/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9033 -&gt; IGTPW_5003</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5003 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5003, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5003:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pipe_control_store_loop@reused-buffer:</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-snb-2600/igt@gem_pipe_control_store_loop@reused-buffer.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-snb-2520m/igt@gem_pipe_control_store_loop@reused-buffer.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-blb-e6850/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-pnv-d510/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-elk-e7500/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-elk-e7500/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-ilk-650/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-byt-j1900/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-byt-j1900/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-pnv-d510/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-pnv-d510/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-blb-e6850/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-blb-e6850/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-bwr-2160/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-bwr-2160/igt@gem_tiled_blits@basic.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5003 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-apl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-apl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-apl-guc/igt@i915_selftest@live@objects.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-apl-guc/igt@i915_selftest@live@objects.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9033/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5787 -&gt; IGTPW_5003</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9033: afeb3835029ad70d17802a9c7148a8372fb08479 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5003: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5003/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2286656187727244850==--

--===============1166887278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1166887278==--
