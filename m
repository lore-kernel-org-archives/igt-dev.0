Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8410698987025073816=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 27 Jun 2022 10:39:27 -0000
Message-ID: <165632636787.11794.13137803673972375626@emeril.freedesktop.org>
References: <20220627084630.120929-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220627084630.120929-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Fkms=3A_Add_a_helper_?=
 =?utf-8?q?to_check_the_max=5Fbpc_constraints?=
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

--===============8410698987025073816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_kms: Add a helper to check the max_bpc constraints
URL   : https://patchwork.freedesktop.org/series/105655/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11809 -> IGTPW_7392
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html

Participating hosts (40 -> 41)
------------------------------

  Additional (2): fi-hsw-4770 bat-dg2-9 
  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7392:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-adln-1}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adln-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-adln-1/igt@core_hotunplug@unbind-rebind.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11809 and IGTPW_7392:

### New IGT tests (6) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_7392 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-4770:        NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#3012])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [PASS][5] -> [INCOMPLETE][6] ([i915#4418])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1072]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][9] ([fdo#109295] / [i915#3301])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-tgl-u2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][10] ([i915#4494] / [i915#4957]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - fi-tgl-u2:          [DMESG-WARN][12] ([i915#402]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/fi-tgl-u2/igt@kms_busy@basic@modeset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-tgl-u2/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][14] ([i915#3576]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6542 -> IGTPW_7392

  CI-20190529: 20190529
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7392: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html

--===============8410698987025073816==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/igt_kms: Add a helper to check the max_bpc constraints</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105655/">https://patchwork.freedesktop.org/series/105655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11809 -&gt; IGTPW_7392</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html</p>
<h2>Participating hosts (40 -&gt; 41)</h2>
<p>Additional (2): fi-hsw-4770 bat-dg2-9 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7392:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11809 and IGTPW_7392:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7392 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/fi-tgl-u2/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/fi-tgl-u2/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6542 -&gt; IGTPW_7392</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7392: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7392/index.html<br />
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8410698987025073816==--
