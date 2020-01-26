Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 18:52:47 -0000
Message-ID: <158006476715.5254.16283781845774190680@emeril.freedesktop.org>
References: <20200124140651.17422-1-mika.kahola@intel.com>
In-Reply-To: <20200124140651.17422-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Flowres=3A_Fix_CRC_mismatch?=
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

Series: tests/kms_plane_lowres: Fix CRC mismatch
URL   : https://patchwork.freedesktop.org/series/72536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7809_full -> IGTPW_3990_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3990_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3990_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3990_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-apl:          [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl7/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl7/igt@kms_plane_lowres@pipe-b-tiling-x.html

  
#### Warnings ####

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-snb:          [SKIP][3] ([fdo#109271]) -> [FAIL][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb6/igt@kms_plane_lowres@pipe-a-tiling-yf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb4/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          [SKIP][5] ([fdo#109271]) -> [FAIL][6] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw7/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][7] ([fdo#112054]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-yf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  
Known issues
------------

  Here are the changes found in IGTPW_3990_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb6/igt@gem_exec_schedule@preempt-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +22 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#140])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb4/igt@i915_selftest@mock_requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb2/igt@i915_selftest@mock_requests.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#168])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl4/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl4/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#168])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl6/igt@kms_color@pipe-b-ctm-max.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl1/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#46])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#140] / [i915#221])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb8/igt@kms_flip@flip-vs-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-snb:          [PASS][41] -> [INCOMPLETE][42] ([i915#82]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb5/igt@kms_plane_lowres@pipe-b-tiling-none.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb1/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([fdo#103665] / [i915#635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl1/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][45] -> [INCOMPLETE][46] ([i915#61]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw6/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-apl:          [PASS][47] -> [INCOMPLETE][48] ([fdo#103927]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl4/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl6/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][49] -> [INCOMPLETE][50] ([fdo#103665]) +12 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#112080]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][59] -> [FAIL][60] ([i915#831])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [fdo#112080]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [FAIL][63] ([i915#679]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk4/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk3/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][65] ([fdo#110854]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-glk:          [INCOMPLETE][67] ([i915#58] / [k.org#198133]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb1/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][71] ([i915#644]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][73] ([fdo#111870] / [i915#478]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_wait@busy-vcs1:
    - shard-iclb:         [SKIP][75] ([fdo#112080]) -> [PASS][76] +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb8/igt@gem_wait@busy-vcs1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb4/igt@gem_wait@busy-vcs1.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][77] ([i915#694]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][79] ([i915#413]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][81] ([i915#563]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw2/igt@i915_selftest@live_blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][83] ([i915#472]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb7/igt@i915_selftest@mock_requests.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb7/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +6 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][89] ([i915#478]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [FAIL][91] ([i915#49]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         [FAIL][93] ([i915#899]) -> [PASS][94] +9 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb4/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96] +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk3/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk6/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-iclb:         [FAIL][97] ([i915#899]) -> [PASS][98] +11 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb5/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][99] ([fdo#109642] / [fdo#111068]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb3/igt@kms_psr2_su@page_flip.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb3/igt@kms_psr@psr2_sprite_render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@oa-exponents:
    - shard-glk:          [FAIL][103] ([i915#84]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk8/igt@perf@oa-exponents.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-glk4/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][105] ([fdo#109276]) -> [PASS][106] +20 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][107] ([IGT#28]) -> [SKIP][108] ([fdo#109276] / [fdo#112080])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][109] ([i915#694]) -> [FAIL][110] ([i915#818])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw7/igt@gem_tiled_blits@normal.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][111] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][112] ([fdo#111870] / [i915#478])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][113] ([fdo#107724]) -> [SKIP][114] ([fdo#109349])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         [SKIP][115] ([fdo#111615]) -> [FAIL][116] ([fdo#111615]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - shard-iclb:         [SKIP][117] ([fdo#109278] / [fdo#112010]) -> [SKIP][118] ([fdo#109278]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb6/igt@kms_plane_lowres@pipe-d-tiling-x.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/shard-iclb1/igt@kms_plane_lowres@pipe-d-tiling-x.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#635]: https://gitlab.freedesktop.org/drm/intel/issues/635
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3990
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3990: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3990/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
