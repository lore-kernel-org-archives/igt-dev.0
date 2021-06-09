Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Jun 2021 13:54:50 -0000
Message-ID: <162324689066.27477.10012178923233365025@emeril.freedesktop.org>
References: <20210609121733.16461-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210609121733.16461-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/11=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0479636139=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0479636139==
Content-Type: multipart/alternative;
 boundary="===============2624870174197679014=="

--===============2624870174197679014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/11] tests/kms_dither: New IGT to validate crtc Dithering
URL   : https://patchwork.freedesktop.org/series/91247/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10196 -> IGTPW_5904
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5904 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5904, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5904:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-hsw-4770:        [WARN][1] ([i915#2283]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
    - fi-bdw-5557u:       [WARN][3] ([i915#2283]) -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-hsw-gt1}:       [WARN][5] ([i915#2283]) -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_5904 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][7] ([fdo#109271]) +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][8] ([i915#1888]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][10] ([i915#2782]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [DMESG-WARN][12] ([i915#2868]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [INCOMPLETE][14] ([i915#3462]) -> [DMESG-FAIL][15] ([i915#3462])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
    - fi-icl-u2:          [DMESG-FAIL][16] ([i915#3462]) -> [INCOMPLETE][17] ([i915#2782] / [i915#3462])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-cfl-8109u:       [FAIL][18] ([i915#3363]) -> [FAIL][19] ([i915#2426] / [i915#3363])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-8109u/igt@runner@aborted.html
    - fi-icl-u2:          [FAIL][20] ([i915#2426] / [i915#2782] / [i915#3363]) -> [FAIL][21] ([i915#2782] / [i915#3363])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][22] ([i915#3363] / [k.org#202321]) -> [FAIL][23] ([i915#2426] / [i915#3363] / [k.org#202321])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-glk-dsi/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-glk-dsi/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][24] ([i915#2426] / [i915#3462]) -> [FAIL][25] ([i915#3462])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-bdw-5557u/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][26] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][27] ([i915#1436] / [i915#3363])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-7500u/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-kbl-7500u/igt@runner@aborted.html
    - fi-cml-u2:          [FAIL][28] ([i915#2082] / [i915#2426] / [i915#3363] / [i915#3462]) -> [FAIL][29] ([i915#3363] / [i915#3462])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cml-u2/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cml-u2/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][30] ([i915#3363]) -> [FAIL][31] ([i915#2426] / [i915#3363])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-guc/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-guc/igt@runner@aborted.html
    - fi-kbl-7567u:       [FAIL][32] ([i915#1436] / [i915#3363]) -> [FAIL][33] ([i915#1436] / [i915#2426] / [i915#3363])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-7567u/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-kbl-7567u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3542]: https://gitlab.freedesktop.org/drm/intel/issues/3542
  [i915#3544]: https://gitlab.freedesktop.org/drm/intel/issues/3544
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (44 -> 39)
------------------------------

  Additional (1): fi-rkl-11500t 
  Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-dg1-1 fi-kbl-8809g fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6103 -> IGTPW_5904

  CI-20190529: 20190529
  CI_DRM_10196: 1588f8e61fe15d12826ca07d41c0a108a26006cc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



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
+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc
+igt@kms_dither@fb-16bpc-vs-panel-12bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html

--===============2624870174197679014==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/11] tests/kms_dither: New IGT to validate crtc Dithering</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91247/">https://patchwork.freedesktop.org/series/91247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10196 -&gt; IGTPW_5904</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5904 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5904, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5904:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-hsw-gt1/igt@core_hotunplug@unbind-rebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5904 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_cs_nop@sync-fork-compute0:<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Additional (1): fi-rkl-11500t <br />
  Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-dg1-1 fi-kbl-8809g fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6103 -&gt; IGTPW_5904</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10196: 1588f8e61fe15d12826ca07d41c0a108a26006cc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5904/index.html<br />
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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
+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-12bpc</p>

</body>
</html>

--===============2624870174197679014==--

--===============0479636139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0479636139==--
