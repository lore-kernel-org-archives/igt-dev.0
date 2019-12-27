Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Dec 2019 16:50:04 -0000
Message-ID: <157746540428.27190.6369767237644300036@emeril.freedesktop.org>
References: <20191220142515.13424-1-venkata.ramana.nayana@intel.com>
In-Reply-To: <20191220142515.13424-1-venkata.ramana.nayana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Ffence=3A_platforms_not_supporting_fences?=
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
To: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_fence: platforms not supporting fences
URL   : https://patchwork.freedesktop.org/series/71412/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7641_full -> IGTPW_3886_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3886_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3886_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3886_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_basic@gtt-rcs0:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb4/igt@gem_exec_basic@gtt-rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb1/igt@gem_exec_basic@gtt-rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_3886_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#435])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb7/igt@gem_exec_reuse@single.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb5/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +12 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb3/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111606] / [fdo#111677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb7/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb6/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@hang:
    - shard-snb:          [PASS][17] -> [INCOMPLETE][18] ([i915#82])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb7/igt@gem_mmap_gtt@hang.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb4/igt@gem_mmap_gtt@hang.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][19] -> [FAIL][20] ([i915#520])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#456] / [i915#460]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#456] / [i915#460] / [i915#516])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#140] / [i915#221])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-tglb:         [INCOMPLETE][41] ([i915#456]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb1/igt@gem_ctx_isolation@vcs1-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb9/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][45] ([i915#490]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb1/igt@gem_eio@in-flight-contexts-1us.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [INCOMPLETE][47] ([fdo#111736]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb6/igt@gem_exec_await@wide-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb9/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [INCOMPLETE][49] ([i915#435]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb9/igt@gem_exec_nop@basic-parallel.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb3/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@pi-userfault-bsd}:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][57] ([i915#707]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb2/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [TIMEOUT][59] ([i915#530]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][61] ([i915#520]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-kbl:          [DMESG-WARN][65] ([i915#716]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-tglb:         [DMESG-WARN][67] ([i915#766]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb4/igt@i915_pm_rpm@sysfs-read.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb8/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
    - shard-apl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-tglb:         [INCOMPLETE][79] ([i915#456] / [i915#460] / [i915#474]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@suspend:
    - shard-tglb:         [INCOMPLETE][83] ([i915#456] / [i915#460]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb3/igt@kms_psr@suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb1/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][85] ([i915#460]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb6/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][87] ([fdo#109276]) -> [PASS][88] +16 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][89] ([i915#82]) -> [DMESG-WARN][90] ([i915#444])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb6/igt@gem_eio@kms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-snb4/igt@gem_eio@kms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][91] ([i915#468]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_atomic_transition@6x-modeset-transitions:
    - shard-tglb:         [SKIP][93] ([fdo#112016] / [fdo#112021]) -> [SKIP][94] ([fdo#112021])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-tglb8/igt@kms_atomic_transition@6x-modeset-transitions.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#766]: https://gitlab.freedesktop.org/drm/intel/issues/766
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5352 -> IGTPW_3886
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7641: c040b352eb9c72e9a6a8dc830245b2ae8089a54e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3886: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/index.html
  IGT_5352: 0586d205f651674e575351c2d5a7d0760716c9f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3886/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
