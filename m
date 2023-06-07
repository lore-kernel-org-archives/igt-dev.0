Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8894164389739193911=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Jun 2023 02:03:40 -0000
Message-ID: <168610342083.21180.14846091944518671958@emeril.freedesktop.org>
References: <20230606091409.3143765-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230606091409.3143765-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2NyaXB0?=
 =?utf-8?q?s/xls=5Fto=5Fdoc=2Epy=3A_add_an_script_to_partially_import_data?=
 =?utf-8?q?_from_a_spreadsheet?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8894164389739193911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/xls_to_doc.py: add an script to partially import data from a spreadsheet
URL   : https://patchwork.freedesktop.org/series/118912/
State : success

== Summary ==

CI Bug Log - changes from IGT_7320_full -> IGTPW_9113_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_9113_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2842])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][3] ([fdo#109271]) +52 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#3886])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271]) +27 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][6] ([i915#1339])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-apl:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4579]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2346])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#79])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#4579]) +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#658])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#2437])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk6/igt@perf_pmu@busy-double-start@bcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@perf_pmu@busy-double-start@bcs0.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - {shard-rkl}:        [FAIL][17] ([i915#7742]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-apl:          [ABORT][19] ([i915#7461] / [i915#8190]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html
    - {shard-dg1}:        [ABORT][21] ([i915#7461] / [i915#8234]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-15/igt@gem_barrier_race@remote-request@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-17/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ctx_freq@sysfs:
    - {shard-dg1}:        [FAIL][23] ([i915#6786]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-13/igt@gem_ctx_freq@sysfs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-16/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@hibernate:
    - {shard-dg1}:        [ABORT][25] ([i915#4391] / [i915#7975] / [i915#8213]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-14/igt@gem_eio@hibernate.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-12/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - {shard-dg1}:        [FAIL][27] ([i915#5784]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-18/igt@gem_eio@unwedge-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][29] ([i915#2842]) -> [PASS][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - {shard-rkl}:        [FAIL][31] ([i915#2842]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][33] ([i915#2842]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_module_load@reload:
    - shard-snb:          [ABORT][35] ([i915#4528]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-snb7/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb5/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][37] ([fdo#109271]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-dg1}:        [SKIP][39] ([i915#1397]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - {shard-rkl}:        [SKIP][41] ([i915#1397]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][43] ([i915#5334]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [FAIL][45] ([i915#2122]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - {shard-tglu}:       [FAIL][47] ([i915#8292]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7320 -> IGTPW_9113

  CI-20190529: 20190529
  CI_DRM_13235: 98a84b63adc57ae6500c03f8076f94e5d5a1743b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html
  IGT_7320: 1c96b08a4cde6f2d49824a8cc3303bd860617b52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html

--===============8894164389739193911==
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
<tr><td><b>Series:</b></td><td>scripts/xls_to_doc.py: add an script to partially import data from a spreadsheet</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118912/">https://patchwork.freedesktop.org/series/118912/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7320_full -&gt; IGTPW_9113_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9113_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1339">i915#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk6/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@perf_pmu@busy-double-start@bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8190">i915#8190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-15/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-17/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-13/igt@gem_ctx_freq@sysfs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6786">i915#6786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-16/igt@gem_ctx_freq@sysfs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-12/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-snb7/igt@i915_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-snb5/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7320/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7320 -&gt; IGTPW_9113</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13235: 98a84b63adc57ae6500c03f8076f94e5d5a1743b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9113/index.html<br />
  IGT_7320: 1c96b08a4cde6f2d49824a8cc3303bd860617b52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8894164389739193911==--

