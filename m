Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Jun 2021 13:01:53 -0000
Message-ID: <162341651330.29314.2464407663318802630@emeril.freedesktop.org>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/17=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0288722828=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0288722828==
Content-Type: multipart/alternative;
 boundary="===============1517996458213464813=="

--===============1517996458213464813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev5)
URL   : https://patchwork.freedesktop.org/series/91371/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10212 -> IGTPW_5912
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5912 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5912, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5912:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-hsw-4770:        [WARN][1] ([i915#2283]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-hsw-gt1}:       [WARN][3] ([i915#2283]) -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html

  * igt@runner@aborted:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-jsl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5912 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][6] ([fdo#109271]) +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][7] ([i915#2782]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][9] ([i915#3462]) -> [INCOMPLETE][10] ([i915#2782] / [i915#2940] / [i915#3462])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][11] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][12] ([i915#1436] / [i915#3363])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-6600u/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-skl-6600u/igt@runner@aborted.html
    - fi-kbl-8809g:       [FAIL][13] ([i915#1436] / [i915#3363]) -> [FAIL][14] ([i915#1436] / [i915#2426] / [i915#3363])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-8809g/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-8809g/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][15] ([i915#1436] / [i915#3363]) -> [FAIL][16] ([i915#1436] / [i915#2426] / [i915#3363])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-soraka/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-soraka/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][17] ([i915#1436] / [i915#3363]) -> [FAIL][18] ([i915#1436] / [i915#2426] / [i915#3363])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-7500u/igt@runner@aborted.html
    - fi-skl-guc:         [FAIL][19] ([i915#1436] / [i915#3363]) -> [FAIL][20] ([i915#1436] / [i915#2426] / [i915#3363])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-guc/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-skl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
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


Participating hosts (46 -> 39)
------------------------------

  Additional (1): fi-jsl-1 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6104 -> IGTPW_5912

  CI-20190529: 20190529
  CI_DRM_10212: d6a4e59ffc78a058586d57930708ba706d765be4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html

--===============1517996458213464813==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91371/">https://patchwork.freedesktop.org/series/91371/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10212 -&gt; IGTPW_5912</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5912 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5912, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5912:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
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
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-jsl-1/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5912 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_cs_nop@sync-fork-compute0:<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 39)</h2>
<p>Additional (1): fi-jsl-1 <br />
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-adlp-4 bat-adls-4 fi-dg1-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6104 -&gt; IGTPW_5912</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10212: d6a4e59ffc78a058586d57930708ba706d765be4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html<br />
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

--===============1517996458213464813==--

--===============0288722828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0288722828==--
