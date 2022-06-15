Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1230208727001089489=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luca@coelho.fi>
Date: Wed, 15 Jun 2022 13:22:04 -0000
Message-ID: <165529932449.14603.5159046082040529202@emeril.freedesktop.org>
References: <20220615122533.658564-1-luca@coelho.fi>
In-Reply-To: <20220615122533.658564-1-luca@coelho.fi>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsysfs=5Fedid=5Ftiming=3A_rework_thresholds_=28rev2=29?=
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

--===============1230208727001089489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_sysfs_edid_timing: rework thresholds (rev2)
URL   : https://patchwork.freedesktop.org/series/104802/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11759 -> IGTPW_7319
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7319 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7319, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html

Participating hosts (44 -> 43)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (2): fi-bdw-samus fi-tgl-u2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7319:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@basic:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-kbl-soraka/igt@gem_mmap_gtt@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-kbl-soraka/igt@gem_mmap_gtt@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_7319 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [PASS][3] -> [DMESG-FAIL][4] ([i915#4494] / [i915#4957])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - bat-adlp-4:         [PASS][5] -> [DMESG-WARN][6] ([i915#3576])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][7] ([i915#5122]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [DMESG-WARN][9] ([i915#3576]) -> [PASS][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-guc:         [DMESG-FAIL][11] ([i915#5334]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@perf:
    - {bat-dg2-9}:        [DMESG-WARN][13] ([i915#5763]) -> [PASS][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg2-9/igt@i915_selftest@live@perf.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-dg2-9/igt@i915_selftest@live@perf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6529 -> IGTPW_7319

  CI-20190529: 20190529
  CI_DRM_11759: fa66b647ce886c01bbe1e9f3017a141e90d87539 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html
  IGT_6529: b96bf5a0307fc0bdbf6c8e86872817306e102883 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html

--===============1230208727001089489==
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
<tr><td><b>Series:</b></td><td>tests/kms_sysfs_edid_timing: rework thresholds (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104802/">https://patchwork.freedesktop.org/series/104802/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11759 -&gt; IGTPW_7319</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7319 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7319, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (2): fi-bdw-samus fi-tgl-u2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7319:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_mmap_gtt@basic:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-kbl-soraka/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-kbl-soraka/igt@gem_mmap_gtt@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7319 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg2-9/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/bat-dg2-9/igt@i915_selftest@live@perf.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6529 -&gt; IGTPW_7319</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11759: fa66b647ce886c01bbe1e9f3017a141e90d87539 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7319/index.html<br />
  IGT_6529: b96bf5a0307fc0bdbf6c8e86872817306e102883 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1230208727001089489==--
