Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7932626930971861873=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 28 Dec 2022 10:45:46 -0000
Message-ID: <167222434692.24091.6499116256458746892@emeril.freedesktop.org>
References: <20221228084331.6997-1-swati2.sharma@intel.com>
In-Reply-To: <20221228084331.6997-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdsc=3A_Add_negative_test_for_invalid_input_bpc?=
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

--===============7932626930971861873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_dsc: Add negative test for invalid input bpc
URL   : https://patchwork.freedesktop.org/series/112264/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7104_full -> IGTPW_8278_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8278_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8278_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8278_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dsc@dsc-with-invalid-bpc} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-13/igt@kms_dsc@dsc-with-invalid-bpc.html
    - {shard-tglu}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-tglu-2/igt@kms_dsc@dsc-with-invalid-bpc.html

  * igt@vgem_basic@second-client:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-glk1/igt@vgem_basic@second-client.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk7/igt@vgem_basic@second-client.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - {shard-rkl}:        [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_7104_full and IGTPW_8278_full:

### New IGT tests (1) ###

  * igt@kms_dsc@dsc-with-invalid-bpc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8278_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb5/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2842]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@gem_lmem_swapping@massive.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-apl:          [PASS][12] -> [INCOMPLETE][13] ([i915#7708])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#3886])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#3886]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271]) +104 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-edid-stress-resolution-non-4k:
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk4/igt@kms_chamelium@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl3/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb5/igt@kms_chamelium@vga-hpd-after-suspend.html

  * {igt@kms_dsc@dsc-with-invalid-bpc} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][20] ([i915#4098])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-2/igt@kms_dsc@dsc-with-invalid-bpc.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#658]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#658]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-snb:          NOTRUN -> [SKIP][25] ([fdo#109271]) +92 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@negative-basic:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271]) +50 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk2/igt@kms_vrr@negative-basic.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2994])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl1/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2994])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - {shard-rkl}:        [SKIP][29] ([i915#3281]) -> [PASS][30] +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@fbdev@eof:
    - {shard-rkl}:        [SKIP][31] ([i915#2582]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@fbdev@eof.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-3/igt@fbdev@eof.html

  * igt@fbdev@read:
    - {shard-dg1}:        [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-dg1-12/igt@fbdev@read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-16/igt@fbdev@read.html
    - shard-apl:          [FAIL][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl6/igt@fbdev@read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@fbdev@read.html
    - shard-snb:          [FAIL][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-snb5/igt@fbdev@read.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb4/igt@fbdev@read.html
    - shard-glk:          [FAIL][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-glk3/igt@fbdev@read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk9/igt@fbdev@read.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][41] ([fdo#103375]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][43] ([i915#6247]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-1/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][45] ([i915#2846]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - {shard-rkl}:        [FAIL][47] ([i915#2842]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][49] ([i915#7276]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - {shard-rkl}:        [SKIP][51] ([i915#3282]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl1/igt@gem_workarounds@suspend-resume.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@secure-batches:
    - {shard-rkl}:        [SKIP][55] ([i915#2527]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-rkl}:        [SKIP][57] ([i915#3361]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [FAIL][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-6/igt@i915_pm_dc@dc9-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-4/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@fences-dpms:
    - {shard-rkl}:        [SKIP][63] ([i915#1849]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@i915_pm_rpm@fences-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-dg1}:        [SKIP][65] ([i915#1397]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-dg1-16/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][67] ([i915#4387]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-3/igt@i915_pm_sseu@full-enable.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][71] ([i915#2346]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-glk:          [DMESG-WARN][73] ([i915#118]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-glk2/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk1/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - {shard-rkl}:        [SKIP][75] ([i915#1849] / [i915#4098]) -> [PASS][76] +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_psr@no_drrs:
    - {shard-rkl}:        [SKIP][77] ([i915#1072]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-3/igt@kms_psr@no_drrs.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@kms_psr@no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-idle:
    - {shard-rkl}:        [SKIP][79] ([i915#1845] / [i915#4098]) -> [PASS][80] +12 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-2/igt@kms_vblank@pipe-b-ts-continuation-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@kms_vblank@pipe-b-ts-continuation-idle.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][81] ([fdo#109289]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - {shard-dg1}:        [FAIL][83] ([i915#4349]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-dg1-15/igt@perf_pmu@busy-double-start@vecs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-18/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@rcs0:
    - {shard-dg1}:        [FAIL][85] ([i915#1755]) -> [PASS][86] +9 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-dg1-19/igt@sysfs_timeslice_duration@timeout@rcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-13/igt@sysfs_timeslice_duration@timeout@rcs0.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
    - shard-apl:          [FAIL][87] ([i915#4573]) -> [DMESG-FAIL][88] ([IGT#6]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl6/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][93], [FAIL][94], [FAIL][95]) ([i915#180] / [i915#3002] / [i915#4312])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl7/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl6/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl1/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl2/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl2/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
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
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7104 -> IGTPW_8278

  CI-20190529: 20190529
  CI_DRM_12526: 34f2552b43d664ce4b76c6e356a57b7835f59c81 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8278: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/index.html
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/index.html

--===============7932626930971861873==
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
<tr><td><b>Series:</b></td><td>tests/kms_dsc: Add negative test for invalid=
 input bpc</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/112264/">https://patchwork.freedesktop.org/series/112264/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8278/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7104_full -&gt; IGTPW_8278_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8278_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_8278_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8278=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc} (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-dg1-13/igt@kms_dsc@dsc-with-invalid-bpc.html"=
>SKIP</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-tglu-2/igt@kms_dsc@dsc-with-invalid-bpc.html"=
>SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@second-client:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-glk1/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk7/igt@v=
gem_basic@second-client.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278=
/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a></l=
i>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7104_full and IGTPW_8278_full=
:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dsc@dsc-with-invalid-bpc:<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8278_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard=
-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-apl7/igt@gem_lmem_swapping@massive.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_82=
78/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7708">i=
915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-glk2/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-apl6/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-4_ti=
led_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +104 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-glk4/igt@kms_chamelium@dp-edid-stress-resolu=
tion-non-4k.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-apl3/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-snb5/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-rkl-2/igt@kms_dsc@dsc-with-invalid-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098"=
>i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl6=
/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-glk4/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-snb5/igt@kms_rotation_crc@sprite-rotation-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +92 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8278/shard-glk2/igt@kms_vrr@negative-basic.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-apl1/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8278/shard-glk1/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_82=
78/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">PASS</a> +8 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-3/igt@fbdev@eo=
f.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>
<p>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-dg1-12/igt@fbdev@read.html">FAIL</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-dg1-16/igt@fbdev@read.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-apl6/igt@fbdev@read.html">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt@fbdev@read.html"=
>PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-snb5/igt@fbdev@read.html">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-snb4/igt@fbdev@read.html"=
>PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-glk3/igt@fbdev@read.html">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-glk9/igt@fbdev@read.html"=
>PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">fdo#103375</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-=
rkl-2/igt@gem_eio@in-flight-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#6247</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/sha=
rd-rkl-1/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard=
-rkl-2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278=
/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#7276=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/=
shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncac=
hed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_8278/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-re=
ads-uncached.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-apl1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/=
shard-apl2/igt@gem_workarounds@suspend-resume.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/sha=
rd-rkl-5/igt@gen9_exec_parse@secure-batches.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-1/ig=
t@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-rkl-6/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-4/igt@i91=
5_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7104/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl7/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rk=
l-6/igt@i915_pm_rpm@fences-dpms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-dg1-16/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/s=
hard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rk=
l-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8278/shard-snb7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8278/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tra=
nsitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-glk2/igt@kms_cursor_legacy@forked-bo@pipe-b.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915=
#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
278/shard-glk1/igt@kms_cursor_legacy@forked-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8278/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb1010=
10-draw-pwrite.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-3/igt@kms_psr@no_drrs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-rkl-6/igt@km=
s_psr@no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-idle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-2/igt@kms_vblank@pipe-b-ts-continuation-idle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915=
#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8278/shard-rkl-6/igt@kms_vblank@pipe-b-ts-continuation-idle.html">PAS=
S</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8278/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-dg1-15/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/=
shard-dg1-18/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-dg1-19/igt@sysfs_timeslice_duration@timeout@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i915=
#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8278/shard-dg1-13/igt@sysfs_timeslice_duration@timeout@rcs0.html">PASS</a> =
+9 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7104/shard-apl6/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4573=
">i915#4573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8278/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols/issues/6">IGT#6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_7104/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7104/=
shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_7104/shard-apl2/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_8278/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/shard-apl2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8278/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7104 -&gt; IGTPW_8278</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12526: 34f2552b43d664ce4b76c6e356a57b7835f59c81 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8278: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8278/index.htm=
l<br />
  IGT_7104: fe5def13049225967770eaaf19ec01ef80e2adc5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7932626930971861873==--
