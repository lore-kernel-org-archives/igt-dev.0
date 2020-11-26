Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Nov 2020 06:01:26 -0000
Message-ID: <160637048697.4109.9018880192702135306@emeril.freedesktop.org>
References: <20201126050320.2434-1-karthik.b.s@intel.com>
In-Reply-To: <20201126050320.2434-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2054485551=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2054485551==
Content-Type: multipart/alternative;
 boundary="===============0552303031134202926=="

--===============0552303031134202926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST (rev3)
URL   : https://patchwork.freedesktop.org/series/82987/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9390 -> IGTPW_5228
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5228:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@dp-mst-lic-type-0} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-u2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - {fi-ehl-1}:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-ehl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-tgl-y:           NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@kms_content_protection@dp-mst-lic-type-0.html

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-cml-u2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-icl-y:           NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-y/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-cml-s:           NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-cml-s/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - fi-kbl-guc:         NOTRUN -> [FAIL][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-guc/igt@kms_content_protection@dp-mst-type-0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-nick/igt@kms_content_protection@dp-mst-type-0.html

  * {igt@kms_content_protection@dp-mst-type-1} (NEW):
    - fi-icl-u2:          NOTRUN -> [SKIP][9] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-u2/igt@kms_content_protection@dp-mst-type-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9390 and IGTPW_5228:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 2 fail(s) 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 2 fail(s) 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 2 fail(s) 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 2 fail(s) 34 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5228 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-7500u:       [PASS][10] -> [INCOMPLETE][11] ([i915#2369] / [i915#2473])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-kbl-7500u/igt@gem_exec_suspend@basic-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-7500u/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [PASS][12] -> [DMESG-WARN][13] ([i915#402]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][14] -> [DMESG-WARN][15] ([i915#1982])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [PASS][16] -> [DMESG-WARN][17] ([i915#1982])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-n3050:       [DMESG-WARN][18] ([i915#1982]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [DMESG-WARN][20] ([i915#1982]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][22] ([i915#1982]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-y:           [DMESG-WARN][24] ([i915#402]) -> [PASS][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@prime_vgem@basic-write.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@gem_huc_copy@huc-copy:
    - fi-bxt-dsi:         [SKIP][26] ([fdo#109271] / [i915#1635] / [i915#2190]) -> [SKIP][27] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-tgl-y:           [DMESG-WARN][28] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][29] ([i915#2411])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      [DMESG-FAIL][30] -> [DMESG-FAIL][31] ([i915#1886])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bxt-dsi:         [SKIP][32] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-apl-guc:         [SKIP][34] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-apl-guc:         [DMESG-WARN][36] ([i915#1635] / [i915#1982]) -> [DMESG-WARN][37] ([i915#1982])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bxt-dsi:         [SKIP][38] ([fdo#109271] / [i915#1635]) -> [SKIP][39] ([fdo#109271]) +28 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@primary_page_flip:
    - fi-apl-guc:         [SKIP][40] ([fdo#109271] / [i915#1635]) -> [SKIP][41] ([fdo#109271]) +29 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_psr@primary_page_flip.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2473]: https://gitlab.freedesktop.org/drm/intel/issues/2473
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (44 -> 40)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5870 -> IGTPW_5228

  CI-20190529: 20190529
  CI_DRM_9390: 4d71054406173e8331f3ba2fb93ef9863156c21d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5228: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@dp-mst-lic-type-0
+igt@kms_content_protection@dp-mst-lic-type-1
+igt@kms_content_protection@dp-mst-type-0
+igt@kms_content_protection@dp-mst-type-1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html

--===============0552303031134202926==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9390 -&gt; IGTPW_5228</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5228:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-0} (NEW):</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-u2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-ehl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-cml-u2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-y/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-cml-s/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-guc/igt@kms_content_protection@dp-mst-type-0.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-nick/igt@kms_content_protection@dp-mst-type-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-1} (NEW):</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-u2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9390 and IGTPW_5228:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 2 fail(s) 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 2 fail(s) 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 2 fail(s) 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 2 fail(s) 34 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5228 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-kbl-7500u/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-7500u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2473">i915#2473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@gem_mmap_gtt@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@prime_vgem@basic-write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@prime_vgem@basic-write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9390/fi-apl-guc/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/fi-apl-guc/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5870 -&gt; IGTPW_5228</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9390: 4d71054406173e8331f3ba2fb93ef9863156c21d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5228: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5228/index.html<br />
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_content_protection@dp-mst-lic-type-0<br />
+igt@kms_content_protection@dp-mst-lic-type-1<br />
+igt@kms_content_protection@dp-mst-type-0<br />
+igt@kms_content_protection@dp-mst-type-1</p>

</body>
</html>

--===============0552303031134202926==--

--===============2054485551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2054485551==--
