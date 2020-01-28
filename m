Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 12:35:41 -0000
Message-ID: <158021494117.20535.18103505552133490145@emeril.freedesktop.org>
References: <20200127144554.11364-1-mika.kahola@intel.com>
In-Reply-To: <20200127144554.11364-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IENS?=
 =?utf-8?q?C_mismatch?=
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

Series: Fix CRC mismatch
URL   : https://patchwork.freedesktop.org/series/72625/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7825_full -> IGTPW_4008_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4008_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4008_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4008_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw5/igt@gem_caching@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw8/igt@gem_caching@reads.html

  * igt@gem_persistent_relocs@forked-faulting-reloc:
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-glk7/igt@gem_persistent_relocs@forked-faulting-reloc.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-apl:          [PASS][4] -> [FAIL][5] +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl4/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl3/igt@kms_plane_lowres@pipe-b-tiling-x.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color_chamelium@pipe-c-degamma}:
    - shard-tglb:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-tglb2/igt@kms_color_chamelium@pipe-c-degamma.html

  
Known issues
------------

  Here are the changes found in IGTPW_4008_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [PASS][11] -> [INCOMPLETE][12] ([fdo#103927]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@gem_exec_create@forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl7/igt@gem_exec_create@forked.html
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#108838] / [i915#140])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb5/igt@gem_exec_create@forked.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb4/igt@gem_exec_create@forked.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb1/igt@gem_exec_flush@basic-uc-ro-default.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb4/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870] / [i915#478])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#694])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw4/igt@gen7_exec_parse@basic-offset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][27] -> [DMESG-FAIL][28] ([i915#725])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw7/igt@i915_selftest@live_blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#44])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#57])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-snb:          [PASS][37] -> [INCOMPLETE][38] ([i915#82]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665] / [i915#635])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl1/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#61]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw6/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw4/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([fdo#103665]) +11 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl7/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-kbl7/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb8/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk3/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-glk7/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109276]) +19 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [fdo#112080]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb5/igt@gem_ctx_isolation@vcs1-reset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb4/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][53] ([i915#82]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb2/igt@gem_eio@kms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb2/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][55] ([fdo#110854]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb3/igt@gem_exec_balancer@smoke.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-hsw:          [FAIL][59] -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw2/igt@gem_partial_pwrite_pread@write-snoop.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw4/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][63] ([i915#818]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw7/igt@gem_tiled_blits@normal.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][65] ([fdo#111870] / [i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-apl1/igt@gem_workarounds@suspend-resume.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-apl8/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [INCOMPLETE][69] ([i915#58] / [k.org#198133]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-kbl2/igt@i915_suspend@forcewake.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-glk:          [FAIL][73] ([i915#899]) -> [PASS][74] +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-glk1/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-glk1/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-iclb:         [FAIL][75] ([i915#899]) -> [PASS][76] +10 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb7/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb7/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         [FAIL][77] ([i915#899]) -> [PASS][78] +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-y.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][79] ([i915#173]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@kms_psr@no_drrs.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb8/igt@kms_psr@psr2_basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][85] ([fdo#109276]) -> [PASS][86] +15 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][87] ([i915#831]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [FAIL][89] ([i915#914]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw1/igt@prime_mmap_coherency@write.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw8/igt@prime_mmap_coherency@write.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][91] ([IGT#28]) -> [SKIP][92] ([fdo#109276] / [fdo#112080])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [DMESG-FAIL][93] ([i915#1045]) -> [FAIL][94] ([i915#1045])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#694]) -> [FAIL][96] ([i915#818])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][97] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][98] ([fdo#111870] / [i915#478])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][99] ([fdo#109349]) -> [DMESG-WARN][100] ([fdo#107724])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7825/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1045]: https://gitlab.freedesktop.org/drm/intel/issues/1045
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#635]: https://gitlab.freedesktop.org/drm/intel/issues/635
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4008
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7825: 7a9128c8e79ca8f3bbd638bddfd4db64b4a2d546 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4008: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4008/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
