Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 11:00:54 -0000
Message-ID: <157951805403.681.17091029689996716258@emeril.freedesktop.org>
References: <20200117143936.5726-1-sreedhar.telukuntla@intel.com>
In-Reply-To: <20200117143936.5726-1-sreedhar.telukuntla@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fparallel=3A_Set_engine_map_to_default_context?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_parallel: Set engine map to default context
URL   : https://patchwork.freedesktop.org/series/72160/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7758_full -> IGTPW_3929_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3929_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3929_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3929_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk1/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk7/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl8/igt@gem_ctx_exec@basic-nohangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl4/igt@gem_ctx_exec@basic-nohangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_3929_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +9 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb5/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_largeobject:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb4/igt@gem_largeobject.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-snb2/igt@gem_largeobject.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271] / [i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk1/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#413])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][23] -> [DMESG-FAIL][24] ([i915#553] / [i915#725])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-hsw5/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl3/igt@gem_ctx_isolation@bcs0-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-kbl2/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [fdo#112080]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@processes:
    - shard-iclb:         [FAIL][39] ([i915#570]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_ctx_persistence@processes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb2/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +18 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][47] ([fdo#112271] / [i915#530]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [TIMEOUT][49] ([fdo#112271] / [i915#530]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][51] ([fdo#103665] / [i915#530]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][53] ([fdo#111870] / [i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * {igt@i915_pm_rc6_residency@rc6-idle}:
    - shard-apl:          [FAIL][55] ([i915#973]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl3/igt@i915_pm_rc6_residency@rc6-idle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][57] ([i915#413]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@i915_pm_rps@reset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_execlists:
    - shard-kbl:          [INCOMPLETE][59] ([fdo#103665] / [fdo#112175] / [fdo#112259]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-kbl6/igt@i915_selftest@live_execlists.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-kbl2/igt@i915_selftest@live_execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][65] ([i915#140] / [i915#250]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][69] ([IGT#28]) -> [SKIP][70] ([fdo#109276] / [fdo#112080])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][71] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][72] ([fdo#110789] / [fdo#111870] / [i915#478])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@runner@aborted:
    - shard-glk:          ([FAIL][73], [FAIL][74]) ([k.org#202321]) -> ([FAIL][75], [FAIL][76], [FAIL][77]) ([i915#940] / [k.org#202321])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk9/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7758/shard-glk2/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk4/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk5/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112175]: https://bugs.freedesktop.org/show_bug.cgi?id=112175
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#973]: https://gitlab.freedesktop.org/drm/intel/issues/973
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3929
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7758: d19270ce1f367fbfc1ff3b539bcb50e11ded181f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3929: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3929/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
