Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 16:20:48 -0000
Message-ID: <158083324886.25090.2102350599473060481@emeril.freedesktop.org>
References: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Fkms=3A_Return_the_fi?=
 =?utf-8?q?rst_overlay_not_the_last_one?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/igt_kms: Return the first overlay not the last one
URL   : https://patchwork.freedesktop.org/series/72844/
State : success

== Summary ==

CI Bug Log - changes from IGT_5410_full -> IGTPW_4067_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4067_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_legacy_colorkey@dst-colorkey-yuyv} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@kms_legacy_colorkey@dst-colorkey-yuyv.html
    - shard-tglb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-tglb8/igt@kms_legacy_colorkey@dst-colorkey-yuyv.html
    - shard-apl:          NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl6/igt@kms_legacy_colorkey@dst-colorkey-yuyv.html
    - shard-glk:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-glk8/igt@kms_legacy_colorkey@dst-colorkey-yuyv.html

  * {igt@kms_legacy_colorkey@src-colorkey-c8} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-kbl6/igt@kms_legacy_colorkey@src-colorkey-c8.html

  
New tests
---------

  New tests have been introduced between IGT_5410_full and IGTPW_4067_full:

### New IGT tests (27) ###

  * igt@kms_legacy_colorkey@dst-colorkey-c8:
    - Statuses : 7 pass(s)
    - Exec time: [0.22, 0.56] s

  * igt@kms_legacy_colorkey@dst-colorkey-rgb565:
    - Statuses : 6 pass(s)
    - Exec time: [0.23, 0.52] s

  * igt@kms_legacy_colorkey@dst-colorkey-xbgr2101010:
    - Statuses : 7 pass(s)
    - Exec time: [0.69, 2.36] s

  * igt@kms_legacy_colorkey@dst-colorkey-xrgb8888:
    - Statuses : 6 pass(s)
    - Exec time: [0.27, 0.48] s

  * igt@kms_legacy_colorkey@dst-colorkey-yuyv:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.90] s

  * igt@kms_legacy_colorkey@src-colorkey-c8:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@kms_legacy_colorkey@src-colorkey-rgb565:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_legacy_colorkey@src-colorkey-xbgr2101010:
    - Statuses : 7 pass(s)
    - Exec time: [0.33, 0.73] s

  * igt@kms_legacy_colorkey@src-colorkey-xrgb8888:
    - Statuses : 6 pass(s)
    - Exec time: [0.23, 0.58] s

  * igt@kms_legacy_colorkey@src-colorkey-yuyv:
    - Statuses : 7 pass(s)
    - Exec time: [0.29, 1.87] s

  * igt@kms_legacy_colorkey_basic@invalid-plane-id:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_legacy_colorkey_basic@pipe-a-dst-colorkey:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.08] s

  * igt@kms_legacy_colorkey_basic@pipe-a-invalid-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.30] s

  * igt@kms_legacy_colorkey_basic@pipe-a-no-colorkey:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_legacy_colorkey_basic@pipe-a-src-colorkey:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.20] s

  * igt@kms_legacy_colorkey_basic@pipe-b-dst-colorkey:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_legacy_colorkey_basic@pipe-b-invalid-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.15] s

  * igt@kms_legacy_colorkey_basic@pipe-b-no-colorkey:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.19] s

  * igt@kms_legacy_colorkey_basic@pipe-b-src-colorkey:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.09] s

  * igt@kms_legacy_colorkey_basic@pipe-c-dst-colorkey:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-c-invalid-flags:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-c-no-colorkey:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-c-src-colorkey:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-d-dst-colorkey:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_legacy_colorkey_basic@pipe-d-invalid-flags:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-d-no-colorkey:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey_basic@pipe-d-src-colorkey:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4067_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +11 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][8] -> [SKIP][9] ([fdo#112179] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb1/igt@gem_ctx_persistence@file.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-tglb1/igt@gem_ctx_persistence@file.html
    - shard-apl:          [PASS][10] -> [SKIP][11] ([fdo#109271] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@gem_ctx_persistence@file.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl8/igt@gem_ctx_persistence@file.html
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271] / [i915#1099]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk5/igt@gem_ctx_persistence@file.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-glk1/igt@gem_ctx_persistence@file.html
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112179] / [i915#1099]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_ctx_persistence@file.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb7/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#110841])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#677])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112146])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#694])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw5/igt@gem_partial_pwrite_pread@write.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-hsw5/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][24] -> [FAIL][25] ([i915#818])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw8/igt@gem_tiled_blits@normal.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          [PASS][32] -> [DMESG-FAIL][33] ([i915#1041] / [i915#118] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109276]) +18 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][36] ([fdo#110854]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][38] ([fdo#112080]) -> [PASS][39] +13 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][44] ([i915#694]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][46] ([i915#644]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@universal-planes-dpms:
    - shard-tglb:         [INCOMPLETE][48] ([i915#472]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb7/igt@i915_pm_rpm@universal-planes-dpms.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-tglb7/igt@i915_pm_rpm@universal-planes-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][50] ([i915#413]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][54] ([fdo#109441]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [TIMEOUT][56] ([i915#1096]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][58] ([IGT#28]) -> [SKIP][59] ([fdo#112080])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-snb:          [SKIP][60] ([fdo#109271]) -> [INCOMPLETE][61] ([i915#82])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-snb1/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1041]: https://gitlab.freedesktop.org/drm/intel/issues/1041
  [i915#1096]: https://gitlab.freedesktop.org/drm/intel/issues/1096
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4067

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4067: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4067/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
