Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4774279326499273131=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Mon, 10 Oct 2022 11:13:40 -0000
Message-ID: <166540042000.29672.14510374056850508683@emeril.freedesktop.org>
References: <20221010084448.140541-1-vinod.govindapillai@intel.com>
In-Reply-To: <20221010084448.140541-1-vinod.govindapillai@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdebugfs=3A_set_provision_to_ignore_long_HPDs?=
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

--===============4774279326499273131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_debugfs: set provision to ignore long HPDs
URL   : https://patchwork.freedesktop.org/series/109531/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12228 -> IGTPW_7936
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-ctg-p8600 

Known issues
------------

  Here are the changes found in IGTPW_7936 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-hsw-g3258:       [PASS][5] -> [INCOMPLETE][6] ([i915#3303] / [i915#4785])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][7] ([fdo#109271] / [i915#4312] / [i915#5594])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-4770/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][8] ([fdo#109271] / [i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][9] ([i915#6257]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/bat-rpls-1/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - {bat-rpls-2}:       [DMESG-FAIL][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/bat-rpls-2/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/bat-rpls-2/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7006 -> IGTPW_7936

  CI-20190529: 20190529
  CI_DRM_12228: ec49ae119a3998563198b95b64a48fd4561f3ddd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html
  IGT_7006: ea6d73b73b88de85d921cbc2680ae8979a2c3ce9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html

--===============4774279326499273131==
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
<tr><td><b>Series:</b></td><td>lib/igt_debugfs: set provision to ignore long HPDs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109531/">https://patchwork.freedesktop.org/series/109531/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12228 -&gt; IGTPW_7936</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-ctg-p8600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7936 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12228/bat-rpls-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/bat-rpls-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7006 -&gt; IGTPW_7936</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12228: ec49ae119a3998563198b95b64a48fd4561f3ddd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7936/index.html<br />
  IGT_7006: ea6d73b73b88de85d921cbc2680ae8979a2c3ce9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4774279326499273131==--
