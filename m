Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 25 Jan 2020 00:12:03 -0000
Message-ID: <157991112326.29038.12730678672410091164@emeril.freedesktop.org>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E_=28rev4=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: validate color tests using chamelium. (rev4)
URL   : https://patchwork.freedesktop.org/series/72006/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5382_full -> IGTPW_3981_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3981_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3981_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3981_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-apl7/igt@gem_ctx_exec@basic-nohangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-apl6/igt@gem_ctx_exec@basic-nohangcheck.html

  * {igt@kms_color_chamelium@pipe-b-ctm-0-75} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +40 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  
New tests
---------

  New tests have been introduced between IGT_5382_full and IGTPW_3981_full:

### New IGT tests (47) ###

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-degamma:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-gamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-degamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-gamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-75:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-negative:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-degamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-gamma:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-degamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-gamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3981_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_import_export@flink:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#472])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-tglb1/igt@drm_import_export@flink.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-tglb4/igt@drm_import_export@flink.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#110841])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#677]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_store@pages-vcs1:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112080]) +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb1/igt@gem_exec_store@pages-vcs1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb3/igt@gem_exec_store@pages-vcs1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-kbl:          [PASS][18] -> [INCOMPLETE][19] ([fdo#103665] / [i915#530] / [i915#640])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [PASS][20] -> [INCOMPLETE][21] ([i915#61])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-glk:          [PASS][22] -> [INCOMPLETE][23] ([i915#58] / [i915#970] / [k.org#198133])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-glk9/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-glk8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([fdo#111870] / [i915#478]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#413])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_busy@basic-modeset-pipe-c:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([CI#80] / [i915#61])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw7/igt@kms_busy@basic-modeset-pipe-c.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw8/igt@kms_busy@basic-modeset-pipe-c.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#79])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#49])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#49]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-glk:          [PASS][42] -> [INCOMPLETE][43] ([i915#58] / [k.org#198133]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109276]) +14 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49] +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [fdo#112080]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb6/igt@gem_ctx_isolation@vcs1-reset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#112146]) -> [PASS][53] +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55] +21 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][56] ([i915#61]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [INCOMPLETE][58] ([fdo#103665] / [i915#530]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][60] ([fdo#103927] / [i915#530]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [INCOMPLETE][62] ([fdo#103665]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][64] ([i915#530] / [i915#61]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw8/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw2/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][68] ([i915#818]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw8/igt@gem_tiled_blits@normal.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][70] ([i915#472]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-tglb7/igt@i915_selftest@mock_requests.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-tglb3/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][72] ([i915#72]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][74] ([i915#478]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [FAIL][76] ([i915#49]) -> [PASS][77] +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][80] ([fdo#112080]) -> [PASS][81] +7 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb7/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][82] ([fdo#109276] / [fdo#112080]) -> [FAIL][83] ([IGT#28])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [FAIL][84] ([i915#520]) -> [INCOMPLETE][85] ([i915#61])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][86] ([i915#61]) -> [INCOMPLETE][87] ([i915#530] / [i915#61])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html
    - shard-kbl:          [INCOMPLETE][88] ([fdo#103665]) -> [INCOMPLETE][89] ([fdo#103665] / [i915#530])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-kbl7/igt@gem_persistent_relocs@forked-thrashing.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [DMESG-FAIL][90] ([i915#44]) -> [FAIL][91] ([i915#818])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][92] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][93] ([fdo#111870] / [i915#478])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#640]: https://gitlab.freedesktop.org/drm/intel/issues/640
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3981

  CI-20190529: 20190529
  CI_DRM_7802: cd932df72f11bdff93423a8d4a9e0e9ccb0985d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3981: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
