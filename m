Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Nov 2020 12:08:55 -0000
Message-ID: <160466453500.19146.11703324394459154311@emeril.freedesktop.org>
References: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_Don=27t_run_plane_scaler_tests_on_each?=
 =?utf-8?q?_output?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0851002751=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0851002751==
Content-Type: multipart/alternative;
 boundary="===============7058958890157287537=="

--===============7058958890157287537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Don't run plane scaler tests on each output
URL   : https://patchwork.freedesktop.org/series/83578/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9281 -> IGTPW_5140
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5140 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5140, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5140:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5140 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-skl-lmem:        [DMESG-WARN][7] ([i915#2605]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-skl-lmem/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-skl-lmem/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [INCOMPLETE][11] ([i915#1635]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605


Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5836 -> IGTPW_5140

  CI-20190529: 20190529
  CI_DRM_9281: f88cfb4c62df91cd9024854d8739c5257e4b6a55 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_plane_scaling@plane-scaling
+igt@kms_plane_scaling@scaler-with-clipping-clamping
+igt@kms_plane_scaling@scaler-with-pixel-format
+igt@kms_plane_scaling@scaler-with-rotation
-igt@kms_plane_scaling@pipe-a-plane-scaling
-igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-a-scaler-with-rotation
-igt@kms_plane_scaling@pipe-b-plane-scaling
-igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-b-scaler-with-rotation
-igt@kms_plane_scaling@pipe-c-plane-scaling
-igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-c-scaler-with-rotation
-igt@kms_plane_scaling@pipe-d-plane-scaling
-igt@kms_plane_scaling@pipe-d-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-d-scaler-with-rotation
-igt@kms_plane_scaling@pipe-e-plane-scaling
-igt@kms_plane_scaling@pipe-e-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-e-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-e-scaler-with-rotation
-igt@kms_plane_scaling@pipe-f-plane-scaling
-igt@kms_plane_scaling@pipe-f-scaler-with-clipping-clamping
-igt@kms_plane_scaling@pipe-f-scaler-with-pixel-format
-igt@kms_plane_scaling@pipe-f-scaler-with-rotation

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html

--===============7058958890157287537==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Don&#39;t run plane scaler tests on each output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83578/">https://patchwork.freedesktop.org/series/83578/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9281 -&gt; IGTPW_5140</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5140 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5140, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5140:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5140 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-skl-lmem/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-skl-lmem/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5836 -&gt; IGTPW_5140</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9281: f88cfb4c62df91cd9024854d8739c5257e4b6a55 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html<br />
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_plane_scaling@plane-scaling<br />
+igt@kms_plane_scaling@scaler-with-clipping-clamping<br />
+igt@kms_plane_scaling@scaler-with-pixel-format<br />
+igt@kms_plane_scaling@scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-a-plane-scaling<br />
-igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-a-scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-b-plane-scaling<br />
-igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-b-scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-c-plane-scaling<br />
-igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-c-scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-d-plane-scaling<br />
-igt@kms_plane_scaling@pipe-d-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-d-scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-e-plane-scaling<br />
-igt@kms_plane_scaling@pipe-e-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-e-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-e-scaler-with-rotation<br />
-igt@kms_plane_scaling@pipe-f-plane-scaling<br />
-igt@kms_plane_scaling@pipe-f-scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@pipe-f-scaler-with-pixel-format<br />
-igt@kms_plane_scaling@pipe-f-scaler-with-rotation</p>

</body>
</html>

--===============7058958890157287537==--

--===============0851002751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0851002751==--
