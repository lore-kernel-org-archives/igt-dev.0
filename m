Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 09 Jan 2021 12:46:22 -0000
Message-ID: <161019638245.8889.7047297636716149539@emeril.freedesktop.org>
References: <20210109120659.5737-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210109120659.5737-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_fix_crc_buffer_overflow_for_slow_platfo?=
 =?utf-8?q?rms?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0602105762=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0602105762==
Content-Type: multipart/alternative;
 boundary="===============5998387529630840394=="

--===============5998387529630840394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: fix crc buffer overflow for slow platforms
URL   : https://patchwork.freedesktop.org/series/85648/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9571 -> IGTPW_5372
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html

Known issues
------------

  Here are the changes found in IGTPW_5372 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][3] -> [FAIL][4] ([i915#1888])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       [PASS][5] -> [DMESG-WARN][6] ([i915#2605])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-kbl-7500u/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-kbl-7500u/igt@i915_module_load@reload.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@contexts:
    - fi-tgl-y:           [FAIL][7] ([i915#2780]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_exec_parallel@engines@contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#2411] / [i915#402]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_tiled_pread_basic:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_tiled_pread_basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_tiled_pread_basic.html

  
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#2780]: https://gitlab.freedesktop.org/drm/intel/issues/2780
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 37)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5953 -> IGTPW_5372

  CI-20190529: 20190529
  CI_DRM_9571: 707b4c70cf8fda42dedf74612233208661f287d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5372: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html
  IGT_5953: 65c5eea699141e6f942ce0a8fc85db76ce53cd19 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html

--===============5998387529630840394==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: fix crc buffer overflow for slow platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85648/">https://patchwork.freedesktop.org/series/85648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9571 -&gt; IGTPW_5372</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5372 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-kbl-7500u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2780">i915#2780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9571/fi-tgl-y/igt@gem_tiled_pread_basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/fi-tgl-y/igt@gem_tiled_pread_basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5953 -&gt; IGTPW_5372</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9571: 707b4c70cf8fda42dedf74612233208661f287d8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5372: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5372/index.html<br />
  IGT_5953: 65c5eea699141e6f942ce0a8fc85db76ce53cd19 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5998387529630840394==--

--===============0602105762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0602105762==--
