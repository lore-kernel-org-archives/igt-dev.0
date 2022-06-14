Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5991014552943245942=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 14 Jun 2022 08:18:04 -0000
Message-ID: <165519468448.12485.8151042463821048559@emeril.freedesktop.org>
References: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcursor=5Fedge=5Fwa?=
 =?utf-8?q?lk=3A_Convert_tests_to_dynamic_=28rev2=29?=
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

--===============5991014552943245942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_cursor_edge_walk: Convert tests to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/104968/
State : success

== Summary ==

CI Bug Log - changes from IGT_6523 -> IGTPW_7301
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html

Participating hosts (36 -> 37)
------------------------------

  Additional (3): bat-adlm-1 fi-rkl-11600 bat-dg2-9 
  Missing    (2): fi-kbl-soraka fi-tgl-u2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7301:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@load:
    - {bat-adlm-1}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-adlm-1/igt@i915_module_load@load.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-dg2-9/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_7301 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([i915#3282])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#3012])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][7] ([i915#4528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-blb-e6850/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][8] -> [INCOMPLETE][9] ([i915#4785])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][10] ([i915#4817])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][11] ([i915#5982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([fdo#111827]) +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] ([i915#4103]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([fdo#109285] / [i915#4098])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([i915#533])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#1072]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#3555] / [i915#4098])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([fdo#109295] / [i915#3301] / [i915#3708])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][20] ([fdo#109271] / [i915#4312])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - {fi-tgl-dsi}:       [DMESG-WARN][21] ([i915#1982]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-tgl-dsi/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-tgl-dsi/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-adlp-6}:       [DMESG-WARN][23] ([i915#3576]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bdw-gvtdvm:      [INCOMPLETE][25] ([i915#2940]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][27] ([i915#4528]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-blb-e6850/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6523 -> IGTPW_7301

  CI-20190529: 20190529
  CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7301: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html
  IGT_6523: 6220aae385a5815093e1672965093b695e32e03b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_cursor_edge_walk@left-edge
+igt@kms_cursor_edge_walk@right-edge
+igt@kms_cursor_edge_walk@top-bottom
+igt@kms_cursor_edge_walk@top-edge
-igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge
-igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-b-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge
-igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge
-igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-d-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-d-256x256-top-edge
-igt@kms_cursor_edge_walk@pipe-e-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-e-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-e-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-e-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-e-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-e-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-e-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-e-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-e-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-e-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-e-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-e-256x256-top-edge
-igt@kms_cursor_edge_walk@pipe-f-64x64-bottom-edge
-igt@kms_cursor_edge_walk@pipe-f-64x64-left-edge
-igt@kms_cursor_edge_walk@pipe-f-64x64-right-edge
-igt@kms_cursor_edge_walk@pipe-f-64x64-top-edge
-igt@kms_cursor_edge_walk@pipe-f-128x128-bottom-edge
-igt@kms_cursor_edge_walk@pipe-f-128x128-left-edge
-igt@kms_cursor_edge_walk@pipe-f-128x128-right-edge
-igt@kms_cursor_edge_walk@pipe-f-128x128-top-edge
-igt@kms_cursor_edge_walk@pipe-f-256x256-bottom-edge
-igt@kms_cursor_edge_walk@pipe-f-256x256-left-edge
-igt@kms_cursor_edge_walk@pipe-f-256x256-right-edge
-igt@kms_cursor_edge_walk@pipe-f-256x256-top-edge

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html

--===============5991014552943245942==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_cursor_edge_walk: Convert tests to dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104968/">https://patchwork.freedesktop.org/series/104968/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6523 -&gt; IGTPW_7301</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html</p>
<h2>Participating hosts (36 -&gt; 37)</h2>
<p>Additional (3): bat-adlm-1 fi-rkl-11600 bat-dg2-9 <br />
  Missing    (2): fi-kbl-soraka fi-tgl-u2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7301:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-adlm-1/igt@i915_module_load@load.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-dg2-9/igt@i915_module_load@load.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7301 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-tgl-dsi/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-tgl-dsi/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6523 -&gt; IGTPW_7301</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7301: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7301/index.html<br />
  IGT_6523: 6220aae385a5815093e1672965093b695e32e03b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_cursor_edge_walk@left-edge<br />
+igt@kms_cursor_edge_walk@right-edge<br />
+igt@kms_cursor_edge_walk@top-bottom<br />
+igt@kms_cursor_edge_walk@top-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-d-256x256-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-e-256x256-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-64x64-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-64x64-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-64x64-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-64x64-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-128x128-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-128x128-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-128x128-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-128x128-top-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-256x256-bottom-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-256x256-left-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-256x256-right-edge<br />
-igt@kms_cursor_edge_walk@pipe-f-256x256-top-edge</p>

</body>
</html>

--===============5991014552943245942==--
