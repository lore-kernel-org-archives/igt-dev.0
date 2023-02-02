Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0316648706179387263=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 02 Feb 2023 18:22:03 -0000
Message-ID: <167536212384.11113.7431236980426627727@emeril.freedesktop.org>
References: <20230202172744.22955-1-nirmoy.das@intel.com>
In-Reply-To: <20230202172744.22955-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparams=3A_Cross-check_getparam_against_engine_execu?=
 =?utf-8?q?tion_=28rev3=29?=
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

--===============0316648706179387263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_params: Cross-check getparam against engine execution (rev3)
URL   : https://patchwork.freedesktop.org/series/113556/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12684 -> IGTPW_8436
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html

Participating hosts (27 -> 25)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8436 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-dg1-6:          NOTRUN -> [SKIP][1] ([i915#7828])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-dg1-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-n3050:       [PASS][2] -> [FAIL][3] ([i915#6298])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg1-6:          [ABORT][4] ([i915#4983]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-dg1-6/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-dg1-6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-rpls-2}:       [DMESG-FAIL][6] ([i915#4258]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [ABORT][8] ([i915#4983]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-rpls-2/igt@i915_selftest@live@reset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7102]: https://gitlab.freedesktop.org/drm/intel/issues/7102
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7144 -> IGTPW_8436

  CI-20190529: 20190529
  CI_DRM_12684: 57eb8680d3ef1213de1d9c607b95e522035036e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8436: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html
  IGT_7144: cda71bf809b981a646270963d6b1ccee4fd4643b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@perf@barrier-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html

--===============0316648706179387263==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_params: Cross-check getparam against engine execution (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113556/">https://patchwork.freedesktop.org/series/113556/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12684 -&gt; IGTPW_8436</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html</p>
<h2>Participating hosts (27 -&gt; 25)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8436 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-dg1-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-dg1-6/igt@i915_selftest@live@gt_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-dg1-6/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12684/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7144 -&gt; IGTPW_8436</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12684: 57eb8680d3ef1213de1d9c607b95e522035036e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8436: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8436/index.html<br />
  IGT_7144: cda71bf809b981a646270963d6b1ccee4fd4643b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@perf@barrier-race</p>

</body>
</html>

--===============0316648706179387263==--
