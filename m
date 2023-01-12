Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3612743647349635203=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 12 Jan 2023 15:32:04 -0000
Message-ID: <167353752484.2074.6040136504964781890@emeril.freedesktop.org>
References: <20230112131534.29777-1-mcanal@igalia.com>
In-Reply-To: <20230112131534.29777-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVjNEIEpv?=
 =?utf-8?q?b_Submission_Tests_=28rev2=29?=
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

--===============3612743647349635203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D Job Submission Tests (rev2)
URL   : https://patchwork.freedesktop.org/series/112363/
State : success

== Summary ==

CI Bug Log - changes from IGT_7118 -> IGTPW_8330
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8330 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][1] ([i915#7793])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-kbl-7567u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4] ([i915#6298])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ivb-3770:        NOTRUN -> [SKIP][5] ([fdo#109271]) +27 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [INCOMPLETE][6] ([i915#4817]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][8] ([i915#4817]) -> [FAIL][9] ([fdo#103375])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7793]: https://gitlab.freedesktop.org/drm/intel/issues/7793


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7118 -> IGTPW_8330

  CI-20190529: 20190529
  CI_DRM_12577: e3da2dad96f658f4275d39977a7258ccfeedac1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8330: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html
  IGT_7118: 6dedf2e6e8458e63538bb8e41a81e24ffde3c37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@v3d/v3d_submit_cl@bad-bo
+igt@v3d/v3d_submit_cl@bad-extension
+igt@v3d/v3d_submit_cl@bad-flag
+igt@v3d/v3d_submit_cl@bad-in-sync
+igt@v3d/v3d_submit_cl@bad-multisync-extension
+igt@v3d/v3d_submit_cl@bad-multisync-in-sync
+igt@v3d/v3d_submit_cl@bad-multisync-out-sync
+igt@v3d/v3d_submit_cl@bad-multisync-pad
+igt@v3d/v3d_submit_cl@bad-pad
+igt@v3d/v3d_submit_cl@bad-perfmon
+igt@v3d/v3d_submit_cl@job-perfmon
+igt@v3d/v3d_submit_cl@multiple-job-submission
+igt@v3d/v3d_submit_cl@multisync-out-syncs
+igt@v3d/v3d_submit_cl@multi-and-single-sync
+igt@v3d/v3d_submit_cl@simple-flush-cache
+igt@v3d/v3d_submit_cl@single-in-sync
+igt@v3d/v3d_submit_cl@single-out-sync
+igt@v3d/v3d_submit_cl@valid-multisync-submission
+igt@v3d/v3d_submit_cl@valid-submission
+igt@v3d/v3d_wait_bo@bad-bo
+igt@v3d/v3d_wait_bo@bad-pad
+igt@v3d/v3d_wait_bo@map-bo-0ns
+igt@v3d/v3d_wait_bo@map-bo-1ns
+igt@v3d/v3d_wait_bo@unused-bo-0ns
+igt@v3d/v3d_wait_bo@unused-bo-1ns
+igt@v3d/v3d_wait_bo@used-bo
+igt@v3d/v3d_wait_bo@used-bo-0ns
+igt@v3d/v3d_wait_bo@used-bo-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html

--===============3612743647349635203==
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
<tr><td><b>Series:</b></td><td>V3D Job Submission Tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112363/">https://patchwork.freedesktop.org/series/112363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7118 -&gt; IGTPW_8330</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8330 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7793">i915#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-kbl-7567u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7118 -&gt; IGTPW_8330</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12577: e3da2dad96f658f4275d39977a7258ccfeedac1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8330: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8330/index.html<br />
  IGT_7118: 6dedf2e6e8458e63538bb8e41a81e24ffde3c37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@v3d/v3d_submit_cl@bad-bo<br />
+igt@v3d/v3d_submit_cl@bad-extension<br />
+igt@v3d/v3d_submit_cl@bad-flag<br />
+igt@v3d/v3d_submit_cl@bad-in-sync<br />
+igt@v3d/v3d_submit_cl@bad-multisync-extension<br />
+igt@v3d/v3d_submit_cl@bad-multisync-in-sync<br />
+igt@v3d/v3d_submit_cl@bad-multisync-out-sync<br />
+igt@v3d/v3d_submit_cl@bad-multisync-pad<br />
+igt@v3d/v3d_submit_cl@bad-pad<br />
+igt@v3d/v3d_submit_cl@bad-perfmon<br />
+igt@v3d/v3d_submit_cl@job-perfmon<br />
+igt@v3d/v3d_submit_cl@multiple-job-submission<br />
+igt@v3d/v3d_submit_cl@multisync-out-syncs<br />
+igt@v3d/v3d_submit_cl@multi-and-single-sync<br />
+igt@v3d/v3d_submit_cl@simple-flush-cache<br />
+igt@v3d/v3d_submit_cl@single-in-sync<br />
+igt@v3d/v3d_submit_cl@single-out-sync<br />
+igt@v3d/v3d_submit_cl@valid-multisync-submission<br />
+igt@v3d/v3d_submit_cl@valid-submission<br />
+igt@v3d/v3d_wait_bo@bad-bo<br />
+igt@v3d/v3d_wait_bo@bad-pad<br />
+igt@v3d/v3d_wait_bo@map-bo-0ns<br />
+igt@v3d/v3d_wait_bo@map-bo-1ns<br />
+igt@v3d/v3d_wait_bo@unused-bo-0ns<br />
+igt@v3d/v3d_wait_bo@unused-bo-1ns<br />
+igt@v3d/v3d_wait_bo@used-bo<br />
+igt@v3d/v3d_wait_bo@used-bo-0ns<br />
+igt@v3d/v3d_wait_bo@used-bo-1ns</p>

</body>
</html>

--===============3612743647349635203==--
