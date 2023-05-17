Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1597824510127122785=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Date: Wed, 17 May 2023 14:03:25 -0000
Message-ID: <168433220513.6589.8038852149944051990@emeril.freedesktop.org>
References: <20230516062206.1064604-1-arun.r.murthy@intel.com>
In-Reply-To: <20230516062206.1064604-1-arun.r.murthy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5BPATCHv2=2Ci-g-t=2C1/4=5D_tests/kms=5Fasync=5F?=
 =?utf-8?q?flips=3A_Get_rid_of_i915_specific_fb_creation_=28rev2=29?=
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

--===============1597824510127122785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [PATCHv2,i-g-t,1/4] tests/kms_async_flips: Get rid of i915 specific fb creation (rev2)
URL   : https://patchwork.freedesktop.org/series/117798/
State : success

== Summary ==

CI Bug Log - changes from IGT_7293_full -> IGTPW_8980_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8980_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc.html
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc.html

  
New tests
---------

  New tests have been introduced between IGT_7293_full and IGTPW_8980_full:

### New IGT tests (8) ###

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-yf-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8980_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_buddy@all-tests:
    - shard-apl:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl1/igt@drm_buddy@all-tests.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-apl:          NOTRUN -> [SKIP][5] ([fdo#109271]) +46 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl2/igt@gem_lmem_swapping@smem-oom.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [PASS][11] -> [ABORT][12] ([i915#4528] / [i915#8189] / [i915#8213])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear (NEW):
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#3886])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_content_protection@type1:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4579])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2346])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2122])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2:
    - shard-glk:          [PASS][20] -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1:
    - shard-apl:          [PASS][22] -> [SKIP][23] ([fdo#109271] / [i915#4579])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl4/igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2:
    - shard-glk:          [PASS][24] -> [SKIP][25] ([fdo#109271] / [i915#4579])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][26] ([fdo#109271]) +9 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][27] ([i915#4573]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_vblank@pipe-b-wait-forked-hang:
    - shard-apl:          [PASS][28] -> [SKIP][29] ([fdo#109271]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@kms_vblank@pipe-b-wait-forked-hang.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@kms_vblank@pipe-b-wait-forked-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][30] ([i915#2846]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][32] ([i915#2842]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][34] ([i915#2842]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_spin_batch@user-each:
    - shard-apl:          [FAIL][36] ([i915#2898]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@gem_spin_batch@user-each.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl2/igt@gem_spin_batch@user-each.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-tglu}:       [WARN][38] ([i915#2681]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][40] ([i915#3591]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][42] ([i915#1397]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [ABORT][44] -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl1/igt@i915_suspend@debugfs-reader.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - {shard-rkl}:        [FAIL][46] ([i915#3743]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][48] ([i915#8011]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-7/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-1/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip@plain-flip-fb-recreate@b-vga1:
    - shard-snb:          [INCOMPLETE][50] -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-snb:          [SKIP][52] ([fdo#109271] / [i915#4579]) -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb4/igt@kms_content_protection@mei_interface.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb2/igt@kms_content_protection@mei_interface.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#2898]: https://gitlab.freedesktop.org/drm/intel/issues/2898
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7293 -> IGTPW_8980

  CI-20190529: 20190529
  CI_DRM_13154: d04e82f5245c285e7ae36955d89c4d217d04d664 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8980: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html
  IGT_7293: a19a081d1b8a8f902d7d8009a6ea6c471d5531ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html

--===============1597824510127122785==
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
<tr><td><b>Series:</b></td><td>series starting with [PATCHv2,i-g-t,1/4] tests/kms_async_flips: Get rid of i915 specific fb creation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117798/">https://patchwork.freedesktop.org/series/117798/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7293_full -&gt; IGTPW_8980_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8980_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7293_full and IGTPW_8980_full:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-y-rc_ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-yf-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8980_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_buddy@all-tests:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl1/igt@drm_buddy@all-tests.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl4/igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@kms_vblank@pipe-b-wait-forked-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@kms_vblank@pipe-b-wait-forked-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-glk2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl3/igt@gem_spin_batch@user-each.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2898">i915#2898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl2/igt@gem_spin_batch@user-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-apl1/igt@i915_suspend@debugfs-reader.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-apl7/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-rkl-7/igt@kms_cursor_legacy@forked-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-rkl-1/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@mei_interface:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7293/shard-snb4/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/shard-snb2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7293 -&gt; IGTPW_8980</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13154: d04e82f5245c285e7ae36955d89c4d217d04d664 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8980: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8980/index.html<br />
  IGT_7293: a19a081d1b8a8f902d7d8009a6ea6c471d5531ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1597824510127122785==--
