Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8016574816889028438=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Oct 2021 23:16:54 -0000
Message-ID: <163347581468.19280.9775901876195975159@emeril.freedesktop.org>
References: <20211005222935.42609-1-ashutosh.dixit@intel.com>
In-Reply-To: <20211005222935.42609-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Refactor_construction_o?=
 =?utf-8?q?f_unique_tokens?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8016574816889028438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Refactor construction of unique tokens
URL   : https://patchwork.freedesktop.org/series/95485/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10685 -> IGTPW_6291
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html

Known issues
------------

  Here are the changes found in IGTPW_6291 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cfl-8109u:       [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][5] ([i915#1888]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][7] ([i915#95]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (41 -> 21)
------------------------------

  Missing    (20): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 fi-bsw-n3050 fi-hsw-4200u fi-glk-dsi fi-icl-u2 fi-bwr-2160 fi-apl-guc fi-snb-2520m fi-ctg-p8600 fi-tgl-1115g4 fi-bsw-cyan bat-adlp-4 fi-ivb-3770 fi-icl-y fi-bsw-kefka fi-bsw-nick bat-jsl-1 fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6232 -> IGTPW_6291

  CI-20190529: 20190529
  CI_DRM_10685: 36c3656c997b07f326d6b967efb1b75e01713773 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6291: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html
  IGT_6232: effad6af5678be711a2c3e58e182319de784de54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html

--===============8016574816889028438==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib: Refactor construction of unique tokens</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95485/">https://patchwork.freedesktop.org/series/95485/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10685 -&gt; IGTPW_6291</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6291 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10685/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 21)</h2>
<p>Missing    (20): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 fi-bsw-n3050 fi-hsw-4200u fi-glk-dsi fi-icl-u2 fi-bwr-2160 fi-apl-guc fi-snb-2520m fi-ctg-p8600 fi-tgl-1115g4 fi-bsw-cyan bat-adlp-4 fi-ivb-3770 fi-icl-y fi-bsw-kefka fi-bsw-nick bat-jsl-1 fi-kbl-r </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6232 -&gt; IGTPW_6291</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10685: 36c3656c997b07f326d6b967efb1b75e01713773 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6291: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6291/index.html<br />
  IGT_6232: effad6af5678be711a2c3e58e182319de784de54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8016574816889028438==--
