Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1605072747229971939=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 02 Nov 2022 17:45:56 -0000
Message-ID: <166741115659.23605.12038945239527732496@emeril.freedesktop.org>
References: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fbacklight=3A_Add_new_subtest_to_validate_dual_?=
 =?utf-8?q?panel_backlight_=28rev5=29?=
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

--===============1605072747229971939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev5)
URL   : https://patchwork.freedesktop.org/series/108246/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12332 -> IGTPW_8038
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8038 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8038, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html

Participating hosts (40 -> 28)
------------------------------

  Missing    (12): bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adlp-4 bat-adln-1 bat-rplp-1 bat-rpls-1 bat-rpls-2 bat-dg2-11 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8038:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-adl-ddr5:        [SKIP][1] ([i915#1155]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][3] ([i915#3012]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_backlight@basic-brightness:
    - {fi-tgl-mst}:       [SKIP][5] ([i915#1155]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12332 and IGTPW_8038:

### New IGT tests (1) ###

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.21, 0.24] s

  

Known issues
------------

  Here are the changes found in IGTPW_8038 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-bxt-dsi:         [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
    - fi-snb-2520m:       [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][12] ([i915#5334]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-adl-ddr5:        [DMESG-WARN][14] ([i915#5591]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html
    - fi-hsw-g3258:       [INCOMPLETE][16] ([i915#3303] / [i915#4785]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-g3258:       [SKIP][18] ([fdo#109271] / [i915#3012]) -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
    - fi-hsw-4770:        [SKIP][20] ([fdo#109271] / [i915#3012]) -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7038 -> IGTPW_8038

  CI-20190529: 20190529
  CI_DRM_12332: 601b2ef606e4b83d5518aa6a5011bb2b1c5954d9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html
  IGT_7038: 5389b3f3b9b75df6bd8506e4aa3da357fd0c0ab1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_backlight@fade-with-dpms
+igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_backlight@fade_with_dpms
-igt@i915_pm_backlight@fade_with_suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html

--===============1605072747229971939==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108246/">https://patchwork.freedesktop.org/series/108246/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12332 -&gt; IGTPW_8038</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8038 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8038, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html</p>
<h2>Participating hosts (40 -&gt; 28)</h2>
<p>Missing    (12): bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adlp-4 bat-adln-1 bat-rplp-1 bat-rpls-1 bat-rpls-2 bat-dg2-11 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8038:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_backlight@basic-brightness:<ul>
<li>{fi-tgl-mst}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12332 and IGTPW_8038:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_pm_backlight@basic-brightness@edp-1:<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.21, 0.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8038 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-adl-ddr5/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12332/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7038 -&gt; IGTPW_8038</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12332: 601b2ef606e4b83d5518aa6a5011bb2b1c5954d9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8038/index.html<br />
  IGT_7038: 5389b3f3b9b75df6bd8506e4aa3da357fd0c0ab1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_backlight@fade-with-dpms<br />
+igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_backlight@fade_with_dpms<br />
-igt@i915_pm_backlight@fade_with_suspend</p>

</body>
</html>

--===============1605072747229971939==--
