Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9091955375071553736=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/kms=5Fdsc=3A_ad?=
 =?utf-8?q?d_new_constraint?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 05 Jan 2024 07:41:56 -0000
Message-ID: <170444051684.39691.7335805772698195568@5338d5abeb45>
References: <20240105065236.57782-1-swati2.sharma@intel.com>
In-Reply-To: <20240105065236.57782-1-swati2.sharma@intel.com>
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

--===============9091955375071553736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dsc: add new constraint
URL   : https://patchwork.freedesktop.org/series/128239/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14080 -> IGTPW_10477
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10477 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10477, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10477:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_10477 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] ([fdo#109271]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][4] ([i915#8668])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - {bat-adls-6}:       [TIMEOUT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-adls-6/igt@i915_selftest@live@gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-adls-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][7] ([i915#9500]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - {bat-adls-6}:       [WARN][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-adls-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-adls-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][11] ([i915#8668]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-2:         [ABORT][13] ([i915#8668] / [i915#9368] / [i915#9897]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9368]: https://gitlab.freedesktop.org/drm/intel/issues/9368
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
  [i915#9897]: https://gitlab.freedesktop.org/drm/intel/issues/9897


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7656 -> IGTPW_10477

  CI-20190529: 20190529
  CI_DRM_14080: d7426b5fc261046501ca418fe0e69ad1d6ba59be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10477: 10477
  IGT_7656: 149297384db8cab03928c12b37ae1bb61089bdad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/index.html

--===============9091955375071553736==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dsc: add new constraint</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128239/">https://patchwork.freedesktop.org/series/128239/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14080 -&gt; IGTPW_10477</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10477 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10477, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10477:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10477 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-adls-6/igt@i915_selftest@live@gt_engines.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-adls-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-adls-6/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-adls-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14080/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9368">i915#9368</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9897">i915#9897</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10477/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7656 -&gt; IGTPW_10477</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14080: d7426b5fc261046501ca418fe0e69ad1d6ba59be @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10477: 10477<br />
  IGT_7656: 149297384db8cab03928c12b37ae1bb61089bdad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9091955375071553736==--
