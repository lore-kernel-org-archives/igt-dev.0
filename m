Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7528553102876947937=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Add_LNL_compute_preempt_tes?=
 =?utf-8?q?t_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Tue, 16 Jan 2024 22:10:13 -0000
Message-ID: <170544301365.519235.15556888633776734350@5338d5abeb45>
References: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
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

--===============7528553102876947937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add LNL compute preempt test (rev2)
URL   : https://patchwork.freedesktop.org/series/128043/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14129 -> IGTPW_10537
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/index.html

Participating hosts (39 -> 36)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (4): bat-mtlp-8 bat-rpls-2 bat-jsl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10537 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-8:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14129/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +31 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][4] -> [INCOMPLETE][5] ([i915#9413])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14129/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7675 -> IGTPW_10537

  CI-20190529: 20190529
  CI_DRM_14129: b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10537: 10537
  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_compute_preempt@compute-preempt
-igt@xe_exec_atomic@basic-dec-all
-igt@xe_exec_atomic@basic-inc-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/index.html

--===============7528553102876947937==
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
<tr><td><b>Series:</b></td><td>Add LNL compute preempt test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128043/">https://patchwork.freedesktop.org/series/128043/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14129 -&gt; IGTPW_10537</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (4): bat-mtlp-8 bat-rpls-2 bat-jsl-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10537 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14129/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14129/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10537/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7675 -&gt; IGTPW_10537</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14129: b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10537: 10537<br />
  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_compute_preempt@compute-preempt<br />
-igt@xe_exec_atomic@basic-dec-all<br />
-igt@xe_exec_atomic@basic-inc-all</p>

</body>
</html>

--===============7528553102876947937==--
