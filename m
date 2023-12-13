Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2043887270663379995=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_intel-ci/xe=2Eblocklist=3A_?=
 =?utf-8?q?add_i915_specific_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 13 Dec 2023 07:02:02 -0000
Message-ID: <170245092245.10264.6145629783243096071@emeril.freedesktop.org>
References: <20231213050829.291455-1-swati2.sharma@intel.com>
In-Reply-To: <20231213050829.291455-1-swati2.sharma@intel.com>
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

--===============2043887270663379995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci/xe.blocklist: add i915 specific tests
URL   : https://patchwork.freedesktop.org/series/127734/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7636 -> IGTPW_10409
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10409 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10409, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html

Participating hosts (36 -> 33)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (4): bat-adlp-11 fi-bsw-n3050 fi-apl-guc fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10409:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem_contexts:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_10409 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +28 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][5] ([fdo#109271]) +36 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][6] ([i915#8668])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [INCOMPLETE][7] ([i915#9275]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-8:          [INCOMPLETE][9] ([i915#9275]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][11] ([i915#8668]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7636 -> IGTPW_10409

  CI-20190529: 20190529
  CI_DRM_14010: b4182ec1538e8cebf630083ec4296bed0061d594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10409: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html
  IGT_7636: 7636


Testlist changes
----------------

-igt@kms_vrr@flip-basic-fastset
-igt@kms_vrr@seamless-rr-switch-drrs
-igt@kms_vrr@seamless-rr-switch-vrr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html

--===============2043887270663379995==
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
<tr><td><b>Series:</b></td><td>intel-ci/xe.blocklist: add i915 specific tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127734/">https://patchwork.freedesktop.org/series/127734/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7636 -&gt; IGTPW_10409</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10409 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10409, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html</p>
<h2>Participating hosts (36 -&gt; 33)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (4): bat-adlp-11 fi-bsw-n3050 fi-apl-guc fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10409:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10409 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7636 -&gt; IGTPW_10409</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14010: b4182ec1538e8cebf630083ec4296bed0061d594 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10409: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10409/index.html<br />
  IGT_7636: 7636</p>
<h2>Testlist changes</h2>
<p>-igt@kms_vrr@flip-basic-fastset<br />
-igt@kms_vrr@seamless-rr-switch-drrs<br />
-igt@kms_vrr@seamless-rr-switch-vrr</p>

</body>
</html>

--===============2043887270663379995==--
