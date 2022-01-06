Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4914340507664736148=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Jan 2022 17:56:44 -0000
Message-ID: <164149180417.20692.4858502156062732251@emeril.freedesktop.org>
References: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdHMg?=
 =?utf-8?q?and_intel=5Fgpu=5Ftop_with_fdinfo_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4914340507664736148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tests and intel_gpu_top with fdinfo support
URL   : https://patchwork.freedesktop.org/series/98555/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11052 -> IGTPW_6542
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html

Participating hosts (44 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (8): bat-dg1-6 bat-dg1-5 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-rpls-1 fi-bdw-samus bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6542 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +31 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-snb-2520m:       NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-snb-2520m/igt@amdgpu/amd_prime@i915-to-amd.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       NOTRUN -> [FAIL][4] ([i915#4547])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][8] ([fdo#109271]) +57 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][9] ([i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-skl-6600u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - fi-snb-2520m:       [DMESG-FAIL][10] ([i915#4610]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-snb-2520m/igt@i915_selftest@live@gt_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-snb-2520m/igt@i915_selftest@live@gt_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][12] ([i915#4785]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][14] ([i915#4269]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4610]: https://gitlab.freedesktop.org/drm/intel/issues/4610
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6324 -> IGTPW_6542

  CI-20190529: 20190529
  CI_DRM_11052: 5926026a36a658f615b8a5aaa74a90a2a3c5e6c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html
  IGT_6324: 6e009504d5f7cc39866191e4bff813a4512c3e9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@drm_fdinfo@all-busy-check-all
+igt@drm_fdinfo@all-busy-idle-check-all
+igt@drm_fdinfo@basics
+igt@drm_fdinfo@busy
+igt@drm_fdinfo@busy-check-all
+igt@drm_fdinfo@busy-hang
+igt@drm_fdinfo@busy-idle
+igt@drm_fdinfo@busy-idle-check-all
+igt@drm_fdinfo@idle
+igt@drm_fdinfo@isolation
+igt@drm_fdinfo@most-busy-check-all
+igt@drm_fdinfo@most-busy-idle-check-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html

--===============4914340507664736148==
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
<tr><td><b>Series:</b></td><td>Tests and intel_gpu_top with fdinfo support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98555/">https://patchwork.freedesktop.org/series/98555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11052 -&gt; IGTPW_6542</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html</p>
<h2>Participating hosts (44 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (8): bat-dg1-6 bat-dg1-5 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-rpls-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6542 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@i915-to-amd:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-snb-2520m/igt@amdgpu/amd_prime@i915-to-amd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-snb-2520m/igt@i915_selftest@live@gt_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4610">i915#4610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-snb-2520m/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6324 -&gt; IGTPW_6542</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11052: 5926026a36a658f615b8a5aaa74a90a2a3c5e6c5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html<br />
  IGT_6324: 6e009504d5f7cc39866191e4bff813a4512c3e9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@drm_fdinfo@all-busy-check-all<br />
+igt@drm_fdinfo@all-busy-idle-check-all<br />
+igt@drm_fdinfo@basics<br />
+igt@drm_fdinfo@busy<br />
+igt@drm_fdinfo@busy-check-all<br />
+igt@drm_fdinfo@busy-hang<br />
+igt@drm_fdinfo@busy-idle<br />
+igt@drm_fdinfo@busy-idle-check-all<br />
+igt@drm_fdinfo@idle<br />
+igt@drm_fdinfo@isolation<br />
+igt@drm_fdinfo@most-busy-check-all<br />
+igt@drm_fdinfo@most-busy-idle-check-all</p>

</body>
</html>

--===============4914340507664736148==--
