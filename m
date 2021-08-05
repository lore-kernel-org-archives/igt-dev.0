Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4591010057679466340=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Aug 2021 05:55:14 -0000
Message-ID: <162814291449.30835.11098299789274949747@emeril.freedesktop.org>
References: <20210805051716.278860-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210805051716.278860-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Fix_mode_selection_for_Nx_tests_=28rev2=29?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4591010057679466340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Fix mode selection for Nx tests (rev2)
URL   : https://patchwork.freedesktop.org/series/90525/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10446 -> IGTPW_6090
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html

Known issues
------------

  Here are the changes found in IGTPW_6090 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1] ([fdo#109271]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-8809g:       NOTRUN -> [INCOMPLETE][2] ([i915#155])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@gem_exec_suspend@basic-s3.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - fi-kbl-8809g:       [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10446/fi-kbl-8809g/igt@core_auth@basic-auth.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@core_auth@basic-auth.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Participating hosts (35 -> 33)
------------------------------

  Missing    (2): fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6159 -> IGTPW_6090

  CI-20190529: 20190529
  CI_DRM_10446: 7b039c201fce9777a2a3304cdf7cf6d8cc6bd33d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html
  IGT_6159: 6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html

--===============4591010057679466340==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Fix mode selection for Nx tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90525/">https://patchwork.freedesktop.org/series/90525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10446 -&gt; IGTPW_6090</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6090 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10446/fi-kbl-8809g/igt@core_auth@basic-auth.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/fi-kbl-8809g/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (35 -&gt; 33)</h2>
<p>Missing    (2): fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6159 -&gt; IGTPW_6090</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10446: 7b039c201fce9777a2a3304cdf7cf6d8cc6bd33d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6090/index.html<br />
  IGT_6159: 6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4591010057679466340==--
