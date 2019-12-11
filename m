Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Dec 2019 18:15:06 -0000
Message-ID: <157608810696.30629.3231280057192791114@emeril.freedesktop.org>
References: <20191211094243.6939-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20191211094243.6939-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?prime=5Fvgem=3A_Give_meaningful_messages_on_SKIP?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/prime_vgem: Give meaningful messages on SKIP
URL   : https://patchwork.freedesktop.org/series/70748/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7537_full -> IGTPW_3844_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/index.html

Known issues
------------

  Here are the changes found in IGTPW_3844_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-apl3/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-apl7/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#456] / [i915#460] / [i915#534])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb1/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#435])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb2/igt@gem_exec_nop@basic-parallel.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb4/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb7/igt@gem_exec_schedule@fifo-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb2/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#707])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb7/igt@gem_exec_schedule@smoketest-vebox.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb3/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [PASS][17] -> [TIMEOUT][18] ([i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb9/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#435] / [i915#472])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb3/igt@gem_sync@basic-store-each.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb4/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#747])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-hsw6/igt@i915_selftest@mock_sanitycheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-hsw2/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#456] / [i915#460]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#129])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-apl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665] / [i915#667])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-hsw2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-hsw4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#456] / [i915#460] / [i915#516])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#49]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103665] / [i915#648] / [i915#667]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl3/igt@kms_plane@pixel-format-pipe-a-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl3/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][47] ([fdo#111735]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb3/igt@gem_ctx_shared@q-smoketest-vebox.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb2/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_capture@capture-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@gem_exec_capture@capture-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb7/igt@gem_exec_capture@capture-bsd.html

  * {igt@gem_exec_schedule@pi-shared-iova-bsd}:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][53] ([i915#463]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb4/igt@gem_exec_schedule@smoketest-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb9/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][55] ([i915#707]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb1/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [INCOMPLETE][61] ([i915#470] / [i915#472]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb6/igt@gem_sync@basic-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb8/igt@gem_sync@basic-all.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_busy@basic-flip-pipe-b:
    - shard-apl:          [DMESG-WARN][65] ([i915#109]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-apl1/igt@kms_busy@basic-flip-pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-apl8/igt@kms_busy@basic-flip-pipe-b.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][71] ([i915#96]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - shard-kbl:          [INCOMPLETE][73] ([fdo#103665] / [i915#667]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [INCOMPLETE][77] ([i915#456] / [i915#460] / [i915#474]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [INCOMPLETE][79] ([fdo#112393] / [i915#667]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [INCOMPLETE][81] ([i915#460]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][83] ([fdo#103665] / [i915#435] / [i915#648] / [i915#667]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-kbl1/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-tglb:         [FAIL][85] ([i915#576] / [i915#598]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb2/igt@kms_plane@pixel-format-pipe-c-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb3/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [INCOMPLETE][89] ([i915#456] / [i915#460]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-tglb7/igt@kms_psr@psr2_suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-tglb7/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-double-start-vcs1:
    - shard-iclb:         [SKIP][91] ([fdo#112080]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb7/igt@perf_pmu@busy-double-start-vcs1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb1/igt@perf_pmu@busy-double-start-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][93] ([fdo#109276]) -> [PASS][94] +4 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][95] ([i915#444]) -> [INCOMPLETE][96] ([i915#82])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-snb4/igt@gem_eio@kms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-snb5/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][97] ([fdo#111870]) -> [DMESG-WARN][98] ([fdo#110789] / [fdo#111870])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][99] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][100] ([fdo#111870])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7537/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#576]: https://gitlab.freedesktop.org/drm/intel/issues/576
  [i915#598]: https://gitlab.freedesktop.org/drm/intel/issues/598
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5343 -> IGTPW_3844
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7537: e7b515c549b7b04f1a90c08b1c58eb572519f207 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3844: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/index.html
  IGT_5343: e3664f8ce1f9152712b32e9bfa1e4ec93ffa5349 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3844/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
