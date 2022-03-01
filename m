Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1588742126851076428=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 01 Mar 2022 11:57:23 -0000
Message-ID: <164613584328.8602.13045530637677825739@emeril.freedesktop.org>
References: <20220301110359.663637-1-matthew.auld@intel.com>
In-Reply-To: <20220301110359.663637-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fparams=3A_check_available_memory_earlier?=
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

--===============1588742126851076428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_params: check available memory earlier
URL   : https://patchwork.freedesktop.org/series/100879/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11302 -> IGTPW_6722
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html

Participating hosts (48 -> 44)
------------------------------

  Missing    (4): fi-bsw-cyan shard-rkl shard-tglu fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6722 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       NOTRUN -> [FAIL][1] ([i915#4547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [PASS][2] -> [INCOMPLETE][3] ([i915#146])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [PASS][4] -> [DMESG-WARN][5] ([i915#3576])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-n3050:       [PASS][6] -> [DMESG-FAIL][7] ([i915#2927] / [i915#3428])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [PASS][8] -> [DMESG-WARN][9] ([i915#1982] / [i915#3576])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@kms_busy@basic@flip.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - bat-adlp-4:         [DMESG-WARN][11] ([i915#3576]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6361 -> IGTPW_6722

  CI-20190529: 20190529
  CI_DRM_11302: 680d0d26eca3df6dc7c9cac1c7cbe7404a255c7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6722: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html
  IGT_6361: 2372a4beb6a33c5f0799a4a8ccbb93794f52dbca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html

--===============1588742126851076428==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_params: check available memory earlier</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100879/">https://patchwork.freedesktop.org/series/100879/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11302 -&gt; IGTPW_6722</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html</p>
<h2>Participating hosts (48 -&gt; 44)</h2>
<p>Missing    (4): fi-bsw-cyan shard-rkl shard-tglu fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6722 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@a-edp1:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6361 -&gt; IGTPW_6722</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11302: 680d0d26eca3df6dc7c9cac1c7cbe7404a255c7e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6722: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html<br />
  IGT_6361: 2372a4beb6a33c5f0799a4a8ccbb93794f52dbca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1588742126851076428==--
