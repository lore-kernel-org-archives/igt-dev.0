Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3738653258601224822=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Wed, 28 Sep 2022 23:42:23 -0000
Message-ID: <166440854361.594.6581728862018455210@emeril.freedesktop.org>
References: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Ffrontbuffer=5Ftrac?=
 =?utf-8?q?king=3A_Check_compression_state_on_all_gens?=
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

--===============3738653258601224822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_frontbuffer_tracking: Check compression state on all gens
URL   : https://patchwork.freedesktop.org/series/109156/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6667_full -> IGTPW_7856_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7856_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7856_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/index.html

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): shard-rkl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7856_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-tglb1/igt@gem_eio@in-flight-immediate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb8/igt@gem_eio@in-flight-immediate.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
    - shard-tglb:         NOTRUN -> [SKIP][3] +32 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
    - shard-iclb:         NOTRUN -> [SKIP][4] +34 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html

  
Known issues
------------

  Here are the changes found in IGTPW_7856_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#5327])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-snb6/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#4525])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4613]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@gem_lmem_swapping@parallel-random.html
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl7/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4613])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_lmem_swapping@parallel-random.html
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk7/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4270])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4270]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#3297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_userptr_blits@access-control.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb8/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@input-checking:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][24] ([i915#4991])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][25] ([i915#4991])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-snb6/igt@gem_userptr_blits@input-checking.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][26] ([i915#4991])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl7/igt@gem_userptr_blits@input-checking.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][27] ([i915#4991])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][28] ([i915#4991])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk7/igt@gem_userptr_blits@input-checking.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#5566] / [i915#716])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#2856]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#4281])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4765])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1769] / [i915#3555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#5286])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110723])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#6095])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#3886])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#6095]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111615] / [i915#3689]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#3742])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3742])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl3/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk2/igt@kms_chamelium@hdmi-crc-multiple.html
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-snb7/igt@kms_chamelium@hdmi-crc-multiple.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_chamelium@hdmi-crc-multiple.html

  * igt@kms_content_protection@atomic:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#1063])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3359])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3359])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#72])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#2346])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
    - shard-iclb:         [PASS][64] -> [FAIL][65] ([i915#2346]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274]) +9 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#2122])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - shard-iclb:         [PASS][70] -> [DMESG-WARN][71] ([i915#1888] / [i915#402])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb1/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][72] -> [DMESG-WARN][73] ([i915#118] / [i915#1888])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk6/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][74] -> [DMESG-WARN][75] ([i915#180])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2672]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3555]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2587] / [i915#2672]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2587] / [i915#2672]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#2672] / [i915#3555])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-glk:          NOTRUN -> [FAIL][81] ([i915#1888] / [i915#2546])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109280]) +18 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#6497]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109280] / [fdo#111825]) +6 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +176 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3555])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271]) +116 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#5176]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#5176]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][90] -> [SKIP][91] ([i915#5176]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#5235]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#6524])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109441]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_primary_render:
    - shard-tglb:         NOTRUN -> [FAIL][95] ([i915#132] / [i915#3467])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109441]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [PASS][98] -> [SKIP][99] ([i915#5519])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#5519])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#5289])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#5289])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-d-query-forked-hang:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278]) +10 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_vblank@pipe-d-query-forked-hang.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#6971]) +43 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][105] ([fdo#109271]) +136 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-snb6/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#6971]) +45 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb8/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109295])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@split-50:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#2994])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb8/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-apl:          [TIMEOUT][109] ([i915#3063]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl3/igt@gem_eio@in-flight-contexts-1us.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl3/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][111] ([i915#4525]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][115] ([i915#2842]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][117] ([i915#2842]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][119] ([i915#3989] / [i915#454]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][121] ([i915#2346]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][123] ([i915#180] / [i915#1982] / [i915#4939]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-snb:          [SKIP][125] ([fdo#109271]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [DMESG-WARN][127] ([i915#180]) -> [PASS][128] +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][129] ([i915#5235]) -> [PASS][130] +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][131] ([fdo#109441]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][133] ([i915#5519]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [WARN][135] ([i915#2684]) -> [FAIL][136] ([i915#2684])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][137] ([i915#658]) -> [SKIP][138] ([i915#2920]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][139] ([i915#2920]) -> [SKIP][140] ([i915#658])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][141] ([i915#2920]) -> [SKIP][142] ([fdo#111068] / [i915#658]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl8/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl2/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl8/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl7/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl7/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl3/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6667 -> IGTPW_7856

  CI-20190529: 20190529
  CI_DRM_12193: 0f0716dcfd8446cde4391475c9c3656ca670b55f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/index.html
  IGT_6667: 97ec0c0a3c6b9d02a4f63cf4ac699cee3dc6ac53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/index.html

--===============3738653258601224822==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_f=
rontbuffer_tracking: Check compression state on all gens</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109156/">https://patchwork.freedesktop.org/series/109156/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7856/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6667_full -&gt; IGTPW_7856_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7856_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7856_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/index.=
html</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): shard-rkl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7856=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-tglb1/igt@gem_eio@in-flight-immediate.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-tglb8/=
igt@gem_eio@in-flight-immediate.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_plane_alpha_blend@pipe-b-cover=
age-7efc.html">SKIP</a> +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-const=
ant-alpha-mid.html">SKIP</a> +34 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7856_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#=
5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-snb6/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7856/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_exec_balancer@parallel-orderin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-=
apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-g=
lk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb5/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-apl7/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-glk7/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_pxp@regular-baseline-src-copy-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optou=
t-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb3/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb8/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb5/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-snb6/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-apl7/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb2/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-glk7/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@gen7_exec_parse@basic-allocation.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl2=
/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@gen9_exec_parse@bb-start-param.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@i91=
5_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-apl1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_ccs@pipe-d-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_chamelium@dp-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-apl3/igt@kms_chamelium@dp-hpd-storm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-glk2/igt@kms_chamelium@hdmi-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-snb7/igt@kms_chamelium@hdmi-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_chamelium@hdmi-crc-multiple.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_content_protection@atomic.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
0">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@kms_content_protection@content_typ=
e_change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1063">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_cursor_crc@cursor-random-512x51=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_cursor_crc@cursor-random-512x51=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7856/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72">i=
915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@ato=
mic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/=
shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>=
) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb5/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-h=
dmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_flip@2x-wf_vblank-ts-check-int=
erruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb1/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7856/shard-iclb1/igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk6/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7856/shard-glk2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-=
a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8=
/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#26=
72</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6497">i915#6497</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +6 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +176 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb3/igt@kms_hdr@bpc-switch-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915=
#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-covera=
ge-vs-premult-vs-constant.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +116 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb8/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb4/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_plane_scaling@=
plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5=
176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb2/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_prime@basic-crc-hybrid.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524">i=
915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb7/igt@kms_psr@psr2_primary_render.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i=
915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/34=
67">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-icl=
b5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7856/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb6/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-iclb7/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7856/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb3/igt@kms_vblank@pipe-d-query-forked-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-tglb5/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6971">i915#6971</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-snb6/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +136 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb8/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6971">i915#6971</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295"=
>fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb8/igt@sysfs_clients@split-50.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl3/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/s=
hard-apl3/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4=
525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
56/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shar=
d-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard=
-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/sha=
rd-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb=
6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7856/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tra=
nsitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i9=
15#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7856/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7856/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-=
draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7856/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a=
> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7856/shard-iclb1/igt@kms_plane_scaling@planes-downscale=
-factor-0-5@pipe-a-edp-1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-iclb2=
/igt@kms_psr@psr2_no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7856/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalida=
te-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#26=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
6/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7856/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7856/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6667/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7856/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1110=
68">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6667/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/=
shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6667/shard-apl2/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6667/shard-apl8/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6667/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
56/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl8/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shar=
d-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7856/shard-apl7/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/shard-apl3/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6667 -&gt; IGTPW_7856</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12193: 0f0716dcfd8446cde4391475c9c3656ca670b55f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7856/index.htm=
l<br />
  IGT_6667: 97ec0c0a3c6b9d02a4f63cf4ac699cee3dc6ac53 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3738653258601224822==--
