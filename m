Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9085360710901314953=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Aug 2021 16:39:05 -0000
Message-ID: <162921834514.22607.11131892206215941862@emeril.freedesktop.org>
References: <20210817134523.1390961-1-mika.kahola@intel.com>
In-Reply-To: <20210817134523.1390961-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5F*=3A_Reset_display_before_execution_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9085360710901314953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_*: Reset display before execution tests
URL   : https://patchwork.freedesktop.org/series/93749/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10490_full -> IGTPW_6129_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/index.html

Known issues
------------

  Here are the changes found in IGTPW_6129_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1] ([i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-snb6/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][4] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2842]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-apl7/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-glk:          NOTRUN -> [DMESG-WARN][11] ([i915#1610])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2428])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk8/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][15] ([i915#2658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][16] ([i915#2658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#768]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#3297]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb5/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#3297]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@gem_userptr_blits@access-control.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109289]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb3/igt@gen3_render_tiledy_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109289]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb8/igt@gen3_render_tiledy_blits.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109302])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb5/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109302])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3826])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3826])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#404])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#404])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3777]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3777]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3777]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111615]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110723])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886]) +14 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [i915#3886]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689] / [i915#3886]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#3742])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb6/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3742])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3319])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109279] / [i915#3359]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3359]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278]) +13 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +375 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#533]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-iclb:         [PASS][59] -> [INCOMPLETE][60] ([i915#1373])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][61] ([i915#180]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][62] -> [DMESG-WARN][63] ([i915#1982])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +68 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111825]) +19 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
    - shard-glk:          NOTRUN -> [FAIL][66] ([i915#1888] / [i915#2546])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109280]) +15 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +270 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +74 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3536])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3536])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2733])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2733])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#658]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][86] ([i915#132] / [i915#3467])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][87] -> [DMESG-WARN][88] ([i915#180] / [i915#295])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109502])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb2/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109502])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_vrr@flipline.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2530]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb5/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#2530])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109278] / [i915#2530])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109291])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109291])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +9 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl8/igt@sysfs_clients@fair-7.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2994]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@sysfs_clients@fair-7.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2994]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk3/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][101] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb8/igt@gem_eio@unwedge-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][105] ([i915#2842] / [i915#3468]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2849]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][111] ([i915#1436] / [i915#716]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][113] ([i915#636]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl4/igt@i915_suspend@forcewake.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][115] ([i915#118] / [i915#95]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120] +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][121] ([i915#433]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][123] ([fdo#109441]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb1/igt@kms_psr@psr2_sprite_render.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][125] ([i915#2684]) -> [WARN][126] ([i915#1804] / [i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][127] ([i915#658]) -> [SKIP][128] ([i915#2920]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][129] ([i915#2920]) -> [SKIP][130] ([i915#658]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][131], [FAIL][132], [FAIL][133]) ([i915#1814] / [i915#2505] / [i915#3002] / [i915#3363]) -> ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([fdo#109271] / [i915#180] / [i915#3363])
   [140]: https

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/index.html

--===============9085360710901314953==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane_*: Reset display before exec=
ution tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/93749/">https://patchwork.freedesktop.org/series/93749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6129/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10490_full -&gt; IGTPW_6129_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6129_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-snb6/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl3/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/sh=
ard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/sha=
rd-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-apl7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-apl1/=
igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-glk1/igt@gem_exec_suspend@basic-s4-devices.h=
tml">DMESG-WARN</a> ([i915#1610])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-i=
clb7/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk8/igt@gem_pread@exhaustion.html">WARN</a> =
([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> =
([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb5/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb4/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb3/igt@gen3_render_tiledy_blits.html">SKIP=
</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb8/igt@gen3_render_tiledy_blits.html">SKIP=
</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb5/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb6/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl1/igt@i915_suspend@debugfs-reader.html">D=
MESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_big_fb@x-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar =
issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar =
issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +14 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_ccs@pipe-b-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb6/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb3/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_color_chamelium@pipe-a-gamma.h=
tml">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-random.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x64=
-rapid-movement.html">SKIP</a> ([fdo#109278]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +375 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6129/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6129/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.htm=
l">INCOMPLETE</a> ([i915#1373])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html=
">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6129/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-indfb-pgflip-blt.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +68 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +19 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-cur-indfb-onoff.html">FAIL</a> ([i915#1888] / [i915#2546])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +15 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +270 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-glk5/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constan=
t-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constan=
t-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk3/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
2.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-1.html">SKIP</a> ([i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-iclb4/igt@km=
s_psr@psr2_dpms.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb1/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6129/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-W=
ARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb2/igt@kms_vrr@flipline.html">SKIP</a> ([f=
do#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_vrr@flipline.html">SKIP</a> ([f=
do#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb5/igt@nouveau_crc@pipe-a-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-apl8/igt@sysfs_clients@fair-7.html">SKIP</a> =
([fdo#109271] / [i915#2994]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb1/igt@sysfs_clients@fair-7.html">SKIP</a>=
 ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-tglb7/igt@sysfs_clients@fair-7.html">SKIP</a>=
 ([i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-kbl4/igt@sysfs_clients@sema-50.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk3/igt@sysfs_clients@sema-50.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i9=
15#2369] / [i915#2481] / [i915#3070]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6129/shard-iclb2/igt@gem_eio@unwedge-stress.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6129/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
([i915#2842] / [i915#3468]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6129/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6129/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6129/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-glk4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> ([i915#1436] / [i915#716]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl4/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([=
i915#636]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6129/shard-kbl4/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMES=
G-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6129/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotat=
e-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DME=
SG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6129/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6129/shard-apl6/igt@kms_flip@flip-vs-suspend-interrup=
tible@c-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (=
[i915#433]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6129/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb1/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([f=
do#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6129/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6129/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i9=
15#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6129/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6129/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10490/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10490/shard-kbl3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i9=
15#2505] / [i915#3002] / [i915#3363]) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kb=
l1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6129/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6129/shard-kbl3/igt@runner@=
aborted.html">FAIL</a>) ([i915#180] / [i915#1814] / [i915#3002] / [i915#336=
3] / [i915#602])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https">FAIL</a>, [FAIL][141], [FAIL][142=
], [FAIL][143], [FAIL][144]) ([fdo#109271] / [i915#180] / [i915#1814] / [i9=
15#3002] / [i915#3363]) -&gt; ([FAIL][145], [FAIL][146], [FAIL][147], [FAIL=
][148], [FAIL][149], [FAIL][150]) ([fdo#109271] / [i915#180] / [i915#3363])=
</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============9085360710901314953==--
