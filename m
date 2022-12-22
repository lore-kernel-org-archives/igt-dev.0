Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4410196938121803273=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chuansheng Liu" <chuansheng.liu@intel.com>
Date: Thu, 22 Dec 2022 11:01:47 -0000
Message-ID: <167170690717.14837.9130445308954037118@emeril.freedesktop.org>
References: <20221222100403.256775-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221222100403.256775-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fmmap=5Fgtt=3A_add_test_mmap=5Fclosed=5Fbo_=28rev4=29?=
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

--===============4410196938121803273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_mmap_gtt: add test mmap_closed_bo (rev4)
URL   : https://patchwork.freedesktop.org/series/101035/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7102 -> IGTPW_8263
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8263 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8263, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html

Participating hosts (44 -> 46)
------------------------------

  Additional (2): bat-atsm-1 fi-ilk-650 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8263:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_8263 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][3] -> [FAIL][4] ([i915#7229])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-ilk-650:         NOTRUN -> [SKIP][5] ([fdo#109271]) +20 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][6] -> [INCOMPLETE][7] ([i915#7156])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][8] -> [DMESG-FAIL][9] ([i915#5334])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][10] -> [INCOMPLETE][11] ([i915#4817])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@mman:
    - fi-rkl-guc:         [TIMEOUT][14] ([i915#6794]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-rkl-guc/igt@i915_selftest@live@mman.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-rkl-guc/igt@i915_selftest@live@mman.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7102 -> IGTPW_8263

  CI-20190529: 20190529
  CI_DRM_12521: 584eb294ab7b1273c5ef505a33f2a5d89c877fcd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8263: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html
  IGT_7102: bacfdc84a9c02556c5441deb21e3a3f18a07347d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_mmap_gtt@mmap-closed-bo

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html

--===============4410196938121803273==
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
<tr><td><b>Series:</b></td><td>tests/gem_mmap_gtt: add test mmap_closed_bo (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101035/">https://patchwork.freedesktop.org/series/101035/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7102 -&gt; IGTPW_8263</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8263 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8263, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html</p>
<h2>Participating hosts (44 -&gt; 46)</h2>
<p>Additional (2): bat-atsm-1 fi-ilk-650 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8263:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8263 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7102/fi-rkl-guc/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/fi-rkl-guc/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7102 -&gt; IGTPW_8263</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12521: 584eb294ab7b1273c5ef505a33f2a5d89c877fcd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8263: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8263/index.html<br />
  IGT_7102: bacfdc84a9c02556c5441deb21e3a3f18a07347d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_mmap_gtt@mmap-closed-bo</p>

</body>
</html>

--===============4410196938121803273==--
