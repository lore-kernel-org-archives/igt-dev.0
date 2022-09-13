Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5922773006270107087=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Tue, 13 Sep 2022 15:11:47 -0000
Message-ID: <166308190759.21295.8965831275858061891@emeril.freedesktop.org>
References: <20220913135244.15703-1-karthik.b.s@intel.com>
In-Reply-To: <20220913135244.15703-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_Convert_test_to_dynamic?=
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

--===============5922773006270107087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: Convert test to dynamic
URL   : https://patchwork.freedesktop.org/series/108500/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12128 -> IGTPW_7778
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7778 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7778, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (2): bat-dg2-11 fi-icl-u2 
  Missing    (2): fi-ctg-p8600 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7778:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@mman:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-rkl-guc/igt@i915_selftest@live@mman.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-rkl-guc/igt@i915_selftest@live@mman.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - {bat-dg2-11}:       NOTRUN -> [DMESG-WARN][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_module_load@load:
    - {bat-dg2-8}:        [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-dg2-8/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-8/igt@i915_module_load@load.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in IGTPW_7778 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][7] ([i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][8] ([i915#4613]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][9] ([i915#4890])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][10] -> [INCOMPLETE][11] ([i915#4785])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-hsw-g3258:       [PASS][12] -> [INCOMPLETE][13] ([i915#3303] / [i915#4785])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][14] -> [DMESG-FAIL][15] ([i915#4528])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][17] ([fdo#111827]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-icl-u2:          NOTRUN -> [SKIP][18] ([i915#4103])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          NOTRUN -> [WARN][19] ([i915#6008])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][20] ([fdo#109285])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][21] ([i915#3555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][22] ([fdo#109295] / [i915#3301])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][23] ([i915#4312] / [i915#6599])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][24] ([fdo#109271] / [i915#4312] / [i915#6246])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][25] ([i915#3303] / [i915#5370]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][27] ([i915#6367]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][29] ([i915#4957]) -> [DMESG-FAIL][30] ([i915#4494] / [i915#4957])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5370]: https://gitlab.freedesktop.org/drm/intel/issues/5370
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6653 -> IGTPW_7778

  CI-20190529: 20190529
  CI_DRM_12128: 9508a7418e4beed93db88d42235449bc097eaf97 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html
  IGT_6653: 4f927248ebbf11f03f4c1ea2254f011e7575322f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_alpha_blend@alpha-7efc
+igt@kms_plane_alpha_blend@alpha-basic
+igt@kms_plane_alpha_blend@alpha-opaque-fb
+igt@kms_plane_alpha_blend@alpha-transparent-fb
+igt@kms_plane_alpha_blend@constant-alpha-max
+igt@kms_plane_alpha_blend@constant-alpha-mid
+igt@kms_plane_alpha_blend@constant-alpha-min
+igt@kms_plane_alpha_blend@coverage-7efc
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-a-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-a-alpha-basic
-igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-a-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-b-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-b-alpha-basic
-igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-b-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-c-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-c-alpha-basic
-igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-c-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-d-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-d-alpha-basic
-igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-d-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-e-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-e-alpha-basic
-igt@kms_plane_alpha_blend@pipe-e-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-e-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-e-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-e-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-f-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-f-alpha-basic
-igt@kms_plane_alpha_blend@pipe-f-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-f-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-f-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-f-coverage-vs-premult-vs-constant

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html

--===============5922773006270107087==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: Convert test to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108500/">https://patchwork.freedesktop.org/series/108500/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12128 -&gt; IGTPW_7778</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7778 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7778, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (2): bat-dg2-11 fi-icl-u2 <br />
  Missing    (2): fi-ctg-p8600 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7778:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-rkl-guc/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-rkl-guc/igt@i915_selftest@live@mman.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-dg2-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-8/igt@i915_module_load@load.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7778 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5370">i915#5370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12128/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6653 -&gt; IGTPW_7778</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12128: 9508a7418e4beed93db88d42235449bc097eaf97 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7778/index.html<br />
  IGT_6653: 4f927248ebbf11f03f4c1ea2254f011e7575322f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_alpha_blend@alpha-7efc<br />
+igt@kms_plane_alpha_blend@alpha-basic<br />
+igt@kms_plane_alpha_blend@alpha-opaque-fb<br />
+igt@kms_plane_alpha_blend@alpha-transparent-fb<br />
+igt@kms_plane_alpha_blend@constant-alpha-max<br />
+igt@kms_plane_alpha_blend@constant-alpha-mid<br />
+igt@kms_plane_alpha_blend@constant-alpha-min<br />
+igt@kms_plane_alpha_blend@coverage-7efc<br />
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-a-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-b-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-c-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-d-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-e-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-e-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-f-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-f-coverage-vs-premult-vs-constant</p>

</body>
</html>

--===============5922773006270107087==--
