Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3164870849338255969=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 24 Aug 2023 06:22:26 -0000
Message-ID: <169285814672.13341.6324501376865606625@emeril.freedesktop.org>
References: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_tili?=
 =?utf-8?q?ng_support_for_display_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3164870849338255969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tiling support for display tests
URL   : https://patchwork.freedesktop.org/series/122822/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7451_BAT -> XEIGTPW_9645_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9645_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9645_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9645_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - bat-atsm-2:         NOTRUN -> [FAIL][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_plane@pixel-format-source-clamping:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-x@pipe-d-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][5] +37 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] +302 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25.html

  * igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25@pipe-b-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25@pipe-b-dp-3.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - bat-adlp-7:         NOTRUN -> [SKIP][8] +22 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_getfb@getfb-accept-ccs}:
    - bat-adlp-7:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_getfb@getfb-accept-ccs.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_getfb@getfb-accept-ccs.html
    - bat-atsm-2:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_getfb@getfb-accept-ccs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9645_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([i915#6077]) +10 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#388])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#388])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][15] ([Intel XE#282]) +10 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [PASS][16] -> [FAIL][17] ([Intel XE#480]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_plane@invalid-pixel-format-settings:
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([i915#1836])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_plane@invalid-pixel-format-settings.html

  * igt@kms_plane@pixel-format:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][19] ([Intel XE#338]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane@pixel-format.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [DMESG-FAIL][20] ([Intel XE#324]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-none@pipe-a-dp-3.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][21] ([Intel XE#319]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][22] ([Intel XE#319] / [Intel XE#455])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][23] ([Intel XE#455]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#455]) +27 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-y@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][25] ([Intel XE#498]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][26] ([Intel XE#305]) +20 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_psr@sprite_blt:
    - bat-atsm-2:         NOTRUN -> [SKIP][27] ([i915#1072]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_psr@sprite_blt.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - bat-adlp-7:         NOTRUN -> [SKIP][28] ([Intel XE#327]) +6 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_rotation_crc@sprite-rotation-90.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/319
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/338
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7451 -> IGTPW_9645
  * Linux: xe-330-3a964d06598874329aab6f8db7fd52840135d568 -> xe-332-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef

  IGTPW_9645: 9645
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-330-3a964d06598874329aab6f8db7fd52840135d568: 3a964d06598874329aab6f8db7fd52840135d568
  xe-332-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef: 24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef



--===============3164870849338255969==
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
<tr><td><b>Series:</b></td><td>Add tiling support for display tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122822/">https://patchwork.freedesktop.org/series/122822/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7451_BAT -&gt; XEIGTPW_9645_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9645_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9645_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9645_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_cursor_edge_walk@256x256-left-edge.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-x@pipe-d-dp-3.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-edp-1.html">DMESG-FAIL</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25.html">SKIP</a> +302 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25@pipe-b-dp-3.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> +22 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_getfb@getfb-accept-ccs}:</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_getfb@getfb-accept-ccs.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_getfb@getfb-accept-ccs.html">SKIP</a></p>
</li>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_getfb@getfb-accept-ccs.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9645_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>)</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@invalid-pixel-format-settings:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_plane@invalid-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane@pixel-format.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/338">Intel XE#338</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-none@pipe-a-dp-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/319">Intel XE#319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/319">Intel XE#319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-dg2-oem2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_lowres@tiling-y@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-atsm-2/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9645/bat-adlp-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +6 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7451 -&gt; IGTPW_9645</li>
<li>Linux: xe-330-3a964d06598874329aab6f8db7fd52840135d568 -&gt; xe-332-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef</li>
</ul>
<p>IGTPW_9645: 9645<br />
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-330-3a964d06598874329aab6f8db7fd52840135d568: 3a964d06598874329aab6f8db7fd52840135d568<br />
  xe-332-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef: 24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef</p>

</body>
</html>

--===============3164870849338255969==--
