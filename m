Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0708866782092862895=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 08 Feb 2023 19:34:03 -0000
Message-ID: <167588484326.388.8175838709773767385@emeril.freedesktop.org>
References: <20230208182122.187248-1-mcanal@igalia.com>
In-Reply-To: <20230208182122.187248-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVjNEIE1p?=
 =?utf-8?q?xed_Job_Submission_Tests_=28rev3=29?=
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

--===============0708866782092862895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D Mixed Job Submission Tests (rev3)
URL   : https://patchwork.freedesktop.org/series/112805/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12715 -> IGTPW_8466
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8466 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-n3050:       [FAIL][1] ([i915#6298]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12715/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7153 -> IGTPW_8466

  CI-20190529: 20190529
  CI_DRM_12715: 07d1c54bcdf3fddd723f31d605b4e8c49328affa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8466: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@v3d/v3d_job_submission@array-job-submission
+igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync
+igt@v3d/v3d_job_submission@threaded-job-submission
+igt@v3d/v3d_submit_csd@bad-bo
+igt@v3d/v3d_submit_csd@bad-extension
+igt@v3d/v3d_submit_csd@bad-flag
+igt@v3d/v3d_submit_csd@bad-in-sync
+igt@v3d/v3d_submit_csd@bad-multisync-extension
+igt@v3d/v3d_submit_csd@bad-multisync-in-sync
+igt@v3d/v3d_submit_csd@bad-multisync-out-sync
+igt@v3d/v3d_submit_csd@bad-multisync-pad
+igt@v3d/v3d_submit_csd@bad-pad
+igt@v3d/v3d_submit_csd@bad-perfmon
+igt@v3d/v3d_submit_csd@job-perfmon
+igt@v3d/v3d_submit_csd@multiple-job-submission
+igt@v3d/v3d_submit_csd@multisync-out-syncs
+igt@v3d/v3d_submit_csd@multi-and-single-sync
+igt@v3d/v3d_submit_csd@single-in-sync
+igt@v3d/v3d_submit_csd@single-out-sync
+igt@v3d/v3d_submit_csd@valid-multisync-submission
+igt@v3d/v3d_submit_csd@valid-submission

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html

--===============0708866782092862895==
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
<tr><td><b>Series:</b></td><td>V3D Mixed Job Submission Tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112805/">https://patchwork.freedesktop.org/series/112805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12715 -&gt; IGTPW_8466</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8466 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12715/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7153 -&gt; IGTPW_8466</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12715: 07d1c54bcdf3fddd723f31d605b4e8c49328affa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8466: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8466/index.html<br />
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@v3d/v3d_job_submission@array-job-submission<br />
+igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync<br />
+igt@v3d/v3d_job_submission@threaded-job-submission<br />
+igt@v3d/v3d_submit_csd@bad-bo<br />
+igt@v3d/v3d_submit_csd@bad-extension<br />
+igt@v3d/v3d_submit_csd@bad-flag<br />
+igt@v3d/v3d_submit_csd@bad-in-sync<br />
+igt@v3d/v3d_submit_csd@bad-multisync-extension<br />
+igt@v3d/v3d_submit_csd@bad-multisync-in-sync<br />
+igt@v3d/v3d_submit_csd@bad-multisync-out-sync<br />
+igt@v3d/v3d_submit_csd@bad-multisync-pad<br />
+igt@v3d/v3d_submit_csd@bad-pad<br />
+igt@v3d/v3d_submit_csd@bad-perfmon<br />
+igt@v3d/v3d_submit_csd@job-perfmon<br />
+igt@v3d/v3d_submit_csd@multiple-job-submission<br />
+igt@v3d/v3d_submit_csd@multisync-out-syncs<br />
+igt@v3d/v3d_submit_csd@multi-and-single-sync<br />
+igt@v3d/v3d_submit_csd@single-in-sync<br />
+igt@v3d/v3d_submit_csd@single-out-sync<br />
+igt@v3d/v3d_submit_csd@valid-multisync-submission<br />
+igt@v3d/v3d_submit_csd@valid-submission</p>

</body>
</html>

--===============0708866782092862895==--
