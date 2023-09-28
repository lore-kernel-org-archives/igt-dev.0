Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5400721583047112622=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 28 Sep 2023 16:49:39 -0000
Message-ID: <169591977971.21265.10541122765259120453@emeril.freedesktop.org>
References: <20230928155604.546419-1-swati2.sharma@intel.com>
In-Reply-To: <20230928155604.546419-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Funiversal=5Fplane=3A_Dynamic_conversion_=28rev2=29?=
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

--===============5400721583047112622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_universal_plane: Dynamic conversion (rev2)
URL   : https://patchwork.freedesktop.org/series/123851/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13689 -> IGTPW_9891
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/index.html

Participating hosts (34 -> 38)
------------------------------

  Additional (6): fi-kbl-soraka fi-cfl-8700k fi-apl-guc fi-kbl-guc fi-ivb-3770 fi-skl-6600u 
  Missing    (2): bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9891 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@fbdev@info.html

  * igt@gem_busy@busy@all-engines:
    - bat-mtlp-8:         [PASS][2] -> [ABORT][3] ([i915#9414])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-mtlp-8/igt@gem_busy@busy@all-engines.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][12] ([i915#1886] / [i915#7913])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][13] -> [TIMEOUT][14] ([i915#6794] / [i915#7392])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rpls-1/igt@i915_selftest@live@mman.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-1:         [PASS][15] -> [WARN][16] ([i915#8747])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1845]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-skl-6600u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][20] ([fdo#109271]) +10 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][21] ([fdo#109271]) +16 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][22] ([IGT#3])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][23] -> [ABORT][24] ([i915#8668])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][25] ([i915#8841]) +6 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ivb-3770:        NOTRUN -> [SKIP][26] ([fdo#109271]) +21 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271]) +25 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][28] ([i915#7952]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7506 -> IGTPW_9891

  CI-20190529: 20190529
  CI_DRM_13689: 5933eb0a0717a28e668d33e01a707311d31cebbb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9891: 9891
  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@cursor-fb-leak
+igt@kms_universal_plane@disable-primary-vs-flip
+igt@kms_universal_plane@universal-plane-functional
+igt@kms_universal_plane@universal-plane-pageflip-windowed
+igt@kms_universal_plane@universal-plane-sanity
+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err
+igt@xe_exec_threads@threads-shared-vm-rebind-err
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err
+igt@xe_mmio@mmio-invalid
+igt@xe_mmio@mmio-timestamp
+igt@xe_query@query-gts
+igt@xe_vm@vm-async-ops-err
+igt@xe_vm@vm-async-ops-err-destroy
-igt@kms_universal_plane@cursor-fb-leak-pipe-a
-igt@kms_universal_plane@cursor-fb-leak-pipe-b
-igt@kms_universal_plane@cursor-fb-leak-pipe-c
-igt@kms_universal_plane@cursor-fb-leak-pipe-d
-igt@kms_universal_plane@cursor-fb-leak-pipe-e
-igt@kms_universal_plane@cursor-fb-leak-pipe-f
-igt@kms_universal_plane@cursor-fb-leak-pipe-g
-igt@kms_universal_plane@cursor-fb-leak-pipe-h
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-g
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-h
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h
-igt@kms_universal_plane@universal-plane-pipe-a-functional
-igt@kms_universal_plane@universal-plane-pipe-a-sanity
-igt@kms_universal_plane@universal-plane-pipe-b-functional
-igt@kms_universal_plane@universal-plane-pipe-b-sanity
-igt@kms_universal_plane@universal-plane-pipe-c-functional
-igt@kms_universal_plane@universal-plane-pipe-c-sanity
-igt@kms_universal_plane@universal-plane-pipe-d-functional
-igt@kms_universal_plane@universal-plane-pipe-d-sanity
-igt@kms_universal_plane@universal-plane-pipe-e-functional
-igt@kms_universal_plane@universal-plane-pipe-e-sanity
-igt@kms_universal_plane@universal-plane-pipe-f-functional
-igt@kms_universal_plane@universal-plane-pipe-f-sanity
-igt@kms_universal_plane@universal-plane-pipe-g-functional
-igt@kms_universal_plane@universal-plane-pipe-g-sanity
-igt@kms_universal_plane@universal-plane-pipe-h-functional
-igt@kms_universal_plane@universal-plane-pipe-h-sanity
-igt@xe_exec_balancer@many-cm-parallel-basic
-igt@xe_exec_balancer@many-cm-parallel-rebind
-igt@xe_exec_balancer@many-cm-parallel-userptr
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-basic
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@once-cm-parallel-basic
-igt@xe_exec_balancer@once-cm-parallel-rebind
-igt@xe_exec_balancer@once-cm-parallel-userptr
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@twice-cm-parallel-basic
-igt@xe_exec_balancer@twice-cm-parallel-rebind
-igt@xe_exec_balancer@twice-cm-parallel-userptr
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind
-igt@xe_exec_threads@threads-hang-rebind-err
-igt@xe_exec_threads@threads-hang-userptr-rebind-err
-igt@xe_exec_threads@threads-rebind-err
-igt@xe_exec_threads@threads-userptr-rebind-err
-igt@xe_query@query-cs-cycles
-igt@xe_query@query-gt-list
-igt@xe_query@query-invalid-cs-cycles

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/index.html

--===============5400721583047112622==
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
<tr><td><b>Series:</b></td><td>tests/kms_universal_plane: Dynamic conversion (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123851/">https://patchwork.freedesktop.org/series/123851/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13689 -&gt; IGTPW_9891</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/index.html</p>
<h2>Participating hosts (34 -&gt; 38)</h2>
<p>Additional (6): fi-kbl-soraka fi-cfl-8700k fi-apl-guc fi-kbl-guc fi-ivb-3770 fi-skl-6600u <br />
  Missing    (2): bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9891 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-skl-6600u/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-cfl-8700k/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/fi-kbl-guc/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13689/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9891/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7506 -&gt; IGTPW_9891</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13689: 5933eb0a0717a28e668d33e01a707311d31cebbb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9891: 9891<br />
  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@cursor-fb-leak<br />
+igt@kms_universal_plane@disable-primary-vs-flip<br />
+igt@kms_universal_plane@universal-plane-functional<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed<br />
+igt@kms_universal_plane@universal-plane-sanity<br />
+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err<br />
+igt@xe_mmio@mmio-invalid<br />
+igt@xe_mmio@mmio-timestamp<br />
+igt@xe_query@query-gts<br />
+igt@xe_vm@vm-async-ops-err<br />
+igt@xe_vm@vm-async-ops-err-destroy<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-a<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-b<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-c<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-d<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-e<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-f<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-g<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-h<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-g<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-h<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h<br />
-igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-a-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-b-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-c-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-d-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-e-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-f-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-g-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-g-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-h-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-h-sanity<br />
-igt@xe_exec_balancer@many-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-basic<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-basic<br />
-igt@xe_exec_balancer@once-cm-parallel-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-basic<br />
-igt@xe_exec_balancer@twice-cm-parallel-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind<br />
-igt@xe_exec_threads@threads-hang-rebind-err<br />
-igt@xe_exec_threads@threads-hang-userptr-rebind-err<br />
-igt@xe_exec_threads@threads-rebind-err<br />
-igt@xe_exec_threads@threads-userptr-rebind-err<br />
-igt@xe_query@query-cs-cycles<br />
-igt@xe_query@query-gt-list<br />
-igt@xe_query@query-invalid-cs-cycles</p>

</body>
</html>

--===============5400721583047112622==--
