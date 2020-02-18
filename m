Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Feb 2020 10:01:09 -0000
Message-ID: <158202006906.31433.4264269215414333901@emeril.freedesktop.org>
References: <20200215023331.41469-1-dale.b.stimson@intel.com>
In-Reply-To: <20200215023331.41469-1-dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbW1pb19i?=
 =?utf-8?q?ase_via_debugfs_infrastructure_+_gem=5Fctx=5Fisolation?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: mmio_base via debugfs infrastructure + gem_ctx_isolation
URL   : https://patchwork.freedesktop.org/series/73493/
State : success

== Summary ==

CI Bug Log - changes from IGT_5443_full -> IGTPW_4159_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html

Known issues
------------

  Here are the changes found in IGTPW_4159_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +12 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#694]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-hsw4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-snb7/igt@gem_userptr_blits@sync-unmap.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#1172])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb5/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1149])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb2/igt@kms_color@pipe-a-ctm-red-to-blue.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb5/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([fdo#111703]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1173])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +10 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-snb1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-snb6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#559])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#1183])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb8/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1171])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb5/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb5/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#402])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb2/igt@kms_rotation_crc@bad-tiling.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#65])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb3/igt@kms_rotation_crc@primary-rotation-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb8/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][45] -> [INCOMPLETE][46] ([i915#61])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_caching@read-writes:
    - shard-hsw:          [FAIL][47] ([i915#694]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-hsw7/igt@gem_caching@read-writes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-hsw4/igt@gem_caching@read-writes.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-tglb:         [FAIL][49] ([IGT#28]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-glk:          [FAIL][51] ([i915#1241]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][53] ([fdo#112271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb5/igt@gem_exec_balancer@hang.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +14 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [INCOMPLETE][61] ([fdo#103665]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-kbl2/igt@gem_workarounds@suspend-resume.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-kbl2/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [DMESG-WARN][65] ([i915#118] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk3/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_busy@extended-modeset-hang-oldfb-render-pipe-a:
    - shard-snb:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-snb5/igt@kms_busy@extended-modeset-hang-oldfb-render-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-snb4/igt@kms_busy@extended-modeset-hang-oldfb-render-pipe-a.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][69] ([i915#168]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-kbl1/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][71] ([i915#168]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-apl7/igt@kms_color@pipe-c-ctm-max.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-apl2/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled:
    - shard-tglb:         [DMESG-FAIL][77] ([i915#402]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [SKIP][83] ([i915#668]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-tglb:         [FAIL][85] ([i915#1183]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-tglb:         [DMESG-FAIL][91] ([i915#402] / [i915#65]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][93] ([fdo#112271] / [i915#1085]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +14 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][97] ([i915#694]) -> [FAIL][98] ([i915#818])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-hsw4/igt@gem_tiled_blits@interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][99] ([i915#818]) -> [FAIL][100] ([i915#694])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-hsw5/igt@gem_tiled_blits@normal.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-hsw4/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][101] ([i915#454]) -> [SKIP][102] ([i915#468])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][103] ([i915#454]) -> [DMESG-FAIL][104] ([i915#402])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1173]: https://gitlab.freedesktop.org/drm/intel/issues/1173
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5443 -> IGTPW_4159

  CI-20190529: 20190529
  CI_DRM_7943: 865945b076689b2e99bc1c52fad95cec05cff9ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4159: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html
  IGT_5443: 1f357d4ec46aa5dd3484c33255b88391ecbd33a5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
