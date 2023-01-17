Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3214633389714592406=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Tue, 17 Jan 2023 00:25:49 -0000
Message-ID: <167391514926.21231.9348158626330291280@emeril.freedesktop.org>
References: <20230116203923.6292-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230116203923.6292-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_add_invalid_parameter_tests_=28rev2=29?=
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

--===============3214633389714592406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: add invalid parameter tests (rev2)
URL   : https://patchwork.freedesktop.org/series/112859/
State : success

== Summary ==

CI Bug Log - changes from IGT_7121_full -> IGTPW_8346_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8346_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@invalid-parameters} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-1/igt@kms_plane_scaling@invalid-parameters.html

  
New tests
---------

  New tests have been introduced between IGT_7121_full and IGTPW_8346_full:

### New IGT tests (3) ###

  * igt@kms_plane_scaling@invalid-parameters:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-parameters@less-than-1-height-src:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@invalid-parameters@less-than-1-width-src:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8346_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@read-writes:
    - shard-apl:          [PASS][2] -> [INCOMPLETE][3] ([i915#7708])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl7/igt@gem_caching@read-writes.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl3/igt@gem_caching@read-writes.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][4] ([i915#2842])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-apl:          [PASS][11] -> [INCOMPLETE][12] ([i915#7708] / [i915#7833])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3886])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk9/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#3886]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][15] ([i915#7173])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271]) +42 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#7862]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#4573]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#658]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +81 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2994])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - {shard-rkl}:        [FAIL][23] ([i915#4778]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][25] ([i915#7742]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@drm_fdinfo@virtual-idle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@eof:
    - {shard-rkl}:        [SKIP][27] ([i915#2582]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@fbdev@eof.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@fbdev@eof.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][29] ([i915#2842]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_nop@basic-sequential:
    - {shard-rkl}:        [SKIP][31] ([fdo#109315]) -> [PASS][32] +23 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@gem_exec_nop@basic-sequential.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-2/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - {shard-rkl}:        [SKIP][33] ([i915#3281]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - {shard-rkl}:        [SKIP][35] ([i915#3282]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-apl:          [INCOMPLETE][37] ([i915#7708] / [i915#7833]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [INCOMPLETE][39] ([i915#7708]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][41] ([i915#2527]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][43] ([i915#658]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@i915_pm_dc@dc5-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-tglu}:       [SKIP][45] ([i915#4281]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-tglu-8/igt@i915_pm_dc@dc9-dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-dg1}:        [FAIL][47] ([i915#3591]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@i2c:
    - {shard-rkl}:        [SKIP][49] ([fdo#109308]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@i915_pm_rpm@i2c.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-dg1}:        [SKIP][51] ([i915#1397]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - {shard-rkl}:        [FAIL][53] ([fdo#103375]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-apl:          [FAIL][55] ([i915#2346]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][57] ([i915#2346]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - {shard-rkl}:        [SKIP][59] ([i915#1849] / [i915#4098]) -> [PASS][60] +16 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - {shard-rkl}:        [SKIP][61] ([i915#1849]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@kms_plane@pixel-format@pipe-b-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_psr@cursor_mmap_cpu:
    - {shard-rkl}:        [SKIP][63] ([i915#1072]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_rotation_crc@exhaust-fences:
    - {shard-rkl}:        [SKIP][65] ([i915#1845] / [i915#4098]) -> [PASS][66] +24 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@kms_rotation_crc@exhaust-fences.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - {shard-rkl}:        [SKIP][67] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@perf@blocking:
    - {shard-rkl}:        [SKIP][69] ([i915#5608]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@perf@blocking.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-4/igt@perf@blocking.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-dg1}:        [FAIL][71] ([i915#4349]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-14/igt@perf_pmu@idle@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-14/igt@perf_pmu@idle@rcs0.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][73] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@prime_vgem@basic-read.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@syncobj_timeline@invalid-signal-zero-handles:
    - {shard-rkl}:        [SKIP][75] ([i915#2575]) -> [PASS][76] +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@syncobj_timeline@invalid-signal-zero-handles.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-4/igt@syncobj_timeline@invalid-signal-zero-handles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4778]: https://gitlab.freedesktop.org/drm/intel/issues/4778
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7076]: https://gitlab.freedesktop.org/drm/intel/issues/7076
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7833]: https://gitlab.freedesktop.org/drm/intel/issues/7833
  [i915#7862]: https://gitlab.freedesktop.org/drm/intel/issues/7862


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7121 -> IGTPW_8346

  CI-20190529: 20190529
  CI_DRM_12588: 4289f17cae840c77e9d314330a635cebe762a735 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8346: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html

--===============3214633389714592406==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: add invalid parameter tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112859/">https://patchwork.freedesktop.org/series/112859/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7121_full -&gt; IGTPW_8346_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8346_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_plane_scaling@invalid-parameters} (NEW):<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-1/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7121_full and IGTPW_8346_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters@less-than-1-height-src:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters@less-than-1-width-src:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8346_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl7/igt@gem_caching@read-writes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl3/igt@gem_caching@read-writes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7833">i915#7833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk9/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_content_protection@srm@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7862">i915#7862</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +81 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4778">i915#4778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@gem_exec_nop@basic-sequential.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-2/igt@gem_exec_nop@basic-sequential.html">PASS</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7833">i915#7833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-tglu-8/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@i915_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@i915_pm_rpm@system-suspend-execbuf.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-3/igt@kms_plane@pixel-format@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-4/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html">PASS</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-functional:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@perf@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-4/igt@perf@blocking.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-dg1-14/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-dg1-14/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-zero-handles:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7121/shard-rkl-5/igt@syncobj_timeline@invalid-signal-zero-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/shard-rkl-4/igt@syncobj_timeline@invalid-signal-zero-handles.html">PASS</a> +8 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7121 -&gt; IGTPW_8346</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12588: 4289f17cae840c77e9d314330a635cebe762a735 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8346: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8346/index.html<br />
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3214633389714592406==--
