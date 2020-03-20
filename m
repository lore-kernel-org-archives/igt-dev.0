Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 02:35:33 -0000
Message-ID: <158467173331.11039.12003522249597265732@emeril.freedesktop.org>
References: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?onfigurable_poll_delay_in_perf_OA_=28rev3=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA (rev3)
URL   : https://patchwork.freedesktop.org/series/74655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8161_full -> IGTPW_4332_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4332_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4332_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4332_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html

  * {igt@perf@blocking-parameterized} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][3] ([i915#478]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8161_full and IGTPW_4332_full:

### New IGT tests (2) ###

  * igt@perf@blocking-parameterized:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@polling-parameterized:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4332_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#72])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb8/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl4/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +20 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][41] ([fdo#110854]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][49] ([i915#1318] / [i915#1401]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][53] ([fdo#111870] / [i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][55] ([i915#1316]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb7/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk6/igt@i915_pm_rpm@gem-execbuf.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-glk7/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][59] ([i915#1316]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][65] ([i915#173]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@kms_psr@no_drrs.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +11 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][73] -> [INCOMPLETE][74] ([i915#1402])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [INCOMPLETE][75] ([i915#1401]) -> [TIMEOUT][76] ([i915#1408])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb8/igt@gem_exec_whisper@basic-fds-all.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb5/igt@gem_exec_whisper@basic-fds-all.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][77], [FAIL][78]) ([i915#1389] / [i915#1402] / [i915#1485] / [i915#92]) -> ([FAIL][79], [FAIL][80]) ([i915#1389] / [i915#1402] / [i915#92])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl7/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl3/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-kbl2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][81], [FAIL][82], [FAIL][83]) ([i915#1318] / [i915#1389] / [i915#1401]) -> [FAIL][84] ([i915#1389])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb8/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb1/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-tglb6/igt@runner@aborted.html
    - shard-snb:          ([FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90]) ([fdo#111870] / [i915#1077] / [i915#1485]) -> ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96]) ([fdo#111870] / [i915#1077] / [i915#1485] / [i915#698])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb6/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb2/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb4/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb2/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb5/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1408]: https://gitlab.freedesktop.org/drm/intel/issues/1408
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4332
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8161: b2b8d8634bf653904ef3268ca7ccedf51f6405af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4332: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4332/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
