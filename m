Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 23:17:19 -0000
Message-ID: <158033983907.5461.10931764182696943779@emeril.freedesktop.org>
References: <20200127144554.11364-1-mika.kahola@intel.com>
In-Reply-To: <20200127144554.11364-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IENS?=
 =?utf-8?q?C_mismatch_=28rev2=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fix CRC mismatch (rev2)
URL   : https://patchwork.freedesktop.org/series/72625/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5394_full -> IGTPW_4018_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4018_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4018_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4018_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@promotion-blt:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl1/igt@gem_exec_schedule@promotion-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl1/igt@gem_exec_schedule@promotion-blt.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-apl:          [PASS][3] -> [FAIL][4] +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl8/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl6/igt@kms_plane_lowres@pipe-b-tiling-x.html

  
Known issues
------------

  Here are the changes found in IGTPW_4018_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +15 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-blt:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([fdo#112118])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl3/igt@gem_exec_schedule@preempt-queue-contexts-blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl1/igt@gem_exec_schedule@preempt-queue-contexts-blt.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#110789] / [fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][21] -> [DMESG-FAIL][22] ([i915#725])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw1/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180] / [i915#56])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl4/igt@kms_flip@flip-vs-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-snb:          [PASS][25] -> [INCOMPLETE][26] ([i915#82]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-snb4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103665] / [i915#635])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#61]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw6/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-hsw1/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          ([PASS][31], [PASS][32]) -> [INCOMPLETE][33] ([i915#61])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw4/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-hsw1/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-apl:          [PASS][34] -> [INCOMPLETE][35] ([fdo#103927]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl7/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl3/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][36] -> [INCOMPLETE][37] ([fdo#103665]) +10 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#173])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb5/igt@kms_psr@no_drrs.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][44] -> [FAIL][45] ([i915#831])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [fdo#112080]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][48] ([i915#677]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_pwrite@big-cpu-fbr:
    - shard-glk:          [INCOMPLETE][52] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk3/igt@gem_pwrite@big-cpu-fbr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-glk9/igt@gem_pwrite@big-cpu-fbr.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][54] ([i915#447]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@i2c:
    - shard-glk:          [FAIL][56] ([i915#68]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk9/igt@i915_pm_rpm@i2c.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-glk4/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][58] ([i915#54]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][60] ([i915#54]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][62] ([i915#96]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][64] ([i915#478]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [FAIL][66] ([i915#49]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-glk2/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-apl:          [FAIL][68] ([i915#49]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][70] ([i915#49]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         [FAIL][76] ([i915#899]) -> [PASS][77] +11 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-tglb4/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-glk:          [FAIL][78] ([i915#899]) -> [PASS][79] +11 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk1/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-glk9/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-iclb:         [FAIL][80] ([i915#899]) -> [PASS][81] +11 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb6/igt@kms_psr@psr2_sprite_render.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][84] ([fdo#112080]) -> [PASS][85] +6 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb8/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][86] ([fdo#109276]) -> [PASS][87] +17 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-kbl:          [INCOMPLETE][88] ([CI#80] / [fdo#103665]) -> [TIMEOUT][89] ([fdo#112271])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@gem_eio@in-flight-contexts-1us.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-kbl4/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-apl:          [TIMEOUT][90] ([fdo#112271]) -> [INCOMPLETE][91] ([CI#80] / [fdo#103927])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl3/igt@gem_eio@in-flight-contexts-immediate.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-apl7/igt@gem_eio@in-flight-contexts-immediate.html
    - shard-glk:          [TIMEOUT][92] ([fdo#112271]) -> [INCOMPLETE][93] ([CI#80] / [i915#58] / [k.org#198133])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk7/igt@gem_eio@in-flight-contexts-immediate.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-glk3/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][94] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][95] ([fdo#111870] / [i915#478])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1074]: https://gitlab.freedesktop.org/drm/intel/issues/1074
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#635]: https://gitlab.freedesktop.org/drm/intel/issues/635
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#68]: https://gitlab.freedesktop.org/drm/intel/issues/68
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5394 -> IGTPW_4018

  CI-20190529: 20190529
  CI_DRM_7831: c40c8f70d19e5b27cffb4bb4609b1bc76fd1a58a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/index.html
  IGT_5394: 991fd07bcd7add7a5beca2c95b72a994e62fbb75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4018/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
