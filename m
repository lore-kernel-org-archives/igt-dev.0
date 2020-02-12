Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 13:52:40 -0000
Message-ID: <158151556005.24266.10726786858681244857@emeril.freedesktop.org>
References: <20200211003742.863630-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200211003742.863630-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3A_Keep_a_copy_of_the_names?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop: Keep a copy of the names
URL   : https://patchwork.freedesktop.org/series/73265/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7904_full -> IGTPW_4123_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4123_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4123_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4123_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb5/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
Known issues
------------

  Here are the changes found in IGTPW_4123_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#694])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-hsw2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +15 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#1140])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1172])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([fdo#111703]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#72])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#559]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#433])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1184]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1139]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb5/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_psr@psr2_basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb2/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-tglb:         [PASS][35] -> [DMESG-FAIL][36] ([i915#402] / [i915#65])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl8/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +9 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +12 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +12 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb6/igt@gem_exec_schedule@in-order-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb2/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][47] ([i915#694]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][51] ([fdo#111870] / [i915#478]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][53] ([i915#454]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-tglb:         [DMESG-FAIL][57] ([i915#402]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-tglb:         [FAIL][63] ([i915#70]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-tglb:         [FAIL][65] ([i915#559]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][67] ([i915#61]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-tglb:         [FAIL][69] ([i915#699]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_flip_tiling@flip-changes-tiling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [SKIP][71] ([i915#668]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-tglb:         [FAIL][75] ([i915#1184]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-tglb:         [FAIL][79] ([i915#65]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_rotation_crc@sprite-rotation-270.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb7/igt@kms_rotation_crc@sprite-rotation-270.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][81] ([IGT#28]) -> [SKIP][82] ([fdo#112080])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [FAIL][84] ([IGT#28])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][85] ([i915#818]) -> [FAIL][86] ([i915#694]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw1/igt@gem_tiled_blits@normal.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][88] ([fdo#110789] / [fdo#111870] / [i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][89] ([i915#454]) -> [SKIP][90] ([i915#468])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5433 -> IGTPW_4123
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7904: 5de757f49fb13a3c0e42626e7c4b47c2d82b14a1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/index.html
  IGT_5433: 6a96c17f3a1b4e1f90b1a0b0ce42a7219875d1a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4123/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
