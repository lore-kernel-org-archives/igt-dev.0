Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8143117370271674993=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 05 Jul 2023 10:18:34 -0000
Message-ID: <168855231429.24205.15501145012672475565@emeril.freedesktop.org>
References: <20230705085259.533791-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230705085259.533791-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSGFuZGxl?=
 =?utf-8?q?_GT_and_tile_seperation_in_IGT_=28rev4=29?=
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

--===============8143117370271674993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle GT and tile seperation in IGT (rev4)
URL   : https://patchwork.freedesktop.org/series/119801/
State : success

== Summary ==

CI Bug Log - changes from IGT_7370 -> IGTPW_9336
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html

Participating hosts (41 -> 24)
------------------------------

  Missing    (17): bat-adlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-cfl-8700k fi-snb-2520m bat-dg1-8 fi-hsw-4770 bat-adln-1 fi-kbl-x1275 fi-kbl-8809g bat-atsm-1 fi-ivb-3770 fi-cfl-8109u bat-rplp-1 bat-rpls-1 fi-bsw-nick 

Known issues
------------

  Here are the changes found in IGTPW_9336 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] ([i915#7077] / [i915#7977] / [i915#8668])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#6367])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][5] ([fdo#109271]) +38 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7370 -> IGTPW_9336

  CI-20190529: 20190529
  CI_DRM_13345: 52c775d5fac7e50737584ba6cf643c1166d95855 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9336: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html
  IGT_7370: f63ab5e7c3ddef724bebde558e36647ca65d98bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_sysfs_tile_prop@physical_vram_size_bytes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html

--===============8143117370271674993==
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
<tr><td><b>Series:</b></td><td>Handle GT and tile seperation in IGT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119801/">https://patchwork.freedesktop.org/series/119801/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7370 -&gt; IGTPW_9336</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html</p>
<h2>Participating hosts (41 -&gt; 24)</h2>
<p>Missing    (17): bat-adlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-cfl-8700k fi-snb-2520m bat-dg1-8 fi-hsw-4770 bat-adln-1 fi-kbl-x1275 fi-kbl-8809g bat-atsm-1 fi-ivb-3770 fi-cfl-8109u bat-rplp-1 bat-rpls-1 fi-bsw-nick </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9336 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7370 -&gt; IGTPW_9336</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13345: 52c775d5fac7e50737584ba6cf643c1166d95855 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9336: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9336/index.html<br />
  IGT_7370: f63ab5e7c3ddef724bebde558e36647ca65d98bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_sysfs_tile_prop@physical_vram_size_bytes</p>

</body>
</html>

--===============8143117370271674993==--
