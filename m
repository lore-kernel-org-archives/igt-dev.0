Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7308753606461492754=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Tue, 29 Nov 2022 09:13:56 -0000
Message-ID: <166971323646.23272.3573957416539739729@emeril.freedesktop.org>
References: <20221129083427.2687430-1-petri.latvala@intel.com>
In-Reply-To: <20221129083427.2687430-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Reset_disk_usage_tracking_on_subtest_change?=
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

--===============7308753606461492754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Reset disk usage tracking on subtest change
URL   : https://patchwork.freedesktop.org/series/111424/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12441 -> IGTPW_8165
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html

Participating hosts (35 -> 29)
------------------------------

  Missing    (6): bat-kbl-2 bat-dg1-6 bat-dg1-5 bat-adlp-4 bat-jsl-3 bat-rpls-2 

Known issues
------------

  Here are the changes found in IGTPW_8165 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][1] ([i915#6179])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][2] -> [FAIL][3] ([i915#6298])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][4] ([i915#7229]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][6] ([i915#2867]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [DMESG-FAIL][8] ([i915#5591]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [DMESG-FAIL][10] ([i915#6997]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-adln-1/igt@i915_selftest@live@slpc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/bat-adln-1/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][12] ([i915#4817]) -> [FAIL][13] ([fdo#103375])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
  [i915#6179]: https://gitlab.freedesktop.org/drm/intel/issues/6179
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7074 -> IGTPW_8165

  CI-20190529: 20190529
  CI_DRM_12441: 72fca6c11d0f5c628a6251f7bc420838c89d6acc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html
  IGT_7074: a7403583f1baee0548d86d1f2c9bb078384f997a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_exec3_balancer@parallel-ordering
-igt@gem_exec3_basic@basic
-igt@gem_lmem_swapping@vm_bind
-igt@gem_shrink@vm_bind
-igt@gem_shrink@vm_bind-oom
-igt@gem_shrink@vm_bind-sanitycheck
-igt@gem_shrink@vm_bind-userptr
-igt@gem_shrink@vm_bind-userptr-dirty
-igt@i915_vm_bind_basic@2m
-igt@i915_vm_bind_basic@2m_sync_bind
-igt@i915_vm_bind_basic@64k
-igt@i915_vm_bind_basic@basic
-igt@i915_vm_bind_basic@multi_cmds
-igt@i915_vm_bind_basic@multi_ctxts
-igt@i915_vm_bind_basic@share_vm
-igt@i915_vm_bind_basic@skip_copy
-igt@i915_vm_bind_basic@skip_unbind
-igt@i915_vm_bind_capture@basic
-igt@i915_vm_bind_sanity@basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html

--===============7308753606461492754==
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
<tr><td><b>Series:</b></td><td>runner: Reset disk usage tracking on subtest change</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111424/">https://patchwork.freedesktop.org/series/111424/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12441 -&gt; IGTPW_8165</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html</p>
<h2>Participating hosts (35 -&gt; 29)</h2>
<p>Missing    (6): bat-kbl-2 bat-dg1-6 bat-dg1-5 bat-adlp-4 bat-jsl-3 bat-rpls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8165 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6179">i915#6179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12441/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7074 -&gt; IGTPW_8165</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12441: 72fca6c11d0f5c628a6251f7bc420838c89d6acc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8165/index.html<br />
  IGT_7074: a7403583f1baee0548d86d1f2c9bb078384f997a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_exec3_balancer@parallel-ordering<br />
-igt@gem_exec3_basic@basic<br />
-igt@gem_lmem_swapping@vm_bind<br />
-igt@gem_shrink@vm_bind<br />
-igt@gem_shrink@vm_bind-oom<br />
-igt@gem_shrink@vm_bind-sanitycheck<br />
-igt@gem_shrink@vm_bind-userptr<br />
-igt@gem_shrink@vm_bind-userptr-dirty<br />
-igt@i915_vm_bind_basic@2m<br />
-igt@i915_vm_bind_basic@2m_sync_bind<br />
-igt@i915_vm_bind_basic@64k<br />
-igt@i915_vm_bind_basic@basic<br />
-igt@i915_vm_bind_basic@multi_cmds<br />
-igt@i915_vm_bind_basic@multi_ctxts<br />
-igt@i915_vm_bind_basic@share_vm<br />
-igt@i915_vm_bind_basic@skip_copy<br />
-igt@i915_vm_bind_basic@skip_unbind<br />
-igt@i915_vm_bind_capture@basic<br />
-igt@i915_vm_bind_sanity@basic</p>

</body>
</html>

--===============7308753606461492754==--
