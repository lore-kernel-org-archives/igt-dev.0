Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 10:49:00 -0000
Message-ID: <159610614044.11112.12456225829795687443@emeril.freedesktop.org>
References: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5l?=
 =?utf-8?q?w_IGT_test_to_validate_crtc_Dithering_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1246146387=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1246146387==
Content-Type: multipart/alternative;
 boundary="===============6193998755840230424=="

--===============6193998755840230424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new IGT test to validate crtc Dithering (rev6)
URL   : https://patchwork.freedesktop.org/series/79661/
State : success

== Summary ==

CI Bug Log - changes from IGT_5752 -> IGTPW_4826
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html

Known issues
------------

  Here are the changes found in IGTPW_4826 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-bsw-kefka/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-bsw-kefka/igt@i915_module_load@reload.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][3] ([i915#1888]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [DMESG-WARN][5] ([i915#1982]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - {fi-kbl-7560u}:     [WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-tgl-u2:          [DMESG-FAIL][9] ([i915#1233]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - {fi-kbl-7560u}:     [WARN][11] ([i915#2100]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-7560u/igt@kms_setmode@basic-clone-single-crtc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-7560u/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][14] ([i915#1982] / [i915#62] / [i915#92] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][16] ([i915#62] / [i915#92]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2100]: https://gitlab.freedesktop.org/drm/intel/issues/2100
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (43 -> 36)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5752 -> IGTPW_4826

  CI-20190529: 20190529
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4826: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_dither@fb-8bpc-vs-panel-6bpc
+igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend
+igt@kms_dither@fb-8bpc-vs-panel-8bpc
+igt@kms_dither@fb-8bpc-vs-panel-8bpc-suspend
+igt@kms_dither@fb-8bpc-vs-panel-10bpc
+igt@kms_dither@fb-8bpc-vs-panel-10bpc-suspend
+igt@kms_dither@fb-10bpc-vs-panel-6bpc
+igt@kms_dither@fb-10bpc-vs-panel-6bpc-suspend
+igt@kms_dither@fb-10bpc-vs-panel-8bpc
+igt@kms_dither@fb-10bpc-vs-panel-8bpc-suspend
+igt@kms_dither@fb-10bpc-vs-panel-10bpc
+igt@kms_dither@fb-10bpc-vs-panel-10bpc-suspend
+igt@kms_dither@fb-16bpc-vs-panel-6bpc
+igt@kms_dither@fb-16bpc-vs-panel-6bpc-suspend
+igt@kms_dither@fb-16bpc-vs-panel-8bpc
+igt@kms_dither@fb-16bpc-vs-panel-8bpc-suspend
+igt@kms_dither@fb-16bpc-vs-panel-10bpc
+igt@kms_dither@fb-16bpc-vs-panel-10bpc-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html

--===============6193998755840230424==
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
<tr><td><b>Series:</b></td><td>Add new IGT test to validate crtc Dithering (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79661/">https://patchwork.freedesktop.org/series/79661/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5752 -&gt; IGTPW_4826</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4826 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-bsw-kefka/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1233">i915#1233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-7560u/igt@kms_setmode@basic-clone-single-crtc.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2100">i915#2100</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-7560u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 36)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5752 -&gt; IGTPW_4826</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4826: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html<br />
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dither@fb-8bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-8bpc-suspend<br />
+igt@kms_dither@fb-8bpc-vs-panel-10bpc<br />
+igt@kms_dither@fb-8bpc-vs-panel-10bpc-suspend<br />
+igt@kms_dither@fb-10bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-10bpc-vs-panel-6bpc-suspend<br />
+igt@kms_dither@fb-10bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-10bpc-vs-panel-8bpc-suspend<br />
+igt@kms_dither@fb-10bpc-vs-panel-10bpc<br />
+igt@kms_dither@fb-10bpc-vs-panel-10bpc-suspend<br />
+igt@kms_dither@fb-16bpc-vs-panel-6bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-6bpc-suspend<br />
+igt@kms_dither@fb-16bpc-vs-panel-8bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-8bpc-suspend<br />
+igt@kms_dither@fb-16bpc-vs-panel-10bpc<br />
+igt@kms_dither@fb-16bpc-vs-panel-10bpc-suspend</p>

</body>
</html>

--===============6193998755840230424==--

--===============1246146387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1246146387==--
