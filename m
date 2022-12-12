Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4342186326166474351=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 12 Dec 2022 23:50:59 -0000
Message-ID: <167088905921.12119.5818723904563741515@emeril.freedesktop.org>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igdm1fYmlu?=
 =?utf-8?q?d=3A_Add_VM=5FBIND_validation_support_=28rev13=29?=
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

--===============4342186326166474351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev13)
URL   : https://patchwork.freedesktop.org/series/105881/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12497 -> IGTPW_8223
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html

Participating hosts (18 -> 19)
------------------------------

  Additional (1): fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8223:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-rkl-11600/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-ehl-2/igt@i915_vm_bind_basic@basic-smem.html
    - fi-icl-u2:          NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-icl-u2/igt@i915_vm_bind_basic@basic-smem.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-adl-ddr5/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-rkl-guc/igt@i915_vm_bind_sanity@basic.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-jsl-1/igt@i915_vm_bind_sanity@basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12497 and IGTPW_8223:

### New IGT tests (3) ###

  * igt@gem_exec3_basic@basic:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_basic@basic-smem:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity@basic:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8223 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_exec3_basic@basic} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][7] ([fdo#109271]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][8] ([fdo#109271]) +47 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-pnv-d510/igt@gem_exec3_basic@basic.html

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][9] ([fdo#109271]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-kbl-7567u/igt@i915_vm_bind_basic@basic-smem.html
    - fi-snb-2600:        NOTRUN -> [SKIP][10] ([fdo#109271]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-snb-2600/igt@i915_vm_bind_basic@basic-smem.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][11] ([fdo#109271]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-kbl-8809g/igt@i915_vm_bind_basic@basic-smem.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][12] ([fdo#109271]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][13] ([fdo#112080])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][14] ([fdo#109271]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bsw-kefka/igt@i915_vm_bind_basic@basic-smem.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][15] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-cfl-guc/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-glk-j4005/igt@i915_vm_bind_sanity@basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-hsw-4770/igt@i915_vm_bind_sanity@basic.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][18] ([fdo#109271]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-skl-guc/igt@i915_vm_bind_sanity@basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][20] ([fdo#109271]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-ivb-3770/igt@i915_vm_bind_sanity@basic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][21] ([i915#6298]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12497/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7091 -> IGTPW_8223

  CI-20190529: 20190529
  CI_DRM_12497: 6636ff92fd32bda3fed63832bc12bf2a9d7c1c33 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8223: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html
  IGT_7091: b8015f920c9f469d3733854263cb878373c1df51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exec3_balancer@parallel-ordering
+igt@gem_exec3_basic@basic
+igt@gem_lmem_swapping@vm_bind
+igt@gem_shrink@vm_bind
+igt@gem_shrink@vm_bind-oom
+igt@gem_shrink@vm_bind-sanitycheck
+igt@gem_shrink@vm_bind-userptr
+igt@gem_shrink@vm_bind-userptr-dirty
+igt@gem_userptr_blits@vma-merge-execbuf3
+igt@i915_vm_bind_basic@2m
+igt@i915_vm_bind_basic@2m_sync_bind
+igt@i915_vm_bind_basic@64k
+igt@i915_vm_bind_basic@basic
+igt@i915_vm_bind_basic@multi_cmds
+igt@i915_vm_bind_basic@multi_ctxts
+igt@i915_vm_bind_basic@share_vm
+igt@i915_vm_bind_basic@skip_copy
+igt@i915_vm_bind_basic@skip_unbind
+igt@i915_vm_bind_capture@basic
+igt@i915_vm_bind_sanity@basic
-igt@kms_hdr@colorspace-switch
-igt@kms_hdr@colorspace-switch-dpms
-igt@kms_hdr@colorspace-switch-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html

--===============4342186326166474351==
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
<tr><td><b>Series:</b></td><td>vm_bind: Add VM_BIND validation support (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105881/">https://patchwork.freedesktop.org/series/105881/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12497 -&gt; IGTPW_8223</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html</p>
<h2>Participating hosts (18 -&gt; 19)</h2>
<p>Additional (1): fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8223:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-rkl-11600/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-ehl-2/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-icl-u2/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-adl-ddr5/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic} (NEW):</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-rkl-guc/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-jsl-1/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12497 and IGTPW_8223:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@gem_exec3_basic@basic:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_basic@basic-smem:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8223 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_exec3_basic@basic} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-pnv-d510/igt@gem_exec3_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +47 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-kbl-7567u/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-snb-2600/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-kbl-8809g/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bsw-kefka/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-cfl-guc/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-glk-j4005/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-hsw-4770/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-skl-guc/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-ivb-3770/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12497/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7091 -&gt; IGTPW_8223</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12497: 6636ff92fd32bda3fed63832bc12bf2a9d7c1c33 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8223: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8223/index.html<br />
  IGT_7091: b8015f920c9f469d3733854263cb878373c1df51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exec3_balancer@parallel-ordering<br />
+igt@gem_exec3_basic@basic<br />
+igt@gem_lmem_swapping@vm_bind<br />
+igt@gem_shrink@vm_bind<br />
+igt@gem_shrink@vm_bind-oom<br />
+igt@gem_shrink@vm_bind-sanitycheck<br />
+igt@gem_shrink@vm_bind-userptr<br />
+igt@gem_shrink@vm_bind-userptr-dirty<br />
+igt@gem_userptr_blits@vma-merge-execbuf3<br />
+igt@i915_vm_bind_basic@2m<br />
+igt@i915_vm_bind_basic@2m_sync_bind<br />
+igt@i915_vm_bind_basic@64k<br />
+igt@i915_vm_bind_basic@basic<br />
+igt@i915_vm_bind_basic@multi_cmds<br />
+igt@i915_vm_bind_basic@multi_ctxts<br />
+igt@i915_vm_bind_basic@share_vm<br />
+igt@i915_vm_bind_basic@skip_copy<br />
+igt@i915_vm_bind_basic@skip_unbind<br />
+igt@i915_vm_bind_capture@basic<br />
+igt@i915_vm_bind_sanity@basic<br />
-igt@kms_hdr@colorspace-switch<br />
-igt@kms_hdr@colorspace-switch-dpms<br />
-igt@kms_hdr@colorspace-switch-suspend</p>

</body>
</html>

--===============4342186326166474351==--
