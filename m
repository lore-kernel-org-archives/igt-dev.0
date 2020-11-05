Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Nov 2020 19:35:19 -0000
Message-ID: <160460491990.14958.15418901680443667828@emeril.freedesktop.org>
References: <20201105184355.97296-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201105184355.97296-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fpread=2C_gem=5Fpwrite=3A_Exercise_exhaustion?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0743190528=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0743190528==
Content-Type: multipart/alternative;
 boundary="===============8092842178472632448=="

--===============8092842178472632448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_pread, gem_pwrite: Exercise exhaustion
URL   : https://patchwork.freedesktop.org/series/83543/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9272 -> IGTPW_5137
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html

Known issues
------------

  Here are the changes found in IGTPW_5137 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-byt-j1900:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-byt-j1900/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-byt-j1900/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-icl-y:           [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-icl-y/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-icl-y/igt@core_hotunplug@unbind-rebind.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@reload:
    - {fi-ehl-1}:         [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-ehl-1/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-ehl-1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-n3050:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-soraka:      [DMESG-WARN][19] ([i915#1982]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@coherency:
    - fi-gdg-551:         [DMESG-FAIL][21] ([i915#1748]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-gdg-551/igt@i915_selftest@live@coherency.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-gdg-551/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@execlists:
    - fi-skl-lmem:        [INCOMPLETE][23] ([CI#80]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-skl-lmem/igt@i915_selftest@live@execlists.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-skl-lmem/igt@i915_selftest@live@execlists.html

  * igt@kms_busy@basic@flip:
    - {fi-kbl-7560u}:     [DMESG-WARN][25] ([i915#1982]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-7560u/igt@kms_busy@basic@flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-7560u/igt@kms_busy@basic@flip.html
    - fi-tgl-y:           [DMESG-WARN][27] ([i915#1982]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@kms_busy@basic@flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@kms_busy@basic@flip.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-tgl-y:           [DMESG-WARN][29] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][30] ([i915#2411])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][31] ([i915#579]) -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-icl-u2 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5836 -> IGTPW_5137

  CI-20190529: 20190529
  CI_DRM_9272: 2e75e39901ada6fbccedcd340a5ca1ba73ca5b7b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5137: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_pread@exhaustion
+igt@gem_pwrite@exhaustion

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html

--===============8092842178472632448==
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
<tr><td><b>Series:</b></td><td>i915/gem_pread, gem_pwrite: Exercise exhaustion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83543/">https://patchwork.freedesktop.org/series/83543/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9272 -&gt; IGTPW_5137</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5137 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-byt-j1900/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-icl-y/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-icl-y/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-ehl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-ehl-1/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-gdg-551/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1748">i915#1748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-gdg-551/igt@i915_selftest@live@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-skl-lmem/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-skl-lmem/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-7560u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-7560u/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@kms_busy@basic@flip.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-tgl-y/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9272/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-icl-u2 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5836 -&gt; IGTPW_5137</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9272: 2e75e39901ada6fbccedcd340a5ca1ba73ca5b7b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5137: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5137/index.html<br />
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pread@exhaustion<br />
+igt@gem_pwrite@exhaustion</p>

</body>
</html>

--===============8092842178472632448==--

--===============0743190528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0743190528==--
