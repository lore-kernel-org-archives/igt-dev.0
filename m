Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1117018136603821341=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Tue, 22 Nov 2022 07:29:50 -0000
Message-ID: <166910219030.2185.8423173045546540276@emeril.freedesktop.org>
References: <20221122065035.40580-1-vikas.srivastava@intel.com>
In-Reply-To: <20221122065035.40580-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fuserptr=5Fblits=3A_Added_XY=5FFAST=5FCOPY=5FBLT_Comm?=
 =?utf-8?q?and_for_MTL_=28rev4=29?=
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

--===============1117018136603821341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_userptr_blits: Added XY_FAST_COPY_BLT Command for MTL (rev4)
URL   : https://patchwork.freedesktop.org/series/111133/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12413 -> IGTPW_8141
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8141 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8141, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html

Participating hosts (36 -> 36)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8141:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - fi-bsw-kefka:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_8141 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][6] ([i915#5334]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][8] ([i915#4785]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@workarounds:
    - {bat-adln-1}:       [INCOMPLETE][10] ([i915#4983] / [i915#7467]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/bat-adln-1/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/bat-adln-1/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][12] ([i915#7336]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336
  [i915#7467]: https://gitlab.freedesktop.org/drm/intel/issues/7467


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7069 -> IGTPW_8141

  CI-20190529: 20190529
  CI_DRM_12413: 6d95d2370020769c71fa36b4bc1884ef62e14a14 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8141: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html
  IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_chamelium@common-hpd-after-hibernate
+igt@kms_chamelium@common-hpd-after-suspend
+igt@kms_chamelium@dp-hpd
+igt@kms_chamelium@dp-hpd-after-hibernate
+igt@kms_chamelium@dp-hpd-after-suspend
+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-fast
+igt@kms_chamelium@dp-hpd-for-each-pipe
+igt@kms_chamelium@dp-hpd-storm
+igt@kms_chamelium@dp-hpd-storm-disable
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd
+igt@kms_chamelium@hdmi-hpd-after-hibernate
+igt@kms_chamelium@hdmi-hpd-after-suspend
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-fast
+igt@kms_chamelium@hdmi-hpd-for-each-pipe
+igt@kms_chamelium@hdmi-hpd-storm
+igt@kms_chamelium@hdmi-hpd-storm-disable
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@vga-hpd
+igt@kms_chamelium@vga-hpd-after-hibernate
+igt@kms_chamelium@vga-hpd-after-suspend
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-fast
+igt@kms_chamelium@vga-hpd-for-each-pipe
+igt@kms_chamelium@vga-hpd-without-ddc
+igt@kms_chamelium@vga-hpd-with-enabled-mode
+igt@kms_color_chamelium@ctm-0-25
+igt@kms_color_chamelium@ctm-0-50
+igt@kms_color_chamelium@ctm-0-75
+igt@kms_color_chamelium@ctm-blue-to-red
+igt@kms_color_chamelium@ctm-green-to-red
+igt@kms_color_chamelium@ctm-limited-range
+igt@kms_color_chamelium@ctm-max
+igt@kms_color_chamelium@ctm-negative
+igt@kms_color_chamelium@ctm-red-to-blue
+igt@kms_color_chamelium@degamma
+igt@kms_color_chamelium@gamma
-igt@chamelium_color@ctm-0-25
-igt@chamelium_color@ctm-0-50
-igt@chamelium_color@ctm-0-75
-igt@chamelium_color@ctm-blue-to-red
-igt@chamelium_color@ctm-green-to-red
-igt@chamelium_color@ctm-limited-range
-igt@chamelium_color@ctm-max
-igt@chamelium_color@ctm-negative
-igt@chamelium_color@ctm-red-to-blue
-igt@chamelium_color@degamma
-igt@chamelium_color@gamma
-igt@chamelium_hpd@common-hpd-after-hibernate
-igt@chamelium_hpd@common-hpd-after-suspend
-igt@chamelium_hpd@dp-hpd
-igt@chamelium_hpd@dp-hpd-after-hibernate
-igt@chamelium_hpd@dp-hpd-after-suspend
-igt@chamelium_hpd@dp-hpd-enable-disable-mode
-igt@chamelium_hpd@dp-hpd-fast
-igt@chamelium_hpd@dp-hpd-for-each-pipe
-igt@chamelium_hpd@dp-hpd-storm
-igt@chamelium_hpd@dp-hpd-storm-disable
-igt@chamelium_hpd@dp-hpd-with-enabled-mode
-igt@chamelium_hpd@hdmi-hpd
-igt@chamelium_hpd@hdmi-hpd-after-hibernate
-igt@chamelium_hpd@hdmi-hpd-after-suspend
-igt@chamelium_hpd@hdmi-hpd-enable-disable-mode
-igt@chamelium_hpd@hdmi-hpd-fast
-igt@chamelium_hpd@hdmi-hpd-for-each-pipe
-igt@chamelium_hpd@hdmi-hpd-storm
-igt@chamelium_hpd@hdmi-hpd-storm-disable
-igt@chamelium_hpd@hdmi-hpd-with-enabled-mode
-igt@chamelium_hpd@vga-hpd
-igt@chamelium_hpd@vga-hpd-after-hibernate
-igt@chamelium_hpd@vga-hpd-after-suspend
-igt@chamelium_hpd@vga-hpd-enable-disable-mode
-igt@chamelium_hpd@vga-hpd-fast
-igt@chamelium_hpd@vga-hpd-for-each-pipe
-igt@chamelium_hpd@vga-hpd-without-ddc
-igt@chamelium_hpd@vga-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html

--===============1117018136603821341==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_userptr_blits: Added XY_FAST_COPY_BLT Command for MTL (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111133/">https://patchwork.freedesktop.org/series/111133/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12413 -&gt; IGTPW_8141</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8141 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8141, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8141:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8141 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/bat-adln-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7467">i915#7467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/bat-adln-1/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12413/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7336">i915#7336</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7069 -&gt; IGTPW_8141</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12413: 6d95d2370020769c71fa36b4bc1884ef62e14a14 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8141: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8141/index.html<br />
  IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_chamelium@common-hpd-after-hibernate<br />
+igt@kms_chamelium@common-hpd-after-suspend<br />
+igt@kms_chamelium@dp-hpd<br />
+igt@kms_chamelium@dp-hpd-after-hibernate<br />
+igt@kms_chamelium@dp-hpd-after-suspend<br />
+igt@kms_chamelium@dp-hpd-enable-disable-mode<br />
+igt@kms_chamelium@dp-hpd-fast<br />
+igt@kms_chamelium@dp-hpd-for-each-pipe<br />
+igt@kms_chamelium@dp-hpd-storm<br />
+igt@kms_chamelium@dp-hpd-storm-disable<br />
+igt@kms_chamelium@dp-hpd-with-enabled-mode<br />
+igt@kms_chamelium@hdmi-hpd<br />
+igt@kms_chamelium@hdmi-hpd-after-hibernate<br />
+igt@kms_chamelium@hdmi-hpd-after-suspend<br />
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode<br />
+igt@kms_chamelium@hdmi-hpd-fast<br />
+igt@kms_chamelium@hdmi-hpd-for-each-pipe<br />
+igt@kms_chamelium@hdmi-hpd-storm<br />
+igt@kms_chamelium@hdmi-hpd-storm-disable<br />
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode<br />
+igt@kms_chamelium@vga-hpd<br />
+igt@kms_chamelium@vga-hpd-after-hibernate<br />
+igt@kms_chamelium@vga-hpd-after-suspend<br />
+igt@kms_chamelium@vga-hpd-enable-disable-mode<br />
+igt@kms_chamelium@vga-hpd-fast<br />
+igt@kms_chamelium@vga-hpd-for-each-pipe<br />
+igt@kms_chamelium@vga-hpd-without-ddc<br />
+igt@kms_chamelium@vga-hpd-with-enabled-mode<br />
+igt@kms_color_chamelium@ctm-0-25<br />
+igt@kms_color_chamelium@ctm-0-50<br />
+igt@kms_color_chamelium@ctm-0-75<br />
+igt@kms_color_chamelium@ctm-blue-to-red<br />
+igt@kms_color_chamelium@ctm-green-to-red<br />
+igt@kms_color_chamelium@ctm-limited-range<br />
+igt@kms_color_chamelium@ctm-max<br />
+igt@kms_color_chamelium@ctm-negative<br />
+igt@kms_color_chamelium@ctm-red-to-blue<br />
+igt@kms_color_chamelium@degamma<br />
+igt@kms_color_chamelium@gamma<br />
-igt@chamelium_color@ctm-0-25<br />
-igt@chamelium_color@ctm-0-50<br />
-igt@chamelium_color@ctm-0-75<br />
-igt@chamelium_color@ctm-blue-to-red<br />
-igt@chamelium_color@ctm-green-to-red<br />
-igt@chamelium_color@ctm-limited-range<br />
-igt@chamelium_color@ctm-max<br />
-igt@chamelium_color@ctm-negative<br />
-igt@chamelium_color@ctm-red-to-blue<br />
-igt@chamelium_color@degamma<br />
-igt@chamelium_color@gamma<br />
-igt@chamelium_hpd@common-hpd-after-hibernate<br />
-igt@chamelium_hpd@common-hpd-after-suspend<br />
-igt@chamelium_hpd@dp-hpd<br />
-igt@chamelium_hpd@dp-hpd-after-hibernate<br />
-igt@chamelium_hpd@dp-hpd-after-suspend<br />
-igt@chamelium_hpd@dp-hpd-enable-disable-mode<br />
-igt@chamelium_hpd@dp-hpd-fast<br />
-igt@chamelium_hpd@dp-hpd-for-each-pipe<br />
-igt@chamelium_hpd@dp-hpd-storm<br />
-igt@chamelium_hpd@dp-hpd-storm-disable<br />
-igt@chamelium_hpd@dp-hpd-with-enabled-mode<br />
-igt@chamelium_hpd@hdmi-hpd<br />
-igt@chamelium_hpd@hdmi-hpd-after-hibernate<br />
-igt@chamelium_hpd@hdmi-hpd-after-suspend<br />
-igt@chamelium_hpd@hdmi-hpd-enable-disable-mode<br />
-igt@chamelium_hpd@hdmi-hpd-fast<br />
-igt@chamelium_hpd@hdmi-hpd-for-each-pipe<br />
-igt@chamelium_hpd@hdmi-hpd-storm<br />
-igt@chamelium_hpd@hdmi-hpd-storm-disable<br />
-igt@chamelium_hpd@hdmi-hpd-with-enabled-mode<br />
-igt@chamelium_hpd@vga-hpd<br />
-igt@chamelium_hpd@vga-hpd-after-hibernate<br />
-igt@chamelium_hpd@vga-hpd-after-suspend<br />
-igt@chamelium_hpd@vga-hpd-enable-disable-mode<br />
-igt@chamelium_hpd@vga-hpd-fast<br />
-igt@chamelium_hpd@vga-hpd-for-each-pipe<br />
-igt@chamelium_hpd@vga-hpd-without-ddc<br />
-igt@chamelium_hpd@vga-hpd-with-enabled-mode</p>

</body>
</html>

--===============1117018136603821341==--
