Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4798226802164337663=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 26 Sep 2022 14:31:34 -0000
Message-ID: <166420269414.15109.16475680610415400722@emeril.freedesktop.org>
References: <20220926133233.32592-1-nirmoy.das@intel.com>
In-Reply-To: <20220926133233.32592-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Create_dynamic_subtest?=
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

--===============4798226802164337663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ringfill: Create dynamic subtest
URL   : https://patchwork.freedesktop.org/series/109054/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12182 -> IGTPW_7842
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html

Participating hosts (48 -> 46)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (3): fi-bdw-samus bat-adls-5 bat-dg1-6 

New tests
---------

  New tests have been introduced between CI_DRM_12182 and IGTPW_7842:

### New IGT tests (10) ###

  * igt@gem_ringfill@basic-all@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [1.08, 1.19] s

  * igt@gem_ringfill@basic-all@ccs0:
    - Statuses : 3 pass(s)
    - Exec time: [1.17] s

  * igt@gem_ringfill@basic-all@ccs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.16, 1.18] s

  * igt@gem_ringfill@basic-all@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [1.18] s

  * igt@gem_ringfill@basic-all@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [1.16, 1.18] s

  * igt@gem_ringfill@basic-all@rcs0:
    - Statuses : 41 pass(s)
    - Exec time: [1.09, 1.21] s

  * igt@gem_ringfill@basic-all@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [1.08, 1.20] s

  * igt@gem_ringfill@basic-all@vcs1:
    - Statuses : 15 pass(s)
    - Exec time: [1.08, 1.20] s

  * igt@gem_ringfill@basic-all@vecs0:
    - Statuses : 34 pass(s)
    - Exec time: [1.08, 1.21] s

  * igt@gem_ringfill@basic-all@vecs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.15, 1.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_7842 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271] / [fdo#111827])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][3] ([i915#2867]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
    - {bat-adlm-1}:       [DMESG-WARN][5] ([i915#2867]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][7] ([i915#3303] / [i915#4785]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5828]: https://gitlab.freedesktop.org/drm/intel/issues/5828
  [i915#6856]: https://gitlab.freedesktop.org/drm/intel/issues/6856


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6663 -> IGTPW_7842

  CI-20190529: 20190529
  CI_DRM_12182: 8ad031bd195081f699414339ac21fa46dd0b8e2d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7842: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html
  IGT_6663: 5e232c77cd762147e0882c337a984121fabb1c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html

--===============4798226802164337663==
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
<tr><td><b>Series:</b></td><td>i915/gem_ringfill: Create dynamic subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109054/">https://patchwork.freedesktop.org/series/109054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12182 -&gt; IGTPW_7842</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html</p>
<h2>Participating hosts (48 -&gt; 46)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (3): fi-bdw-samus bat-adls-5 bat-dg1-6 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12182 and IGTPW_7842:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@gem_ringfill@basic-all@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.08, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@rcs0:</p>
<ul>
<li>Statuses : 41 pass(s)</li>
<li>Exec time: [1.09, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.08, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vcs1:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [1.08, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vecs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [1.08, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vecs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15, 1.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7842 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12182/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6663 -&gt; IGTPW_7842</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12182: 8ad031bd195081f699414339ac21fa46dd0b8e2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7842: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7842/index.html<br />
  IGT_6663: 5e232c77cd762147e0882c337a984121fabb1c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4798226802164337663==--
