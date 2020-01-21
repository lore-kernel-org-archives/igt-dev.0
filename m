Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 19:26:32 -0000
Message-ID: <157963479248.11479.17569230118315326419@emeril.freedesktop.org>
References: <20200120220320.17092-1-imre.deak@intel.com>
In-Reply-To: <20200120220320.17092-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/ioctl=5Fwrappers=3A_Query_?=
 =?utf-8?q?if_device_supports_set/get_legacy_tiling?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/ioctl_wrappers: Query if device supports set/get legacy tiling
URL   : https://patchwork.freedesktop.org/series/72308/
State : success

== Summary ==

CI Bug Log - changes from IGT_5375_full -> IGTPW_3956_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html

Known issues
------------

  Here are the changes found in IGTPW_3956_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([fdo#111764])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb1/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb7/igt@gem_exec_schedule@deep-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#140])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb1/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb8/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_largeobject:
    - shard-iclb:         [PASS][15] -> [DMESG-WARN][16] ([i915#109])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb8/igt@gem_largeobject.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@gem_largeobject.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([CI#80] / [fdo#103927] / [i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-apl:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271] / [i915#530])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#530] / [i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw1/igt@gem_persistent_relocs@forked-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw1/igt@gem_persistent_relocs@forked-thrashing.html
    - shard-iclb:         [PASS][23] -> [TIMEOUT][24] ([fdo#112271] / [i915#530])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb6/igt@gem_persistent_relocs@forked-thrashing.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb6/igt@i915_pm_rps@waitboost.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock_requests:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#61])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw4/igt@i915_selftest@mock_requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw5/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#168])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl6/igt@kms_color@pipe-a-ctm-max.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl2/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#168])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl7/igt@kms_color@pipe-a-ctm-max.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl8/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#168])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk4/igt@kms_color@pipe-a-ctm-max.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk7/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#54]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-random:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#54]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#79])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#49])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#49]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([fdo#103665])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@enable-race-vcs1:
    - shard-tglb:         [PASS][59] -> [INCOMPLETE][60] ([i915#472])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb8/igt@perf_pmu@enable-race-vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb1/igt@perf_pmu@enable-race-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [TIMEOUT][61] ([fdo#112271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw2/igt@gem_busy@close-race.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw1/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [fdo#112080]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb6/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb1/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [FAIL][65] ([i915#679]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk9/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk3/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [INCOMPLETE][67] ([fdo#111735] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb4/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [TIMEOUT][69] ([fdo#112271] / [i915#940]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk7/igt@gem_exec_create@forked.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk2/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-glk:          [FAIL][73] ([i915#859]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +16 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][79] ([fdo#112080]) -> [PASS][80] +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb8/igt@gem_exec_store@cachelines-vcs1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][81] ([i915#530] / [i915#61]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [TIMEOUT][83] ([fdo#112271] / [i915#530]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][85] ([fdo#103665] / [i915#530]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][87] ([i915#644]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][89] ([i915#413]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb1/igt@i915_pm_rps@reset.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][91] ([i915#472]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb6/igt@i915_selftest@mock_requests.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb6/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-hsw:          [INCOMPLETE][93] ([CI#80] / [i915#61]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [FAIL][97] ([i915#49]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [FAIL][99] ([i915#49]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@primary_page_flip:
    - shard-tglb:         [SKIP][103] ([i915#668]) -> [PASS][104] +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb5/igt@kms_psr@primary_page_flip.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb4/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          [DMESG-FAIL][107] ([i915#118] / [i915#95]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-glk6/igt@kms_rotation_crc@multiplane-rotation.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-glk8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][109] ([i915#31]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-apl3/igt@kms_setmode@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-hsw:          [INCOMPLETE][111] ([i915#61]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][113] ([i915#831]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][115] ([fdo#109276] / [fdo#112080]) -> [FAIL][116] ([IGT#28]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][117] ([i915#454]) -> [SKIP][118] ([i915#468])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-tglb:         [INCOMPLETE][119] ([i915#472] / [i915#823]) -> [SKIP][120] ([fdo#109279])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#823]: https://gitlab.freedesktop.org/drm/intel/issues/823
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5375 -> IGTPW_3956

  CI-20190529: 20190529
  CI_DRM_7781: 3f2b341ae1fde67f823aeb715c6f489affdef8b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3956: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html
  IGT_5375: 6a6f7a50c5b2a62f5294b37a810ec7458aaeb774 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
