Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0310024292084492871=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 17 Aug 2023 07:41:40 -0000
Message-ID: <169225810086.12434.11969276584728876002@emeril.freedesktop.org>
References: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbWVzb25f?=
 =?utf-8?q?options=3A_Disable_testplan_by_default?=
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

--===============0310024292084492871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: meson_options: Disable testplan by default
URL   : https://patchwork.freedesktop.org/series/122553/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13528 -> IGTPW_9607
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9607 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        NOTRUN -> [ABORT][1] ([i915#8011])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][2] -> [ABORT][3] ([i915#7982])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [ABORT][4] ([i915#7913]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-8:          [DMESG-FAIL][6] ([i915#7913]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-dg2-8/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-dg2-8/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [ABORT][8] ([i915#4423]) -> [DMESG-WARN][9] ([i915#4423])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-adlp-11/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         [SKIP][10] ([i915#1072]) -> [ABORT][11] ([i915#8469] / [i915#8668])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7441 -> IGTPW_9607

  CI-20190529: 20190529
  CI_DRM_13528: a7c0be10a6b6a23017681cc609c1353711dc70e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html
  IGT_7441: 152bb04fd1297075b5d0b1c4487dac8e9a70d070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_pm_residency@toggle-gt-c6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html

--===============0310024292084492871==
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
<tr><td><b>Series:</b></td><td>meson_options: Disable testplan by default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122553/">https://patchwork.freedesktop.org/series/122553/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13528 -&gt; IGTPW_9607</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9607 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-dg2-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-dg2-8/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13528/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7441 -&gt; IGTPW_9607</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13528: a7c0be10a6b6a23017681cc609c1353711dc70e7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9607/index.html<br />
  IGT_7441: 152bb04fd1297075b5d0b1c4487dac8e9a70d070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_pm_residency@toggle-gt-c6</p>

</body>
</html>

--===============0310024292084492871==--
