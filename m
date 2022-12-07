Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7248579079844668092=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Wed, 07 Dec 2022 13:53:31 -0000
Message-ID: <167042121183.14513.9206360998332387512@emeril.freedesktop.org>
References: <20221207110300.3328-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20221207110300.3328-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/api=5Fintel=5Fallocator=3A_Fixed_start_alignment?=
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

--===============7248579079844668092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/api_intel_allocator: Fixed start alignment
URL   : https://patchwork.freedesktop.org/series/111722/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12477 -> IGTPW_8211
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (3): bat-atsm-1 fi-bwr-2160 fi-pnv-d510 
  Missing    (2): fi-skl-guc bat-dg1-6 

Known issues
------------

  Here are the changes found in IGTPW_8211 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@kms_chamelium@common-hpd-after-suspend.html
    - bat-adlp-4:         NOTRUN -> [SKIP][4] ([fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlp-4:         NOTRUN -> [SKIP][5] ([i915#3546])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-bwr-2160:        NOTRUN -> [SKIP][6] ([fdo#109271]) +50 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bwr-2160/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +44 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-bwr-2160:        NOTRUN -> [FAIL][8] ([i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bwr-2160/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adlp-6}:       [DMESG-WARN][9] ([i915#7077]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       [FAIL][11] ([i915#7355]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [INCOMPLETE][13] ([i915#2940] / [i915#6734]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [INCOMPLETE][15] ([i915#7308] / [i915#7348]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][17] ([i915#6298]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size:
    - {bat-adlp-9}:       [FAIL][19] -> [PASS][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6734]: https://gitlab.freedesktop.org/drm/intel/issues/6734
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7328]: https://gitlab.freedesktop.org/drm/intel/issues/7328
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7355]: https://gitlab.freedesktop.org/drm/intel/issues/7355
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7085 -> IGTPW_8211

  CI-20190529: 20190529
  CI_DRM_12477: a9fe1490cceb47334a43a1b037e150300e6058f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html
  IGT_7085: 11af20de3877b23a244b816453bfc41d83591a15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html

--===============7248579079844668092==
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
<tr><td><b>Series:</b></td><td>tests/i915/api_intel_allocator: Fixed start alignment</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111722/">https://patchwork.freedesktop.org/series/111722/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12477 -&gt; IGTPW_8211</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (3): bat-atsm-1 fi-bwr-2160 fi-pnv-d510 <br />
  Missing    (2): fi-skl-guc bat-dg1-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8211 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bwr-2160/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bwr-2160/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7355">i915#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6734">i915#6734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>{bat-adlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12477/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7085 -&gt; IGTPW_8211</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12477: a9fe1490cceb47334a43a1b037e150300e6058f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8211/index.html<br />
  IGT_7085: 11af20de3877b23a244b816453bfc41d83591a15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7248579079844668092==--
