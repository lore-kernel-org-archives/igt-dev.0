Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7145764939811867972=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Aug 2021 07:20:05 -0000
Message-ID: <163004880565.12588.1731639789376496686@emeril.freedesktop.org>
References: <20210824110459.27235-1-swati2.sharma@intel.com>
In-Reply-To: <20210824110459.27235-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_Add_upscaling_tests_=28rev3=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7145764939811867972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip_scaled_crc: Add upscaling tests (rev3)
URL   : https://patchwork.freedesktop.org/series/93952/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10528 -> IGTPW_6164
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html

Known issues
------------

  Here are the changes found in IGTPW_6164 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-1115g4:      [PASS][3] -> [DMESG-WARN][4] ([i915#4002])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [PASS][5] -> [DMESG-WARN][6] ([i915#3967])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][7] ([i915#2940]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_busy@basic@modeset:
    - fi-tgl-1115g4:      [DMESG-WARN][9] ([i915#4002]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_busy@basic@modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@kms_busy@basic@modeset.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [DMESG-WARN][11] ([i915#4002]) -> [FAIL][12] ([i915#1888])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-1115g4:      [SKIP][13] ([i915#1072] / [i915#1385]) -> [SKIP][14] ([i915#1072])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3967]: https://gitlab.freedesktop.org/drm/intel/issues/3967
  [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 bat-adls-5 fi-bsw-cyan bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6187 -> IGTPW_6164

  CI-20190529: 20190529
  CI_DRM_10528: c0d72b2775df87cc8a852e5be38e9d84e7e42a05 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6164: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html
  IGT_6187: 1afd52c1471dafdf521eae431f3e228826de6de2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html

--===============7145764939811867972==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip_scaled_crc: Add upscaling tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93952/">https://patchwork.freedesktop.org/series/93952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10528 -&gt; IGTPW_6164</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6164 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3967">i915#3967</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-ilk-m540 bat-adls-5 fi-bsw-cyan bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6187 -&gt; IGTPW_6164</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10528: c0d72b2775df87cc8a852e5be38e9d84e7e42a05 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6164: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6164/index.html<br />
  IGT_6187: 1afd52c1471dafdf521eae431f3e228826de6de2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs</p>

</body>
</html>

--===============7145764939811867972==--
