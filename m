Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1428377211766645430=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Drobnik" <karolina.drobnik@intel.com>
Date: Thu, 07 Jul 2022 13:08:42 -0000
Message-ID: <165719932240.2213.11826234284639828965@emeril.freedesktop.org>
References: <20220707094906.4010020-1-karolina.drobnik@intel.com>
In-Reply-To: <20220707094906.4010020-1-karolina.drobnik@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_Check_impact_of_fence_ordering_on_waitboostin?=
 =?utf-8?q?g_=28rev3=29?=
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

--===============1428377211766645430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_pm_rps: Check impact of fence ordering on waitboosting (rev3)
URL   : https://patchwork.freedesktop.org/series/105922/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11857 -> IGTPW_7478
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7478 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7478, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html

Participating hosts (45 -> 42)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (4): fi-ctg-p8600 bat-rpls-1 fi-bdw-samus bat-jsl-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7478:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-j4005:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-glk-j4005/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_7478 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-skl-6700k2:      [PASS][3] -> [INCOMPLETE][4] ([i915#4817])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [PASS][5] -> [DMESG-WARN][6] ([i915#3576])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-glk-j4005:       NOTRUN -> [FAIL][9] ([i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@coherency:
    - {bat-dg2-9}:        [DMESG-WARN][10] ([i915#5763]) -> [PASS][11] +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg2-9/igt@i915_selftest@live@coherency.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg2-9/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][12] ([i915#3303] / [i915#5370]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [INCOMPLETE][14] ([i915#3921]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [DMESG-FAIL][16] ([i915#4494] / [i915#4957]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - {bat-adln-1}:       [DMESG-WARN][18] ([i915#3576]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adln-1/igt@kms_busy@basic@modeset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adln-1/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][20] ([i915#3576]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
    - bat-adlp-4:         [DMESG-WARN][22] ([i915#3576]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5370]: https://gitlab.freedesktop.org/drm/intel/issues/5370
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6297]: https://gitlab.freedesktop.org/drm/intel/issues/6297


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6561 -> IGTPW_7478

  CI-20190529: 20190529
  CI_DRM_11857: de2555fd1402a79eb3c89db3f62944fec2026c8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7478: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html
  IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_rps@engine-order
+igt@i915_pm_rps@fence-order

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html

--===============1428377211766645430==
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
<tr><td><b>Series:</b></td><td>i915/i915_pm_rps: Check impact of fence ordering on waitboosting (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105922/">https://patchwork.freedesktop.org/series/105922/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11857 -&gt; IGTPW_7478</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7478 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7478, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (4): fi-ctg-p8600 bat-rpls-1 fi-bdw-samus bat-jsl-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7478:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-glk-j4005/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7478 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg2-9/igt@i915_selftest@live@coherency.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg2-9/igt@i915_selftest@live@coherency.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5370">i915#5370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adln-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adln-1/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6561 -&gt; IGTPW_7478</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11857: de2555fd1402a79eb3c89db3f62944fec2026c8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7478: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html<br />
  IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_rps@engine-order<br />
+igt@i915_pm_rps@fence-order</p>

</body>
</html>

--===============1428377211766645430==--
