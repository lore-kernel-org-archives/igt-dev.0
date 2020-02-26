Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 20:15:47 -0000
Message-ID: <158274814766.21011.12735947438579621859@emeril.freedesktop.org>
References: <20200226054634.6611-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200226054634.6611-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flut=5Fhandle=3A_Minor_fixes?=
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
To: bhanuprakash.modem@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_lut_handle: Minor fixes
URL   : https://patchwork.freedesktop.org/series/73938/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5467_full -> IGTPW_4225_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4225_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4225_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4225_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-tglb2/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb1/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-tglb1/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-snb:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-snb5/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-iclb:         [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@sw_sync@sync_multi_producer_single_consumer.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb1/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_whisper@basic-contexts-forked}:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@gem_exec_whisper@basic-contexts-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb3/igt@gem_exec_whisper@basic-contexts-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4225_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1277])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@gem_exec_balancer@hang.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@gem_exec_schedule@preempt-self-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#447])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk4/igt@i915_pm_rpm@gem-evict-pwrite.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-glk6/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#413])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([IGT#5])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_invalid_dotclock:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@kms_invalid_dotclock.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl2/igt@kms_invalid_dotclock.html
    - shard-apl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103927])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl8/igt@kms_invalid_dotclock.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-apl6/igt@kms_invalid_dotclock.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#899]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +11 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109276]) +15 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd1}:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +14 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [DMESG-WARN][59] -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_mmap_offset@pf-nonblock.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-snb4/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][65] ([i915#1233]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb7/igt@i915_selftest@live_gt_lrc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-tglb3/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][69] ([i915#71]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl1/igt@kms_color@pipe-c-degamma.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-apl8/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][71] ([i915#71]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@kms_color@pipe-c-degamma.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-kbl3/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][75] ([IGT#5] / [i915#697]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][83] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][84] ([fdo#111870])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw1/igt@gem_userptr_blits@dmabuf-sync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-hsw:          [DMESG-WARN][85] ([fdo#111870]) -> [DMESG-WARN][86] ([fdo#110789] / [fdo#111870])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#697]: https://gitlab.freedesktop.org/drm/intel/issues/697
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5467 -> IGTPW_4225

  CI-20190529: 20190529
  CI_DRM_8005: 81f641f60edbfa1ccb169689206f0af360a06e31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4225: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/index.html
  IGT_5467: 2684f182424582c66e67bcbbda77cd60901627b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4225/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
