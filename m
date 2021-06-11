Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Jun 2021 15:23:38 -0000
Message-ID: <162342501841.29314.1067745950518058318@emeril.freedesktop.org>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/17=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1575531763=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1575531763==
Content-Type: multipart/alternative;
 boundary="===============5297127754578801873=="

--===============5297127754578801873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev6)
URL   : https://patchwork.freedesktop.org/series/91371/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10212 -> IGTPW_5914
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5914 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5914, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5914:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-hsw-4770:        [WARN][2] ([i915#2283]) -> [WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-hsw-gt1}:       [WARN][4] ([i915#2283]) -> [WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html

  * igt@runner@aborted:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-jsl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5914 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bdw-5557u:       NOTRUN -> [DMESG-FAIL][7] ([i915#3462])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][8] -> [FAIL][9] ([i915#1372])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_psr@cursor_plane_move:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][10] ([fdo#109271]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][11] ([i915#3462]) -> [INCOMPLETE][12] ([i915#2782] / [i915#2940] / [i915#3462])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bsw-nick/igt@i915_selftest@live@execlists.html
    - fi-kbl-soraka:      [INCOMPLETE][13] ([i915#2782] / [i915#3462] / [i915#794]) -> [INCOMPLETE][14] ([i915#794])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][15] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][16] ([i915#1436] / [i915#3363])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-6600u/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-skl-6600u/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][17] ([i915#2426] / [i915#3363] / [k.org#202321]) -> [FAIL][18] ([i915#3363] / [k.org#202321])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-glk-dsi/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-glk-dsi/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][19] ([i915#1602] / [i915#2029]) -> [FAIL][20] ([i915#3462])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bdw-5557u/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][21] ([i915#1436] / [i915#3363]) -> [FAIL][22] ([i915#1436] / [i915#2426] / [i915#3363])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-7500u/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][23] ([i915#2426] / [i915#3363]) -> [FAIL][24] ([i915#3363])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-cfl-guc/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-cfl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2932]: https://gitlab.freedesktop.org/drm/intel/issues/2932
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#2966]: https://gitlab.freedesktop.org/drm/intel/issues/2966
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (46 -> 38)
------------------------------

  Additional (1): fi-jsl-1 
  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-skl-guc fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6104 -> IGTPW_5914

  CI-20190529: 20190529
  CI_DRM_10212: d6a4e59ffc78a058586d57930708ba706d765be4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html
  IGT_6104: f8f81bd3752f3126a47d9dbba2d0ab29f7c17a19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_cdclk@basic
+igt@kms_cdclk@mode-transition
+igt@kms_cdclk@plane-scaling
+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc
+igt@kms_dither@fb-16bpc-vs-panel-12bpc
+igt@kms_dp_dsc@basic-dsc-enable
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888
-igt@kms_dp_dsc@basic-dsc-enable-dp
-igt@kms_dp_dsc@basic-dsc-enable-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html

--===============5297127754578801873==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91371/">https://patchwork.freedesktop.org/series/91371/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10212 -&gt; IGTPW_5914</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5914 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5914, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5914:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-jsl-1/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5914 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 38)</h2>
<p>Additional (1): fi-jsl-1 <br />
  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-skl-guc fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6104 -&gt; IGTPW_5914</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10212: d6a4e59ffc78a058586d57930708ba706d765be4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5914/index.html<br />
  IGT_6104: f8f81bd3752f3126a47d9dbba2d0ab29f7c17a19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_addfb_basic@invalid-smem-bo-on-discrete<br />
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_cdclk@basic<br />
+igt@kms_cdclk@mode-transition<br />
+igt@kms_cdclk@plane-scaling<br />
+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-12bpc<br />
+igt@kms_dp_dsc@basic-dsc-enable<br />
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888<br />
-igt@kms_dp_dsc@basic-dsc-enable-dp<br />
-igt@kms_dp_dsc@basic-dsc-enable-edp</p>

</body>
</html>

--===============5297127754578801873==--

--===============1575531763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1575531763==--
