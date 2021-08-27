Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3916330394270817651=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Aug 2021 06:20:17 -0000
Message-ID: <163004521758.12587.1807371986308562278@emeril.freedesktop.org>
References: <20210827052349.1171468-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210827052349.1171468-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Handle_unsupported_modes_for_invalid_crtc_test?=
 =?utf-8?q?_=28rev3=29?=
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3916330394270817651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Handle unsupported modes for invalid crtc test (rev3)
URL   : https://patchwork.freedesktop.org/series/93812/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10528 -> IGTPW_6162
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html

Known issues
------------

  Here are the changes found in IGTPW_6162 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-1115g4:      [PASS][2] -> [DMESG-WARN][3] ([i915#4002])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-tgl-1115g4:      [DMESG-WARN][4] ([i915#4002]) -> [PASS][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][6] ([i915#2940]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-1115g4:      [SKIP][8] ([i915#1072] / [i915#1385]) -> [SKIP][9] ([i915#1072])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 bat-adls-5 fi-bsw-cyan bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6187 -> IGTPW_6162

  CI-20190529: 20190529
  CI_DRM_10528: c0d72b2775df87cc8a852e5be38e9d84e7e42a05 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6162: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html
  IGT_6187: 1afd52c1471dafdf521eae431f3e228826de6de2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html

--===============3916330394270817651==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Handle unsupported modes for invalid crtc test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93812/">https://patchwork.freedesktop.org/series/93812/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10528 -&gt; IGTPW_6162</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6162 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@i915_module_load@reload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10528/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-ilk-m540 bat-adls-5 fi-bsw-cyan bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6187 -&gt; IGTPW_6162</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10528: c0d72b2775df87cc8a852e5be38e9d84e7e42a05 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6162: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6162/index.html<br />
  IGT_6187: 1afd52c1471dafdf521eae431f3e228826de6de2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3916330394270817651==--
