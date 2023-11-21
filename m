Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5232119368181712944=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Tue, 21 Nov 2023 10:54:41 -0000
Message-ID: <170056408177.30157.13861901375765674569@emeril.freedesktop.org>
References: <20231121062320.1860993-1-jeevan.b@intel.com>
In-Reply-To: <20231121062320.1860993-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIEZC?=
 =?utf-8?q?C_support_to_PSR/PSR2_tests_=28rev2=29?=
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

--===============5232119368181712944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FBC support to PSR/PSR2 tests (rev2)
URL   : https://patchwork.freedesktop.org/series/126689/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13904 -> IGTPW_10225
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html

Participating hosts (28 -> 26)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (3): bat-jsl-1 fi-snb-2520m bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10225:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr_primary_mmap_gtt}:
    - fi-rkl-11600:       [SKIP][1] ([i915#9673]) -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-adlm-1:         [SKIP][3] ([i915#9673]) -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html
    - fi-tgl-1115g4:      [SKIP][5] ([i915#9673]) -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-mtlp-6:         [SKIP][7] ([i915#9673]) -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_10225 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][9] ([fdo#109271]) +25 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7595 -> IGTPW_10225

  CI-20190529: 20190529
  CI_DRM_13904: e7f3669de4cd241d80b35b37ddf7c5e0a2129516 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10225: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html

--===============5232119368181712944==
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
<tr><td><b>Series:</b></td><td>Add FBC support to PSR/PSR2 tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126689/">https://patchwork.freedesktop.org/series/126689/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13904 -&gt; IGTPW_10225</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html</p>
<h2>Participating hosts (28 -&gt; 26)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (3): bat-jsl-1 fi-snb-2520m bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10225:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr_primary_mmap_gtt}:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13904/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10225 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@basic:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7595 -&gt; IGTPW_10225</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13904: e7f3669de4cd241d80b35b37ddf7c5e0a2129516 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10225: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10225/index.html<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5232119368181712944==--
