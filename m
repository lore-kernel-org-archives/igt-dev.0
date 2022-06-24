Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1372186290876768655=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Fri, 24 Jun 2022 11:50:47 -0000
Message-ID: <165607144781.16786.14878905810243488376@emeril.freedesktop.org>
References: <20220624105841.22411-1-jeevan.b@intel.com>
In-Reply-To: <20220624105841.22411-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_test_only_for_invalid_combination_=28rev6=29?=
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

--===============1372186290876768655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Skip test only for invalid combination (rev6)
URL   : https://patchwork.freedesktop.org/series/105386/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11803 -> IGTPW_7381
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html

Participating hosts (36 -> 37)
------------------------------

  Additional (2): fi-bdw-5557u bat-adlp-6 
  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7381:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-adln-1}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-adln-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-adln-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_7381 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][3] -> [INCOMPLETE][4] ([i915#5847])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][5] ([i915#3921])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          NOTRUN -> [DMESG-FAIL][6] ([i915#4494] / [i915#4957])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-6:          NOTRUN -> [INCOMPLETE][7] ([i915#6011])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_psr@primary_page_flip:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][11] ([fdo#109271]) +13 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][12] ([fdo#109271] / [i915#3428] / [i915#4312])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bsw-nick/igt@runner@aborted.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][13] ([i915#2029] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-rkl-11600/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [INCOMPLETE][14] ([i915#4418]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          [DMESG-WARN][16] ([i915#402]) -> [PASS][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - {bat-adln-1}:       [DMESG-WARN][18] ([i915#3576]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-adln-1/igt@kms_busy@basic@modeset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-adln-1/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5847]: https://gitlab.freedesktop.org/drm/intel/issues/5847
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6541 -> IGTPW_7381

  CI-20190529: 20190529
  CI_DRM_11803: 23f2707225ca8a6c43526d1d7c46a7dd1a5f02cf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html
  IGT_6541: 02153f109bd422d93cfce7f5aa9d7b0e22fab13c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html

--===============1372186290876768655==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Skip test only for invalid combination (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105386/">https://patchwork.freedesktop.org/series/105386/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11803 -&gt; IGTPW_7381</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html</p>
<h2>Participating hosts (36 -&gt; 37)</h2>
<p>Additional (2): fi-bdw-5557u bat-adlp-6 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7381:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7381 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5847">i915#5847</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bdw-5557u/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-rkl-11600/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/fi-tgl-u2/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11803/bat-adln-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/bat-adln-1/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6541 -&gt; IGTPW_7381</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11803: 23f2707225ca8a6c43526d1d7c46a7dd1a5f02cf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7381/index.html<br />
  IGT_6541: 02153f109bd422d93cfce7f5aa9d7b0e22fab13c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1372186290876768655==--
