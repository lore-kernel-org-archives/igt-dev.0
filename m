Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2383954895846023879=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Wed, 25 Oct 2023 17:58:13 -0000
Message-ID: <169825669383.20489.5771161293611403946@emeril.freedesktop.org>
References: <20231025142716.1019749-1-kunal1.joshi@intel.com>
In-Reply-To: <20231025142716.1019749-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_extend_k?=
 =?utf-8?q?ms=5Fpsr_test_to_validate_pr_=28rev2=29?=
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

--===============2383954895846023879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev2)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7557_BAT -> XEIGTPW_10066_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10066_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10066_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10066_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_psr@primary_page_flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         [SKIP][3] ([Intel XE#535]) -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-atsm-2/igt@kms_psr@cursor_plane_move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          [SKIP][5] ([Intel XE#535]) -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-pvc-2/igt@kms_psr@primary_page_flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-pvc-2/igt@kms_psr@primary_page_flip.html
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#535]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10066_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] ([i915#2346])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#524]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7557 -> IGTPW_10066
  * Linux: xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3 -> xe-447-a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08

  IGTPW_10066: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3: bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3
  xe-447-a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08: a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/index.html

--===============2383954895846023879==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7557_BAT -&gt; XEIGTPW_10066_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10066_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10066_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10066_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@kms_psr@primary_page_flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10066_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10066/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7557 -&gt; IGTPW_10066</li>
<li>Linux: xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3 -&gt; xe-447-a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08</li>
</ul>
<p>IGTPW_10066: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html<br />
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3: bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3<br />
  xe-447-a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08: a7f3ac69656bb7c3a41f68c92b38ffa488e0ed08</p>

</body>
</html>

--===============2383954895846023879==--
