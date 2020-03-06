Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 22:17:40 -0000
Message-ID: <158353306077.3083.11004079062152649210@emeril.freedesktop.org>
References: <20200306042734.9100-1-karthik.b.s@intel.com>
In-Reply-To: <20200306042734.9100-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Ftiled=5Fdisplay=3A_Increase_the_time_limit_to_receiv?=
 =?utf-8?q?e_all_page_flips?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_dp_tiled_display: Increase the time limit to receive all page flips
URL   : https://patchwork.freedesktop.org/series/74367/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8074_full -> IGTPW_4269_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4269_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt}:
    - shard-hsw:          [DMESG-WARN][3] ([i915#478]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * {igt@gem_userptr_blits@map-fixed-invalidate@gtt}:
    - shard-hsw:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate@gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8074_full and IGTPW_4269_full:

### New IGT tests (4) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.49, 2.27] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.56, 2.36] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.56, 2.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.57, 2.17] s

  

Known issues
------------

  Here are the changes found in IGTPW_4269_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb6/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([fdo#110789] / [fdo#111870])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@gem_userptr_blits@sync-unmap.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#447])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#189])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl1/igt@kms_flip@flip-vs-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-kbl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#433])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +15 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk5/igt@gem_exec_whisper@basic-queues-priority.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][45] ([fdo#111870]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@gem_userptr_blits@sync-unmap-after-close.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][47] ([fdo#111870] / [i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl2/igt@gem_workarounds@suspend-resume-context.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1390]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-tglb6/igt@i915_module_load@reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-tglb5/igt@i915_module_load@reload.html
    - shard-snb:          [INCOMPLETE][53] ([i915#82]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@i915_module_load@reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb6/igt@i915_module_load@reload.html
    - shard-iclb:         [INCOMPLETE][55] ([i915#140]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb2/igt@i915_module_load@reload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb1/igt@i915_module_load@reload.html
    - shard-kbl:          [INCOMPLETE][57] ([fdo#103665] / [i915#1390]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl7/igt@i915_module_load@reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-kbl6/igt@i915_module_load@reload.html
    - shard-hsw:          [INCOMPLETE][59] ([i915#1312] / [i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw1/igt@i915_module_load@reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw6/igt@i915_module_load@reload.html
    - shard-glk:          [INCOMPLETE][61] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk6/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-glk3/igt@i915_module_load@reload.html
    - shard-apl:          [INCOMPLETE][63] ([fdo#103927] / [i915#1390]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl7/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-apl3/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw6/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-tglb5/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [SKIP][69] ([i915#1316]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb1/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-glk3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-snb:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl6/igt@kms_flip@flip-vs-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-apl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl3/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-kbl1/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][81] ([fdo#109276]) -> [INCOMPLETE][82] ([i915#1381]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][83] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][84] ([fdo#110789] / [fdo#111870] / [i915#478])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][85] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][86] ([fdo#111870] / [i915#478])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@i915_pm_rpm@pm-caching.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][89] ([fdo#109349]) -> [DMESG-WARN][90] ([i915#1226])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98]) ([fdo#109271] / [fdo#111870] / [k.org#204565]) -> ([FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106]) ([fdo#111870])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw1/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw6/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw6/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw8/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][107], [FAIL][108]) ([i915#92] / [k.org#204565]) -> [FAIL][109] ([i915#92])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl7/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][110], [FAIL][111]) ([fdo#103927] / [k.org#204565]) -> [FAIL][112] ([fdo#103927])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-apl1/igt@runner@aborted.html
    - shard-snb:          ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#111870] / [i915#1077] / [k.org#204565]) -> ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#111870] / [i915#1077])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb5/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1312]: https://gitlab.freedesktop.org/drm/intel/issues/1312
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4269
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8074: 0dd63259839ca847514d9999749219635f311015 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4269: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4269/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
