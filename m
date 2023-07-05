Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4346634367185653296=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Wed, 05 Jul 2023 09:45:00 -0000
Message-ID: <168855030089.24205.5960145464790956336@emeril.freedesktop.org>
References: <20230705084658.246195-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230705084658.246195-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_helper_with_DPMS_to_turn_on_and_off_the_displays?=
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

--===============4346634367185653296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Add helper with DPMS to turn on and off the displays
URL   : https://patchwork.freedesktop.org/series/120215/
State : success

== Summary ==

CI Bug Log - changes from IGT_7370 -> IGTPW_9335
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html

Participating hosts (41 -> 23)
------------------------------

  Missing    (18): bat-adlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-cfl-8700k bat-adlp-6 fi-snb-2520m bat-dg1-8 fi-hsw-4770 bat-adln-1 fi-kbl-x1275 fi-kbl-8809g bat-atsm-1 fi-ivb-3770 fi-cfl-8109u bat-rplp-1 bat-rpls-1 fi-bsw-nick 

Known issues
------------

  Here are the changes found in IGTPW_9335 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#7059])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +38 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7370 -> IGTPW_9335

  CI-20190529: 20190529
  CI_DRM_13345: 52c775d5fac7e50737584ba6cf643c1166d95855 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html
  IGT_7370: f63ab5e7c3ddef724bebde558e36647ca65d98bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html

--===============4346634367185653296==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Add helper with DPMS to turn on and off the displays</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120215/">https://patchwork.freedesktop.org/series/120215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7370 -&gt; IGTPW_9335</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html</p>
<h2>Participating hosts (41 -&gt; 23)</h2>
<p>Missing    (18): bat-adlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-cfl-8700k bat-adlp-6 fi-snb-2520m bat-dg1-8 fi-hsw-4770 bat-adln-1 fi-kbl-x1275 fi-kbl-8809g bat-atsm-1 fi-ivb-3770 fi-cfl-8109u bat-rplp-1 bat-rpls-1 fi-bsw-nick </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9335 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7370/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7370 -&gt; IGTPW_9335</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13345: 52c775d5fac7e50737584ba6cf643c1166d95855 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9335/index.html<br />
  IGT_7370: f63ab5e7c3ddef724bebde558e36647ca65d98bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4346634367185653296==--
