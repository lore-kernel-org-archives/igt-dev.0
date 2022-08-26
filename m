Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8984301018771812455=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 26 Aug 2022 06:25:18 -0000
Message-ID: <166149511855.30039.4108421349435826585@emeril.freedesktop.org>
References: <20220826054435.875-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220826054435.875-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev9=29?=
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

--===============8984301018771812455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup (rev9)
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12029 -> IGTPW_7695
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html

Participating hosts (33 -> 34)
------------------------------

  Additional (1): bat-dg2-11 

Known issues
------------

  Here are the changes found in IGTPW_7695 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] ([i915#4785])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#4312] / [i915#5594] / [i915#6246])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-4770/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-hsw-g3258:       [INCOMPLETE][6] ([i915#4817] / [i915#6598]) -> [INCOMPLETE][7] ([i915#6598])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-hsw-g3258/igt@i915_suspend@basic-s3-without-i915.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-g3258/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
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
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6580]: https://gitlab.freedesktop.org/drm/intel/issues/6580
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6642]: https://gitlab.freedesktop.org/drm/intel/issues/6642


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6636 -> IGTPW_7695

  CI-20190529: 20190529
  CI_DRM_12029: 77ebe479d84890d78217fb7a6b556f7de71866f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7695: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_draw_crc@draw-method
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled
-igt@kms_draw_crc@draw-method-rgb565-render-untiled
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html

--===============8984301018771812455==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12029 -&gt; IGTPW_7695</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html</p>
<h2>Participating hosts (33 -&gt; 34)</h2>
<p>Additional (1): bat-dg2-11 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7695 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12029/fi-hsw-g3258/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/fi-hsw-g3258/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6636 -&gt; IGTPW_7695</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12029: 77ebe479d84890d78217fb7a6b556f7de71866f3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7695: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7695/index.html<br />
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_draw_crc@draw-method<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled</p>

</body>
</html>

--===============8984301018771812455==--
