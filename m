Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2392544284761126446=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Tue, 22 Aug 2023 18:55:50 -0000
Message-ID: <169273055031.20553.17253247882091638954@emeril.freedesktop.org>
References: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
In-Reply-To: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv4=2C1/2=5D_lib/amdgpu=3A_Add_check_for_ODM_c?=
 =?utf-8?q?ombine_segments_debugfs_endpoint_=28rev4=29?=
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

--===============2392544284761126446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] lib/amdgpu: Add check for ODM combine segments debugfs endpoint (rev4)
URL   : https://patchwork.freedesktop.org/series/122707/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13546 -> IGTPW_9634
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9634 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        NOTRUN -> [ABORT][1] ([i915#9164])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-adlp-11/igt@core_auth@basic-auth.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [ABORT][2] ([i915#4423]) -> [DMESG-WARN][3] ([i915#4423] / [i915#9176])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/bat-adlp-11/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         [SKIP][4] ([i915#1072]) -> [ABORT][5] ([i915#8442] / [i915#8469] / [i915#8668])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9164]: https://gitlab.freedesktop.org/drm/intel/issues/9164
  [i915#9176]: https://gitlab.freedesktop.org/drm/intel/issues/9176


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7449 -> IGTPW_9634

  CI-20190529: 20190529
  CI_DRM_13546: f6024d250da6ed099dacf2955832e9efdd83e938 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9634: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html
  IGT_7449: 7449

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html

--===============2392544284761126446==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] lib/amdgpu: Add check for ODM combine segments debugfs endpoint (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122707/">https://patchwork.freedesktop.org/series/122707/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13546 -&gt; IGTPW_9634</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9634 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9164">i915#9164</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9176">i915#9176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7449 -&gt; IGTPW_9634</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13546: f6024d250da6ed099dacf2955832e9efdd83e938 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9634: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html<br />
  IGT_7449: 7449</p>

</body>
</html>

--===============2392544284761126446==--
