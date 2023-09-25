Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4772964128108823520=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Mon, 25 Sep 2023 20:55:12 -0000
Message-ID: <169567531280.21535.8284306197721601772@emeril.freedesktop.org>
References: <20230925164852.4123643-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230925164852.4123643-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwv?=
 =?utf-8?q?i915=5Fquery=3A_Add_query-l3-bank-count_subtest?=
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

--===============4772964128108823520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel/i915_query: Add query-l3-bank-count subtest
URL   : https://patchwork.freedesktop.org/series/124213/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13677 -> IGTPW_9867
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9867 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7502 -> IGTPW_9867

  CI-20190529: 20190529
  CI_DRM_13677: d69432c1f5832c5097d4629e61cabd8bdfc027b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9867: 9867
  IGT_7502: ac56ba97248b33668fbe771882360bd7b274cc9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_query@query-l3-bank-count
+igt@i915_query@query-l3-bank-count-invalid
+igt@i915_query@query-l3-bank-count-support

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/index.html

--===============4772964128108823520==
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
<tr><td><b>Series:</b></td><td>intel/i915_query: Add query-l3-bank-count subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124213/">https://patchwork.freedesktop.org/series/124213/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13677 -&gt; IGTPW_9867</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9867 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9867/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7502 -&gt; IGTPW_9867</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13677: d69432c1f5832c5097d4629e61cabd8bdfc027b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9867: 9867<br />
  IGT_7502: ac56ba97248b33668fbe771882360bd7b274cc9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_query@query-l3-bank-count<br />
+igt@i915_query@query-l3-bank-count-invalid<br />
+igt@i915_query@query-l3-bank-count-support</p>

</body>
</html>

--===============4772964128108823520==--
