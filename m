Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7088953639536887882=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fcreate=3A_?=
 =?utf-8?q?create-contexts_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Fri, 08 Dec 2023 11:05:03 -0000
Message-ID: <170203350372.7324.14112324849597088292@emeril.freedesktop.org>
References: <20231208090558.17004-1-lukasz.laguna@intel.com>
In-Reply-To: <20231208090558.17004-1-lukasz.laguna@intel.com>
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

--===============7088953639536887882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_create: create-contexts subtest
URL   : https://patchwork.freedesktop.org/series/127558/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13998 -> IGTPW_10381
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10381 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10381, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10381:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic@flip:
    - bat-adlp-11:        NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@kms_busy@basic@flip.html
    - bat-dg2-8:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_busy@basic@flip.html
    - bat-jsl-1:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@kms_busy@basic@flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-guc:         NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html

  
Known issues
------------

  Here are the changes found in IGTPW_10381 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-11:        NOTRUN -> [SKIP][5] ([i915#9318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-1:          NOTRUN -> [SKIP][6] ([i915#9318])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1849])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] ([i915#2190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][9] ([i915#4083])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][10] ([i915#4077]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][11] ([i915#4079]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_tiled_pread_basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][12] ([i915#3282])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@gem_tiled_pread_basic.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][13] ([i915#5190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][14] ([i915#4215] / [i915#5190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][15] ([i915#4212]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-8:          NOTRUN -> [SKIP][16] ([i915#4212] / [i915#5608])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271]) +18 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7628 -> IGTPW_10381

  CI-20190529: 20190529
  CI_DRM_13998: 25a1f5a87b8a320992918d224a548bb13a68c378 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_create@create-contexts

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html

--===============7088953639536887882==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_create: create-contexts subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127558/">https://patchwork.freedesktop.org/series/127558/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13998 -&gt; IGTPW_10381</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10381 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10381, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10381:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@kms_busy@basic@flip.html">ABORT</a></p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_busy@basic@flip.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@kms_busy@basic@flip.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10381 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7628 -&gt; IGTPW_10381</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13998: 25a1f5a87b8a320992918d224a548bb13a68c378 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10381/index.html<br />
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_create@create-contexts</p>

</body>
</html>

--===============7088953639536887882==--
