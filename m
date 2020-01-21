Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 04:24:49 -0000
Message-ID: <157958068985.11481.16063931248125852330@emeril.freedesktop.org>
References: <1579219079-10981-1-git-send-email-john.machado@intel.com>
In-Reply-To: <1579219079-10981-1-git-send-email-john.machado@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIFRp?=
 =?utf-8?q?gerLake_Registers_file?=
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
To: John Machado <john.machado@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add TigerLake Registers file
URL   : https://patchwork.freedesktop.org/series/72161/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7758_full -> IGTPW_3930_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/index.html

Known issues
------------

  Here are the changes found in IGTPW_3930_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#232])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb2/igt@gem_eio@unwedge-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#470] / [i915#472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb8/igt@gem_exec_parallel@fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb7/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb4/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#460] / [i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb1/igt@gem_exec_suspend@basic-s3-devices.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb6/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [PASS][15] -> [TIMEOUT][16] ([fdo#112271] / [i915#530]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-kbl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271] / [i915#530]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl2/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl6/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#530] / [i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-hsw5/igt@gem_persistent_relocs@forked-thrashing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#472]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb1/igt@gem_sync@basic-store-each.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb6/igt@gem_sync@basic-store-each.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#71])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl1/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([i915#478]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#668]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +13 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@processes:
    - shard-iclb:         [FAIL][51] ([i915#570]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_ctx_persistence@processes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb6/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#111735] / [i915#472]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb8/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][55] ([i915#461] / [i915#472]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][61] ([i915#472] / [i915#707]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb4/igt@gem_exec_schedule@smoketest-vebox.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb8/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [INCOMPLETE][63] ([i915#472]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb3/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][65] ([fdo#112271] / [i915#530]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [TIMEOUT][67] ([fdo#112271] / [i915#530]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][69] ([i915#472] / [i915#707] / [i915#796]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb3/igt@gem_pipe_control_store_loop@reused-buffer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb7/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][71] ([fdo#111870] / [i915#478]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * {igt@i915_pm_rc6_residency@rc6-idle}:
    - shard-apl:          [FAIL][73] ([i915#973]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl3/igt@i915_pm_rc6_residency@rc6-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live_execlists:
    - shard-kbl:          [INCOMPLETE][75] ([fdo#103665] / [fdo#112175] / [fdo#112259]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl6/igt@i915_selftest@live_execlists.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl7/igt@i915_selftest@live_execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-tglb:         [FAIL][83] ([i915#49]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][85] ([i915#140] / [i915#250]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][89] ([fdo#112080]) -> [PASS][90] +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][91] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870] / [i915#478])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@runner@aborted:
    - shard-glk:          ([FAIL][93], [FAIL][94]) ([k.org#202321]) -> [FAIL][95] ([i915#997] / [k.org#202321])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk9/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112175]: https://bugs.freedesktop.org/show_bug.cgi?id=112175
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#973]: https://gitlab.freedesktop.org/drm/intel/issues/973
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3930
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7758: d19270ce1f367fbfc1ff3b539bcb50e11ded181f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3930/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
