Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2562855344489255517=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 28 Sep 2022 19:43:16 -0000
Message-ID: <166439419672.595.1218457715897794055@emeril.freedesktop.org>
References: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?b?IGdlbV9nZXRfYmF0Y2hfc2l6ZSgpIChyZXYyKQ==?=
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

--===============2562855344489255517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove gem_get_batch_size() (rev2)
URL   : https://patchwork.freedesktop.org/series/109109/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12194 -> IGTPW_7872
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html

Participating hosts (46 -> 44)
------------------------------

  Missing    (2): fi-icl-u2 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7872 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][1] ([i915#2867]) -> [PASS][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_ringfill@basic-all:
    - {bat-dg2-9}:        [FAIL][3] ([i915#5886]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-dg2-9/igt@gem_ringfill@basic-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-dg2-9/igt@gem_ringfill@basic-all.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-adln-1}:       [DMESG-FAIL][5] ([i915#4258]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-adln-1/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-adln-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][7] ([i915#4983]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-rpls-1/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [FAIL][9] ([i915#6298]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6668 -> IGTPW_7872

  CI-20190529: 20190529
  CI_DRM_12194: 1a9d9ad2a7211ef754a3b3cf5f76adb15607a752 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7872: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html

--===============2562855344489255517==
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
<tr><td><b>Series:</b></td><td>Remove gem_get_batch_size() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109109/">https://patchwork.freedesktop.org/series/109109/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12194 -&gt; IGTPW_7872</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html</p>
<h2>Participating hosts (46 -&gt; 44)</h2>
<p>Missing    (2): fi-icl-u2 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7872 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-dg2-9/igt@gem_ringfill@basic-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5886">i915#5886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-dg2-9/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-adln-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-adln-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12194/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6668 -&gt; IGTPW_7872</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12194: 1a9d9ad2a7211ef754a3b3cf5f76adb15607a752 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7872: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7872/index.html<br />
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2562855344489255517==--
