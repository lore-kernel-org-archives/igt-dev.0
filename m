Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 30 Sep 2020 19:05:48 -0000
Message-ID: <160149274810.17416.13578989135443861177@emeril.freedesktop.org>
References: <20200930173150.431995-1-lyude@redhat.com>
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0490087424=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0490087424==
Content-Type: multipart/alternative;
 boundary="===============5715292624246047337=="

--===============5715292624246047337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add nouveau-crc tests (rev5)
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9081 -> IGTPW_5033
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html

Known issues
------------

  Here are the changes found in IGTPW_5033 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([i915#1161] / [i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@vgem_basic@unload:
    - fi-skl-guc:         [PASS][5] -> [DMESG-WARN][6] ([i915#2203])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-skl-guc/igt@vgem_basic@unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-skl-guc/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@unbind-rebind}:
    - fi-kbl-x1275:       [DMESG-WARN][7] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][11] ([i915#1982]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][14] ([i915#62] / [i915#92]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92]) -> [DMESG-WARN][16] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@vgem_basic@unload:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#95]) -> [DMESG-WARN][18] ([i915#62] / [i915#92])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@vgem_basic@unload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@vgem_basic@unload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (45 -> 38)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5794 -> IGTPW_5033

  CI-20190529: 20190529
  CI_DRM_9081: 134739e6ec0aa2efba634e855481be724443393a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5033: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html
  IGT_5794: eeccb2a17453f90ad92d1ab6f81ad7d344119d72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@nouveau_crc@ctx-flip-threshold-reset-after-capture
+igt@nouveau_crc@pipe-a-ctx-flip-detection
+igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-a-source-outp-complete
+igt@nouveau_crc@pipe-a-source-outp-inactive
+igt@nouveau_crc@pipe-a-source-rg
+igt@nouveau_crc@pipe-b-ctx-flip-detection
+igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-b-source-outp-complete
+igt@nouveau_crc@pipe-b-source-outp-inactive
+igt@nouveau_crc@pipe-b-source-rg
+igt@nouveau_crc@pipe-c-ctx-flip-detection
+igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-c-source-outp-complete
+igt@nouveau_crc@pipe-c-source-outp-inactive
+igt@nouveau_crc@pipe-c-source-rg
+igt@nouveau_crc@pipe-d-ctx-flip-detection
+igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-d-source-outp-complete
+igt@nouveau_crc@pipe-d-source-outp-inactive
+igt@nouveau_crc@pipe-d-source-rg
+igt@nouveau_crc@pipe-e-ctx-flip-detection
+igt@nouveau_crc@pipe-e-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-e-source-outp-complete
+igt@nouveau_crc@pipe-e-source-outp-inactive
+igt@nouveau_crc@pipe-e-source-rg
+igt@nouveau_crc@pipe-f-ctx-flip-detection
+igt@nouveau_crc@pipe-f-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-f-source-outp-complete
+igt@nouveau_crc@pipe-f-source-outp-inactive
+igt@nouveau_crc@pipe-f-source-rg

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html

--===============5715292624246047337==
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
<tr><td><b>Series:</b></td><td>Add nouveau-crc tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/74811/">https://patchwork.freedesktop.org/series/74811/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9081 -&gt; IGTPW_5033</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5033 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-skl-guc/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@unbind-rebind}:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9081/fi-kbl-x1275/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/fi-kbl-x1275/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 38)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5794 -&gt; IGTPW_5033</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9081: 134739e6ec0aa2efba634e855481be724443393a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5033: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5033/index.html<br />
  IGT_5794: eeccb2a17453f90ad92d1ab6f81ad7d344119d72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@nouveau_crc@ctx-flip-threshold-reset-after-capture<br />
+igt@nouveau_crc@pipe-a-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-a-source-outp-complete<br />
+igt@nouveau_crc@pipe-a-source-outp-inactive<br />
+igt@nouveau_crc@pipe-a-source-rg<br />
+igt@nouveau_crc@pipe-b-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-b-source-outp-complete<br />
+igt@nouveau_crc@pipe-b-source-outp-inactive<br />
+igt@nouveau_crc@pipe-b-source-rg<br />
+igt@nouveau_crc@pipe-c-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-c-source-outp-complete<br />
+igt@nouveau_crc@pipe-c-source-outp-inactive<br />
+igt@nouveau_crc@pipe-c-source-rg<br />
+igt@nouveau_crc@pipe-d-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-d-source-outp-complete<br />
+igt@nouveau_crc@pipe-d-source-outp-inactive<br />
+igt@nouveau_crc@pipe-d-source-rg<br />
+igt@nouveau_crc@pipe-e-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-e-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-e-source-outp-complete<br />
+igt@nouveau_crc@pipe-e-source-outp-inactive<br />
+igt@nouveau_crc@pipe-e-source-rg<br />
+igt@nouveau_crc@pipe-f-ctx-flip-detection<br />
+igt@nouveau_crc@pipe-f-ctx-flip-skip-current-frame<br />
+igt@nouveau_crc@pipe-f-source-outp-complete<br />
+igt@nouveau_crc@pipe-f-source-outp-inactive<br />
+igt@nouveau_crc@pipe-f-source-rg</p>

</body>
</html>

--===============5715292624246047337==--

--===============0490087424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0490087424==--
