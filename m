Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Mar 2021 16:39:29 -0000
Message-ID: <161608556922.12740.7491233395915924435@emeril.freedesktop.org>
References: <20210318012952.53562-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210318012952.53562-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparallel=3A_Drop_gem=5Frequire=5Fpread=5Fpwrite_che?=
 =?utf-8?q?ck_from_userptr_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1976663329=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1976663329==
Content-Type: multipart/alternative;
 boundary="===============6142807564204397176=="

--===============6142807564204397176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_parallel: Drop gem_require_pread_pwrite check from userptr tests (rev2)
URL   : https://patchwork.freedesktop.org/series/88085/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9870 -> IGTPW_5623
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5623:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@userptr:
    - {fi-rkl-11500t}:    [SKIP][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-rkl-11500t/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/fi-rkl-11500t/igt@gem_exec_parallel@engines@userptr.html

  
Known issues
------------

  Here are the changes found in IGTPW_5623 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [PASS][3] -> [TIMEOUT][4] ([i915#2502] / [i915#3145]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6036 -> IGTPW_5623

  CI-20190529: 20190529
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html
  IGT_6036: 5b535494abcdf5ce2b9be99b7bb5df8ab4733083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html

--===============6142807564204397176==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_parallel: Drop gem_require_pread_pwrite check from userptr tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88085/">https://patchwork.freedesktop.org/series/88085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9870 -&gt; IGTPW_5623</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5623:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_parallel@engines@userptr:<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-rkl-11500t/igt@gem_exec_parallel@engines@userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/fi-rkl-11500t/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5623 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_linear_blits@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6036 -&gt; IGTPW_5623</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5623/index.html<br />
  IGT_6036: 5b535494abcdf5ce2b9be99b7bb5df8ab4733083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6142807564204397176==--

--===============1976663329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1976663329==--
