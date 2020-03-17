Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 12:27:11 -0000
Message-ID: <158444803193.5180.11130986310381513515@emeril.freedesktop.org>
References: <20200317071906.28879-1-swati2.sharma@intel.com>
In-Reply-To: <20200317071906.28879-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos_=28rev4=29?=
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_atomic: add test to validate immutable zpos (rev4)
URL   : https://patchwork.freedesktop.org/series/73956/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8139_full -> IGTPW_4314_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4314_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_atomic@plane_primary_overlay_mutable_zpos} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb8/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb5/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8139_full and IGTPW_4314_full:

### New IGT tests (5) ###

  * igt@kms_atomic@plane_immutable_zpos:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 0.51] s

  * igt@kms_atomic@plane_primary_overlay_mutable_zpos:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@off:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4314_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([fdo#112126])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1401])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb3/igt@gem_exec_whisper@basic-fds-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb8/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#110789] / [fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@fill-fb:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([i915#478])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb6/igt@kms_draw_crc@fill-fb.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-snb6/igt@kms_draw_crc@fill-fb.html
    - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw4/igt@kms_draw_crc@fill-fb.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#62]) +26 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl2/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl6/igt@kms_vblank@pipe-c-wait-busy-hang.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276]) +20 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +12 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1402]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#56]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][51] ([fdo#110854]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-snb:          [DMESG-WARN][59] ([fdo#110789] / [i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb6/igt@gem_partial_pwrite_pread@write-uncached.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-snb2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][65] ([fdo#111870] / [i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb6/igt@i915_pm_rps@reset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][71] ([i915#72]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][77] ([i915#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [SKIP][83] ([fdo#112015]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][87] ([fdo#109278]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-hsw:          [INCOMPLETE][89] ([i915#61]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][91] ([fdo#109276]) -> [PASS][92] +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb7/igt@prime_busy@after-bsd2.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb4/igt@prime_busy@after-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][93] ([fdo#103927]) -> [INCOMPLETE][94] ([fdo#103927] / [i915#1402])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [DMESG-WARN][95] ([fdo#111870]) -> [DMESG-WARN][96] ([fdo#110789] / [fdo#111870])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [SKIP][98] ([i915#588])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][99] ([i915#454]) -> [SKIP][100] ([i915#468])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][101] ([fdo#111644] / [i915#1397]) -> [SKIP][102] ([i915#1316])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][103] ([fdo#110892]) -> [SKIP][104] ([i915#1316])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][105] ([fdo#103927] / [i915#656]) -> [INCOMPLETE][106] ([fdo#103927] / [i915#529])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@i915_selftest@live@execlists.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl7/igt@i915_selftest@live@execlists.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][107] ([i915#180]) -> [INCOMPLETE][108] ([i915#648])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb:
    - shard-apl:          [FAIL][109] ([fdo#108145]) -> [DMESG-FAIL][110] ([fdo#108145] / [i915#62]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][111], [FAIL][112]) ([i915#1389] / [i915#1402] / [i915#92]) -> ([FAIL][113], [FAIL][114], [FAIL][115]) ([i915#1389] / [i915#1402] / [i915#716] / [i915#92])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#103927] / [i915#1402] / [i915#529]) -> ([FAIL][119], [FAIL][120]) ([fdo#103927] / [i915#1402])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5512 -> IGTPW_4314
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8139: 1516ff1b2279ede916d81b1978da0428414705f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4314: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html
  IGT_5512: f6fef7eff6f121e5e89afd7e70116f471ccd5b8b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
