Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4974382656223708603=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 11 Jan 2023 12:36:16 -0000
Message-ID: <167344057626.20084.12071278372268135784@emeril.freedesktop.org>
References: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IHR3?=
 =?utf-8?q?o_issues_in_gem=5Fmmap=5Foffset_test?=
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

--===============4974382656223708603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix two issues in gem_mmap_offset test
URL   : https://patchwork.freedesktop.org/series/112663/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12572 -> IGTPW_8325
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html

Participating hosts (40 -> 34)
------------------------------

  Missing    (6): bat-dg1-7 bat-dg1-6 fi-snb-2520m bat-adln-1 bat-rpls-1 bat-rpls-2 

Known issues
------------

  Here are the changes found in IGTPW_8325 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][1] -> [FAIL][2] ([i915#7229])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@perf:
    - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] ([i915#1886])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-kbl-soraka/igt@i915_selftest@live@perf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-kbl-soraka/igt@i915_selftest@live@perf.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-elk-e7500:       [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence.html

  
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7115 -> IGTPW_8325

  CI-20190529: 20190529
  CI_DRM_12572: 1d81095ce0a981d0c0b5979bf4b75fe6cf871973 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8325: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html
  IGT_7115: c162d70b00c6f4cf6a0ba1ca7a7e2ad8f7190646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_exercise_blt@fast-copy
-igt@gem_exercise_blt@fast-copy-emit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html

--===============4974382656223708603==
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
<tr><td><b>Series:</b></td><td>Fix two issues in gem_mmap_offset test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112663/">https://patchwork.freedesktop.org/series/112663/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12572 -&gt; IGTPW_8325</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html</p>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): bat-dg1-7 bat-dg1-6 fi-snb-2520m bat-adln-1 bat-rpls-1 bat-rpls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8325 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-kbl-soraka/igt@i915_selftest@live@perf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-kbl-soraka/igt@i915_selftest@live@perf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@dmabuf@all-tests@dma_fence:<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12572/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7115 -&gt; IGTPW_8325</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12572: 1d81095ce0a981d0c0b5979bf4b75fe6cf871973 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8325: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8325/index.html<br />
  IGT_7115: c162d70b00c6f4cf6a0ba1ca7a7e2ad8f7190646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_exercise_blt@fast-copy<br />
-igt@gem_exercise_blt@fast-copy-emit</p>

</body>
</html>

--===============4974382656223708603==--
