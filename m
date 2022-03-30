Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6741319357535192837=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 30 Mar 2022 19:25:15 -0000
Message-ID: <164866831562.8653.13322738576212649266@emeril.freedesktop.org>
References: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVW5sb2Fk?=
 =?utf-8?q?_mei=5Fgsc_before_i915?=
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

--===============6741319357535192837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Unload mei_gsc before i915
URL   : https://patchwork.freedesktop.org/series/101973/
State : success

== Summary ==

CI Bug Log - changes from IGT_6401 -> IGTPW_6847
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html

Participating hosts (44 -> 42)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (3): bat-rpls-1 fi-bsw-cyan fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6847:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_store@basic:
    - {bat-dg2-9}:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-dg2-9/igt@gem_exec_store@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-dg2-9/igt@gem_exec_store@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_6847 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {fi-rkl-11600}:     [INCOMPLETE][3] ([i915#5127]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@execlists:
    - {bat-jsl-2}:        [INCOMPLETE][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-jsl-2/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-jsl-2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@perf:
    - {bat-jsl-1}:        [INCOMPLETE][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-jsl-1/igt@i915_selftest@live@perf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-jsl-1/igt@i915_selftest@live@perf.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5482]: https://gitlab.freedesktop.org/drm/intel/issues/5482


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6401 -> IGTPW_6847

  CI-20190529: 20190529
  CI_DRM_11416: 1dc2c6953e2689a0e5b7cca8450da14059d35f03 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6847: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html
  IGT_6401: 7ee1289c5b3d3e02ec86f59f60fe304dce550be1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html

--===============6741319357535192837==
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
<tr><td><b>Series:</b></td><td>Unload mei_gsc before i915</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101973/">https://patchwork.freedesktop.org/series/101973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6401 -&gt; IGTPW_6847</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (3): bat-rpls-1 fi-bsw-cyan fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6847:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_store@basic:<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-dg2-9/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-dg2-9/igt@gem_exec_store@basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6847 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{fi-rkl-11600}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5127">i915#5127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>{bat-jsl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-jsl-2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-jsl-2/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/bat-jsl-1/igt@i915_selftest@live@perf.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/bat-jsl-1/igt@i915_selftest@live@perf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6401/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6401 -&gt; IGTPW_6847</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11416: 1dc2c6953e2689a0e5b7cca8450da14059d35f03 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6847: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6847/index.html<br />
  IGT_6401: 7ee1289c5b3d3e02ec86f59f60fe304dce550be1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6741319357535192837==--
