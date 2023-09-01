Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2894826116486808565=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 01 Sep 2023 11:23:25 -0000
Message-ID: <169356740565.9813.2088977089480947429@emeril.freedesktop.org>
References: <20230901074224.524217-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230901074224.524217-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?meson=2Ebuild=3A_only_generate_testlists_on_native_builds_=28re?=
 =?utf-8?b?djMp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2894826116486808565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/meson.build: only generate testlists on native builds (rev3)
URL   : https://patchwork.freedesktop.org/series/123104/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13587 -> IGTPW_9705
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9705 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#6311])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [PASS][3] -> [DMESG-FAIL][4] ([i915#4258] / [i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - fi-elk-e7500:       [FAIL][5] ([i915#2122]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

  
#### Warnings ####

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         [SKIP][7] ([i915#1072]) -> [ABORT][8] ([i915#8442] / [i915#8469] / [i915#8668])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7463 -> IGTPW_9705

  CI-20190529: 20190529
  CI_DRM_13587: 8152aa47d7b14683059ec856ffa99e2d86acfc8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9705: 9705
  IGT_7463: 7463

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/index.html

--===============2894826116486808565==
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
<tr><td><b>Series:</b></td><td>tests/meson.build: only generate testlists on native builds (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123104/">https://patchwork.freedesktop.org/series/123104/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13587 -&gt; IGTPW_9705</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9705 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_mmap_gtt:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13587/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9705/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7463 -&gt; IGTPW_9705</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13587: 8152aa47d7b14683059ec856ffa99e2d86acfc8b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9705: 9705<br />
  IGT_7463: 7463</p>

</body>
</html>

--===============2894826116486808565==--

