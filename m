Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1677394674373913655=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 10 Jul 2023 16:09:40 -0000
Message-ID: <168900538069.24990.4543872825347034186@emeril.freedesktop.org>
References: <20230710145856.1864141-1-matthew.brost@intel.com>
In-Reply-To: <20230710145856.1864141-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/5=5D_xe/xe=5Fexec=5Fbasic=3A_A_sections_to_?=
 =?utf-8?q?test_NULL_=28sparse=29_bindings?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1677394674373913655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/5] xe/xe_exec_basic: A sections to test NULL (sparse) bindings
URL   : https://patchwork.freedesktop.org/series/120471/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7378 -> IGTPW_9377
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9377 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9377, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9377:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-adls-5:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-adls-5/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adls-5/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-cfl-8700k:       [FAIL][3] ([i915#7940]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html

  
Known issues
------------

  Here are the changes found in IGTPW_9377 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#7456])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-rpls-2:         NOTRUN -> [SKIP][6] ([i915#1849] / [i915#2582])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-rpls-2:         NOTRUN -> [SKIP][7] ([i915#2582]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] ([i915#4613]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-rpls-2:         NOTRUN -> [SKIP][9] ([i915#4613]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][10] ([i915#3282])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-rpls-2:         NOTRUN -> [SKIP][11] ([i915#7561])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-skl-guc:         [PASS][12] -> [FAIL][13] ([i915#7940])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rps@basic-api:
    - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#6621])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][15] -> [DMESG-FAIL][16] ([i915#7059])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][17] ([i915#7059])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][18] ([i915#4258] / [i915#7913])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][19] ([i915#6367])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_busy@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][20] ([i915#1845]) +15 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_busy@basic.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][21] ([i915#7828]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-adlm-1:         NOTRUN -> [SKIP][22] ([i915#7828])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-jsl-1:          NOTRUN -> [SKIP][23] ([i915#7828])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-rpls-2:         NOTRUN -> [SKIP][24] ([i915#3637]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-rpls-2:         NOTRUN -> [SKIP][25] ([fdo#109285])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][26] ([i915#1849])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlm-1:         NOTRUN -> [SKIP][27] ([i915#1845])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rpls-2:         NOTRUN -> [SKIP][28] ([i915#1072]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rpls-2:         NOTRUN -> [SKIP][29] ([i915#3555])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-rpls-2:         NOTRUN -> [SKIP][30] ([fdo#109295] / [i915#1845] / [i915#3708])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - bat-rpls-2:         NOTRUN -> [SKIP][31] ([fdo#109295] / [i915#3708]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - bat-jsl-1:          [INCOMPLETE][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-jsl-1/igt@i915_module_load@reload.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [FAIL][34] ([i915#7940]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [DMESG-FAIL][36] ([i915#7269]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-8:         [DMESG-WARN][38] ([i915#6367]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-8/igt@i915_selftest@live@slpc.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - bat-adlm-1:         [INCOMPLETE][40] ([i915#4983] / [i915#7677]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-adlm-1/igt@i915_selftest@live@workarounds.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         [SKIP][42] ([i915#1072]) -> [ABORT][43] ([i915#8442] / [i915#8668])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-rplp-1/igt@kms_psr@primary_page_flip.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7677]: https://gitlab.freedesktop.org/drm/intel/issues/7677
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7378 -> IGTPW_9377

  CI-20190529: 20190529
  CI_DRM_13364: 91010bd5ed0a15e689f0fcc3817489bd02433884 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9377: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html
  IGT_7378: e78963553e05a2413cf735824517547b2bb19936 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_exec_basic@many-engines-many-vm-null
+igt@xe_exec_basic@many-engines-many-vm-null-defer-bind
+igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap
+igt@xe_exec_basic@many-engines-many-vm-null-rebind
+igt@xe_exec_basic@many-engines-null
+igt@xe_exec_basic@many-engines-null-defer-bind
+igt@xe_exec_basic@many-engines-null-defer-mmap
+igt@xe_exec_basic@many-engines-null-rebind
+igt@xe_exec_basic@many-null
+igt@xe_exec_basic@many-null-defer-bind
+igt@xe_exec_basic@many-null-defer-mmap
+igt@xe_exec_basic@many-null-rebind
+igt@xe_exec_basic@no-exec-null
+igt@xe_exec_basic@no-exec-null-defer-bind
+igt@xe_exec_basic@no-exec-null-defer-mmap
+igt@xe_exec_basic@no-exec-null-rebind
+igt@xe_exec_basic@once-null
+igt@xe_exec_basic@once-null-defer-bind
+igt@xe_exec_basic@once-null-defer-mmap
+igt@xe_exec_basic@once-null-rebind
+igt@xe_exec_basic@twice-null
+igt@xe_exec_basic@twice-null-defer-bind
+igt@xe_exec_basic@twice-null-defer-mmap
+igt@xe_exec_basic@twice-null-rebind
+igt@xe_vm@bind-engines-conflict
+igt@xe_vm@mmap-style-bind-all
+igt@xe_vm@mmap-style-bind-either-side-full
+igt@xe_vm@mmap-style-bind-either-side-partial
+igt@xe_vm@mmap-style-bind-either-side-partial-hammer
+igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer
+igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer
+igt@xe_vm@mmap-style-bind-end
+igt@xe_vm@mmap-style-bind-front
+igt@xe_vm@mmap-style-bind-many-all
+igt@xe_vm@mmap-style-bind-many-either-side-partial
+igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer
+igt@xe_vm@mmap-style-bind-one-partial
+igt@xe_vm@mmap-style-bind-userptr-all
+igt@xe_vm@mmap-style-bind-userptr-either-side-full
+igt@xe_vm@mmap-style-bind-userptr-either-side-partial
+igt@xe_vm@mmap-style-bind-userptr-one-partial
+igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer
+igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html

--===============1677394674373913655==
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
<tr><td><b>Series:</b></td><td>series starting with [1/5] xe/xe_exec_basic: A sections to test NULL (sparse) bindings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120471/">https://patchwork.freedesktop.org/series/120471/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7378 -&gt; IGTPW_9377</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9377 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9377, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9377:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-adls-5/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adls-5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9377 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rpls-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-jsl-1/igt@i915_module_load@reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-jsl-1/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7269">i915#7269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-mtlp-8/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-adlm-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7677">i915#7677</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-adlm-1/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7378/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/bat-rplp-1/igt@kms_psr@primary_page_flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7378 -&gt; IGTPW_9377</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13364: 91010bd5ed0a15e689f0fcc3817489bd02433884 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9377: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9377/index.html<br />
  IGT_7378: e78963553e05a2413cf735824517547b2bb19936 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_basic@many-engines-many-vm-null<br />
+igt@xe_exec_basic@many-engines-many-vm-null-defer-bind<br />
+igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap<br />
+igt@xe_exec_basic@many-engines-many-vm-null-rebind<br />
+igt@xe_exec_basic@many-engines-null<br />
+igt@xe_exec_basic@many-engines-null-defer-bind<br />
+igt@xe_exec_basic@many-engines-null-defer-mmap<br />
+igt@xe_exec_basic@many-engines-null-rebind<br />
+igt@xe_exec_basic@many-null<br />
+igt@xe_exec_basic@many-null-defer-bind<br />
+igt@xe_exec_basic@many-null-defer-mmap<br />
+igt@xe_exec_basic@many-null-rebind<br />
+igt@xe_exec_basic@no-exec-null<br />
+igt@xe_exec_basic@no-exec-null-defer-bind<br />
+igt@xe_exec_basic@no-exec-null-defer-mmap<br />
+igt@xe_exec_basic@no-exec-null-rebind<br />
+igt@xe_exec_basic@once-null<br />
+igt@xe_exec_basic@once-null-defer-bind<br />
+igt@xe_exec_basic@once-null-defer-mmap<br />
+igt@xe_exec_basic@once-null-rebind<br />
+igt@xe_exec_basic@twice-null<br />
+igt@xe_exec_basic@twice-null-defer-bind<br />
+igt@xe_exec_basic@twice-null-defer-mmap<br />
+igt@xe_exec_basic@twice-null-rebind<br />
+igt@xe_vm@bind-engines-conflict<br />
+igt@xe_vm@mmap-style-bind-all<br />
+igt@xe_vm@mmap-style-bind-either-side-full<br />
+igt@xe_vm@mmap-style-bind-either-side-partial<br />
+igt@xe_vm@mmap-style-bind-either-side-partial-hammer<br />
+igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer<br />
+igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer<br />
+igt@xe_vm@mmap-style-bind-end<br />
+igt@xe_vm@mmap-style-bind-front<br />
+igt@xe_vm@mmap-style-bind-many-all<br />
+igt@xe_vm@mmap-style-bind-many-either-side-partial<br />
+igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer<br />
+igt@xe_vm@mmap-style-bind-one-partial<br />
+igt@xe_vm@mmap-style-bind-userptr-all<br />
+igt@xe_vm@mmap-style-bind-userptr-either-side-full<br />
+igt@xe_vm@mmap-style-bind-userptr-either-side-partial<br />
+igt@xe_vm@mmap-style-bind-userptr-one-partial<br />
+igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer<br />
+igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer</p>

</body>
</html>

--===============1677394674373913655==--
