Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4598583707736510302=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack@kde.org>
Date: Thu, 13 Apr 2023 02:05:20 -0000
Message-ID: <168135152040.3697.2379804853418690155@emeril.freedesktop.org>
References: <20230413012426.503658-1-zack@kde.org>
In-Reply-To: <20230413012426.503658-1-zack@kde.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHZt?=
 =?utf-8?q?wgfx_support_=28rev4=29?=
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

--===============4598583707736510302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vmwgfx support (rev4)
URL   : https://patchwork.freedesktop.org/series/111441/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12997 -> IGTPW_8795
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8795 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8795, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8795:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-1:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@slpc:
    - bat-atsm-1:         [PASS][3] -> [FAIL][4] +38 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_selftest@live@slpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_8795 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-rpls-2:         NOTRUN -> [ABORT][5] ([i915#6687])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#5775]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_sync@basic-each:
    - bat-atsm-1:         [PASS][7] -> [SKIP][8] ([i915#2575]) +38 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_sync@basic-each.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_sync@basic-each.html

  * igt@gem_wait@busy:
    - bat-atsm-1:         NOTRUN -> [SKIP][9] ([i915#2575]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_wait@busy.html

  * igt@i915_pm_rpm@basic-rte:
    - bat-atsm-1:         [PASS][10] -> [SKIP][11] ([i915#5174]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][12] ([i915#6367] / [i915#7913] / [i915#7996])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][14] -> [FAIL][15] ([i915#7932])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][16] ([i915#3546]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - bat-atsm-1:         [SKIP][17] ([i915#2582]) -> [PASS][18] +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@fbdev@eof.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@fbdev@eof.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         [FAIL][19] ([i915#8308]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [ABORT][21] ([i915#4983] / [i915#7913]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-2/igt@i915_selftest@live@reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         [DMESG-FAIL][23] ([i915#6997]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8700k:       [ABORT][25] ([i915#8299]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][27] ([i915#7932]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
#### Warnings ####

  * igt@gem_mmap@basic:
    - bat-atsm-1:         [SKIP][29] ([i915#4083]) -> [SKIP][30] ([i915#2575])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_mmap@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         [SKIP][31] ([i915#4077]) -> [SKIP][32] ([i915#2575]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-atsm-1:         [SKIP][33] ([i915#4079]) -> [SKIP][34] ([i915#2575]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_pread_basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_pread_basic.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         [SKIP][35] ([i915#6077]) -> [SKIP][36] ([i915#2575]) +36 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_addfb_basic@size-max.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         [SKIP][37] ([i915#6078]) -> [SKIP][38] ([i915#2575]) +19 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-plain-flip:
    - bat-atsm-1:         [SKIP][39] ([i915#6166]) -> [SKIP][40] ([i915#2575]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_flip@basic-plain-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-atsm-1:         [SKIP][41] ([i915#6093]) -> [SKIP][42] ([i915#2575]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-atsm-1:         [SKIP][43] ([i915#1836]) -> [SKIP][44] ([i915#2575]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         [SKIP][45] ([i915#7357]) -> [SKIP][46] ([i915#2575])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_prop_blob@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][47] ([i915#1072]) -> [SKIP][48] ([i915#2575]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-atsm-1:         [SKIP][49] ([i915#6094]) -> [SKIP][50] ([i915#2575])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         [SKIP][51] ([fdo#109295] / [i915#6078]) -> [SKIP][52] ([i915#2575])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-atsm-1:         [SKIP][53] ([fdo#109295] / [i915#4077]) -> [SKIP][54] ([i915#2575]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         [SKIP][55] ([fdo#109295]) -> [SKIP][56] ([i915#2575]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-write.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-write.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
  [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7253 -> IGTPW_8795

  CI-20190529: 20190529
  CI_DRM_12997: afe31b57e95ebf86f5814fd01a030c2f9551acb4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8795: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html
  IGT_7253: 1a619e8dbc6ca887f2ae24b2d7f1ac536342f58c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 210 lines
--- 2 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html

--===============4598583707736510302==
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
<tr><td><b>Series:</b></td><td>Add vmwgfx support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111441/">https://patchwork.freedesktop.org/series/111441/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12997 -&gt; IGTPW_8795</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8795 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8795, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8795:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_selftest@live@slpc.html">FAIL</a> +38 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8795 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5775">i915#5775</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_sync@basic-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_wait@busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5174">i915#5174</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7996">i915#7996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@fbdev@eof.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-11/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8308">i915#8308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-11/igt@i915_pm_rps@basic-api.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8299">i915#8299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6166">i915#6166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6093">i915#6093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7357">i915#7357</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6094">i915#6094</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7253 -&gt; IGTPW_8795</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12997: afe31b57e95ebf86f5814fd01a030c2f9551acb4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8795: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html<br />
  IGT_7253: 1a619e8dbc6ca887f2ae24b2d7f1ac536342f58c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 210 lines<br />
--- 2 lines</p>

</body>
</html>

--===============4598583707736510302==--
