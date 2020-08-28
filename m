Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Aug 2020 13:52:11 -0000
Message-ID: <159862273178.4240.2015059791508906221@emeril.freedesktop.org>
References: <20200828131354.26519-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200828131354.26519-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev31=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0804089964=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0804089964==
Content-Type: multipart/alternative;
 boundary="===============4510464447078237889=="

--===============4510464447078237889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev31)
URL   : https://patchwork.freedesktop.org/series/79823/
State : success

== Summary ==

CI Bug Log - changes from IGT_5774 -> IGTPW_4918
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html

Known issues
------------

  Here are the changes found in IGTPW_4918 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-tgl-u2:          [PASS][3] -> [INCOMPLETE][4] ([i915#2045])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@fds:
    - fi-icl-y:           [INCOMPLETE][7] ([i915#2398]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-y/igt@gem_exec_parallel@engines@fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-y/igt@gem_exec_parallel@engines@fds.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [INCOMPLETE][9] ([i915#2276]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-y/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-skl-guc:         [DMESG-WARN][11] ([i915#2203]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#1982] / [i915#62] / [i915#92]) -> [DMESG-WARN][14] ([i915#62] / [i915#92] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92]) -> [DMESG-WARN][16] ([i915#62] / [i915#92] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2276]: https://gitlab.freedesktop.org/drm/intel/issues/2276
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (39 -> 33)
------------------------------

  Missing    (6): fi-cml-u2 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4918

  CI-20190529: 20190529
  CI_DRM_8937: 78b090a913c972368c81f05352a532590200cc89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4918: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@check-canonical
+igt@api_intel_bb@lot-of-buffers
+igt@api_intel_bb@render
+igt@api_intel_bb@render-ccs
+igt@api_intel_bb@reset-flags
-igt@gem_read_read_speed@read-read-1x1
-igt@gem_read_read_speed@read-write-1x1
-igt@gem_read_read_speed@write-read-1x1
-igt@gem_read_read_speed@write-write-1x1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html

--===============4510464447078237889==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev31)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5774 -&gt; IGTPW_4918</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4918 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2045">i915#2045</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-y/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-y/igt@gem_exec_parallel@engines@fds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-icl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2276">i915#2276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Missing    (6): fi-cml-u2 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4918</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8937: 78b090a913c972368c81f05352a532590200cc89 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4918: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4918/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_bb@check-canonical<br />
+igt@api_intel_bb@lot-of-buffers<br />
+igt@api_intel_bb@render<br />
+igt@api_intel_bb@render-ccs<br />
+igt@api_intel_bb@reset-flags<br />
-igt@gem_read_read_speed@read-read-1x1<br />
-igt@gem_read_read_speed@read-write-1x1<br />
-igt@gem_read_read_speed@write-read-1x1<br />
-igt@gem_read_read_speed@write-write-1x1</p>

</body>
</html>

--===============4510464447078237889==--

--===============0804089964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0804089964==--
