Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2987281424050117393=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_RFC=3A_tests/xe=5Fsvm=3A_ba?=
 =?utf-8?q?sic_svm_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Thu, 11 Jan 2024 11:35:31 -0000
Message-ID: <170497293188.270358.16192034330847029363@5338d5abeb45>
References: <20240111094304.395181-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240111094304.395181-1-krishnaiah.bommu@intel.com>
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

--===============2987281424050117393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: tests/xe_svm: basic svm test
URL   : https://patchwork.freedesktop.org/series/128638/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14111 -> IGTPW_10511
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10511 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-rpls-2:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][3] ([i915#3282])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-rpls-2:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][5] ([i915#10010])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rpls-2:         NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#3840] / [i915#9886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-rpls-2:         NOTRUN -> [SKIP][8] ([fdo#109285])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-rpls-2:         NOTRUN -> [SKIP][9] ([i915#5354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rpls-2:         NOTRUN -> [SKIP][10] ([i915#3555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][11] ([fdo#109295] / [i915#3708]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [ABORT][12] ([i915#7911]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-adls-6}:       [INCOMPLETE][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-adls-6/igt@i915_selftest@live@gt_timelines.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-adls-6/igt@i915_selftest@live@gt_timelines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#10010]: https://gitlab.freedesktop.org/drm/intel/issues/10010
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7669 -> IGTPW_10511

  CI-20190529: 20190529
  CI_DRM_14111: 86d0316f679868605ed771544c96bab5c8eaf994 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10511: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html
  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_svm@svm-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html

--===============2987281424050117393==
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
<tr><td><b>Series:</b></td><td>RFC: tests/xe_svm: basic svm test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128638/">https://patchwork.freedesktop.org/series/128638/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14111 -&gt; IGTPW_10511</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10511 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10010">i915#10010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-rpls-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14111/bat-adls-6/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/bat-adls-6/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7669 -&gt; IGTPW_10511</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14111: 86d0316f679868605ed771544c96bab5c8eaf994 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10511: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10511/index.html<br />
  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_svm@svm-basic</p>

</body>
</html>

--===============2987281424050117393==--
