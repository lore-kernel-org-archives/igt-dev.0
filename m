Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2464746543722144784=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Mon, 01 Aug 2022 22:52:07 -0000
Message-ID: <165939432789.14742.7683958146872714656@emeril.freedesktop.org>
References: <20220801093521.16437-1-karthik.b.s@intel.com>
In-Reply-To: <20220801093521.16437-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fbig=5Ffb=3A_First_async_flip_discarded_on_i915?=
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

--===============2464746543722144784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_big_fb: First async flip discarded on i915
URL   : https://patchwork.freedesktop.org/series/106870/
State : success

== Summary ==

CI Bug Log - changes from IGT_6605_full -> IGTPW_7590_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7590_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rps@fence-order:
    - {shard-rkl}:        NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@i915_pm_rps@fence-order.html

  
New tests
---------

  New tests have been introduced between IGT_6605_full and IGTPW_7590_full:

### New IGT tests (4) ###

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  

Known issues
------------

  Here are the changes found in IGTPW_7590_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([i915#658])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@feature_discovery@psr2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ccs@suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@gem_ccs@suspend-resume.html
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#5325])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#6268])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-tglb:         [PASS][8] -> [TIMEOUT][9] ([i915#3063])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb8/igt@gem_eio@in-flight-contexts-immediate.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#5784])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb7/igt@gem_eio@kms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][12] ([i915#3354])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#2846])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#2842]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][25] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#2849])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#5498])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@gem_exec_whisper@basic-fds-priority.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb4/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl1/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb8/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-snb6/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-snb:          NOTRUN -> [SKIP][37] ([fdo#109271]) +52 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-snb4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#768])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#4171])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb5/igt@gem_softpin@evict-single-offset.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl2/igt@gem_workarounds@suspend-resume.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl6/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109289]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@gen3_render_tiledy_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109289]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@gen3_render_tiledy_blits.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#1937])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-glk:          [PASS][48] -> [DMESG-WARN][49] ([i915#118])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk5/igt@i915_pm_rc6_residency@rc6-fence.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-apl:          [PASS][50] -> [WARN][51] ([i915#6405])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
    - shard-kbl:          NOTRUN -> [WARN][52] ([i915#6405])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111644] / [i915#1397] / [i915#2411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110892])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111614])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110725] / [fdo#111614])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#110723])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [i915#3886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb4/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6095])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3689] / [i915#6095])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +202 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb7/igt@kms_chamelium@hdmi-crc-single.html
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk6/igt@kms_chamelium@hdmi-crc-single.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl3/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][73] -> [FAIL][74] ([i915#72])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][77] -> [FAIL][78] ([i915#2122])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][79] ([i915#180])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2672])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#3555]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2672]) +6 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#2672] / [i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-snb:          [PASS][84] -> [SKIP][85] ([fdo#109271]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-iclb:         [PASS][86] -> [FAIL][87] ([i915#1888] / [i915#2546])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#6497]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109280] / [fdo#111825]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109280]) +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][91] ([i915#180])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#6403]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#6403]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb4/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][94] ([fdo#108145] / [i915#265])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][95] ([i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([i915#5235]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#658]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#2920])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#658])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@primary_page_flip:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271]) +91 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109441]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][107] ([i915#132] / [i915#3467]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][108] -> [SKIP][109] ([i915#5519])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-d-wait-busy-hang:
    - shard-glk:          NOTRUN -> [SKIP][110] ([fdo#109271]) +27 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk2/igt@kms_vblank@pipe-d-wait-busy-hang.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109278]) +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@kms_vrr@flip-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#3555])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_vrr@flip-dpms.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109291])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@prime_nv_api@i915_self_import.html
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109291])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@prime_nv_api@i915_self_import.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl6/igt@sysfs_clients@create.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994]) +3 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][117] ([i915#2582]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@fbdev@unaligned-write.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-dg1}:        [FAIL][119] ([i915#4883]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-dg1-13/igt@gem_ctx_persistence@many-contexts.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-dg1-17/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][121] ([i915#3063]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][123] ([i915#180]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][125] ([i915#2846]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][127] ([i915#2842]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][129] ([i915#2842]) -> [PASS][130] +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][131] ([i915#2842]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-apl:          [FAIL][133] ([i915#2842]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [FAIL][135] ([i915#2842]) -> [PASS][136] +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk8/igt@gem_exec_fair@basic-pace@vcs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - {shard-rkl}:        [SKIP][137] ([i915#3281]) -> [PASS][138] +7 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][139] ([fdo#110254]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_readwrite@read-write:
    - {shard-rkl}:        [SKIP][141] ([i915#3282]) -> [PASS][142] +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@gem_readwrite@read-write.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5/igt@gem_readwrite@read-write.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - {shard-rkl}:        [SKIP][143] ([i915#2527]) -> [PASS][144] +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-page.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_backlight@basic-brightness:
    - {shard-rkl}:        [SKIP][145] ([i915#3012]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@i915_pm_backlight@basic-brightness.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][147] ([i915#4281]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-glk:          [WARN][149] ([i915#6405]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-dg1}:        [SKIP][151] ([i915#1397]) -> [PASS][152] +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-dg1-17/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-rkl}:        [SKIP][153] ([i915#1397]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - {shard-rkl}:        [SKIP][155] ([i915#4098] / [i915#4369]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - {shard-rkl}:        [SKIP][157] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][158] +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][159] ([i915#79]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][161] ([i915#1849] / [i915#4098]) -> [PASS][162] +4 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][163] ([i915#433]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [DMESG-WARN][165] ([i915#180]) -> [PASS][166] +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - {shard-rkl}:        [SKIP][167] ([i915#3546] / [i915#4098]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - {shard-rkl}:        [SKIP][169] ([i915#1849] / [i915#3546] / [i915#4070] / [i915#4098]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][171] ([i915#5235]) -> [PASS][172] +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][173] ([fdo#109441]) -> [PASS][174] +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@sprite_plane_move:
    - {shard-rkl}:        [SKIP][175] ([i915#1072]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@kms_psr@sprite_plane_move.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_psr@sprite_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][177] ([i915#5519]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][179] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - {shard-rkl}:        [SKIP][181] ([i915#1845] / [i915#4098]) -> [PASS][182] +11 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-1/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][183] ([i915#5639]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb5/igt@perf@polling-parameterized.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@perf@polling-parameterized.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][185] ([i915#1722]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-rkl-1/igt@perf@polling-small-buf.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        [FAIL][187] ([i915#4521]) -> [PASS][188] +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][189] ([i915#6117]) -> [SKIP][190] ([i915#4525])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][191] ([i915#2842]) -> [FAIL][192] ([i915#2852])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][193] ([i915#180]) -> [INCOMPLETE][194] ([i915#3614] / [i915#4939])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][195] ([i915#588]) -> [SKIP][196] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-glk:          [SKIP][197] ([fdo#109271] / [i915#1888]) -> [SKIP][198] ([fdo#109271])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-glk7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][199] ([i915#658]) -> [SKIP][200] ([i915#2920])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][201] ([i915#2920]) -> [SKIP][202] ([i915#658])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][203] ([fdo#111068] / [i915#658]) -> [SKIP][204] ([i915#2920])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl1/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl7/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl8/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl1/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl8/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl6/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5498]: https://gitlab.freedesktop.org/drm/intel/issues/5498
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6331]: https://gitlab.freedesktop.org/drm/intel/issues/6331
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6405]: https://gitlab.freedesktop.org/drm/intel/issues/6405
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
  [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6605 -> IGTPW_7590

  CI-20190529: 20190529
  CI_DRM_11946: 0e9c43d76a145712da46e935d429ce2a3eea80e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/index.html
  IGT_6605: 1596683606cafa391f5d8f6b68e0c888233c0738 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/index.html

--===============2464746543722144784==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_big_fb: First async flip disc=
arded on i915</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106870/">https://patchwork.freedesktop.org/series/106870/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7590/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6605_full -&gt; IGTPW_7590_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7590=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rps@fence-order:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@i915_pm_rps@fence-order.html">TIME=
OUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6605_full and IGTPW_7590_full=
:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7590_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb3/igt@f=
eature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb5/igt@gem_ccs@suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#5=
327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb5/igt@gem_ccs@suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5=
325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tgl=
b5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb8/igt@gem_eio@in-flight-contexts-immediate.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/sha=
rd-tglb7/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-tglb1/igt@gem_eio@kms.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3354">i915#3=
354</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/sha=
rd-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard=
-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1/=
igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl1=
/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
849">i915#2849</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shar=
d-iclb4/igt@gem_exec_whisper@basic-fds-priority.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5498">i915#5498</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl4/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-apl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb8/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-snb4/igt@gem_render_copy@x-tiled-to-vebox-yf-=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +52 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb5/igt@gem_softpin@evict-single-offset.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-ic=
lb2/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl4/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@gem=
_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-apl2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl6=
/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb8/igt@gen3_render_tiledy_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb5/igt@gen3_render_tiledy_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk5/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk=
6/igt@i915_pm_rc6_residency@rc6-fence.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6605/shard-apl3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-=
apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/6405">i915#6405</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6405">i915#6405</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644"=
>fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892"=
>fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-glk5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tile=
d_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb4/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +202 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb7/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-glk6/igt@kms_chamelium@hdmi-crc-single.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl3/igt@kms_chamelium@vga-hpd-after-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_chamelium@vga-hpd-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7590/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72">i=
915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb@=
varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb@=
varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7590/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgf=
lip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7590/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-in=
dfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indf=
b-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7590/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-s=
pr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6497">i915#6497</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +4 similar issues<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-d=
p-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb7/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb4/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/igt@kms_plane_scaling@planes-u=
pscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl4/igt@kms_psr@primary_page_flip.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +91 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-icl=
b7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb8/igt@kms_psr@psr2_sprite_render.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i9=
15#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/346=
7">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7590/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-glk2/igt@kms_vblank@pipe-d-wait-busy-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-iclb6/igt@kms_vblank@pipe-d-wait-forked.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-tglb2/igt@kms_vrr@flip-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-tglb5/igt@prime_nv_api@i915_self_import.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7590/shard-iclb7/igt@prime_nv_api@i915_self_import.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-apl6/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7590/shard-kbl1/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/=
igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-dg1-13/igt@gem_ctx_persistence@many-contexts.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4883">i915#488=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590=
/shard-dg1-17/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/=
shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl7/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard=
-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard=
-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shar=
d-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard=
-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6605/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_759=
0/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6605/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/=
shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk8/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard=
-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-=
rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110254">fdo#1102=
54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_759=
0/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@gem_readwrite@read-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rk=
l-5/igt@gem_readwrite@read-write.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/=
shard-rkl-5/igt@gen9_exec_parse@cmd-crossing-page.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#301=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590=
/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb2/ig=
t@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915#640=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590=
/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-dg1-17/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#=
1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
590/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i91=
5#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7590/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/409=
8">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7590/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwrite-xt=
iled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb21=
01010-blt-ytiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
90/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-dr=
aw-mmap-wc.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-t=
glb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7590/shard-apl3/igt@kms_plane@plane-panning-bottom-r=
ight-suspend@pipe-a-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-=
vs-constant.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_plane_alpha_blend@pipe=
-a-coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-=
b-constant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-iclb7/igt@kms_plane_scal=
ing@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">PASS=
</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/sh=
ard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@kms_psr@sprite_plane_move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rk=
l-6/igt@kms_psr@sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7590/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalida=
te-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7590/shard-rkl-6/igt@kms_universal_plane@disable-pr=
imary-vs-flip-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy-hang:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-1/igt@kms_vblank@pipe-b-wait-busy-hang.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915=
#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7590/shard-rkl-6/igt@kms_vblank@pipe-b-wait-busy-hang.html">PASS</a> +11 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb5/igt@perf@polling-parameterized.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-i=
clb2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-rkl-1/igt@perf@polling-small-buf.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-rkl-5=
/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#45=
21</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_759=
0/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2 sim=
ilar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#61=
17</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_759=
0/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590=
/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7590/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i=
915#3614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shar=
d-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-glk7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg=
2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7590/shard-glk7/igt@kms_ccs@pipe-d-crc-primar=
y-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7590/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7590/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6605/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7590/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6605/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/shard-apl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6605/=
shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6605/shard-apl1/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i9=
15#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
12">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7590/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7590/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7590/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/shard-apl1/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6605 -&gt; IGTPW_7590</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11946: 0e9c43d76a145712da46e935d429ce2a3eea80e8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7590/index.htm=
l<br />
  IGT_6605: 1596683606cafa391f5d8f6b68e0c888233c0738 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2464746543722144784==--
