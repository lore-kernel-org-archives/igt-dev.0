Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9177046219652698506=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 15 Sep 2023 06:14:43 -0000
Message-ID: <169475848323.32040.13178693944859133630@emeril.freedesktop.org>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGNv?=
 =?utf-8?q?py_basic_test_to_exercise_blt_commands_=28rev3=29?=
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

--===============9177046219652698506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add copy basic test to exercise blt commands (rev3)
URL   : https://patchwork.freedesktop.org/series/122615/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13635 -> IGTPW_9795
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9795 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9795, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/index.html

Participating hosts (40 -> 38)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (3): fi-hsw-4770 fi-tgl-1115g4 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9795:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@ring_submission:
    - fi-kbl-soraka:      NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_9795 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][4] ([i915#5334] / [i915#7872])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [PASS][6] -> [INCOMPLETE][7] ([i915#7913] / [i915#9253])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-guc:         [PASS][9] -> [ABORT][10] ([i915#8299])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
  [i915#9253]: https://gitlab.freedesktop.org/drm/intel/issues/9253


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7488 -> IGTPW_9795

  CI-20190529: 20190529
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9795: 9795
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_copy_basic@mem-copy
+igt@xe_copy_basic@mem-set

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/index.html

--===============9177046219652698506==
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
<tr><td><b>Series:</b></td><td>Add copy basic test to exercise blt commands (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122615/">https://patchwork.freedesktop.org/series/122615/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13635 -&gt; IGTPW_9795</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9795 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9795, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (3): fi-hsw-4770 fi-tgl-1115g4 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9795:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@ring_submission:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@ring_submission.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9795 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9253">i915#9253</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13635/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9795/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8299">i915#8299</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7488 -&gt; IGTPW_9795</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13635: c6b7f865a77a75af03c3b68baa4cf7eb66c1c6d5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9795: 9795<br />
  IGT_7488: 099e058c5dfb7a49942edf03cae88a52a77077a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_copy_basic@mem-copy<br />
+igt@xe_copy_basic@mem-set</p>

</body>
</html>

--===============9177046219652698506==--
