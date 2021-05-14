Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 May 2021 07:28:26 -0000
Message-ID: <162097730608.21338.1469418577714875900@emeril.freedesktop.org>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1207116338=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1207116338==
Content-Type: multipart/alternative;
 boundary="===============6877250159320373156=="

--===============6877250159320373156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev3)
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10081 -> IGTPW_5812
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5812 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5812, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5812:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - fi-bdw-5557u:       [FAIL][1] ([i915#1602] / [i915#2029]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bdw-5557u/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5812 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-ilk-650:         NOTRUN -> [SKIP][3] ([fdo#109271]) +30 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][4] ([i915#2283])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-elk-e7500:       [PASS][5] -> [FAIL][6] ([i915#3457])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - fi-bsw-n3050:       [PASS][7] -> [FAIL][8] ([i915#3457]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_fence@nb-await@bcs0:
    - fi-bsw-nick:        [PASS][9] -> [FAIL][10] ([i915#3457])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-kefka:       [PASS][11] -> [FAIL][12] ([i915#3457])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@i915_module_load@reload:
    - fi-ilk-650:         NOTRUN -> [DMESG-FAIL][13] ([i915#3457]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bdw-5557u:       NOTRUN -> [DMESG-FAIL][14] ([i915#3462])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][15] -> [INCOMPLETE][16] ([i915#2782])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - fi-bdw-5557u:       NOTRUN -> [DMESG-WARN][17] ([i915#3457]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@i915_selftest@live@mman.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][18] ([i915#3457])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][20] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][21] -> [DMESG-WARN][22] ([i915#2868])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-ilk-650:         NOTRUN -> [FAIL][23] ([i915#3457]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-tgl-u2:          [PASS][24] -> [FAIL][25] ([i915#2416])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-elk-e7500:       [PASS][26] -> [FAIL][27] ([i915#53]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bwr-2160:        [PASS][28] -> [FAIL][29] ([i915#53])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@cursor_plane_move:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][30] ([fdo#109271]) +9 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@vcs0:
    - fi-bxt-dsi:         [FAIL][31] ([i915#3457]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bxt-dsi/igt@gem_exec_fence@basic-await@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bxt-dsi/igt@gem_exec_fence@basic-await@vcs0.html
    - fi-bsw-kefka:       [FAIL][33] ([i915#3457]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][35] ([i915#1888]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][37] ([i915#3177] / [i915#3457]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_wait@busy@all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_wait@busy@all.html
    - fi-bsw-kefka:       [FAIL][39] ([i915#3177] / [i915#3457]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_wait@busy@all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_wait@busy@all.html
    - fi-pnv-d510:        [FAIL][41] ([i915#3457]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-pnv-d510/igt@gem_wait@busy@all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-pnv-d510/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bsw-nick:        [FAIL][43] ([i915#3457]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_wait@wait@all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_wait@wait@all.html

  * igt@kms_busy@basic@flip:
    - fi-ilk-650:         [INCOMPLETE][45] ([i915#3457]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-ilk-650/igt@kms_busy@basic@flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_busy@basic@flip.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-elk-e7500:       [FAIL][47] ([i915#53]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-ilk-650:         [FAIL][49] ([i915#3472]) -> [FAIL][50] ([i915#3457] / [i915#3472])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - fi-bsw-kefka:       [DMESG-WARN][51] ([i915#1982] / [i915#3457]) -> [DMESG-FAIL][52] ([i915#1982] / [i915#3457])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@i915_module_load@reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][53] -> [INCOMPLETE][54] ([i915#2782] / [i915#2940])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-cfl-8700k:       [FAIL][55] ([i915#3363]) -> [FAIL][56] ([i915#2426] / [i915#3363])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-cfl-8700k/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-cfl-8700k/igt@runner@aborted.html
    - fi-kbl-r:           [FAIL][57] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][58] ([i915#1436] / [i915#3363])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-kbl-r/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-kbl-r/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][59] ([i915#1436] / [i915#3363]) -> [FAIL][60] ([i915#1436] / [i915#2426] / [i915#3363])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-kbl-soraka/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-kbl-soraka/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2416]: https://gitlab.freedesktop.org/drm/intel/issues/2416
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3472]: https://gitlab.freedesktop.org/drm/intel/issues/3472
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53


Participating hosts (36 -> 33)
------------------------------

  Missing    (3): fi-rkl-11500t fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6083 -> IGTPW_5812

  CI-20190529: 20190529
  CI_DRM_10081: dc2124d77a63b582650bad3429c60d8163819ed1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5812: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html
  IGT_6083: d28aee5c5f528aa6c352c3339f20aaed4d698ffa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_pxp@allow-regular-ctx-old-prot-buff-execution-after-suspend-resume
+igt@gem_pxp@create-protected-buffer
+igt@gem_pxp@create-regular-buffer
+igt@gem_pxp@create-regular-context-1
+igt@gem_pxp@create-regular-context-2
+igt@gem_pxp@create-valid-protected-context
+igt@gem_pxp@display-protected-crc-without-hdcp
+igt@gem_pxp@display-protected-crc-with-hdcp
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted
+igt@gem_pxp@fail-invalid-protected-context
+igt@gem_pxp@hw-rejects-pxp-buffer
+igt@gem_pxp@hw-rejects-pxp-context
+igt@gem_pxp@old-prot-context-reports-reset-stat-after-suspend-resume
+igt@gem_pxp@protected-encrypted-src-copy-not-readible
+igt@gem_pxp@protected-raw-src-copy-not-readible
+igt@gem_pxp@regular-baseline-src-copy-readible
+igt@gem_pxp@reject-modify-context-protection-off-1
+igt@gem_pxp@reject-modify-context-protection-off-2
+igt@gem_pxp@reject-modify-context-protection-off-3
+igt@gem_pxp@reject-modify-context-protection-on
+igt@gem_pxp@reject-old-prot-buffer-execution-after-suspend-resume
+igt@gem_pxp@reject-old-prot-context-execution-after-suspend-resume
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html

--===============6877250159320373156==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10081 -&gt; IGTPW_5812</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5812 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5812, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5812:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5812 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2416">i915#2416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bxt-dsi/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bxt-dsi/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-pnv-d510/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-pnv-d510/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@gem_wait@wait@all.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-ilk-650/igt@kms_busy@basic@flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10081/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (36 -&gt; 33)</h2>
<p>Missing    (3): fi-rkl-11500t fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6083 -&gt; IGTPW_5812</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10081: dc2124d77a63b582650bad3429c60d8163819ed1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5812: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5812/index.html<br />
  IGT_6083: d28aee5c5f528aa6c352c3339f20aaed4d698ffa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pxp@allow-regular-ctx-old-prot-buff-execution-after-suspend-resume<br />
+igt@gem_pxp@create-protected-buffer<br />
+igt@gem_pxp@create-regular-buffer<br />
+igt@gem_pxp@create-regular-context-1<br />
+igt@gem_pxp@create-regular-context-2<br />
+igt@gem_pxp@create-valid-protected-context<br />
+igt@gem_pxp@display-protected-crc-without-hdcp<br />
+igt@gem_pxp@display-protected-crc-with-hdcp<br />
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted<br />
+igt@gem_pxp@fail-invalid-protected-context<br />
+igt@gem_pxp@hw-rejects-pxp-buffer<br />
+igt@gem_pxp@hw-rejects-pxp-context<br />
+igt@gem_pxp@old-prot-context-reports-reset-stat-after-suspend-resume<br />
+igt@gem_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@gem_pxp@protected-raw-src-copy-not-readible<br />
+igt@gem_pxp@regular-baseline-src-copy-readible<br />
+igt@gem_pxp@reject-modify-context-protection-off-1<br />
+igt@gem_pxp@reject-modify-context-protection-off-2<br />
+igt@gem_pxp@reject-modify-context-protection-off-3<br />
+igt@gem_pxp@reject-modify-context-protection-on<br />
+igt@gem_pxp@reject-old-prot-buffer-execution-after-suspend-resume<br />
+igt@gem_pxp@reject-old-prot-context-execution-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume</p>

</body>
</html>

--===============6877250159320373156==--

--===============1207116338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1207116338==--
