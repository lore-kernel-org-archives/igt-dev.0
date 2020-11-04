Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Nov 2020 22:27:00 -0000
Message-ID: <160452882067.21430.835332134071064370@emeril.freedesktop.org>
References: <20201104180008.42282-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201104180008.42282-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Fdevice=5Fscan=3A_Pro?=
 =?utf-8?q?vide_function_for_return_integrated_card?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0252115291=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0252115291==
Content-Type: multipart/alternative;
 boundary="===============7694047593742358185=="

--===============7694047593742358185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_device_scan: Provide function for return integrated card
URL   : https://patchwork.freedesktop.org/series/83507/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9265_full -> IGTPW_5127_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5127_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5127_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5127_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-hsw:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@gem_exec_flush@basic-wb-rw-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk3/igt@gem_workarounds@suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk4/igt@gem_workarounds@suspend-resume.html
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw1/igt@gem_workarounds@suspend-resume.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@i915_suspend@sysfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@i915_suspend@sysfs-reader.html

  
#### Warnings ####

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][11] ([i915#2411]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  
Known issues
------------

  Here are the changes found in IGTPW_5127_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_blits@basic:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#1888]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@gem_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_blits@basic.html

  * igt@gem_caching@reads:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb4/igt@gem_caching@reads.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb5/igt@gem_caching@reads.html

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@gem_eio@kms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1185]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb4/igt@gem_workarounds@suspend-resume.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#1436])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@gen9_exec_parse@allowed-single.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][25] -> [INCOMPLETE][26] ([i915#1635]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@i915_suspend@sysfs-reader.html
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2055]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@i915_suspend@sysfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw1/igt@i915_suspend@sysfs-reader.html
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#1982]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#2598])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl3/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl4/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1373])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb3/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-256:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@kms_plane_cursor@pipe-b-viewport-size-256.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_plane_cursor@pipe-b-viewport-size-256.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1635]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [PASS][51] -> [SKIP][52] ([fdo#109271]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([i915#1836])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [PASS][55] -> [SKIP][56] ([i915#1836])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][59] -> [SKIP][60] ([fdo#109271]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109278])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         [PASS][63] -> [SKIP][64] ([i915#1354]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@perf@non-sampling-read-error.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb2/igt@perf@non-sampling-read-error.html
    - shard-apl:          [PASS][65] -> [SKIP][66] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@perf@non-sampling-read-error.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@perf@non-sampling-read-error.html
    - shard-glk:          [PASS][67] -> [SKIP][68] ([fdo#109271] / [i915#1354]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@perf@non-sampling-read-error.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk4/igt@perf@non-sampling-read-error.html
    - shard-kbl:          [PASS][69] -> [SKIP][70] ([fdo#109271] / [i915#1354]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@perf@non-sampling-read-error.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl4/igt@perf@non-sampling-read-error.html
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([i915#1354]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@perf@non-sampling-read-error.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@perf@non-sampling-read-error.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotrebind}:
    - shard-iclb:         [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb1/igt@core_hotunplug@hotrebind.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@core_hotunplug@hotrebind.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][75] ([i915#118] / [i915#95]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-hsw:          [FAIL][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_exec_whisper@basic-normal-all.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw2/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-iclb:         [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - shard-snb:          [INCOMPLETE][81] ([i915#82]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html

  * igt@i915_suspend@forcewake:
    - shard-iclb:         [INCOMPLETE][83] ([i915#1185]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@i915_suspend@forcewake.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb1/igt@i915_suspend@forcewake.html
    - shard-kbl:          [INCOMPLETE][85] ([i915#155] / [i915#636]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@i915_suspend@forcewake.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl3/igt@i915_suspend@forcewake.html
    - shard-hsw:          [INCOMPLETE][87] ([i915#2055]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@i915_suspend@forcewake.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw4/igt@i915_suspend@forcewake.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#2521]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [FAIL][91] ([i915#2346]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:
    - shard-iclb:         [FAIL][93] ([i915#52] / [i915#54]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +6 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk3/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-apl:          [DMESG-WARN][97] ([i915#1635] / [i915#1982]) -> [PASS][98] +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
    - shard-kbl:          [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
    - shard-tglb:         [DMESG-WARN][101] ([i915#1982]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [FAIL][103] ([i915#2546]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [FAIL][105] ([i915#49]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [FAIL][107] ([i915#49]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence:
    - shard-glk:          [FAIL][109] ([i915#53]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-glk:          [INCOMPLETE][111] -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-apl:          [INCOMPLETE][113] ([i915#1635]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [INCOMPLETE][115] ([i915#155]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-hsw:          [INCOMPLETE][117] -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [SKIP][119] ([i915#1836]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [SKIP][121] ([fdo#109271]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [SKIP][123] ([fdo#109271]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [SKIP][125] ([fdo#109271] / [i915#1635]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [SKIP][127] ([i915#1836]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [SKIP][129] ([fdo#109271]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][131] ([fdo#109441]) -> [PASS][132] +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - shard-kbl:          [INCOMPLETE][133] ([i915#1731]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume:
    - shard-tglb:         [DMESG-WARN][135] ([i915#2411]) -> [INCOMPLETE][136] ([i915#1436] / [i915#456]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@gem_workarounds@suspend-resume.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][137] ([i915#1515]) -> [WARN][138] ([i915#1515])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][139] ([fdo#109293] / [fdo#109506]) -> [SKIP][140] ([i915#579])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][141] ([fdo#109506] / [i915#2411]) -> [SKIP][142] ([i915#579])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [INCOMPLETE][143] ([i915#1436] / [i915#456]) -> [DMESG-WARN][144] ([i915#2411])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_suspend@forcewake.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb6/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [DMESG-WARN][145] ([i915#2411]) -> [DMESG-WARN][146] ([i915#1436])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@i915_suspend@sysfs-reader.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][147] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][148] ([i915#2411])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-tglb:         [DMESG-WARN][149] ([i915#2411]) -> [INCOMPLETE][150] ([i915#2411] / [i915#456])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][151] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][152] ([fdo#108145] / [i915#1635] / [i915#1982])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          [FAIL][153] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][154] ([fdo#108145] / [i915#1982])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][155], [FAIL][156]) ([fdo#109271] / [i915#2439]) -> ([FAIL][157], [FAIL][158]) ([fdo#109271] / [i915#2439] / [i915#483])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][159], [FAIL][160]) ([i915#1814] / [i915#2439] / [i915#483]) -> ([FAIL][161], [FAIL][162]) ([i915#2439] / [i915#483])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][163], [FAIL][164]) ([fdo#109271] / [i915#1635] / [i915#1814] / [i915#2439]) -> ([FAIL][165], [FAIL][166]) ([fdo#109271] / [i915#1635] / [i915#2439])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl1/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][167], [FAIL][168]) ([i915#181

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html

--===============7694047593742358185==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/igt_device_scan: Provide function for return integrated card</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83507/">https://patchwork.freedesktop.org/series/83507/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9265_full -&gt; IGTPW_5127_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5127_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5127_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5127_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@gem_exec_flush@basic-wb-rw-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_exec_flush@basic-wb-rw-default.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk3/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk4/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw1/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5127_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_blits@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@gem_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@gem_blits@basic.html">FAIL</a> ([i915#1888]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb4/igt@gem_caching@reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb5/igt@gem_caching@reads.html">INCOMPLETE</a> ([i915#82])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb4/igt@gem_eio@kms.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#1185]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#1436])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw1/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#2055]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#155]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl4/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@kms_flip@flip-vs-suspend@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb3/igt@kms_flip@flip-vs-suspend@b-edp1.html">INCOMPLETE</a> ([i915#1373])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">DMESG-WARN</a> ([i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-viewport-size-256:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@kms_plane_cursor@pipe-b-viewport-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_plane_cursor@pipe-b-viewport-size-256.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271] / [i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> ([fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@non-sampling-read-error:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb2/igt@perf@non-sampling-read-error.html">SKIP</a> ([i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@perf@non-sampling-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk4/igt@perf@non-sampling-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl4/igt@perf@non-sampling-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@perf@non-sampling-read-error.html">SKIP</a> ([i915#1354]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb1/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_exec_whisper@basic-normal-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw2/igt@gem_exec_whisper@basic-normal-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html">INCOMPLETE</a> ([i915#82]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb1/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#155] / [i915#636]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl3/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw4/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#1635] / [i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk3/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html">FAIL</a> ([i915#53]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk9/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html">INCOMPLETE</a> ([i915#1731]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#1436] / [i915#456]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#1515]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1515])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#1436] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#1436])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#1635] / [i915#265]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> ([fdo#108145] / [i915#1635] / [i915#1982])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> ([fdo#108145] / [i915#1982])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#2439]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-hsw1/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#2439] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2439] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#2439] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1635] / [i915#1814] / [i915#2439]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/shard-apl4/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1635] / [i915#2439])</p>
</li>
<li>
<p>shard-glk:          ([FAIL][167], [FAIL][168]) ([i915#181</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7694047593742358185==--

--===============0252115291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0252115291==--
