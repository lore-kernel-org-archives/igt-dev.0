Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 Feb 2021 14:37:15 -0000
Message-ID: <161279503571.27713.1212213539881753949@emeril.freedesktop.org>
References: <20210208102439.29463-1-petri.latvala@intel.com>
In-Reply-To: <20210208102439.29463-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Handle_graceful_exit_regardless_of_log_level?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1671895761=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1671895761==
Content-Type: multipart/alternative;
 boundary="===============7248165087671781042=="

--===============7248165087671781042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Handle graceful exit regardless of log level
URL   : https://patchwork.freedesktop.org/series/86836/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9747 -> IGTPW_5490
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html

Known issues
------------

  Here are the changes found in IGTPW_5490 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][1] ([fdo#109271]) +25 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#1982] / [i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271]) +23 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][7] ([i915#1886] / [i915#2291])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#533])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#533])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][12] -> [DMESG-WARN][13] ([i915#402]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [DMESG-WARN][14] ([i915#402]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (42 -> 37)
------------------------------

  Additional (2): fi-kbl-soraka fi-cfl-8700k 
  Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5998 -> IGTPW_5490

  CI-20190529: 20190529
  CI_DRM_9747: 65d67e70f9f78c7f8c2796956fdbdb69cffc7c98 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5490: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html
  IGT_5998: b0160aad9e547d2205341e0b6783e12aa143566e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html

--===============7248165087671781042==
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
<tr><td><b>Series:</b></td><td>runner: Handle graceful exit regardless of log level</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86836/">https://patchwork.freedesktop.org/series/86836/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9747 -&gt; IGTPW_5490</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5490 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_self_import@basic-with_two_bos:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9747/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (2): fi-kbl-soraka fi-cfl-8700k <br />
  Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5998 -&gt; IGTPW_5490</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9747: 65d67e70f9f78c7f8c2796956fdbdb69cffc7c98 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5490: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5490/index.html<br />
  IGT_5998: b0160aad9e547d2205341e0b6783e12aa143566e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7248165087671781042==--

--===============1671895761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1671895761==--
