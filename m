Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7797771756551827463=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Sun, 13 Nov 2022 00:27:54 -0000
Message-ID: <166829927407.21699.11901546063167414658@emeril.freedesktop.org>
References: <20221110070828.26227-1-ananya.sharma@intel.com>
In-Reply-To: <20221110070828.26227-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTVBPICsg?=
 =?utf-8?q?pipe_color_test_=28rev5=29?=
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

--===============7797771756551827463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: MPO + pipe color test (rev5)
URL   : https://patchwork.freedesktop.org/series/108655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12364_full -> IGTPW_8080_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8080_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8080_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8080_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk3/igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1.html

  * {igt@kms_color@ctm-multiplane@pipe-d-hdmi-a-4} (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-dg1-13/igt@kms_color@ctm-multiplane@pipe-d-hdmi-a-4.html

  * igt@kms_color@degamma@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][3] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_color@degamma@pipe-b-edp-1.html

  * igt@kms_color@degamma@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl7/igt@kms_color@degamma@pipe-c-dp-1.html

  * {igt@kms_color@gamma-multiplane@pipe-a-edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb3/igt@kms_color@gamma-multiplane@pipe-a-edp-1.html

  * igt@kms_color@gamma@pipe-a-dp-1:
    - shard-apl:          [PASS][6] -> [FAIL][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl1/igt@kms_color@gamma@pipe-a-dp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl8/igt@kms_color@gamma@pipe-a-dp-1.html

  * igt@kms_color@gamma@pipe-a-vga-1:
    - shard-snb:          [PASS][8] -> [FAIL][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-snb5/igt@kms_color@gamma@pipe-a-vga-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-snb5/igt@kms_color@gamma@pipe-a-vga-1.html

  * igt@kms_color@gamma@pipe-b-edp-1:
    - shard-iclb:         [PASS][10] -> [FAIL][11] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb6/igt@kms_color@gamma@pipe-b-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb6/igt@kms_color@gamma@pipe-b-edp-1.html

  * igt@kms_color@gamma@pipe-b-hdmi-a-2:
    - shard-glk:          [PASS][12] -> [FAIL][13] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk5/igt@kms_color@gamma@pipe-b-hdmi-a-2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk8/igt@kms_color@gamma@pipe-b-hdmi-a-2.html

  * igt@kms_color@gamma@pipe-d-edp-1:
    - shard-tglb:         [PASS][14] -> [FAIL][15] +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb2/igt@kms_color@gamma@pipe-d-edp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb8/igt@kms_color@gamma@pipe-d-edp-1.html

  * {igt@kms_color_chamelium@ctm-multiplane} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-dg1-19/igt@kms_color_chamelium@ctm-multiplane.html

  * {igt@kms_color_chamelium@degamma-multiplane} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][17] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-2/igt@kms_color_chamelium@degamma-multiplane.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@degamma@pipe-b-hdmi-a-4:
    - {shard-dg1}:        NOTRUN -> [FAIL][18] +7 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-dg1-12/igt@kms_color@degamma@pipe-b-hdmi-a-4.html

  * igt@kms_invalid_mode@int-max-clock:
    - {shard-rkl}:        NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-5/igt@kms_invalid_mode@int-max-clock.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12364_full and IGTPW_8080_full:

### New IGT tests (39) ###

  * igt@kms_color@ctm-multiplane:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-a-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-b-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-c-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-d-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-a-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-b-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-c-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-d-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-a-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-b-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-c-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color@gamma-multiplane@pipe-d-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@ctm-multiplane:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@degamma-multiplane:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@gamma-multiplane:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8080_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([i915#658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@feature_discovery@psr2.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][22] ([i915#4991])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-snb5/igt@gem_create@create-massive.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#4525]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4525])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#2842]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_schedule@preempt-user:
    - shard-snb:          NOTRUN -> [SKIP][30] ([fdo#109271]) +26 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-snb5/igt@gem_exec_schedule@preempt-user.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [INCOMPLETE][32] ([i915#7248])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#3297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#6537])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl7/igt@i915_pm_rps@engine-order.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [PASS][37] -> [DMESG-FAIL][38] ([i915#5334])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk6/igt@i915_selftest@live@gt_heartbeat.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk5/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#5286])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#5286])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3689])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb1/igt@kms_chamelium@dp-hpd-fast.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk3/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
    - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl1/igt@kms_chamelium@vga-hpd-fast.html

  * {igt@kms_color@ctm-multiplane} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][49] ([i915#4098]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-2/igt@kms_color@ctm-multiplane.html

  * {igt@kms_color_chamelium@ctm-multiplane} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb6/igt@kms_color_chamelium@ctm-multiplane.html

  * {igt@kms_color_chamelium@degamma-multiplane} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb1/igt@kms_color_chamelium@degamma-multiplane.html

  * {igt@kms_color_chamelium@gamma-multiplane} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271]) +11 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk9/igt@kms_color_chamelium@gamma-multiplane.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][53] ([i915#7173])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#180]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#111825])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#2346])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#2672]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2587] / [i915#2672]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109280])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109280] / [fdo#111825])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +72 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#112054] / [i915#5288])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#3536]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([i915#5176]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([i915#5235]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#7037])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][75] ([i915#5939]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109441]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][79] ([i915#4525]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][81] ([i915#2842]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][83] ([i915#2842]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - {shard-rkl}:        [SKIP][85] ([i915#3281]) -> [PASS][86] +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - {shard-rkl}:        [SKIP][87] ([i915#3282]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][89] ([i915#5566] / [i915#716]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - {shard-rkl}:        [SKIP][91] ([i915#2527]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][93] ([i915#658]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][95] ([i915#3989] / [i915#454]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@cursor-dpms:
    - {shard-rkl}:        [SKIP][99] ([i915#1849]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-2/igt@i915_pm_rpm@cursor-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
    - shard-apl:          [FAIL][103] ([i915#2521]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - shard-iclb:         [FAIL][105] ([i915#2521]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][107] ([i915#118] / [i915#5138]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-rkl}:        [SKIP][109] ([i915#1845] / [i915#4098]) -> [PASS][110] +17 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][111] ([i915#1849] / [i915#4098]) -> [PASS][112] +14 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:
    - {shard-dg1}:        [INCOMPLETE][113] ([i915#7266]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-dg1-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-dg1-18/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - {shard-rkl}:        [SKIP][115] ([i915#3558]) -> [PASS][116] +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@kms_plane@pixel-format@pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][117] ([i915#5235]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@primary_mmap_cpu:
    - {shard-rkl}:        [SKIP][119] ([i915#1072]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-2/igt@kms_psr@primary_mmap_cpu.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][121] ([fdo#109441]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][123] ([i915#5519]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][125] ([i915#5234]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][127] ([i915#6117]) -> [SKIP][128] ([i915#4525])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          [INCOMPLETE][129] ([i915#7248]) -> [WARN][130] ([i915#2658])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gem_pread@exhaustion.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl1/igt@gem_pread@exhaustion.html
    - shard-tglb:         [INCOMPLETE][131] ([i915#7248]) -> [WARN][132] ([i915#2658])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb5/igt@gem_pread@exhaustion.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-tglb6/igt@gem_pread@exhaustion.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
    - shard-apl:          [FAIL][133] ([i915#4573]) -> [DMESG-FAIL][134] ([IGT#6]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][135] ([i915#2920]) -> [SKIP][136] ([i915#658])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][137] ([i915#658]) -> [SKIP][138] ([i915#2920])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][139] ([i915#2920]) -> [SKIP][140] ([fdo#111068] / [i915#658])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#180] / [i915#3002] / [i915#4312])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl8/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3692]: https://gitlab.freedesktop.org/drm/intel/issues/3692
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
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
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
  [i915#7266]: https://gitlab.freedesktop.org/drm/intel/issues/7266


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7050 -> IGTPW_8080
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12364: e8bcb44a50317c067823a983fa2badde97e41fdd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/index.html
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/index.html

--===============7797771756551827463==
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
<tr><td><b>Series:</b></td><td>MPO + pipe color test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108655/">https://patchwork.freedesktop.org/series/108655/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12364_full -&gt; IGTPW_8080_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8080_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_8080_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8080=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-glk3/igt@kms_color@ctm-multiplane@pipe-c-hdm=
i-a-1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-multiplane@pipe-d-hdmi-a-4} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-dg1-13/igt@kms_color@ctm-multiplane@pipe-d-h=
dmi-a-4.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_color@degamma@pipe-b-edp-1.htm=
l">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl7/igt@kms_color@degamma@pipe-c-dp-1.html"=
>FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@gamma-multiplane@pipe-a-edp-1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-tglb3/igt@kms_color@gamma-multiplane@pipe-a-=
edp-1.html">FAIL</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl1/igt@kms_color@gamma@pipe-a-dp-1.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl=
8/igt@kms_color@gamma@pipe-a-dp-1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-snb5/igt@kms_color@gamma@pipe-a-vga-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-sn=
b5/igt@kms_color@gamma@pipe-a-vga-1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb6/igt@kms_color@gamma@pipe-b-edp-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-i=
clb6/igt@kms_color@gamma@pipe-b-edp-1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk5/igt@kms_color@gamma@pipe-b-hdmi-a-2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard=
-glk8/igt@kms_color@gamma@pipe-b-hdmi-a-2.html">FAIL</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-tglb2/igt@kms_color@gamma@pipe-d-edp-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-t=
glb8/igt@kms_color@gamma@pipe-d-edp-1.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@ctm-multiplane} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-dg1-19/igt@kms_color_chamelium@ctm-multiplan=
e.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@degamma-multiplane} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-rkl-2/igt@kms_color_chamelium@degamma-multip=
lane.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-4:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-dg1-12/igt@kms_color@degamma@pipe-b-hdmi-a-4=
.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-rkl-5/igt@kms_invalid_mode@int-max-clock.htm=
l">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12364_full and IGTPW_8080_=
full:</p>
<h3>New IGT tests (39)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-multiplane:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-multiplane:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@degamma-multiplane:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@gamma-multiplane:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8080_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb5/i=
gt@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-snb5/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-tglb5/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/=
shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@gem_exec_balancer@parallel-context=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-g=
lk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-snb5/igt@gem_exec_schedule@preempt-user.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl2/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl1/igt@gem_pwrite@basic-exhaustion.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
248">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl7/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl2/i=
gt@i915_pm_rps@engine-order.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk6/igt@i915_selftest@live@gt_heartbeat.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard=
-glk5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-tglb8/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb1/igt@kms_chamelium@dp-hpd-fast.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-glk3/igt@kms_chamelium@dp-hpd-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl1/igt@kms_chamelium@vga-hpd-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-multiplane} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-rkl-2/igt@kms_color@ctm-multiplane.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i91=
5#4098</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@ctm-multiplane} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-tglb6/igt@kms_color_chamelium@ctm-multiplane=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@degamma-multiplane} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb1/igt@kms_color_chamelium@degamma-multip=
lane.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109284">fdo#109284</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@gamma-multiplane} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-glk9/igt@kms_color_chamelium@gamma-multiplan=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl2/igt@kms_content_protection@atomic@pipe-=
a-dp-1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8080/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb3/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-iclb6/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8080/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_flip_sc=
aled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-tglb7/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb3/igt@kms_plane_scal=
ing@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i9=
15#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_plane_scaling@plan=
es-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7037">i9=
15#7037</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8080/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_psr2_su@page_flip-nv12@pipe-b-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5939">i915#5939</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-apl3/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-iclb7/=
igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8080/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">P=
ASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8080/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
080/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/=
shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read.html">PASS</a> +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_8080/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.h=
tml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8080/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/s=
hard-rkl-5/igt@gen9_exec_parse@bb-start-cmd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/i=
gt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-i=
clb7/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl=
6/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-2/igt@i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-=
rkl-6/igt@i915_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_8080/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-b-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8080/shard-apl7/igt@kms_async_flips@alternate-sync-async-=
flip@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_async_flips@alternate-sync-asy=
nc-flip@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-=
180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8080/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_big_fb@x-tiled-max=
-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +17 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +14 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-dg1-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-h=
dmi-a-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/7266">i915#7266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8080/shard-dg1-18/igt@kms_pipe_crc_basic@suspend-re=
ad-crc@pipe-d-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@kms_plane@pixel-format@pipe-b-planes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558">i9=
15#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8080/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8080/shard-iclb6/igt@kms_plane_scaling@planes-downs=
cale-factor-0-5@pipe-a-edp-1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-2/igt@kms_psr@primary_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard=
-rkl-6/igt@kms_psr@primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_808=
0/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_8080/shard-tglb8/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#=
5234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
080/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8080/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-apl6/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard=
-apl1/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-tglb5/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shar=
d-tglb6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4573">i915#4573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8080/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gp=
u-tools/issues/6">IGT#6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8080/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8080/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8080/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12364/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12364/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8080/shard-apl8/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/sha=
rd-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8080/shard-apl3/igt@runner@aborted.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i91=
5#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/431=
2">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7050 -&gt; IGTPW_8080</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12364: e8bcb44a50317c067823a983fa2badde97e41fdd @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8080/index.htm=
l<br />
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7797771756551827463==--
