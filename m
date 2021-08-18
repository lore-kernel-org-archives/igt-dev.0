Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9174462990095297053=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Aug 2021 00:00:51 -0000
Message-ID: <162924485156.16673.13815749912239399942@emeril.freedesktop.org>
References: <20210817232154.152035-1-jose.souza@intel.com>
In-Reply-To: <20210817232154.152035-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_tests/kms=5Fcursor=5Flegacy=3A?=
 =?utf-8?q?_Handle_cursor_movements_as_slow_patch_for_display_9+?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9174462990095297053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] tests/kms_cursor_legacy: Handle cursor movements as slow patch for display 9+
URL   : https://patchwork.freedesktop.org/series/93764/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10491 -> IGTPW_6133
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6133 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6133, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6133:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-guc:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {fi-tgl-dsi}:       [PASS][5] -> [SKIP][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
Known issues
------------

  Here are the changes found in IGTPW_6133 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][7] ([fdo#109315]) +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#2190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][9] ([fdo#109271]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][10] ([i915#1886] / [i915#2291])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-skl-guc:         [PASS][12] -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-cfl-guc:         [PASS][14] -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-icl-y:           [PASS][16] -> [SKIP][17] ([fdo#109278]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-cml-u2:          [PASS][18] -> [SKIP][19] ([fdo#109278]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-skl-6700k2:      [PASS][20] -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bxt-dsi:         [PASS][22] -> [SKIP][23] ([fdo#109271]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [PASS][24] -> [SKIP][25] ([fdo#109278]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-cfl-8700k:       [PASS][26] -> [SKIP][27] ([fdo#109271]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-cfl-8109u:       [PASS][28] -> [SKIP][29] ([fdo#109271]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-glk-dsi:         [PASS][30] -> [SKIP][31] ([fdo#109271]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-kbl-7500u:       [PASS][32] -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-kbl-7500u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-7500u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#533])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][35] ([i915#1602] / [i915#2029])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [DMESG-WARN][36] ([i915#3925]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-ilk-650:         [DMESG-WARN][38] ([i915#164]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-ilk-650/igt@core_hotunplug@unbind-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-ilk-650/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [INCOMPLETE][40] ([i915#155]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-1115g4:      [FAIL][42] ([i915#1888]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@execlists:
    - {fi-tgl-dsi}:       [DMESG-FAIL][44] ([i915#1993]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-dsi/igt@i915_selftest@live@execlists.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-dsi/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#164]: https://gitlab.freedesktop.org/drm/intel/issues/164
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1993]: https://gitlab.freedesktop.org/drm/intel/issues/1993
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (36 -> 34)
------------------------------

  Missing    (2): fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6177 -> IGTPW_6133

  CI-20190529: 20190529
  CI_DRM_10491: efa09f306ade4b8550404d7248ac743fc0cb2c7d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6133: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html
  IGT_6177: f474644e7226dd319195ca03b3cde82ad10ac54c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html

--===============9174462990095297053==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] tests/kms_cursor_legacy: Handle cursor movements as slow patch for display 9+</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93764/">https://patchwork.freedesktop.org/series/93764/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10491 -&gt; IGTPW_6133</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6133 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6133, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6133:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6133 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-icl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-kbl-7500u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-7500u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-ilk-650/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/164">i915#164</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-ilk-650/igt@core_hotunplug@unbind-rebind.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10491/fi-tgl-dsi/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1993">i915#1993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/fi-tgl-dsi/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (36 -&gt; 34)</h2>
<p>Missing    (2): fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6177 -&gt; IGTPW_6133</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10491: efa09f306ade4b8550404d7248ac743fc0cb2c7d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6133: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6133/index.html<br />
  IGT_6177: f474644e7226dd319195ca03b3cde82ad10ac54c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9174462990095297053==--
