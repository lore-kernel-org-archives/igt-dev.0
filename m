Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4087770807668733290=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/perf=5Fpmu=3A_Set_def?=
 =?utf-8?q?aults_before_frequency_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Thu, 11 Jan 2024 23:34:18 -0000
Message-ID: <170501605878.290000.2720917775519946602@5338d5abeb45>
References: <20240111222054.2403101-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240111222054.2403101-1-vinay.belgaumkar@intel.com>
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

--===============4087770807668733290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/perf_pmu: Set defaults before frequency test
URL   : https://patchwork.freedesktop.org/series/128695/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14116 -> IGTPW_10517
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10517 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10517, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html

Participating hosts (37 -> 26)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (12): fi-rkl-11600 fi-skl-guc fi-tgl-1115g4 bat-dg2-9 fi-cfl-guc fi-snb-2520m fi-ivb-3770 fi-elk-e7500 bat-rplp-1 fi-blb-e6850 bat-dg2-11 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10517:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@coherency:
    - bat-adlm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-adlm-1/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-adlm-1/igt@i915_selftest@live@coherency.html

  
Known issues
------------

  Here are the changes found in IGTPW_10517 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] ([fdo#109271]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-skl-6600u:       [INCOMPLETE][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-rpls-3}:       [DMESG-WARN][6] ([i915#5591]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
    - {bat-dg2-14}:       [ABORT][8] ([i915#9840]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-dg2-14/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-dg2-14/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9840]: https://gitlab.freedesktop.org/drm/intel/issues/9840


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7670 -> IGTPW_10517

  CI-20190529: 20190529
  CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html

--===============4087770807668733290==
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
<tr><td><b>Series:</b></td><td>tests/perf_pmu: Set defaults before frequency test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128695/">https://patchwork.freedesktop.org/series/128695/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14116 -&gt; IGTPW_10517</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10517 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10517, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html</p>
<h2>Participating hosts (37 -&gt; 26)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (12): fi-rkl-11600 fi-skl-guc fi-tgl-1115g4 bat-dg2-9 fi-cfl-guc fi-snb-2520m fi-ivb-3770 fi-elk-e7500 bat-rplp-1 fi-blb-e6850 bat-dg2-11 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10517:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@coherency:<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-adlm-1/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-adlm-1/igt@i915_selftest@live@coherency.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10517 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@random-engines:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14116/bat-dg2-14/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9840">i915#9840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/bat-dg2-14/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7670 -&gt; IGTPW_10517</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html<br />
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4087770807668733290==--
