Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4482976069651003010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Extend_xe=5Fquery_to_multi-GPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 15 Dec 2023 20:55:44 -0000
Message-ID: <170267374484.27834.7722996914017426727@emeril.freedesktop.org>
References: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
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

--===============4482976069651003010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend xe_query to multi-GPU
URL   : https://patchwork.freedesktop.org/series/127887/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7643_BAT -> XEIGTPW_10430_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10430_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10430_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10430_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dsc@dsc-basic@pipe-a-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_dsc@dsc-basic@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][2] ([Intel XE#423]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10430_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][4] -> [FAIL][5] ([Intel XE#480]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][6] -> [FAIL][7] ([Intel XE#906]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][8] -> [FAIL][9] ([Intel XE#999])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-adlp-7:         [FAIL][10] ([i915#2346]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [FAIL][12] ([Intel XE#480]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][14] ([Intel XE#423]) -> [SKIP][15] ([Intel XE#455])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][16] ([Intel XE#480]) -> [FAIL][17] ([Intel XE#906])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7643 -> IGTPW_10430
  * Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -> xe-581-bfe165d757b20c5983930ecd2826d91d1758a28a

  IGTPW_10430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b
  xe-581-bfe165d757b20c5983930ecd2826d91d1758a28a: bfe165d757b20c5983930ecd2826d91d1758a28a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/index.html

--===============4482976069651003010==
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
<tr><td><b>Series:</b></td><td>Extend xe_query to multi-GPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127887/">https://patchwork.freedesktop.org/series/127887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7643_BAT -&gt; XEIGTPW_10430_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10430_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10430_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10430_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_dsc@dsc-basic@pipe-a-edp-1:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_dsc@dsc-basic@pipe-a-edp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10430_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7643/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10430/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7643 -&gt; IGTPW_10430</li>
<li>Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -&gt; xe-581-bfe165d757b20c5983930ecd2826d91d1758a28a</li>
</ul>
<p>IGTPW_10430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html<br />
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b<br />
  xe-581-bfe165d757b20c5983930ecd2826d91d1758a28a: bfe165d757b20c5983930ecd2826d91d1758a28a</p>

</body>
</html>

--===============4482976069651003010==--
