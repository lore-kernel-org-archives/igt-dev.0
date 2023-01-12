Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4357590772847153620=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 12 Jan 2023 15:37:26 -0000
Message-ID: <167353784642.2072.8958521928788472913@emeril.freedesktop.org>
References: <20230112140054.36590-1-mcanal@igalia.com>
In-Reply-To: <20230112140054.36590-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTWFrZSBz?=
 =?utf-8?q?ure_v3d/vc4_support_performance_monitors_=28rev3=29?=
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

--===============4357590772847153620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make sure v3d/vc4 support performance monitors (rev3)
URL   : https://patchwork.freedesktop.org/series/112370/
State : success

== Summary ==

CI Bug Log - changes from IGT_7118 -> IGTPW_8331
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8331 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][3] ([fdo#109271]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-kbl-7567u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ivb-3770:        NOTRUN -> [SKIP][4] ([fdo#109271]) +27 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][5] ([i915#6367]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [INCOMPLETE][7] ([i915#4817]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7118 -> IGTPW_8331

  CI-20190529: 20190529
  CI_DRM_12577: e3da2dad96f658f4275d39977a7258ccfeedac1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html
  IGT_7118: 6dedf2e6e8458e63538bb8e41a81e24ffde3c37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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
-igt@v3d/v3d_submit_cl@multisync-out-syncs
-igt@v3d/v3d_submit_cl@multi-and-single-sync
-igt@v3d/v3d_submit_cl@simple-flush-cache
-igt@v3d/v3d_submit_cl@single-in-sync
-igt@v3d/v3d_submit_cl@single-out-sync
-igt@v3d/v3d_submit_cl@valid-multisync-submission
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html

--===============4357590772847153620==
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
<tr><td><b>Series:</b></td><td>Make sure v3d/vc4 support performance monitors (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112370/">https://patchwork.freedesktop.org/series/112370/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7118 -&gt; IGTPW_8331</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8331 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-kbl-7567u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7118/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7118 -&gt; IGTPW_8331</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12577: e3da2dad96f658f4275d39977a7258ccfeedac1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8331/index.html<br />
  IGT_7118: 6dedf2e6e8458e63538bb8e41a81e24ffde3c37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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
-igt@v3d/v3d_submit_cl@multisync-out-syncs<br />
-igt@v3d/v3d_submit_cl@multi-and-single-sync<br />
-igt@v3d/v3d_submit_cl@simple-flush-cache<br />
-igt@v3d/v3d_submit_cl@single-in-sync<br />
-igt@v3d/v3d_submit_cl@single-out-sync<br />
-igt@v3d/v3d_submit_cl@valid-multisync-submission<br />
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

--===============4357590772847153620==--
