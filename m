Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4097730855402725155=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Mon, 25 Sep 2023 19:40:28 -0000
Message-ID: <169567082806.21534.6010444891275284935@emeril.freedesktop.org>
References: <20230925143154.4055120-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230925143154.4055120-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwv?=
 =?utf-8?q?i915=5Fquery=3A_Add_query-l3-bank-count_subtest_=28rev2=29?=
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

--===============4097730855402725155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel/i915_query: Add query-l3-bank-count subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/124121/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13677 -> IGTPW_9865
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9865 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-mtlp-8:         NOTRUN -> [FAIL][1] ([fdo#103375]) +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-mtlp-8:         [PASS][2] -> [FAIL][3] ([fdo#103375])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-mtlp-8/igt@i915_suspend@basic-s2idle-without-i915.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][4] -> [FAIL][5] ([IGT#3])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-mtlp-8:         [ABORT][6] ([i915#9262]) -> [FAIL][7] ([fdo#103375])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         [ABORT][8] ([i915#7978] / [i915#8668]) -> [INCOMPLETE][9] ([i915#9136])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9136]: https://gitlab.freedesktop.org/drm/intel/issues/9136
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7502 -> IGTPW_9865

  CI-20190529: 20190529
  CI_DRM_13677: d69432c1f5832c5097d4629e61cabd8bdfc027b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9865: 9865
  IGT_7502: ac56ba97248b33668fbe771882360bd7b274cc9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_query@query-l3-bank-count
+igt@i915_query@query-l3-bank-count-invalid
+igt@i915_query@query-l3-bank-count-support

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/index.html

--===============4097730855402725155==
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
<tr><td><b>Series:</b></td><td>intel/i915_query: Add query-l3-bank-count subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124121/">https://patchwork.freedesktop.org/series/124121/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13677 -&gt; IGTPW_9865</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9865 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-mtlp-8/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13677/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9865/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9136">i915#9136</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7502 -&gt; IGTPW_9865</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13677: d69432c1f5832c5097d4629e61cabd8bdfc027b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9865: 9865<br />
  IGT_7502: ac56ba97248b33668fbe771882360bd7b274cc9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_query@query-l3-bank-count<br />
+igt@i915_query@query-l3-bank-count-invalid<br />
+igt@i915_query@query-l3-bank-count-support</p>

</body>
</html>

--===============4097730855402725155==--
