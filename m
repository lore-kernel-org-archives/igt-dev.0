Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 11:22:56 -0000
Message-ID: <158029697681.5460.7946989230884905927@emeril.freedesktop.org>
References: <20200128090022.10547-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200128090022.10547-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Ftiled=5Fwc=3A_skip_on_platforms_without_GGTT?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_tiled_wc: skip on platforms without GGTT
URL   : https://patchwork.freedesktop.org/series/72650/
State : success

== Summary ==

CI Bug Log - changes from IGT_5391_full -> IGTPW_4013_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/index.html

Known issues
------------

  Here are the changes found in IGTPW_4013_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb4/igt@gem_ctx_isolation@vcs1-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb5/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#818])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([i915#58] / [k.org#198133])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-offscreen.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([CI#80] / [i915#58] / [k.org#198133])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl3/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl2/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][31] ([fdo#109276] / [fdo#112080]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * {igt@gem_ctx_persistence@hang}:
    - shard-apl:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl7/igt@gem_ctx_persistence@hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl8/igt@gem_ctx_persistence@hang.html
    - shard-kbl:          [FAIL][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-kbl4/igt@gem_ctx_persistence@hang.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-kbl7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#110841]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][43] ([i915#818]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-hsw5/igt@gem_tiled_blits@normal.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][45] ([fdo#111870] / [i915#478]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-snb1/igt@gem_userptr_blits@sync-unmap.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_busy@extended-pageflip-hang-oldfb-render-pipe-a:
    - shard-kbl:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-kbl4/igt@kms_busy@extended-pageflip-hang-oldfb-render-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-kbl4/igt@kms_busy@extended-pageflip-hang-oldfb-render-pipe-a.html
    - shard-apl:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl7/igt@kms_busy@extended-pageflip-hang-oldfb-render-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl6/igt@kms_busy@extended-pageflip-hang-oldfb-render-pipe-a.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][51] ([i915#96]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang-interruptible:
    - shard-hsw:          [INCOMPLETE][55] ([CI#80] / [i915#61]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-hsw2/igt@kms_flip@2x-flip-vs-modeset-vs-hang-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-hsw6/igt@kms_flip@2x-flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][59] ([fdo#103665]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][61] ([fdo#109642] / [fdo#111068]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][67] ([fdo#112080]) -> [PASS][68] +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +22 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [fdo#112080]) -> [FAIL][72] ([IGT#28])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-10ms:
    - shard-glk:          [TIMEOUT][73] ([fdo#112271]) -> [INCOMPLETE][74] ([CI#80] / [i915#58] / [k.org#198133])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-glk7/igt@gem_eio@in-flight-10ms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-glk1/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-apl:          [TIMEOUT][75] ([fdo#112271]) -> [INCOMPLETE][76] ([CI#80] / [fdo#103927]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl3/igt@gem_eio@in-flight-contexts-1us.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-immediate:
    - shard-apl:          [INCOMPLETE][77] ([CI#80] / [fdo#103927]) -> [TIMEOUT][78] ([fdo#112271])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-apl1/igt@gem_eio@in-flight-immediate.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-apl8/igt@gem_eio@in-flight-immediate.html
    - shard-glk:          [INCOMPLETE][79] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][80] ([fdo#112271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-glk6/igt@gem_eio@in-flight-immediate.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-glk7/igt@gem_eio@in-flight-immediate.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][81] ([i915#468]) -> [FAIL][82] ([i915#454])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-snb2/igt@i915_pm_rpm@pc8-residency.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-snb4/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][85] ([i915#553] / [i915#725]) -> [DMESG-FAIL][86] ([i915#725])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-hsw1/igt@i915_selftest@live_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [INCOMPLETE][88] ([fdo#103665] / [i915#600])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5391/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5391 -> IGTPW_4013

  CI-20190529: 20190529
  CI_DRM_7828: 0af593e4d6eb72946a292a3cb80516c35c442e50 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4013: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/index.html
  IGT_5391: 004b7ccce8a6fc76f89344afc0a65e2dfe61e317 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4013/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
