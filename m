Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7697839296570904546=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 14 Jan 2023 00:13:07 -0000
Message-ID: <167365518743.1045.10414178171757827925@emeril.freedesktop.org>
References: <20230113190002.617853-1-mcanal@igalia.com>
In-Reply-To: <20230113190002.617853-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVjNEIEpv?=
 =?utf-8?q?b_Submission_Tests_=28rev3=29?=
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

--===============7697839296570904546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D Job Submission Tests (rev3)
URL   : https://patchwork.freedesktop.org/series/112363/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12585 -> IGTPW_8337
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8337 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][3] ([i915#5334]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-rpls-2}:       [DMESG-FAIL][5] ([i915#4258]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - fi-kbl-soraka:      [INCOMPLETE][7] ([i915#7640]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg2-11}:       [INCOMPLETE][9] ([i915#7834]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][11] ([i915#6257]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][13] ([i915#4983]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-2/igt@i915_selftest@live@reset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7640]: https://gitlab.freedesktop.org/drm/intel/issues/7640
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7834]: https://gitlab.freedesktop.org/drm/intel/issues/7834


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7119 -> IGTPW_8337

  CI-20190529: 20190529
  CI_DRM_12585: 68d139b609a97a83e7c231189d4864aba4e1679b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8337: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html
  IGT_7119: 1e6d24e6dfa42b22f950f7d5e436b8f9acf8747f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html

--===============7697839296570904546==
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
<tr><td><b>Series:</b></td><td>V3D Job Submission Tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112363/">https://patchwork.freedesktop.org/series/112363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12585 -&gt; IGTPW_8337</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8337 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7640">i915#7640</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7834">i915#7834</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12585/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7119 -&gt; IGTPW_8337</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12585: 68d139b609a97a83e7c231189d4864aba4e1679b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8337: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8337/index.html<br />
  IGT_7119: 1e6d24e6dfa42b22f950f7d5e436b8f9acf8747f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============7697839296570904546==--
