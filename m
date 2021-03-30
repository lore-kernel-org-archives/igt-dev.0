Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Mar 2021 15:07:33 -0000
Message-ID: <161711685396.22471.12490798614474379812@emeril.freedesktop.org>
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210330035056.52019-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Avoid_set=5Fdomain_-ENOMEM_error_with_huge_buffers?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1045256849=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1045256849==
Content-Type: multipart/alternative;
 boundary="===============2745376911938702147=="

--===============2745376911938702147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: Avoid set_domain -ENOMEM error with huge buffers
URL   : https://patchwork.freedesktop.org/series/88561/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9914 -> IGTPW_5675
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html

Known issues
------------

  Here are the changes found in IGTPW_5675 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-skl-6600u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +19 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@fbdev@write:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-tgl-y/igt@fbdev@write.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-tgl-y/igt@fbdev@write.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-6600u:       NOTRUN -> [FAIL][5] ([i915#3239])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7500u:       [PASS][6] -> [DMESG-WARN][7] ([i915#2605])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-skl-6600u:       NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6600u:       NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#533])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][10] ([i915#1602] / [i915#2029])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][11] ([i915#198]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@double-flink:
    - fi-tgl-y:           [DMESG-WARN][13] ([i915#402]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-tgl-y/igt@gem_flink_basic@double-flink.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-tgl-y/igt@gem_flink_basic@double-flink.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][15] ([i915#1372]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-glk-dsi:         [DMESG-WARN][17] ([i915#1982] / [i915#3143]) -> [DMESG-WARN][18] ([i915#3143])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#3143]: https://gitlab.freedesktop.org/drm/intel/issues/3143
  [i915#3239]: https://gitlab.freedesktop.org/drm/intel/issues/3239
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-tgl-u2 fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6047 -> IGTPW_5675

  CI-20190529: 20190529
  CI_DRM_9914: 808d9e2b1a7dbaede3bd8b5860eb2c33adec9510 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5675: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html
  IGT_6047: 3887134e739f480cefe1dc7f13eb54f7bf3ca27f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html

--===============2745376911938702147==
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
<tr><td><b>Series:</b></td><td>i915: Avoid set_domain -ENOMEM error with huge buffers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88561/">https://patchwork.freedesktop.org/series/88561/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9914 -&gt; IGTPW_5675</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5675 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-tgl-y/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-tgl-y/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3239">i915#3239</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/198">i915#198</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@double-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-tgl-y/igt@gem_flink_basic@double-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-tgl-y/igt@gem_flink_basic@double-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-tgl-u2 fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6047 -&gt; IGTPW_5675</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9914: 808d9e2b1a7dbaede3bd8b5860eb2c33adec9510 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5675: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html<br />
  IGT_6047: 3887134e739f480cefe1dc7f13eb54f7bf3ca27f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2745376911938702147==--

--===============1045256849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1045256849==--
