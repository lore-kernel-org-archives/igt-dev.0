Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Jul 2021 18:22:25 -0000
Message-ID: <162732374546.2614.16655422257007943444@emeril.freedesktop.org>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFs?=
 =?utf-8?q?locator_support_in_IGT_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1456679330=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1456679330==
Content-Type: multipart/alternative;
 boundary="===============6165117547773943811=="

--===============6165117547773943811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add allocator support in IGT (rev2)
URL   : https://patchwork.freedesktop.org/series/92881/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6151_full -> IGTPW_6059_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6059_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6059_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6059_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_spin_batch@spin-all:
    - shard-glk:          [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk6/igt@gem_spin_batch@spin-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk4/igt@gem_spin_batch@spin-all.html
    - shard-iclb:         [PASS][3] -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb5/igt@gem_spin_batch@spin-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gem_spin_batch@spin-all.html
    - shard-kbl:          [PASS][5] -> [CRASH][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl7/igt@gem_spin_batch@spin-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl2/igt@gem_spin_batch@spin-all.html
    - shard-tglb:         [PASS][7] -> [CRASH][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-tglb7/igt@gem_spin_batch@spin-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gem_spin_batch@spin-all.html

  
New tests
---------

  New tests have been introduced between IGT_6151_full and IGTPW_6059_full:

### New IGT tests (2) ###

  * igt@gem_softpin@allocator-evict:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-evict-all-engines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 44.73] s

  

Known issues
------------

  Here are the changes found in IGTPW_6059_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][11] -> [TIMEOUT][12] ([i915#2369] / [i915#2481] / [i915#3070])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][13] ([i915#3354])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk4/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][16] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2842]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2842]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][19] ([i915#2842]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#2842]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#2842]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#1888] / [i915#307])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk6/igt@gem_mmap_gtt@cpuset-big-copy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk8/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#2428])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][32] ([i915#3318])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109289])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb3/igt@gen7_exec_parse@basic-allocation.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109289])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2856])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#2856])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-apl:          NOTRUN -> [FAIL][37] ([i915#579])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl1/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#579]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb1/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#579]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#1769])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#1769])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#118] / [i915#95]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#110725] / [fdo#111614])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110723])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +23 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +9 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +286 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk3/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb3/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [i915#1149])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109279])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][62] -> [FAIL][63] ([i915#3444])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109279] / [i915#3359]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271]) +380 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111825]) +18 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([i915#3788])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109274])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][74] -> [DMESG-WARN][75] ([i915#180]) +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +15 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271]) +51 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#110577])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb3/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109310])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][82] ([i915#155] / [i915#2828])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#3536])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3536])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#112054])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr@cursor_plane_onoff:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271]) +46 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl1/igt@kms_psr@cursor_plane_onoff.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109441]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][97] -> [SKIP][98] ([fdo#109441]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#3841])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2530])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2530])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109291]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109291]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@prime_nv_pcopy@test3_1.html

  * igt@prime_vgem@sync@rcs0:
    - shard-tglb:         [PASS][104] -> [INCOMPLETE][105] ([i915#409])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-tglb6/igt@prime_vgem@sync@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb1/igt@prime_vgem@sync@rcs0.html

  * igt@sysfs_clients@fair-3:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2994]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb3/igt@sysfs_clients@fair-3.html
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2994])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2994]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl7/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [FAIL][109] ([i915#2410]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][111] ([i915#2846]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][115] ([i915#2842]) -> [PASS][116] +5 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_selftest@live@gt_pm:
    - shard-iclb:         [INCOMPLETE][117] -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb3/igt@i915_selftest@live@gt_pm.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl8/igt@i915_suspend@forcewake.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-glk:          [DMESG-WARN][121] ([IGT#6]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][123] ([fdo#109441]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb1/igt@kms_psr@psr2_basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglb:         [FAIL][125] ([i915#2849]) -> [FAIL][126] ([i915#2842])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][129] ([i915#658]) -> [SKIP][130] ([i915#2920]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][131], [FAIL][132]) ([i915#2505] / [i915#3002] / [i915#3363]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][145], [FAIL][146]) ([i915#1814] / [i915#3002] / [i915#3363])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl8/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl3/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][147], [FAIL][148]) ([i915#3002]) -> ([FAIL][149], [FAIL][150], [FAIL][151]) ([i915#2426] / [i915#3002] / [i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/index.html

--===============6165117547773943811==
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
<tr><td><b>Series:</b></td><td>Add allocator support in IGT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/92881/">https://patchwork.freedesktop.org/series/92881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6059/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6151_full -&gt; IGTPW_6059_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6059_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6059_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6059=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_spin_batch@spin-all:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-glk6/igt@gem_spin_batch@spin-all.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk4/igt@gem=
_spin_batch@spin-all.html">CRASH</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-iclb5/igt@gem_spin_batch@spin-all.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@g=
em_spin_batch@spin-all.html">CRASH</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-kbl7/igt@gem_spin_batch@spin-all.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl2/igt@gem=
_spin_batch@spin-all.html">CRASH</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-tglb7/igt@gem_spin_batch@spin-all.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@g=
em_spin_batch@spin-all.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6151_full and IGTPW_6059_full=
:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_softpin@allocator-evict:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-evict-all-engines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 44.73] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6059_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb7/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-iclb1/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb7/igt@ge=
m_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3=
070])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</a=
> ([i915#3354])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6151/shard-glk6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk4/ig=
t@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-apl6/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html"=
>FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">=
FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">=
FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shar=
d-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl2=
/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-glk6/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-glk8/i=
gt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#1888] / [i915#307])</=
li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-ic=
lb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-=
linear.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl6/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb3/igt@gen7_exec_parse@basic-allocation.ht=
ml">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gen7_exec_parse@basic-allocation.ht=
ml">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb7/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb6/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl1/igt@i915_pm_rpm@basic-rte.html">FAIL</a=
> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb1/igt@i915_pm_rpm@pm-caching.html">SKIP<=
/a> ([i915#579]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@i915_pm_rpm@sysfs-read.html">SKIP<=
/a> ([i915#579]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb7/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-gl=
k7/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / =
[i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.=
html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.=
html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs.html">SKIP</a> ([fdo#109278]) +23 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl6/igt@kms_cdclk@mode-transition.html">SKI=
P</a> ([fdo#109271]) +286 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-glk3/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb3/igt@kms_chamelium@dp-hpd-for-each-pipe=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl6/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_color@pipe-d-ctm-red-to-blue.h=
tml">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-neg=
ative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl7/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-k=
bl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#3444])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shar=
d-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915=
#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +380 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb=
-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic.html">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6059/shard-iclb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">S=
KIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html">S=
KIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
059/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG=
-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +15 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-sus=
pend.html">SKIP</a> ([fdo#109271]) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb3/igt@kms_invalid_dotclock.html">SKIP</a>=
 ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb7/igt@kms_invalid_dotclock.html">SKIP</a>=
 ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.h=
tml">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-d.h=
tml">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-c.html">INCOMPLETE</a> ([i915#155] / [i915#2828])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_onoff:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-kbl1/igt@kms_psr@cursor_plane_onoff.html">SK=
IP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html"=
>FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-iclb1/igt@kms=
_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-=
modeset-rpm.html">SKIP</a> ([i915#3841])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-tglb6/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-tglb6/igt@prime_vgem@sync@rcs0.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-tglb1/igt@pri=
me_vgem@sync@rcs0.html">INCOMPLETE</a> ([i915#409])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-tglb3/igt@sysfs_clients@fair-3.html">SKIP</a>=
 ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-iclb7/igt@sysfs_clients@fair-3.html">SKIP</a>=
 ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6059/shard-apl7/igt@sysfs_clients@recycle-many.html">SK=
IP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> =
([i915#2410]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6059/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915=
#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_605=
9/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a=
> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6059/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6059/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb3/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-icl=
b8/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-apl8/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915=
#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059=
/shard-apl6/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.h=
tml">DMESG-WARN</a> ([IGT#6]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6059/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-bus=
y-crc-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb1/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-=
iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>=
 ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6059/shard-tglb6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> =
([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.=
html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6059/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.ht=
ml">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6059/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>) ([i915#2505] / [i915#3002] / [i915#3363]) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6059/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_605=
9/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6059/shard-kbl3/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard=
-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6059/shard-kbl4/igt@runner@aborted.html">FAIL</a>) =
([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6151/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/s=
hard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6151/shard-apl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6151/shard-apl3/i=
gt@runner@aborted.html">FAIL</a>) ([i915#180] / [i915#1814] / [i915#3002] /=
 [i915#3363]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6059/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6059/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>) ([i915#1814] / [i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-tglb:         ([FAIL][147], [FAIL][148]) ([i915#3002]) -&gt; ([FAI=
L][149], [FAIL][150], [FAIL][151]) ([i915#2426] / [i915#3002] / [i</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6165117547773943811==--

--===============1456679330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1456679330==--
