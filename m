Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 May 2021 11:32:37 -0000
Message-ID: <162073275772.32034.13783384254026399061@emeril.freedesktop.org>
References: <20210511103445.7383-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210511103445.7383-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Restrict_the_test_execution_to_two_pipes_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1166971319=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1166971319==
Content-Type: multipart/alternative;
 boundary="===============3792210434899046975=="

--===============3792210434899046975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Restrict the test execution to two pipes (rev3)
URL   : https://patchwork.freedesktop.org/series/89837/
State : success

== Summary ==

CI Bug Log - changes from IGT_6082 -> IGTPW_5801
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html

Known issues
------------

  Here are the changes found in IGTPW_5801 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-icl-y:           NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-icl-u2:          NOTRUN -> [SKIP][2] ([fdo#109315]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@gem_exec_gttfill@basic:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-bsw-n3050/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bsw-n3050:       NOTRUN -> [INCOMPLETE][4] ([i915#3159])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-guc:         NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@gem_huc_copy@huc-copy.html
    - fi-icl-y:           NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@gem_huc_copy@huc-copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][7] ([i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][8] -> [FAIL][9] ([i915#1372])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6082/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
    - fi-skl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html
    - fi-icl-y:           NOTRUN -> [SKIP][11] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-icl-u2:          NOTRUN -> [SKIP][12] ([fdo#109309]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-y:           NOTRUN -> [SKIP][13] ([fdo#109285])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_force_connector_basic@force-load-detect.html
    - fi-icl-u2:          NOTRUN -> [SKIP][14] ([fdo#109285])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-icl-u2:          NOTRUN -> [SKIP][15] ([fdo#109278])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-icl-y:           NOTRUN -> [SKIP][16] ([fdo#109278])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-skl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#533])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-skl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271]) +26 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_psr@primary_mmap_gtt.html
    - fi-icl-y:           NOTRUN -> [SKIP][19] ([fdo#110189]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_psr@primary_mmap_gtt.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][20] ([i915#3301])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@prime_vgem@basic-userptr.html
    - fi-icl-y:           NOTRUN -> [SKIP][21] ([i915#3301])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@prime_vgem@basic-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3159]: https://gitlab.freedesktop.org/drm/intel/issues/3159
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (40 -> 42)
------------------------------

  Additional (5): fi-rkl-11500t fi-bsw-n3050 fi-skl-guc fi-icl-u2 fi-icl-y 
  Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6082 -> IGTPW_5801

  CI-20190529: 20190529
  CI_DRM_10064: eb2730cd1643ffb717211862c1d66eeb8e5b31cf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5801: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html
  IGT_6082: 355269577baef0c5d8114e8851acaeac657e4fe6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_plane@pixel-format
+igt@kms_plane@pixel-format-source-clamping
+igt@kms_plane@plane-panning-bottom-right
+igt@kms_plane@plane-panning-bottom-right-suspend
+igt@kms_plane@plane-panning-top-left
+igt@kms_plane@plane-position-covered
+igt@kms_plane@plane-position-hole
+igt@kms_plane@plane-position-hole-dpms
-igt@kms_plane@pixel-format-pipe-a-planes
-igt@kms_plane@pixel-format-pipe-a-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-b-planes
-igt@kms_plane@pixel-format-pipe-b-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-c-planes
-igt@kms_plane@pixel-format-pipe-c-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-d-planes
-igt@kms_plane@pixel-format-pipe-d-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-e-planes
-igt@kms_plane@pixel-format-pipe-e-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-f-planes
-igt@kms_plane@pixel-format-pipe-f-planes-source-clamping
-igt@kms_plane@plane-panning-bottom-right-pipe-a-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-b-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-c-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-d-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-e-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-f-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-e-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-f-planes
-igt@kms_plane@plane-panning-top-left-pipe-a-planes
-igt@kms_plane@plane-panning-top-left-pipe-b-planes
-igt@kms_plane@plane-panning-top-left-pipe-c-planes
-igt@kms_plane@plane-panning-top-left-pipe-d-planes
-igt@kms_plane@plane-panning-top-left-pipe-e-planes
-igt@kms_plane@plane-panning-top-left-pipe-f-planes
-igt@kms_plane@plane-position-covered-pipe-a-planes
-igt@kms_plane@plane-position-covered-pipe-b-planes
-igt@kms_plane@plane-position-covered-pipe-c-planes
-igt@kms_plane@plane-position-covered-pipe-d-planes
-igt@kms_plane@plane-position-covered-pipe-e-planes
-igt@kms_plane@plane-position-covered-pipe-f-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-a-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-b-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-c-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-d-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-e-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-f-planes
-igt@kms_plane@plane-position-hole-pipe-a-planes
-igt@kms_plane@plane-position-hole-pipe-b-planes
-igt@kms_plane@plane-position-hole-pipe-c-planes
-igt@kms_plane@plane-position-hole-pipe-d-planes
-igt@kms_plane@plane-position-hole-pipe-e-planes
-igt@kms_plane@plane-position-hole-pipe-f-planes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html

--===============3792210434899046975==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Restrict the test execution to two pipes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89837/">https://patchwork.freedesktop.org/series/89837/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6082 -&gt; IGTPW_5801</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5801 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-bsw-n3050/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3159">i915#3159</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6082/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-skl-guc/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/fi-icl-y/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 42)</h2>
<p>Additional (5): fi-rkl-11500t fi-bsw-n3050 fi-skl-guc fi-icl-u2 fi-icl-y <br />
  Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6082 -&gt; IGTPW_5801</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10064: eb2730cd1643ffb717211862c1d66eeb8e5b31cf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5801: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5801/index.html<br />
  IGT_6082: 355269577baef0c5d8114e8851acaeac657e4fe6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_plane@pixel-format<br />
+igt@kms_plane@pixel-format-source-clamping<br />
+igt@kms_plane@plane-panning-bottom-right<br />
+igt@kms_plane@plane-panning-bottom-right-suspend<br />
+igt@kms_plane@plane-panning-top-left<br />
+igt@kms_plane@plane-position-covered<br />
+igt@kms_plane@plane-position-hole<br />
+igt@kms_plane@plane-position-hole-dpms<br />
-igt@kms_plane@pixel-format-pipe-a-planes<br />
-igt@kms_plane@pixel-format-pipe-a-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-b-planes<br />
-igt@kms_plane@pixel-format-pipe-b-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-c-planes<br />
-igt@kms_plane@pixel-format-pipe-c-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-d-planes<br />
-igt@kms_plane@pixel-format-pipe-d-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-e-planes<br />
-igt@kms_plane@pixel-format-pipe-e-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-f-planes<br />
-igt@kms_plane@pixel-format-pipe-f-planes-source-clamping<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-a-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-b-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-c-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-d-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-e-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-f-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-e-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-f-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-a-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-b-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-c-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-d-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-e-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-f-planes<br />
-igt@kms_plane@plane-position-covered-pipe-a-planes<br />
-igt@kms_plane@plane-position-covered-pipe-b-planes<br />
-igt@kms_plane@plane-position-covered-pipe-c-planes<br />
-igt@kms_plane@plane-position-covered-pipe-d-planes<br />
-igt@kms_plane@plane-position-covered-pipe-e-planes<br />
-igt@kms_plane@plane-position-covered-pipe-f-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-a-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-b-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-c-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-d-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-e-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-f-planes<br />
-igt@kms_plane@plane-position-hole-pipe-a-planes<br />
-igt@kms_plane@plane-position-hole-pipe-b-planes<br />
-igt@kms_plane@plane-position-hole-pipe-c-planes<br />
-igt@kms_plane@plane-position-hole-pipe-d-planes<br />
-igt@kms_plane@plane-position-hole-pipe-e-planes<br />
-igt@kms_plane@plane-position-hole-pipe-f-planes</p>

</body>
</html>

--===============3792210434899046975==--

--===============1166971319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1166971319==--
