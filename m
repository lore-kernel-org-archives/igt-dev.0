Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 07:28:07 -0000
Message-ID: <158460288755.17935.2020811539888689738@emeril.freedesktop.org>
References: <20200313132556.26038-1-swati2.sharma@intel.com>
In-Reply-To: <20200313132556.26038-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fhdr=3A_Made_debug_info_more_evident?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_hdr: Made debug info more evident
URL   : https://patchwork.freedesktop.org/series/74675/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8133_full -> IGTPW_4301_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4301_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4301_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4301_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         [SKIP][1] ([i915#1187]) -> [SKIP][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@kms_hdr@static-toggle.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb2/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         [SKIP][3] ([i915#1187]) -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html

  
Known issues
------------

  Here are the changes found in IGTPW_4301_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#1402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [PASS][7] -> [TIMEOUT][8] ([i915#1340])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +12 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@gem_exec_schedule@in-order-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb7/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#447])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl2/igt@kms_flip@dpms-vs-vblank-race.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl3/igt@kms_flip@dpms-vs-vblank-race.html
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103927])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl3/igt@kms_flip@dpms-vs-vblank-race.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl7/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl1/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#1185] / [i915#123])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#173])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb7/igt@kms_psr@no_drrs.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1085])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][43] ([fdo#103927] / [i915#1402]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-shared-gtt-blt:
    - shard-tglb:         [FAIL][45] ([i915#616]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-tglb6/igt@gem_ctx_shared@exec-shared-gtt-blt.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +14 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-iclb:         [INCOMPLETE][55] ([i915#1401]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb2/igt@gem_exec_whisper@basic-fds-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl7/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#716]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [FAIL][63] ([i915#71]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl1/igt@kms_color@pipe-b-degamma.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl1/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [FAIL][65] ([i915#71]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl8/igt@kms_color@pipe-b-degamma.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][67] ([i915#46]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +12 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][75] ([fdo#111732] / [i915#1322]) -> [TIMEOUT][76] ([i915#1322])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl6/igt@gem_linear_blits@normal.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl1/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][78] ([fdo#111870] / [i915#478])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][79] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][80] ([fdo#111870])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-hsw7/igt@gem_userptr_blits@dmabuf-sync.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][81] ([i915#478]) -> [DMESG-WARN][82] ([fdo#110789] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
    - shard-snb:          [DMESG-WARN][83] ([i915#478]) -> [DMESG-WARN][84] ([fdo#110789] / [i915#478])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][85] ([i915#454]) -> [SKIP][86] ([i915#468])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][87] ([i915#1316]) -> [SKIP][88] ([fdo#109506])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][89] ([i915#1316]) -> [SKIP][90] ([fdo#109293] / [fdo#109506])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][91] ([i915#155]) -> [DMESG-WARN][92] ([i915#180])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][93] ([i915#92]) -> ([FAIL][94], [FAIL][95]) ([i915#1389] / [i915#1402] / [i915#92])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-kbl3/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][96], [FAIL][97]) ([fdo#103927] / [i915#1402]) -> [FAIL][98] ([fdo#103927])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl1/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8133/shard-apl3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/shard-apl3/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5508 -> IGTPW_4301
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8133: e9912ab15be5d104fafd00c5e72361ae3b8839a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4301: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/index.html
  IGT_5508: 89d644600a1a9f08794cc7106b63758df40ce1d8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4301/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
