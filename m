Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0174285095045408191=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Wed, 16 Nov 2022 23:05:45 -0000
Message-ID: <166863994546.29189.17278160048915946010@emeril.freedesktop.org>
References: <20221115115002.2493594-1-petri.latvala@intel.com>
In-Reply-To: <20221115115002.2493594-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Use_=27abort=27_as_result_if_a_test_caused_an_abort_=28rev2?=
 =?utf-8?q?=29?=
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

--===============0174285095045408191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Use 'abort' as result if a test caused an abort (rev2)
URL   : https://patchwork.freedesktop.org/series/110914/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12389 -> IGTPW_8118
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html

Participating hosts (40 -> 41)
------------------------------

  Additional (3): bat-kbl-2 bat-atsm-1 bat-jsl-3 
  Missing    (2): fi-bxt-dsi bat-dg1-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8118:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg2-11}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@migrate:
    - {bat-atsm-1}:       NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-atsm-1/igt@i915_selftest@live@migrate.html

  
Known issues
------------

  Here are the changes found in IGTPW_8118 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         NOTRUN -> [DMESG-FAIL][5] ([i915#5334])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [PASS][6] -> [ABORT][7] ([i915#7352])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-apl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [INCOMPLETE][10] ([i915#7056]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [DMESG-WARN][12] ([i915#1982]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_module_load@reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_engines:
    - {bat-dg1-7}:        [INCOMPLETE][14] ([i915#4418]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/bat-dg1-7/igt@i915_selftest@live@gt_engines.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-dg1-7/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][16] ([i915#5334]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@fbdev@eof:
    - fi-kbl-8809g:       [DMESG-WARN][18] ([i915#7552]) -> [ABORT][19] ([i915#7552])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-8809g/igt@fbdev@eof.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-8809g/igt@fbdev@eof.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7056]: https://gitlab.freedesktop.org/drm/intel/issues/7056
  [i915#7352]: https://gitlab.freedesktop.org/drm/intel/issues/7352
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7358]: https://gitlab.freedesktop.org/drm/intel/issues/7358
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7552]: https://gitlab.freedesktop.org/drm/intel/issues/7552


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7061 -> IGTPW_8118

  CI-20190529: 20190529
  CI_DRM_12389: 3eb60fea7cd44530f85bd9362508647aceea1dea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8118: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html
  IGT_7061: d16e679b99d43643c3a0bcc34ec4c4f001dbbbb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html

--===============0174285095045408191==
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
<tr><td><b>Series:</b></td><td>runner: Use &#39;abort&#39; as result if a test caused an abort (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110914/">https://patchwork.freedesktop.org/series/110914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12389 -&gt; IGTPW_8118</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html</p>
<h2>Participating hosts (40 -&gt; 41)</h2>
<p>Additional (3): bat-kbl-2 bat-atsm-1 bat-jsl-3 <br />
  Missing    (2): fi-bxt-dsi bat-dg1-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8118:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-atsm-1/igt@i915_selftest@live@migrate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8118 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7352">i915#7352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7056">i915#7056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/bat-dg1-7/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/bat-dg1-7/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@fbdev@eof:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12389/fi-kbl-8809g/igt@fbdev@eof.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7552">i915#7552</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/fi-kbl-8809g/igt@fbdev@eof.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7552">i915#7552</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7061 -&gt; IGTPW_8118</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12389: 3eb60fea7cd44530f85bd9362508647aceea1dea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8118: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8118/index.html<br />
  IGT_7061: d16e679b99d43643c3a0bcc34ec4c4f001dbbbb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0174285095045408191==--
