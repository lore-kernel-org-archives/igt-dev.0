Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Sep 2020 10:01:10 -0000
Message-ID: <160033687087.14569.13933415086094029607@emeril.freedesktop.org>
References: <20200917092620.30306-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200917092620.30306-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?debugfs=5Ftest=3AAdded_igt=5Frequire_check_for_sysfs_and_debugf?=
 =?utf-8?q?s?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1005310342=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1005310342==
Content-Type: multipart/alternative;
 boundary="===============5585857264713318742=="

--===============5585857264713318742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/debugfs_test:Added igt_require check for sysfs and debugfs
URL   : https://patchwork.freedesktop.org/series/81785/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9021 -> IGTPW_4993
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html

Known issues
------------

  Here are the changes found in IGTPW_4993 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_create@basic:
    - fi-byt-j1900:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-byt-j1900/igt@gem_ctx_create@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-byt-j1900/igt@gem_ctx_create@basic.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@vgem_basic@unload:
    - fi-skl-guc:         [PASS][7] -> [DMESG-WARN][8] ([i915#2203])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-skl-guc/igt@vgem_basic@unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-skl-guc/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@flip:
    - {fi-kbl-7560u}:     [DMESG-WARN][9] ([i915#1982]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-7560u/igt@kms_busy@basic@flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-7560u/igt@kms_busy@basic@flip.html
    - {fi-tgl-dsi}:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-tgl-dsi/igt@kms_busy@basic@flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-tgl-dsi/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-WARN][13] ([i915#2203]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-FAIL][15] ([i915#62] / [i915#95]) -> [DMESG-FAIL][16] ([i915#62])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92]) -> [DMESG-WARN][20] ([i915#62] / [i915#92] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][22] ([i915#1982] / [i915#62] / [i915#92])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (44 -> 38)
------------------------------

  Additional (1): fi-bdw-gvtdvm 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_4993

  CI-20190529: 20190529
  CI_DRM_9021: 95639fb77efd2097ba29928126871829593a2bd7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html

--===============5585857264713318742==
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
<tr><td><b>Series:</b></td><td>tests/debugfs_test:Added igt_require check for sysfs and debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81785/">https://patchwork.freedesktop.org/series/81785/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9021 -&gt; IGTPW_4993</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4993 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-byt-j1900/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-byt-j1900/igt@gem_ctx_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-skl-guc/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-7560u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-7560u/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-tgl-dsi/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-tgl-dsi/igt@kms_busy@basic@flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9021/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Additional (1): fi-bdw-gvtdvm <br />
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5787 -&gt; IGTPW_4993</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9021: 95639fb77efd2097ba29928126871829593a2bd7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4993/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5585857264713318742==--

--===============1005310342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1005310342==--
