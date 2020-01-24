Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 18:20:14 -0000
Message-ID: <157989001466.15090.16001305686868278894@emeril.freedesktop.org>
References: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?dumb=5Fbuffer=3A_Try_to_compute_the_largest_possible_dumb_buffe?=
 =?utf-8?q?r?=
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

Series: tests/dumb_buffer: Try to compute the largest possible dumb buffer
URL   : https://patchwork.freedesktop.org/series/72463/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5380_full -> IGTPW_3978_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3978_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3978_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3978_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-hsw2/igt@gem_render_copy_redux@normal.html

  
Known issues
------------

  Here are the changes found in IGTPW_3978_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#490])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-snb4/igt@gem_eio@in-flight-contexts-1us.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-snb2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([fdo#103665] / [i915#530])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103665] / [i915#970])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#520])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#694])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870] / [i915#478]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#58] / [k.org#198133])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103665] / [i915#151])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb5/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103927])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl8/igt@i915_selftest@mock_requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl2/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103665])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl3/igt@i915_selftest@mock_requests.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl2/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#49]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109642] / [fdo#111068])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl4/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl2/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-glk5/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-glk7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [fdo#112080]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb7/igt@gem_ctx_isolation@vcs1-none.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-tglb:         [FAIL][55] ([i915#679]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-tglb8/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-tglb6/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-apl:          [INCOMPLETE][65] ([fdo#103927]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
    - shard-iclb:         [INCOMPLETE][67] ([fdo#109100] / [i915#140]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb2/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][69] ([i915#61]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-hsw2/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][71] ([i915#520]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [INCOMPLETE][73] ([fdo#103665] / [i915#530]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-tglb:         [INCOMPLETE][75] ([i915#472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-tglb5/igt@gem_persistent_relocs@forked-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-tglb3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [FAIL][77] ([i915#874]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][79] ([i915#454]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [INCOMPLETE][81] ([i915#140]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb6/igt@i915_selftest@mock_requests.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb6/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          [DMESG-WARN][83] ([i915#42]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-snb5/igt@i915_suspend@debugfs-reader.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-snb4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [FAIL][85] ([i915#54]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][87] ([i915#54]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [FAIL][89] ([i915#54]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][91] ([i915#49]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb8/igt@kms_psr@psr2_suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][95] ([i915#31]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-hsw2/igt@kms_setmode@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-hsw5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][101] ([IGT#28]) -> [SKIP][102] ([fdo#109276] / [fdo#112080])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][103] ([fdo#109276] / [fdo#112080]) -> [FAIL][104] ([IGT#28])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][105] ([fdo#103927] / [i915#530]) -> [INCOMPLETE][106] ([fdo#103927])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][107] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][108] ([fdo#111870] / [i915#478]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][109] ([fdo#109349]) -> [DMESG-WARN][110] ([fdo#107724])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][111] ([fdo#103665]) -> [DMESG-WARN][112] ([i915#180])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
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
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5380 -> IGTPW_3978

  CI-20190529: 20190529
  CI_DRM_7801: 6e1cfbab49286533a902e0c265249b80e5cf71da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html
  IGT_5380: 50c31d6423d37633dae5d36c7aaea10162baa63d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
