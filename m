Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 10:22:08 -0000
Message-ID: <157968852888.22395.8487096560946209549@emeril.freedesktop.org>
References: <20200121123120.27148-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200121123120.27148-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s?=
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
To: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines
URL   : https://patchwork.freedesktop.org/series/72334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783_full -> IGTPW_3958_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html

Known issues
------------

  Here are the changes found in IGTPW_3958_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@processes:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#570])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl3/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl7/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb6/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#616])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl7/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [PASS][9] -> [TIMEOUT][10] ([fdo#112271] / [i915#940])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl1/igt@gem_exec_create@forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl4/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb4/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([i915#530] / [i915#58] / [k.org#198133])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk8/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-glk5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271] / [i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#520])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl4/igt@gem_persistent_relocs@forked-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl6/igt@gem_persistent_relocs@forked-interruptible.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#520])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-apl:          [PASS][23] -> [TIMEOUT][24] ([fdo#112271] / [i915#530])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#530] / [i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw6/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103665] / [i915#530])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl2/igt@gem_persistent_relocs@forked-thrashing.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html
    - shard-snb:          [PASS][29] -> [FAIL][30] ([i915#520])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-snb5/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([fdo#109100] / [i915#140])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#818])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [PASS][35] -> [INCOMPLETE][36] ([i915#82])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb6/igt@i915_selftest@mock_requests.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-snb5/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([fdo#103665])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl6/igt@i915_selftest@mock_requests.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl3/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#140])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@i915_selftest@mock_requests.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb2/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([CI#80] / [i915#61])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][43] -> [INCOMPLETE][44] ([i915#61])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@kms_flip@flip-vs-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#49]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109642] / [fdo#111068])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109276]) +20 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [fdo#112080]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb1/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#110841]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][61] ([i915#140]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_balancer@hang.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +14 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][69] ([i915#463] / [i915#472]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb4/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [TIMEOUT][71] ([fdo#112271] / [i915#530]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [TIMEOUT][73] ([fdo#112271] / [i915#530]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][75] ([fdo#112271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-tglb:         [TIMEOUT][77] ([fdo#112126] / [fdo#112271] / [i915#530]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-glk:          [TIMEOUT][79] ([fdo#112271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-glk7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][81] ([i915#530] / [i915#61]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][83] ([i915#644]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][85] ([fdo#111870] / [i915#478]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][87] ([i915#472]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb7/igt@i915_selftest@mock_requests.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb8/igt@i915_selftest@mock_requests.html
    - shard-apl:          [INCOMPLETE][89] ([fdo#103927]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl6/igt@i915_selftest@mock_requests.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl4/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-apl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [FAIL][95] ([i915#49]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@kms_psr@psr2_suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +10 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][101] ([fdo#109276] / [fdo#112080]) -> [FAIL][102] ([IGT#28])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][103] ([IGT#28]) -> [SKIP][104] ([fdo#109276] / [fdo#112080])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][105] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][107] ([fdo#107724]) -> [SKIP][108] ([fdo#109349])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][109] ([k.org#202321]) -> [FAIL][110] ([i915#873] / [k.org#202321])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/shard-glk1/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3958
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3958: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
