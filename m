Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1096611359518870198=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Mon, 03 Jul 2023 06:44:15 -0000
Message-ID: <168836665552.4275.15708353142427321373@emeril.freedesktop.org>
References: <20230607115333.55940-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230607115333.55940-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4ZWQg?=
 =?utf-8?q?mode_selection_for_MST_modeset_=28rev10=29?=
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

--===============1096611359518870198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixed mode selection for MST modeset (rev10)
URL   : https://patchwork.freedesktop.org/series/117503/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13341 -> IGTPW_9321
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9321 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9321, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-dg1-8 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9321:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@contexts:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-atsm-1/igt@gem_exec_parallel@engines@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-atsm-1/igt@gem_exec_parallel@engines@contexts.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-massive-size}:
    - {bat-dg1-8}:        NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-dg1-8/igt@xe_create@create-massive-size.html

  * igt@xe_guc_pc@rc6_on_idle:
    - {bat-dg1-8}:        NOTRUN -> [INCOMPLETE][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_9321 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        NOTRUN -> [ABORT][5] ([i915#8011])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@dmabuf@all-tests@dma_fence:
    - fi-kbl-guc:         [PASS][6] -> [DMESG-FAIL][7] ([i915#8189])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-kbl-guc:         [PASS][8] -> [ABORT][9] ([i915#8218] / [i915#8423])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][10] -> [DMESG-FAIL][11] ([i915#8497])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][12] ([i915#6367])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][13] ([i915#6367])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         NOTRUN -> [ABORT][14] ([i915#6687] / [i915#8668])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][15] ([i915#6687] / [i915#7978] / [i915#8668])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][16] ([i915#5334]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [DMESG-FAIL][18] ([i915#7059]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][20] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-rpls-1/igt@i915_selftest@live@reset.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_selftest@live@reset.html
    - bat-rpls-2:         [ABORT][22] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#7981] / [i915#8347]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-rpls-2/igt@i915_selftest@live@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [ABORT][24] ([i915#4423]) -> [DMESG-WARN][25] ([i915#4423])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-adlp-11/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-adlp-11/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8218]: https://gitlab.freedesktop.org/drm/intel/issues/8218
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8423]: https://gitlab.freedesktop.org/drm/intel/issues/8423
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8513]: https://gitlab.freedesktop.org/drm/intel/issues/8513
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8676]: https://gitlab.freedesktop.org/drm/intel/issues/8676
  [i915#8698]: https://gitlab.freedesktop.org/drm/intel/issues/8698
  [i915#8700]: https://gitlab.freedesktop.org/drm/intel/issues/8700


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7365 -> IGTPW_9321

  CI-20190529: 20190529
  CI_DRM_13341: e72529f161cf81710f4a436e7abe0936630c5ea5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9321: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html
  IGT_7365: c5980a82c798f9003dc7b4df07aace01b8afde77 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html

--===============1096611359518870198==
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
<tr><td><b>Series:</b></td><td>Fixed mode selection for MST modeset (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117503/">https://patchwork.freedesktop.org/series/117503/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13341 -&gt; IGTPW_9321</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9321 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9321, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-dg1-8 <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9321:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_parallel@engines@contexts:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-atsm-1/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-atsm-1/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-massive-size}:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-dg1-8/igt@xe_create@create-massive-size.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@rc6_on_idle:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9321 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8218">i915#8218</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8423">i915#8423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13341/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7365 -&gt; IGTPW_9321</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13341: e72529f161cf81710f4a436e7abe0936630c5ea5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9321: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9321/index.html<br />
  IGT_7365: c5980a82c798f9003dc7b4df07aace01b8afde77 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1096611359518870198==--
