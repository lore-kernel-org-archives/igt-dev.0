Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 09 Mar 2021 10:49:33 -0000
Message-ID: <161528697399.8978.3861956024272197370@emeril.freedesktop.org>
References: <20210309093720.678-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210309093720.678-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_added_test_description_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1066520492=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1066520492==
Content-Type: multipart/alternative;
 boundary="===============2069754272949362529=="

--===============2069754272949362529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: added test description (rev5)
URL   : https://patchwork.freedesktop.org/series/86430/
State : success

== Summary ==

CI Bug Log - changes from IGT_6027 -> IGTPW_5583
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html

Known issues
------------

  Here are the changes found in IGTPW_5583 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [PASS][2] -> [TIMEOUT][3] ([i915#3145])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][4] -> [INCOMPLETE][5] ([i915#2782])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][6] ([i915#1602] / [i915#2029] / [i915#2369])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [DMESG-FAIL][7] ([i915#2927]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (46 -> 41)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6027 -> IGTPW_5583

  CI-20190529: 20190529
  CI_DRM_9842: 1c2e0e8e88b495547c87064738ef1d13f8bef6ff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html
  IGT_6027: b8b3facdfbb99a0b9ef5f541a0ee7d6bca2aafea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html

--===============2069754272949362529==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: added test description (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86430/">https://patchwork.freedesktop.org/series/86430/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6027 -&gt; IGTPW_5583</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5583 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6027/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (46 -&gt; 41)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6027 -&gt; IGTPW_5583</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9842: 1c2e0e8e88b495547c87064738ef1d13f8bef6ff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5583/index.html<br />
  IGT_6027: b8b3facdfbb99a0b9ef5f541a0ee7d6bca2aafea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2069754272949362529==--

--===============1066520492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1066520492==--
