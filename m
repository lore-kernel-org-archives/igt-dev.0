Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2226977821893644990=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 12 Jul 2022 16:44:38 -0000
Message-ID: <165764427899.12860.16223291658542581982@emeril.freedesktop.org>
References: <20220712095707.22168-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220712095707.22168-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGNv?=
 =?utf-8?q?dename_in_device_selection_=28rev2=29?=
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

--===============2226977821893644990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add codename in device selection (rev2)
URL   : https://patchwork.freedesktop.org/series/106012/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11876_full -> IGTPW_7500_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7500_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7500_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7500_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_buddy@all:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@drm_buddy@all.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb5/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@drm_mm@all:
    - {shard-dg1}:        NOTRUN -> [SKIP][6] +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-13/igt@drm_mm@all.html
    - {shard-tglu}:       NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglu-3/igt@drm_mm@all.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-rkl}:        [PASS][8] -> [WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - {shard-dg1}:        [PASS][10] -> [WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-12/igt@kms_addfb_basic@invalid-get-prop-any.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-16/igt@kms_addfb_basic@invalid-get-prop-any.html

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-d:
    - {shard-dg1}:        NOTRUN -> [FAIL][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-16/igt@kms_busy@extended-modeset-hang-newfb@pipe-d.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled:
    - {shard-dg1}:        [PASS][13] -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-17/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-16/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_7500_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@feature_discovery@psr2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#5325])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#5327])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#5325])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][20] ([i915#4991])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-snb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#6344])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#2842])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#2842]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#2842])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112283])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#112283])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][39] -> [DMESG-WARN][40] ([i915#118])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2190])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +83 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#768]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-kbl:          NOTRUN -> [FAIL][45] ([i915#4171])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109290])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb6/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#110542])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3297]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#3297])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][50] ([i915#3318])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109289]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109289]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][53] ([i915#5566] / [i915#716])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +141 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#2856])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#658]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglb:         NOTRUN -> [WARN][58] ([i915#2681]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-kbl:          NOTRUN -> [WARN][59] ([i915#6405])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110892])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111644] / [i915#1397] / [i915#2411])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109303])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][63] -> [INCOMPLETE][64] ([i915#3921])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-snb2/igt@i915_selftest@live@hangcheck.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-snb4/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#4765])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#5286])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#5286])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111614]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689] / [i915#3886]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk8/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#3886]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278]) +14 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689] / [i915#6095]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#6095]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111615] / [i915#3689]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271]) +145 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3689]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3742])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-snb:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-snb2/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl6/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1063])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_content_protection@content_type_change.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109300] / [fdo#111066])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb6/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][89] ([i915#1319])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][90] ([i915#2105])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#3359]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170.html

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#4462]) +7 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#4462]) +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#3359]) +7 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109274] / [fdo#111825])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:
    - shard-iclb:         [PASS][96] -> [FAIL][97] ([i915#5072])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5287])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#5287])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109274] / [fdo#111825] / [i915#3637]) +6 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109274]) +5 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2672]) +8 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2672])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([i915#3555])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109280] / [fdo#111825]) +19 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109280]) +12 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271]) +173 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][110] -> [FAIL][111] ([i915#1188]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#1839])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][113] ([i915#265])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][115] ([fdo#108145] / [i915#265])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][116] ([fdo#108145] / [i915#265])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#111615]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#5176]) +8 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5176]) +11 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][120] -> [SKIP][121] ([i915#5235]) +5 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#5235]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109642] / [fdo#111068] / [i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-kbl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#658]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglb:         NOTRUN -> [SKIP][126] ([i915#1911])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][127] -> [SKIP][128] ([fdo#109441]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - shard-tglb:         NOTRUN -> [FAIL][129] ([i915#132] / [i915#3467]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_psr@psr2_primary_render.html
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109441])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#5289])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#5289])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#2437])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#2530]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#2530]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-iclb:         NOTRUN -> [SKIP][136] ([fdo#109291])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([fdo#109291]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#2994])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl4/igt@sysfs_clients@fair-1.html
    - shard-glk:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#2994])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk9/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#2994])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@pidname:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([i915#2994]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#2994]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - {shard-rkl}:        [SKIP][143] ([i915#658]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@feature_discovery@psr2.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@feature_discovery@psr2.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][145] ([i915#6268]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][147] ([i915#3070]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@gem_eio@unwedge-stress.html
    - {shard-rkl}:        [TIMEOUT][149] ([i915#3063]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_eio@unwedge-stress.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@gem_eio@unwedge-stress.html
    - {shard-dg1}:        [FAIL][151] ([i915#5784]) -> [PASS][152] +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-15/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         [FAIL][153] ([i915#5784]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][155] ([i915#2842]) -> [PASS][156] +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][157] ([i915#2842]) -> [PASS][158] +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - {shard-rkl}:        [SKIP][159] ([i915#3281]) -> [PASS][160] +10 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][161] ([i915#4936]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][163] ([fdo#111656]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][165] ([i915#3282]) -> [PASS][166] +7 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@valid-registers:
    - {shard-rkl}:        [SKIP][167] ([i915#2527]) -> [PASS][168] +4 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][169] ([i915#454]) -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-apl:          [WARN][171] ([i915#6405]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
    - shard-glk:          [WARN][173] ([i915#6405]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][175] ([i915#4387]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-tglb:         [FAIL][177] ([i915#2521]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-glk:          [FAIL][179] ([i915#2521]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
    - shard-tglb:         [INCOMPLETE][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb3/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-glk:          [FAIL][183] ([i915#1888] / [i915#5138]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][185] ([i915#1845] / [i915#4098]) -> [PASS][186] +5 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][187] ([i915#2346]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][189] ([i915#2122]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][191] ([i915#180]) -> [PASS][192] +5 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - {shard-rkl}:        [SKIP][193] ([i915#1849] / [i915#4098]) -> [PASS][194] +2 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - {shard-rkl}:        [SKIP][195] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][197] ([fdo#109441]) -> [PASS][198] +2 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][199] ([i915#5519]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][201] ([i915#180]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - {shard-dg1}:        [FAIL][203] ([i915#6054]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-19/igt@perf_pmu@module-unload.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-dg1-15/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][205] ([i915#4525]) -> [FAIL][206] ([i915#6117])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [FAIL][207] ([i915#2842]) -> [FAIL][208] ([i915#2876])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [WARN][209] ([i915#2684]) -> [FAIL][210] ([i915#2684])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][211] ([i915#658]) -> [SKIP][212] ([i915#2920])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][213] ([i915#2920]) -> [SKIP][214] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][215] ([fdo#111068] / [i915#658]) -> [SKIP][216] ([i915#2920])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][217] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][218] ([i915#5939])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226], [FAIL][227]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl1/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl7/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
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
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6054]: https://gitlab.freedesktop.org/drm/intel/issues/6054
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6331]: https://gitlab.freedesktop.org/drm/intel/issues/6331
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6405]: https://gitlab.freedesktop.org/drm/intel/issues/6405
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6578 -> IGTPW_7500
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7500: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/index.html
  IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/index.html

--===============2226977821893644990==
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
<tr><td><b>Series:</b></td><td>Add codename in device selection (rev2)</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106012/">https://patchwork.freedesktop.org/series/106012/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7500/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11876_full -&gt; IGTPW_7500_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7500_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7500_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7500=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@drm_buddy@all:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@drm_buddy@all.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/sh=
ard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb5/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_750=
0/shard-tglb8/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">INCOMPLETE</a=
></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@drm_mm@all:</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-dg1-13/igt@drm_mm@all.html">SKIP</a> +6 simil=
ar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglu-3/igt@drm_mm@all.html">SKIP</a> +1 simil=
ar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/=
shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-dg1-12/igt@kms_addfb_basic@invalid-get-prop-any.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_750=
0/shard-dg1-16/igt@kms_addfb_basic@invalid-get-prop-any.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-d:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-dg1-16/igt@kms_busy@extended-modeset-hang-ne=
wfb@pipe-d.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-dg1-17/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-=
xtiled.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7500/shard-dg1-16/igt@kms_draw_crc@draw-method-xrgb2101010-pwrit=
e-xtiled.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7500_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb5/i=
gt@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325"=
>i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325=
">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl8/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_750=
0/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-snb5/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7500/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@gem_exec_capture@capture-recoverab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/s=
hard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/s=
hard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/sh=
ard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-g=
lk1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-=
kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb1/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/sha=
rd-glk3/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@gem_lmem_swapping@heavy-random.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +83 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/768">i915#768</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb6/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb7/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl6/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb5/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@gen9_exec_parse@allowed-single.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5566">i915#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx-p=
aram.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +141 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb8/igt@gen9_exec_parse@basic-rejected-ctx-=
param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb3/igt@gen9_exec_parse@basic-rejected-ctx-=
param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs=
0.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2681">i915#2681</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0=
.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6405">i915#6405</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D110892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-sn=
b4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb8/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk8/igt@kms_ccs@pipe-a-crc-primary-basic-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-basic-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb4/igt@kms_ccs@pipe-c-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_ccs@pipe-c-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-apl7/igt@kms_ccs@pipe-d-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +145 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-snb2/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl6/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +7 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_content_protection@content_type=
_change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1063">i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb6/igt@kms_content_protection@content_type=
_change.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111066">fdo#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_cursor_crc@cursor-random@pipe-=
b-edp-1-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_cursor_crc@cursor-random@pipe-c=
-edp-1-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4462">i915#4462</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_cursor_crc@cursor-random@pipe-c=
-edp-1-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4462">i915#4462</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_cursor_crc@cursor-random@pipe-=
c-edp-1-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip@atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7500/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-fl=
ip@atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5072">i915#5072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mma=
p-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mma=
p-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3637">i915#3637</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-lin=
ear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +=
8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_flip_=
scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +19 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +173 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +8 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb3/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_plane_scaling@plan=
es-unity-scaling-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk9/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
642">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
11">i915#1911</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-i=
clb4/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_psr@psr2_primary_render.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i9=
15#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/346=
7">i915#3467</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb6/igt@kms_psr@psr2_primary_render.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">=
fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-apl4/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-tglb8/igt@nouveau_crc@pipe-c-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-apl4/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-glk9/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7500/shard-iclb5/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@sysfs_clients@pidname.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-1/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl=
-6/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500=
/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-iclb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard=
-iclb8/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-rkl-1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard=
-rkl-5/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-dg1-12/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-d=
g1-15/igt@gem_eio@unwedge-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-tg=
lb7/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7500/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/s=
hard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7500/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html">PAS=
S</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4936"=
>i915#4936</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7500/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-1/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#111656</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard=
-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard=
-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#25=
27</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_750=
0/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-iclb=
1/igt@i915_pm_dc@dc6-dpms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915#=
6405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
500/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11876/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915#=
6405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
500/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard=
-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-tglb5/igt@kms_async_flips@alternate-sync-asy=
nc-flip@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-b-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7500/shard-glk1/igt@kms_async_flips@alternate-sync-as=
ync-flip@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb3/igt@kms_atomic_transition@modeset-transition-fenc=
ing@1x-outputs.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7500/shard-tglb7/igt@kms_atomic_transition@modeset=
-transition-fencing@1x-outputs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#=
1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138"=
>i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7500/shard-glk6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen=
12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_ccs@pipe-b-missing-cc=
s-buffer-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7500/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7500/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ab=
-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7500/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-d=
p1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparen=
t-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7500/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-=
a-alpha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-=
iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7500/shard-tglb8/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7500/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-dg1-19/igt@perf_pmu@module-unload.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6054">i915#6054</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-=
dg1-15/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7500/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/=
shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7500/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7500/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7500/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7500/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11876/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7500/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11876/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11876/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11876/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11876/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_118=
76/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-k=
bl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7500/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7500/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/shard-kbl1/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7500/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">=
i915#716</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6578 -&gt; IGTPW_7500</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7500: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7500/index.htm=
l<br />
  IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2226977821893644990==--
