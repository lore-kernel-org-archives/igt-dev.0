Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0009993952668722249=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Fri, 15 Sep 2023 04:58:44 -0000
Message-ID: <169475392408.32041.14409242905058745080@emeril.freedesktop.org>
References: <20230915032914.1164763-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230915032914.1164763-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Add_a_helper_to_read_mmio_registers_via_ioctl_=28rev3=29?=
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

--===============0009993952668722249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915: Add a helper to read mmio registers via ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/122929/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13635 -> IGTPW_9794
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9794 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       [PASS][3] -> [FAIL][4] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][7] ([i915#1886] / [i915#7913])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7488 -> IGTPW_9794

  CI-20190529: 20190529
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9794: 9794
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err
+igt@xe_exec_threads@threads-shared-vm-rebind-err
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err
+igt@xe_vm@vm-async-ops-err
+igt@xe_vm@vm-async-ops-err-destroy
-igt@xe_exec_basic@zero-execs
-igt@xe_exec_threads@threads-hang-rebind-err
-igt@xe_exec_threads@threads-hang-userptr-rebind-err
-igt@xe_exec_threads@threads-rebind-err
-igt@xe_exec_threads@threads-userptr-rebind-err
-igt@xe_vm@zero-binds

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/index.html

--===============0009993952668722249==
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
<tr><td><b>Series:</b></td><td>lib/i915: Add a helper to read mmio registers via ioctl (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122929/">https://patchwork.freedesktop.org/series/122929/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13635 -&gt; IGTPW_9794</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9794 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9794/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7488 -&gt; IGTPW_9794</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9794: 9794<br />
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err<br />
+igt@xe_vm@vm-async-ops-err<br />
+igt@xe_vm@vm-async-ops-err-destroy<br />
-igt@xe_exec_basic@zero-execs<br />
-igt@xe_exec_threads@threads-hang-rebind-err<br />
-igt@xe_exec_threads@threads-hang-userptr-rebind-err<br />
-igt@xe_exec_threads@threads-rebind-err<br />
-igt@xe_exec_threads@threads-userptr-rebind-err<br />
-igt@xe_vm@zero-binds</p>

</body>
</html>

--===============0009993952668722249==--
