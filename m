Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7192621698282031501=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adrian Larumbe" <adrian.larumbe@collabora.com>
Date: Fri, 19 Aug 2022 20:46:27 -0000
Message-ID: <166094198771.23789.2941059025717053878@emeril.freedesktop.org>
References: <20220819195218.983998-1-adrian.larumbe@collabora.com>
In-Reply-To: <20220819195218.983998-1-adrian.larumbe@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_i915=5Fdrm=2Eh_sync_uapi_?=
 =?utf-8?q?engine_class_enum_with_drm-next?=
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

--===============7192621698282031501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] i915_drm.h sync uapi engine class enum with drm-next
URL   : https://patchwork.freedesktop.org/series/107512/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12004 -> IGTPW_7665
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-adln-1 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7665:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@read_all_entries:
    - {bat-dg2-8}:        [INCOMPLETE][1] ([i915#6637]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg2-8/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg2-8/igt@debugfs_test@read_all_entries.html

  * igt@fbdev@write:
    - {bat-dg2-9}:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg2-9/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg2-9/igt@fbdev@write.html

  
Known issues
------------

  Here are the changes found in IGTPW_7665 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][5] -> [INCOMPLETE][6] ([i915#5982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][7] ([i915#6598] / [i915#6601])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][8] -> [FAIL][9] ([i915#6298])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        [DMESG-FAIL][10] ([i915#4528]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-pnv-d510/igt@i915_selftest@live@gem.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-pnv-d510/igt@i915_selftest@live@gem.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - fi-rkl-guc:         [TIMEOUT][12] ([i915#6627]) -> [TIMEOUT][13] ([i915#6627] / [i915#6637])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-rkl-guc/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-rkl-guc/igt@i915_module_load@load.html
    - bat-dg1-6:          [TIMEOUT][14] ([i915#6627]) -> [TIMEOUT][15] ([i915#6627] / [i915#6637])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg1-6/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg1-6/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601
  [i915#6627]: https://gitlab.freedesktop.org/drm/intel/issues/6627
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6632 -> IGTPW_7665

  CI-20190529: 20190529
  CI_DRM_12004: 9a91db2ace2b69713b8ebbbc37554b53f23fa883 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html
  IGT_6632: a0ac4d449e551fd5c78b56f85cd534330ea60507 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html

--===============7192621698282031501==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] i915_drm.h sync uapi engine class enum with drm-next</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107512/">https://patchwork.freedesktop.org/series/107512/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12004 -&gt; IGTPW_7665</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-adln-1 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7665:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg2-8/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6637">i915#6637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg2-8/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg2-9/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg2-9/igt@fbdev@write.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7665 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6601">i915#6601</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gem:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-pnv-d510/igt@i915_selftest@live@gem.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/fi-rkl-guc/igt@i915_module_load@load.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6627">i915#6627</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/fi-rkl-guc/igt@i915_module_load@load.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6627">i915#6627</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6637">i915#6637</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12004/bat-dg1-6/igt@i915_module_load@load.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6627">i915#6627</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/bat-dg1-6/igt@i915_module_load@load.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6627">i915#6627</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6637">i915#6637</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6632 -&gt; IGTPW_7665</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12004: 9a91db2ace2b69713b8ebbbc37554b53f23fa883 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7665/index.html<br />
  IGT_6632: a0ac4d449e551fd5c78b56f85cd534330ea60507 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7192621698282031501==--
