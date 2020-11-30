Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Nov 2020 13:06:49 -0000
Message-ID: <160674160969.10643.8576320376143175639@emeril.freedesktop.org>
References: <20201130014446.19709-1-arjun.melkaveri@intel.com>
In-Reply-To: <20201130014446.19709-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Freloc=3A_Added_gem=5Frequire=5Fmappable=5Fggt?=
 =?utf-8?q?t_to_check_mappable_aperture?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0539659598=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0539659598==
Content-Type: multipart/alternative;
 boundary="===============4543601133850649386=="

--===============4543601133850649386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_reloc: Added gem_require_mappable_ggtt to check mappable aperture
URL   : https://patchwork.freedesktop.org/series/84386/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5876 -> IGTPW_5237
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5237 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5237, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5237:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  
Known issues
------------

  Here are the changes found in IGTPW_5237 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][9] -> [DMESG-FAIL][10] ([i915#2291] / [i915#541])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bxt-dsi:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-icl-y:           [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-icl-y/igt@i915_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-icl-y/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-tgl-y:           [DMESG-WARN][17] ([i915#1982] / [i915#2411]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bsw-n3050:       [DMESG-FAIL][19] ([i915#2675] / [i915#541]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [DMESG-WARN][21] ([i915#1982] / [i915#262]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][23] ([i915#1982]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@vgem_basic@setversion:
    - fi-tgl-y:           [DMESG-WARN][25] ([i915#402]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@vgem_basic@setversion.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@vgem_basic@setversion.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2675]: https://gitlab.freedesktop.org/drm/intel/issues/2675
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5876 -> IGTPW_5237

  CI-20190529: 20190529
  CI_DRM_9403: 7b3db1fb7ff13ce64c1383dc8953d916ed222c33 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5237: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html
  IGT_5876: cf2f41b3d3dfabaf3a4837062f996f3491a350b1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html

--===============4543601133850649386==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_reloc: Added gem_require_mappable_ggtt to check mappable aperture</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84386/">https://patchwork.freedesktop.org/series/84386/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5876 -&gt; IGTPW_5237</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5237 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5237, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5237:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_timelines:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5237 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-subslice-total:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-icl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-icl-y/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2675">i915#2675</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@setversion:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5876/fi-tgl-y/igt@vgem_basic@setversion.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/fi-tgl-y/igt@vgem_basic@setversion.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5876 -&gt; IGTPW_5237</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9403: 7b3db1fb7ff13ce64c1383dc8953d916ed222c33 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5237: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5237/index.html<br />
  IGT_5876: cf2f41b3d3dfabaf3a4837062f996f3491a350b1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4543601133850649386==--

--===============0539659598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0539659598==--
