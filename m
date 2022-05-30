Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7139970006141475984=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 30 May 2022 10:20:00 -0000
Message-ID: <165390600022.17900.375706518784743347@emeril.freedesktop.org>
References: <20220530074036.3840581-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220530074036.3840581-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Fix_mixed_declarations_warning?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7139970006141475984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Fix mixed declarations warning
URL   : https://patchwork.freedesktop.org/series/104497/
State : success

== Summary ==

CI Bug Log - changes from IGT_6496_full -> IGTPW_7185_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_6496_full and IGTPW_7185_full:

### New IGT tests (13) ###

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.09] s

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [20.23] s

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [20.27] s

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [20.04] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [19.84] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  

Known issues
------------

  Here are the changes found in IGTPW_7185_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-iclb:         NOTRUN -> [SKIP][1] ([i915#5327]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#3555] / [i915#5325])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][3] ([i915#5076] / [i915#5614])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#4525])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#5076] / [i915#5614])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][12] ([i915#2842]) +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109313])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109313])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109283]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#112283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_params@secure-non-master.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#112283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271]) +207 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-snb6/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4613]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk2/igt@gem_lmem_swapping@verify-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4613]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111656])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109292])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          NOTRUN -> [FAIL][30] ([i915#644])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4270]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_softpin@evict-single-offset:
    - shard-kbl:          NOTRUN -> [FAIL][33] ([i915#4171])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109312])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109312])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109289]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#2527] / [i915#2856]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#2856]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#454])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110892])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#5723])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#5723])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@gt_engines:
    - shard-tglb:         [PASS][46] -> [DMESG-WARN][47] ([i915#2867]) +15 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_engines.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@i915_selftest@live@gt_engines.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#5903])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#5903])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#5286]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#5286]) +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111614]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110725] / [fdo#111614]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#1888] / [i915#5138])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111615]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110723]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#6095]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689] / [i915#3886]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [i915#3886]) +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278]) +60 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3689]) +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271]) +153 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk4/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111615] / [i915#3689]) +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271]) +369 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3742])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_cdclk@plane-scaling.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3742])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk1/igt@kms_chamelium@dp-edid-change-during-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-snb:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-snb6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +17 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [i915#1149]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#1063])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109300] / [fdo#111066])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#3116]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3116] / [i915#3299]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][85] ([i915#1319]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][86] ([i915#2105])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3319]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109279] / [i915#3359]) +6 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3359]) +7 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][92] -> [FAIL][93] ([i915#2346])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#533]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#533]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
    - shard-glk:          [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#5287]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#5287]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109274] / [fdo#111825]) +14 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109274]) +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2587])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2587]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109280]) +34 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271]) +148 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109280] / [fdo#111825]) +41 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#1839])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#1839])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][109] -> [DMESG-WARN][110] ([i915#180])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][111] ([fdo#108145] / [i915#265]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][112] ([fdo#108145] / [i915#265]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][113] ([i915#265])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#3536]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-x.html
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#3536]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#111615] / [fdo#112054])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#5288])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#1836])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#1836])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#658]) +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#2920]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#2920])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#111068] / [i915#658])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#658]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][128] -> [SKIP][129] ([fdo#109441]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109441]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-tglb:         NOTRUN -> [FAIL][131] ([i915#132] / [i915#3467]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][132] ([fdo#111615] / [i915#5289])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#533]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_vrr@flip-dpms.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][135] ([i915#2530]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][136] ([i915#2530]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([fdo#109289]) +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling-parameterized:
    - shard-apl:          NOTRUN -> [FAIL][138] ([i915#5639])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl1/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-tglb:         NOTRUN -> [SKIP][139] ([fdo#109291]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_api@nv_self_import_to_different_fd:
    - shard-iclb:         NOTRUN -> [SKIP][140] ([fdo#109291]) +3 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@prime_nv_api@nv_self_import_to_different_fd.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([fdo#109295])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@prime_vgem@fence-write-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109295])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@prime_vgem@fence-write-hang.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][143] ([i915#5098])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@recycle-many:
    - shard-glk:          NOTRUN -> [SKIP][144] ([fdo#109271] / [i915#2994])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk3/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-25:
    - shard-tglb:         NOTRUN -> [SKIP][145] ([i915#2994]) +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@sysfs_clients@sema-25.html
    - shard-iclb:         NOTRUN -> [SKIP][146] ([i915#2994]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-10:
    - shard-kbl:          NOTRUN -> [SKIP][147] ([fdo#109271] / [i915#2994]) +4 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@fbdev@pan:
    - {shard-rkl}:        [SKIP][148] ([i915#2582]) -> [PASS][149] +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@fbdev@pan.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@fbdev@pan.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [TIMEOUT][150] ([i915#3070]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][152] ([i915#2842]) -> [PASS][153] +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - {shard-rkl}:        [FAIL][154] ([i915#2842]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][156] ([i915#2842]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [FAIL][158] ([i915#2842]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-snb:          [SKIP][160] ([fdo#109271]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-snb6/igt@gem_exec_flush@basic-wb-set-default.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-snb7/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][162] ([i915#4281]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [SKIP][164] ([fdo#109271]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-rkl}:        [SKIP][166] ([i915#1397]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - {shard-rkl}:        [FAIL][168] ([fdo#103375]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - {shard-rkl}:        [SKIP][170] ([fdo#112022] / [i915#4070]) -> [PASS][171] +4 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-5/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
    - {shard-rkl}:        [SKIP][172] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [FAIL][174] ([i915#5072]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - {shard-rkl}:        [SKIP][176] ([fdo#111825] / [i915#4070]) -> [PASS][177] +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][178] ([i915#2346] / [i915#533]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - {shard-rkl}:        [SKIP][180] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][181] +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - {shard-rkl}:        [SKIP][182] ([i915#4098] / [i915#4369]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][184] ([i915#79]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][186] ([i915#180]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - {shard-rkl}:        [SKIP][188] ([i915#3701]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][190] ([i915#1888] / [i915#2546]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - {shard-rkl}:        [SKIP][192] ([i915#1849] / [i915#4098]) -> [PASS][193] +17 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_invalid_mode@int-max-clock:
    - {shard-rkl}:        [SKIP][194] ([i915#4278]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@kms_invalid_mode@int-max-clock.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_lease@page_flip_implicit_plane:
    - {shard-rkl}:        [SKIP][196] ([i915#1845] / [i915#4098]) -> [PASS][197] +19 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@kms_lease@page_flip_implicit_plane.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:
    - {shard-rkl}:        [SKIP][198] ([i915#1849] / [i915#3558]) -> [PASS][199] +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - {shard-rkl}:        [SKIP][200] ([i915#4070] / [i915#4098]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * {igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1}:
    - shard-iclb:         [SKIP][202] ([i915#5176]) -> [PASS][203] +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * {igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1}:
    - shard-iclb:         [SKIP][204] -> [PASS][205] +2 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][206] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][208] ([fdo#109441]) -> [PASS][209] +1 similar issue
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb6/igt@kms_psr@psr2_primary_blt.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@sprite_plane_onoff:
    - {shard-rkl}:        [SKIP][210] ([i915#1072]) -> [PASS][211] +2 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_psr@sprite_plane_onoff.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
    - {shard-rkl}:        [SKIP][212] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][213] +1 similar issue
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][214] ([i915#180]) -> [PASS][215] +2 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - {shard-dg1}:        [FAIL][216] ([i915#1755]) -> [PASS][217] +2 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [DMESG-WARN][218] ([i915#5614]) -> [SKIP][219] ([i915#4525])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@gem_exec_balancer@parallel.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_balancer@parallel.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         [DMESG-FAIL][220] ([i915#2373]) -> [DMESG-FAIL][221] ([i915#2373] / [i915#2867])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_lrc.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [DMESG-FAIL][222] ([i915#1759]) -> [DMESG-FAIL][223] ([i915#1759] / [i915#2867])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_pm.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][224] ([i915#180]) -> [FAIL][225] ([i915#4767])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][226] ([i915#180] / [i915#1982]) -> [DMESG-WARN][227] ([i915#180])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][228] ([i915#2920]) -> [SKIP][229] ([fdo#111068] / [i915#658])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251], [FAIL][252]) ([i915#3002] / [i915#4312] / [i915#5257])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@runner@aborted.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6496 -> IGTPW_7185

  CI-20190529: 20190529
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/index.html
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/index.html

--===============7139970006141475984==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Fix mixed declarations warning<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104497/">https://patchwork.freedesktop.org/series/104497/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7185/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6496_full -&gt; IGTPW_7185_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6496_full and IGTPW_7185_full=
:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe=
-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe=
-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe=
-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75@pipe=
-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7185_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4525">i915#4525</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-kbl1/igt@gem_exec_balancer@parallel-keep-in-f=
ence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard=
-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard=
-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb2/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">=
fdo#109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb7/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb6/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-snb6/igt@gem_exec_whisper@basic-queues.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +207 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl1/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-glk2/igt@gem_lmem_swapping@verify-ccs.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">=
i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb3/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb1/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#1=
09292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@gem_pxp@create-valid-protected-con=
text.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_pxp@dmabuf-shared-protected-ds=
t-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb4/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@gen9_exec_parse@batch-invalid-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2856">i915#2856</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb6/igt@gen9_exec_parse@batch-invalid-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fd=
o#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2411">i915#2411</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fd=
o#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb1/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-tglb=
5/igt@i915_selftest@live@gt_engines.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +15 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb4/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb7/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/=
shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shar=
d-glk5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-apl6/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-glk5/igt@kms_ccs@pipe-c-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-glk4/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +369 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb4/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-glk1/igt@kms_chamelium@dp-edid-change-during-=
suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-snb6/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_chamelium@vga-frame-dump.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl4/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl3/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-s=
ize-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7185/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitio=
ns.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-glk6/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7185/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mm=
ap-cpu-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-=
pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +148 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +41 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_718=
5/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_prime@basic-crc@first-to-second=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb6/igt@kms_prime@basic-crc@first-to-second=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1836">i915#1836</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb8=
/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_psr@psr2_primary_blt.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915=
#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467"=
>i915#3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb1/igt@kms_vrr@flip-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb6/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-apl1/igt@perf@polling-parameterized.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i9=
15#5639</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-tglb3/igt@prime_nv_api@i915_nv_double_export=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-iclb1/igt@prime_nv_api@nv_self_import_to_dif=
ferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb1/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb5/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@syncobj_timeline@transfer-timeline-=
point.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5098">i915#5098</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-glk3/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2994">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-tglb5/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-iclb2/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@fbdev@pa=
n.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/=
shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shar=
d-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185=
/shard-rkl-6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard=
-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard=
-glk1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-snb6/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
85/shard-snb7/igt@gem_exec_flush@basic-wb-set-default.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-apl2/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/=
igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html">FA=
IL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">f=
do#103375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7185/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-5/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112022"=
>fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding=
.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x2=
56-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i91=
5#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7185/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">=
fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7185/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk7/igt@kms_cursor_legacy@flip-vs-=
cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-=
pwrite-untiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-unt=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101=
010-mmap-cpu-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
85/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7185/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
legen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_flip_scaled_crc@f=
lip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb=
-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7185/shard-glk1/igt@kms_frontbuffer_tracking=
@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-shrfb-msflip-blt.html">PASS</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4278</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/sha=
rd-rkl-6/igt@kms_invalid_mode@int-max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@kms_lease@page_flip_implicit_plane.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#184=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i9=
15#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7185/shard-rkl-6/igt@kms_lease@page_flip_implicit_plane.html">PASS</a> +1=
9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right@pipe-b-plane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right=
@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-tr=
ansparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats=
@pipe-b-edp-1}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-iclb2/igt@kms_plane_sc=
aling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">=
PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-=
edp-1}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7185/shard-iclb5/igt@kms_plane_scaling@planes-u=
pscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#10964=
2</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">f=
do#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7185/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb6/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-=
iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-r=
kl-6/igt@kms_psr@sprite_plane_onoff.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i=
915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7185/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe=
-b.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7185/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">P=
ASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i91=
5#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7185/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a=
> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/s=
hard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/sh=
ard-tglb5/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/sha=
rd-tglb5/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard=
-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i91=
5#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7185/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7185/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6496/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i=
915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/9=
2">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7185/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
185/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/sha=
rd-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7185/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/shard-kbl1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7185/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6496 -&gt; IGTPW_7185</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7185/index.htm=
l<br />
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7139970006141475984==--
