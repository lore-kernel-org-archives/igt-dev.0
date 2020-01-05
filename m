Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 05 Jan 2020 03:04:17 -0000
Message-ID: <157819345727.14739.5893288359569711221@emeril.freedesktop.org>
References: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Find_the_associated_perf-type_for_a_particular_device_?=
 =?utf-8?b?KHJldjMp?=
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

Series: i915/perf: Find the associated perf-type for a particular device (rev3)
URL   : https://patchwork.freedesktop.org/series/71609/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7678_full -> IGTPW_3900_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3900_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3900_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3900_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_linear_blits@interruptible:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-glk1/igt@gem_linear_blits@interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-glk4/igt@gem_linear_blits@interruptible.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-snb6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_3900_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#679])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb5/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb1/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-blt:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111735])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb7/igt@gem_ctx_shared@q-smoketest-blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb6/igt@gem_ctx_shared@q-smoketest-blt.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#476])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb9/igt@gem_eio@kms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb8/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@nop:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111736])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb6/igt@gem_exec_balancer@nop.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb1/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#435]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb7/igt@gem_exec_nop@basic-series.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb9/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#707]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb7/igt@gem_exec_schedule@smoketest-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-tglb:         [PASS][20] -> [TIMEOUT][21] ([fdo#112126] / [i915#530])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([i915#472] / [i915#707])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb1/igt@gem_sync@basic-many-each.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb6/igt@gem_sync@basic-many-each.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb2/igt@gem_sync@basic-store-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb3/igt@gem_sync@basic-store-all.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([fdo#111870]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#413])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb1/igt@i915_pm_rps@reset.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([fdo#103665])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][34] -> [DMESG-WARN][35] ([fdo#111764])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#391])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-snb:          [PASS][42] -> [DMESG-WARN][43] ([i915#473])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-snb5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@busy-accuracy-98-vecs0:
    - shard-tglb:         [PASS][44] -> [INCOMPLETE][45] ([i915#435] / [i915#923])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb2/igt@perf_pmu@busy-accuracy-98-vecs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb2/igt@perf_pmu@busy-accuracy-98-vecs0.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#112080]) +10 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109276]) +13 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-iclb:         [DMESG-WARN][50] ([fdo#111764]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb7/igt@gem_ctx_isolation@rcs0-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][52] ([fdo#109276] / [fdo#112080]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb7/igt@gem_ctx_isolation@vcs1-clean.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#110841]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][56] ([fdo#110854]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_basic@basic-vcs1:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb5/igt@gem_exec_basic@basic-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb2/igt@gem_exec_basic@basic-vcs1.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [INCOMPLETE][60] ([i915#470]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb3/igt@gem_exec_parallel@fds.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb5/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_ringfill@basic-default:
    - shard-tglb:         [INCOMPLETE][64] -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb5/igt@gem_ringfill@basic-default.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb5/igt@gem_ringfill@basic-default.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-glk:          [DMESG-WARN][66] ([i915#716]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][68] ([i915#454]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-apl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][72] ([i915#54]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [FAIL][74] ([i915#54]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [FAIL][76] ([i915#54]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][78] ([i915#79]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [INCOMPLETE][80] ([fdo#103665] / [i915#600]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [FAIL][82] ([i915#49]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][88] ([fdo#109276]) -> [PASS][89] +16 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][90] ([fdo#109276] / [fdo#112080]) -> [FAIL][91] ([IGT#28])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][92] ([i915#82]) -> [DMESG-WARN][93] ([i915#444])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-snb7/igt@gem_eio@kms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][94] ([fdo#111870]) -> [DMESG-WARN][95] ([fdo#110789] / [fdo#111870])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][96] ([i915#468]) -> [FAIL][97] ([i915#454])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][98] ([fdo#112021]) -> [SKIP][99] ([fdo#112016] / [fdo#112021])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-tglb1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][100] ([fdo#107724]) -> [SKIP][101] ([fdo#109349])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][102] ([fdo#103665]) -> [DMESG-WARN][103] ([i915#180])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7678/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#391]: https://gitlab.freedesktop.org/drm/intel/issues/391
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#473]: https://gitlab.freedesktop.org/drm/intel/issues/473
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#923]: https://gitlab.freedesktop.org/drm/intel/issues/923


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3900
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7678: e554efffc6ca410bae6c5b3f310dea22f597487c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3900/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
