Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 00:36:17 -0000
Message-ID: <157956697730.11479.17406610470391829393@emeril.freedesktop.org>
References: <20200119103333.3895518-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200119103333.3895518-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNTog?=
 =?utf-8?q?Add_gem=5Fexec=5Fendless?=
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

Series: i915: Add gem_exec_endless
URL   : https://patchwork.freedesktop.org/series/72247/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7772_full -> IGTPW_3947_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3947_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3947_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3947_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_endless@suspend@s3} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk3/igt@gem_exec_endless@suspend@s3.html
    - shard-kbl:          NOTRUN -> [FAIL][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl7/igt@gem_exec_endless@suspend@s3.html

  * {igt@gem_exec_endless@suspend@s4-devices} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb4/igt@gem_exec_endless@suspend@s4-devices.html
    - shard-apl:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl1/igt@gem_exec_endless@suspend@s4-devices.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-hsw5/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7772_full and IGTPW_3947_full:

### New IGT tests (5) ###

  * igt@gem_exec_endless@suspend:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_endless@suspend@s0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.00, 16.14] s

  * igt@gem_exec_endless@suspend@s3:
    - Statuses : 1 dmesg-fail(s) 3 fail(s) 1 skip(s)
    - Exec time: [0.00, 2.53] s

  * igt@gem_exec_endless@suspend@s4:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.00, 7.17] s

  * igt@gem_exec_endless@suspend@s4-devices:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.00, 7.58] s

  

Known issues
------------

  Here are the changes found in IGTPW_3947_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +14 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#679])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl7/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl1/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-hsw:          [PASS][12] -> [TIMEOUT][13] ([fdo#112271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw7/igt@gem_exec_parallel@bcs0-fds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-hsw5/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-kbl:          [PASS][18] -> [TIMEOUT][19] ([fdo#112271] / [i915#530])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([fdo#103665] / [i915#530])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@gem_persistent_relocs@forked-thrashing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl1/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([fdo#103375])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#79])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109642] / [fdo#111068])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109276]) +19 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][38] ([fdo#109276] / [fdo#112080]) -> [PASS][39] +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#110841]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][44] ([fdo#112146]) -> [PASS][45] +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-hsw:          [TIMEOUT][46] ([fdo#112271] / [i915#530]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw2/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [INCOMPLETE][48] ([fdo#103665] / [i915#530]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [TIMEOUT][50] ([fdo#112271] / [i915#530]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][52] ([i915#644]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][54] ([fdo#111870] / [i915#478]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@i915_hangman@error-state-capture-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][60] ([i915#454]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [INCOMPLETE][62] ([fdo#103665] / [i915#151]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-kbl7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][64] ([i915#82]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@i915_selftest@mock_requests.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-snb4/igt@i915_selftest@mock_requests.html
    - shard-glk:          [INCOMPLETE][66] ([i915#58] / [k.org#198133]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@i915_selftest@mock_requests.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk7/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][68] ([i915#72]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-apl:          [FAIL][70] ([i915#49]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_lease@cursor_implicit_plane:
    - shard-snb:          [SKIP][72] ([fdo#109271]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@kms_lease@cursor_implicit_plane.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-snb4/igt@kms_lease@cursor_implicit_plane.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][74] ([fdo#109441]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][76] ([fdo#109276] / [fdo#112080]) -> [FAIL][77] ([IGT#28])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][78] ([i915#818]) -> [FAIL][79] ([i915#694])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][80] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][81] ([fdo#111870] / [i915#478])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][82] ([i915#873] / [k.org#202321]) -> ([FAIL][83], [FAIL][84]) ([i915#997] / [k.org#202321])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk7/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/shard-glk4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3947
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7772: f65c394056d8637ff151fa83d5d1613adc0932d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3947: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3947/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
