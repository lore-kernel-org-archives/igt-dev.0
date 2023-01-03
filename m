Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3759999169933596892=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 03 Jan 2023 12:32:25 -0000
Message-ID: <167274914596.26874.11689218683396648431@emeril.freedesktop.org>
References: <20230103111820.607755-1-mcanal@igalia.com>
In-Reply-To: <20230103111820.607755-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/v3d=5Fperfmon=3A_Make_su?=
 =?utf-8?q?re_v3d_supports_perfmon?=
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

--===============3759999169933596892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/v3d_perfmon: Make sure v3d supports perfmon
URL   : https://patchwork.freedesktop.org/series/112365/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12539 -> IGTPW_8290
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (2): fi-bsw-kefka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8290 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][1] ([i915#4983]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12539/bat-rpls-2/igt@i915_selftest@live@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7105 -> IGTPW_8290

  CI-20190529: 20190529
  CI_DRM_12539: 2e13396f24319653cab10dbe1b21c5fa9890949a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8290: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html
  IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@v3d/v3d_submit_cl@bad-bo
-igt@v3d/v3d_submit_cl@bad-extension
-igt@v3d/v3d_submit_cl@bad-flag
-igt@v3d/v3d_submit_cl@bad-in-sync
-igt@v3d/v3d_submit_cl@bad-multisync-extension
-igt@v3d/v3d_submit_cl@bad-multisync-in-sync
-igt@v3d/v3d_submit_cl@bad-multisync-out-sync
-igt@v3d/v3d_submit_cl@bad-multisync-pad
-igt@v3d/v3d_submit_cl@bad-pad
-igt@v3d/v3d_submit_cl@bad-perfmon
-igt@v3d/v3d_submit_cl@job-perfmon
-igt@v3d/v3d_submit_cl@multiple-job-submission
-igt@v3d/v3d_submit_cl@multisync-out-sync
-igt@v3d/v3d_submit_cl@multi-and-simple-sync
-igt@v3d/v3d_submit_cl@simple-flush-cache
-igt@v3d/v3d_submit_cl@simple-in-sync
-igt@v3d/v3d_submit_cl@simple-out-sync
-igt@v3d/v3d_submit_cl@valid-submission
-igt@v3d/v3d_wait_bo@bad-bo
-igt@v3d/v3d_wait_bo@bad-pad
-igt@v3d/v3d_wait_bo@map-bo-0ns
-igt@v3d/v3d_wait_bo@map-bo-1ns
-igt@v3d/v3d_wait_bo@unused-bo-0ns
-igt@v3d/v3d_wait_bo@unused-bo-1ns
-igt@v3d/v3d_wait_bo@used-bo
-igt@v3d/v3d_wait_bo@used-bo-0ns
-igt@v3d/v3d_wait_bo@used-bo-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html

--===============3759999169933596892==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/v3d_perfmon: Make sure v3d supports perfmon</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112365/">https://patchwork.freedesktop.org/series/112365/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12539 -&gt; IGTPW_8290</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (2): fi-bsw-kefka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8290 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12539/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7105 -&gt; IGTPW_8290</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12539: 2e13396f24319653cab10dbe1b21c5fa9890949a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8290: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8290/index.html<br />
  IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@v3d/v3d_submit_cl@bad-bo<br />
-igt@v3d/v3d_submit_cl@bad-extension<br />
-igt@v3d/v3d_submit_cl@bad-flag<br />
-igt@v3d/v3d_submit_cl@bad-in-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-extension<br />
-igt@v3d/v3d_submit_cl@bad-multisync-in-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-out-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-pad<br />
-igt@v3d/v3d_submit_cl@bad-pad<br />
-igt@v3d/v3d_submit_cl@bad-perfmon<br />
-igt@v3d/v3d_submit_cl@job-perfmon<br />
-igt@v3d/v3d_submit_cl@multiple-job-submission<br />
-igt@v3d/v3d_submit_cl@multisync-out-sync<br />
-igt@v3d/v3d_submit_cl@multi-and-simple-sync<br />
-igt@v3d/v3d_submit_cl@simple-flush-cache<br />
-igt@v3d/v3d_submit_cl@simple-in-sync<br />
-igt@v3d/v3d_submit_cl@simple-out-sync<br />
-igt@v3d/v3d_submit_cl@valid-submission<br />
-igt@v3d/v3d_wait_bo@bad-bo<br />
-igt@v3d/v3d_wait_bo@bad-pad<br />
-igt@v3d/v3d_wait_bo@map-bo-0ns<br />
-igt@v3d/v3d_wait_bo@map-bo-1ns<br />
-igt@v3d/v3d_wait_bo@unused-bo-0ns<br />
-igt@v3d/v3d_wait_bo@unused-bo-1ns<br />
-igt@v3d/v3d_wait_bo@used-bo<br />
-igt@v3d/v3d_wait_bo@used-bo-0ns<br />
-igt@v3d/v3d_wait_bo@used-bo-1ns</p>

</body>
</html>

--===============3759999169933596892==--
