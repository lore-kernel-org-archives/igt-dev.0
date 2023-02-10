Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3286479821414252434=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Fri, 10 Feb 2023 15:42:25 -0000
Message-ID: <167604374507.7875.9020721362944894627@emeril.freedesktop.org>
References: <20230209044219.4498-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230209044219.4498-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_Limit_the_test_execution_=28rev5?=
 =?utf-8?q?=29?=
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

--===============3286479821414252434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: Limit the test execution (rev5)
URL   : https://patchwork.freedesktop.org/series/113776/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12723 -> IGTPW_8481
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-kbl-soraka bat-kbl-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8481:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@requests:
    - {bat-adlm-1}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-adlm-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-adlm-1/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_8481 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - fi-blb-e6850:       [PASS][3] -> [SKIP][4] ([fdo#109271]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/fi-blb-e6850/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/fi-blb-e6850/igt@fbdev@write.html

  * igt@i915_module_load@load:
    - fi-cfl-guc:         [PASS][5] -> [ABORT][6] ([i915#8141])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/fi-cfl-guc/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/fi-cfl-guc/igt@i915_module_load@load.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@migrate:
    - {bat-atsm-1}:       [DMESG-FAIL][7] ([i915#7699]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [ABORT][9] ([i915#4983]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-rpls-2/igt@i915_selftest@live@reset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-rpls-2/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
  [i915#8141]: https://gitlab.freedesktop.org/drm/intel/issues/8141


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7155 -> IGTPW_8481

  CI-20190529: 20190529
  CI_DRM_12723: f07c78a0aa8293873119176b462f58f21b74baf6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8481: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html
  IGT_7155: 75c508d4e19c65683d4060cb3a772df600aaf23e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_ctx_exec@barrier-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html

--===============3286479821414252434==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: Limit the test execution (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113776/">https://patchwork.freedesktop.org/series/113776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12723 -&gt; IGTPW_8481</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-kbl-soraka bat-kbl-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8481:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-adlm-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-adlm-1/igt@i915_selftest@live@requests.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8481 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/fi-blb-e6850/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/fi-blb-e6850/igt@fbdev@write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/fi-cfl-guc/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/fi-cfl-guc/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8141">i915#8141</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-atsm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12723/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7155 -&gt; IGTPW_8481</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12723: f07c78a0aa8293873119176b462f58f21b74baf6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8481: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8481/index.html<br />
  IGT_7155: 75c508d4e19c65683d4060cb3a772df600aaf23e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_ctx_exec@barrier-race</p>

</body>
</html>

--===============3286479821414252434==--
