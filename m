Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1587542674888325978=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Tue, 27 Jun 2023 10:59:29 -0000
Message-ID: <168786356958.2457.7217549980728819762@emeril.freedesktop.org>
References: <20230627082438.15559-1-lukasz.laguna@intel.com>
In-Reply-To: <20230627082438.15559-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fsysfs=3A_add_asserting_helpers_for_read/write_operations_?=
 =?utf-8?b?KHJldjUp?=
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

--===============1587542674888325978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_sysfs: add asserting helpers for read/write operations (rev5)
URL   : https://patchwork.freedesktop.org/series/119507/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13327 -> IGTPW_9266
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (1): bat-dg1-8 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9266:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-massive-size}:
    - {bat-dg1-8}:        NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-dg1-8/igt@xe_create@create-massive-size.html

  * igt@xe_guc_pc@rc6_on_idle:
    - {bat-dg1-8}:        NOTRUN -> [INCOMPLETE][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_9266 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-FAIL][4] ([i915#8141])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-cfl-8109u:       [PASS][5] -> [ABORT][6] ([i915#8058] / [i915#8141] / [i915#8144])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][7] -> [ABORT][8] ([i915#4423])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-adlp-11/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [PASS][9] -> [DMESG-FAIL][10] ([i915#7059])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [PASS][11] -> [ABORT][12] ([i915#7911] / [i915#7920])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rpls-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rpls-1/igt@i915_selftest@live@requests.html
    - bat-rpls-2:         [PASS][13] -> [ABORT][14] ([i915#7913])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rpls-2/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rpls-2/igt@i915_selftest@live@requests.html
    - bat-mtlp-6:         [PASS][15] -> [ABORT][16] ([i915#7982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][17] -> [DMESG-FAIL][18] ([i915#6763])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][19] -> [ABORT][20] ([i915#8442])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][21] ([i915#5334] / [i915#7872]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8058]: https://gitlab.freedesktop.org/drm/intel/issues/8058
  [i915#8141]: https://gitlab.freedesktop.org/drm/intel/issues/8141
  [i915#8144]: https://gitlab.freedesktop.org/drm/intel/issues/8144
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8513]: https://gitlab.freedesktop.org/drm/intel/issues/8513
  [i915#8676]: https://gitlab.freedesktop.org/drm/intel/issues/8676
  [i915#8678]: https://gitlab.freedesktop.org/drm/intel/issues/8678
  [i915#8679]: https://gitlab.freedesktop.org/drm/intel/issues/8679
  [i915#8698]: https://gitlab.freedesktop.org/drm/intel/issues/8698
  [i915#8699]: https://gitlab.freedesktop.org/drm/intel/issues/8699
  [i915#8700]: https://gitlab.freedesktop.org/drm/intel/issues/8700


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7351 -> IGTPW_9266

  CI-20190529: 20190529
  CI_DRM_13327: 954bc57e332bc11eb26322e2adb4d84431b25d45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html
  IGT_7351: d8dc96b95c60e4737fdfa1664ce9b1dcebfdef60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_pm_residency@idle-residency

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html

--===============1587542674888325978==
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
<tr><td><b>Series:</b></td><td>lib/igt_sysfs: add asserting helpers for read/write operations (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119507/">https://patchwork.freedesktop.org/series/119507/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13327 -&gt; IGTPW_9266</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (1): bat-dg1-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9266:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-massive-size}:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-dg1-8/igt@xe_create@create-massive-size.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@rc6_on_idle:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9266 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8141">i915#8141</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8058">i915#8058</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8141">i915#8141</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8144">i915#8144</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>)</p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7351 -&gt; IGTPW_9266</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13327: 954bc57e332bc11eb26322e2adb4d84431b25d45 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9266/index.html<br />
  IGT_7351: d8dc96b95c60e4737fdfa1664ce9b1dcebfdef60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_pm_residency@idle-residency</p>

</body>
</html>

--===============1587542674888325978==--
