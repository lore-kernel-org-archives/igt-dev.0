Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7876184670807941980=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 10 Jun 2022 15:44:00 -0000
Message-ID: <165487584061.16746.10956790897703611607@emeril.freedesktop.org>
References: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcursor=5Fedge=5Fwa?=
 =?utf-8?q?lk=3A_Convert_tests_to_dynamic?=
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

--===============7876184670807941980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_cursor_edge_walk: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/104968/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11752 -> IGTPW_7276
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html

Participating hosts (42 -> 42)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_7276 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [PASS][1] -> [DMESG-FAIL][2] ([i915#2373] / [i915#5780])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [PASS][5] -> [DMESG-WARN][6] ([i915#3576])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-adlp-4/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][8] -> [DMESG-WARN][9] ([i915#62]) +16 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#3428] / [i915#4312])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-bsw-n3050/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][11] ([fdo#109271] / [i915#4312])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][12] ([i915#5122]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@dmabuf:
    - {bat-dg2-9}:        [DMESG-WARN][14] ([i915#5763]) -> [PASS][15] +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-dg2-9/igt@i915_selftest@live@dmabuf.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-dg2-9/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][16] ([i915#4528]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - bat-adlp-4:         [DMESG-WARN][18] ([i915#3576]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5780]: https://gitlab.freedesktop.org/drm/intel/issues/5780
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6518 -> IGTPW_7276

  CI-20190529: 20190529
  CI_DRM_11752: 75ccb392dacda10127700cb2a03160f5dd9f475c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7276: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html

--===============7876184670807941980==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_cursor_edge_walk: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104968/">https://patchwork.freedesktop.org/series/104968/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11752 -&gt; IGTPW_7276</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7276 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5780">i915#5780</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-dg2-9/igt@i915_selftest@live@dmabuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-dg2-9/igt@i915_selftest@live@dmabuf.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/bat-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6518 -&gt; IGTPW_7276</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11752: 75ccb392dacda10127700cb2a03160f5dd9f475c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7276: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html<br />
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============7876184670807941980==--
