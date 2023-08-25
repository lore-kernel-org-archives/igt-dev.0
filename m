Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1104172236159796885=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 09:25:31 -0000
Message-ID: <169295553137.10952.8096002299334282420@emeril.freedesktop.org>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_tili?=
 =?utf-8?q?ng_support_for_display_tests_=28rev2=29?=
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

--===============1104172236159796885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tiling support for display tests (rev2)
URL   : https://patchwork.freedesktop.org/series/122822/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7452_BAT -> XEIGTPW_9658_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9658_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9658_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9658_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +40 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][3] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +87 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] +89 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - bat-atsm-2:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_getfb@getfb2-accept-ccs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9658_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([i915#6077]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         NOTRUN -> [FAIL][10] ([Intel XE#609])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#607])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#537]) +160 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_draw_crc@draw-method-blt:
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#539]) +59 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#455]) +27 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][16] ([Intel XE#422]) +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_getfb@getfb-reject-ccs:
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#577])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_getfb@getfb-reject-ccs.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][18] ([Intel XE#277]) -> [SKIP][19] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/577
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7452 -> IGTPW_9658

  IGTPW_9658: 9658
  IGT_7452: 7452
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5



--===============1104172236159796885==
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
<tr><td><b>Series:</b></td><td>Add tiling support for display tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122822/">https://patchwork.freedesktop.org/series/122822/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7452_BAT -&gt; XEIGTPW_9658_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9658_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9658_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9658_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">INCOMPLETE</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">FAIL</a> +89 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9658_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-adlp-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a>) +160 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-dg2-oem2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/577">Intel XE#577</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9658/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7452 -&gt; IGTPW_9658</li>
</ul>
<p>IGTPW_9658: 9658<br />
  IGT_7452: 7452<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5</p>

</body>
</html>

--===============1104172236159796885==--
