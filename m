Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7218583311979795797=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 11 Nov 2022 21:45:10 -0000
Message-ID: <166820311091.871.12039428983925965287@emeril.freedesktop.org>
References: <20221111195813.277822-1-mcanal@igalia.com>
In-Reply-To: <20221111195813.277822-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVjNEIElH?=
 =?utf-8?q?T_Tests_Updates_=28rev2=29?=
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

--===============7218583311979795797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D IGT Tests Updates (rev2)
URL   : https://patchwork.freedesktop.org/series/110681/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12371 -> IGTPW_8089
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-ctg-p8600 fi-kbl-x1275 fi-rkl-11600 

Known issues
------------

  Here are the changes found in IGTPW_8089 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [PASS][1] -> [INCOMPLETE][2] ([i915#7308] / [i915#7348])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][3] ([i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-adlp-4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - {bat-dg2-8}:        [FAIL][4] ([i915#7328]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg2-8/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-dg2-8/igt@i915_module_load@load.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][6] ([i915#6367]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {bat-kbl-2}:        [INCOMPLETE][8] ([i915#4817]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7328]: https://gitlab.freedesktop.org/drm/intel/issues/7328
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7498]: https://gitlab.freedesktop.org/drm/intel/issues/7498


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7051 -> IGTPW_8089

  CI-20190529: 20190529
  CI_DRM_12371: 3abfcf048c08ca9c7bbaba0c57c699453fd37a2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8089: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@v3d_create_bo@create-bo-0
+igt@v3d_create_bo@create-bo-4096
+igt@v3d_create_bo@create-bo-zeroed
+igt@v3d_perfmon@create-perfmon-0
+igt@v3d_perfmon@create-perfmon-exceed
+igt@v3d_perfmon@create-perfmon-invalid-counters
+igt@v3d_perfmon@create-single-perfmon
+igt@v3d_perfmon@create-two-perfmon
+igt@v3d_perfmon@destroy-invalid-perfmon
+igt@v3d_perfmon@destroy-valid-perfmon
+igt@v3d_perfmon@get-values-invalid-pad
+igt@v3d_perfmon@get-values-invalid-perfmon
+igt@v3d_perfmon@get-values-invalid-pointer
+igt@v3d_perfmon@get-values-valid-perfmon

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html

--===============7218583311979795797==
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
<tr><td><b>Series:</b></td><td>V3D IGT Tests Updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110681/">https://patchwork.freedesktop.org/series/110681/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12371 -&gt; IGTPW_8089</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-ctg-p8600 fi-kbl-x1275 fi-rkl-11600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8089 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg2-8/igt@i915_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7328">i915#7328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-dg2-8/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7051 -&gt; IGTPW_8089</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12371: 3abfcf048c08ca9c7bbaba0c57c699453fd37a2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8089: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8089/index.html<br />
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@v3d_create_bo@create-bo-0<br />
+igt@v3d_create_bo@create-bo-4096<br />
+igt@v3d_create_bo@create-bo-zeroed<br />
+igt@v3d_perfmon@create-perfmon-0<br />
+igt@v3d_perfmon@create-perfmon-exceed<br />
+igt@v3d_perfmon@create-perfmon-invalid-counters<br />
+igt@v3d_perfmon@create-single-perfmon<br />
+igt@v3d_perfmon@create-two-perfmon<br />
+igt@v3d_perfmon@destroy-invalid-perfmon<br />
+igt@v3d_perfmon@destroy-valid-perfmon<br />
+igt@v3d_perfmon@get-values-invalid-pad<br />
+igt@v3d_perfmon@get-values-invalid-perfmon<br />
+igt@v3d_perfmon@get-values-invalid-pointer<br />
+igt@v3d_perfmon@get-values-valid-perfmon</p>

</body>
</html>

--===============7218583311979795797==--
