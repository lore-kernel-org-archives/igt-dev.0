Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 13:06:24 -0000
Message-ID: <158021678471.20534.12582729895847762665@emeril.freedesktop.org>
References: <20200127161439.2941023-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200127161439.2941023-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBS?=
 =?utf-8?q?eport_wait=28=29_failures?=
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

Series: lib: Report wait() failures
URL   : https://patchwork.freedesktop.org/series/72628/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7825_full -> IGTPW_4009_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4009_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4009_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4009_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_persistent_relocs@forked-faulting-reloc:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-glk5/igt@gem_persistent_relocs@forked-faulting-reloc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color_chamelium@pipe-c-degamma}:
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-tglb3/igt@kms_color_chamelium@pipe-c-degamma.html

  
Known issues
------------

  Here are the changes found in IGTPW_4009_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb4/igt@gem_ctx_isolation@vcs1-clean.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#490])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb2/igt@gem_eio@in-flight-contexts-1us.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-snb1/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#520])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#110789] / [fdo#111870] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#694])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw4/igt@gen7_exec_parse@basic-offset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw6/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#413])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb3/igt@i915_pm_rps@reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][23] -> [DMESG-FAIL][24] ([i915#553] / [i915#725])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw7/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#402])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-tglb6/igt@kms_busy@basic-flip-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-tglb4/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#668]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-tglb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk3/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-glk5/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109276]) +18 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [fdo#112080]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][41] ([fdo#109276]) -> [PASS][42] +12 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-hsw:          [FAIL][47] -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw2/igt@gem_partial_pwrite_pread@write-snoop.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw5/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][53] ([i915#818]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw7/igt@gem_tiled_blits@normal.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw4/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][55] ([fdo#111870] / [i915#478]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@gem_workarounds@suspend-resume.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [INCOMPLETE][59] ([i915#58] / [k.org#198133]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl2/igt@i915_suspend@forcewake.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-tglb:         [FAIL][63] ([i915#488]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][65] ([i915#173]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@kms_psr@no_drrs.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][69] ([i915#831]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [FAIL][71] ([i915#914]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw1/igt@prime_mmap_coherency@write.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw4/igt@prime_mmap_coherency@write.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#109276] / [fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [DMESG-FAIL][75] ([i915#1045]) -> [FAIL][76] ([i915#1045])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][77] ([i915#694]) -> [FAIL][78] ([i915#818])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][80] ([fdo#110789] / [fdo#111870] / [i915#478])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1045]: https://gitlab.freedesktop.org/drm/intel/issues/1045
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4009
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7825: 7a9128c8e79ca8f3bbd638bddfd4db64b4a2d546 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4009: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4009/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
