Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 14:57:20 -0000
Message-ID: <157624904045.23798.10121799149411079897@emeril.freedesktop.org>
References: <20191205132208.23450-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191205132208.23450-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHM6?=
 =?utf-8?q?_Add_an_intel=5Fdbuf=5Fmap_tool_=28rev2=29?=
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
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools: Add an intel_dbuf_map tool (rev2)
URL   : https://patchwork.freedesktop.org/series/70493/
State : success

== Summary ==

CI Bug Log - changes from IGT_5340_full -> IGTPW_3828_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html

Known issues
------------

  Here are the changes found in IGTPW_3828_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-apl1/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#232])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb6/igt@gem_eio@reset-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_store@pages-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb1/igt@gem_exec_store@pages-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb3/igt@gem_exec_store@pages-vcs1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#456])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb9/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#183])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl4/igt@gem_tiled_swapping@non-threaded.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#110789] / [fdo#111870])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#435] / [i915#460])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb5/igt@i915_pm_rpm@system-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#747])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl2/igt@i915_selftest@mock_sanitycheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl4/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#456] / [i915#460]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb1/igt@i915_suspend@debugfs-reader.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#460] / [i915#516])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb9/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#435] / [i915#474] / [i915#667])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([i915#478])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#49]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#456] / [i915#460] / [i915#474])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276]) +10 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb1/igt@prime_busy@after-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb6/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][45] ([i915#435]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb6/igt@gem_busy@close-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb8/igt@gem_busy@close-race.html

  * igt@gem_busy@extended-vcs1:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb6/igt@gem_busy@extended-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb2/igt@gem_busy@extended-vcs1.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb3/igt@gem_ctx_isolation@vcs1-reset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb2/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#110841]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#111735]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb4/igt@gem_ctx_shared@q-smoketest-vebox.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb5/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [TIMEOUT][55] ([i915#775]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][57] ([i915#456] / [i915#460] / [i915#534]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb5/igt@gem_eio@in-flight-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@preempt-contexts-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111736] / [i915#460]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb5/igt@gem_exec_suspend@basic-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-iclb:         [TIMEOUT][65] ([i915#530]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][71] ([fdo#110789] / [fdo#111870]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][73] ([i915#456] / [i915#460]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb8/igt@gem_workarounds@suspend-resume-context.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb9/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-glk:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-apl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-kbl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][81] ([i915#79]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][83] ([i915#79]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][85] ([i915#478]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [FAIL][89] ([i915#49]) -> [PASS][90] +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][91] ([fdo#103665]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-iclb:         [DMESG-WARN][93] ([fdo#111764]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [FAIL][95] ([i915#49]) -> [PASS][96] +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [INCOMPLETE][97] ([fdo#112393] / [i915#667]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][101] ([i915#31]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-apl3/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [PASS][104] +7 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][105] ([i915#460]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5340/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#775]: https://gitlab.freedesktop.org/drm/intel/issues/775
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5340 -> IGTPW_3828
  * Linux: CI_DRM_7515 -> CI_DRM_7516

  CI-20190529: 20190529
  CI_DRM_7515: c7fb52d87d5a118f9b70231662b7bb84d4be466e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_7516: 048eafd9f22bdd5fd3673e3ce827142864fa9b0b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3828: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html
  IGT_5340: 1b21dc2c399805f8580e000346ff457fe50f12fa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
