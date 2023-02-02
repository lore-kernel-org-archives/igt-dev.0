Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8407090072407614987=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 02 Feb 2023 06:00:45 -0000
Message-ID: <167531764506.11115.119358123561809385@emeril.freedesktop.org>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230202051509.28983-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTGltaXQg?=
 =?utf-8?q?the_execution_to_few_pipes/planes_=28rev2=29?=
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

--===============8407090072407614987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit the execution to few pipes/planes (rev2)
URL   : https://patchwork.freedesktop.org/series/113526/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12681 -> IGTPW_8430
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8430 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8430, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html

Participating hosts (25 -> 25)
------------------------------

  Additional (1): fi-apl-guc 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8430:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg1-6:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12681/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  
Known issues
------------

  Here are the changes found in IGTPW_8430 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - fi-blb-e6850:       [PASS][3] -> [SKIP][4] ([fdo#109271]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12681/fi-blb-e6850/igt@fbdev@write.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-blb-e6850/igt@fbdev@write.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][6] ([fdo#109271]) +21 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7143 -> IGTPW_8430

  CI-20190529: 20190529
  CI_DRM_12681: 8ee2ec597aa4b8331124bf852432c2ca2fd7b8d1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_plane_alpha_blend@alpha-7efc
-igt@kms_plane_alpha_blend@alpha-basic
-igt@kms_plane_alpha_blend@alpha-opaque-fb
-igt@kms_plane_alpha_blend@alpha-transparent-fb
-igt@kms_plane_alpha_blend@constant-alpha-max
-igt@kms_plane_alpha_blend@constant-alpha-mid
-igt@kms_plane_alpha_blend@constant-alpha-min
-igt@kms_plane_alpha_blend@coverage-7efc
-igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html

--===============8407090072407614987==
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
<tr><td><b>Series:</b></td><td>Limit the execution to few pipes/planes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113526/">https://patchwork.freedesktop.org/series/113526/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12681 -&gt; IGTPW_8430</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8430 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8430, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html</p>
<h2>Participating hosts (25 -&gt; 25)</h2>
<p>Additional (1): fi-apl-guc <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8430:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-modifier-no-flag:<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12681/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/bat-dg1-6/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8430 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12681/fi-blb-e6850/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-blb-e6850/igt@fbdev@write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7143 -&gt; IGTPW_8430</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12681: 8ee2ec597aa4b8331124bf852432c2ca2fd7b8d1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8430/index.html<br />
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_plane_alpha_blend@alpha-7efc<br />
-igt@kms_plane_alpha_blend@alpha-basic<br />
-igt@kms_plane_alpha_blend@alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@constant-alpha-max<br />
-igt@kms_plane_alpha_blend@constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@constant-alpha-min<br />
-igt@kms_plane_alpha_blend@coverage-7efc<br />
-igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant</p>

</body>
</html>

--===============8407090072407614987==--
