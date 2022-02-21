Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============8962248254377266767=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 21 Feb 2022 16:59:55 -0000
Message-ID: <164546279585.21415.8558200312650594286@emeril.freedesktop.org>
References: <20220221093812.3911-1-jeevan.b@intel.com>
In-Reply-To: <20220221093812.3911-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdisplay=5Fmodes=3A_Add_test_for_extended_mode_=28rev2=29?=
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

--===============8962248254377266767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Add test for extended mode (rev2)
URL   : https://patchwork.freedesktop.org/series/100323/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11263_full -> IGTPW_6661_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

New tests
---------

  New tests have been introduced between CI_DRM_11263_full and IGTPW_6661_full:

### New IGT tests (3) ###

  * igt@kms_display_modes@extended-mode-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-basic@pipe-ab:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-basic@pipe-bc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6661_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [FAIL][3] ([i915#232]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][4] ([i915#3354])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#4525])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk:          NOTRUN -> [SKIP][6] ([fdo#109271]) +101 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk5/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][7] ([i915#5076])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][8] ([i915#5076])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][9] ([i915#5076])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][13] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk6/igt@gem_exec_fair@basic-none@vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          NOTRUN -> [DMESG-WARN][21] ([i915#118])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4613]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@gem_lmem_swapping@heavy-random.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4613]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_lmem_swapping@heavy-random.html
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl2/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4270]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271]) +266 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#768]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3297]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#3297]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#110542])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109290])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          NOTRUN -> [DMESG-WARN][38] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109289]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109289]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#2527] / [i915#2856]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2856]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][43] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][44] -> [SKIP][45] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][46] ([i915#2681] / [i915#2684])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][47] ([i915#2684])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109293] / [fdo#109506])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109506] / [i915#2411])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#4387])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#4387])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109303])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109303])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#1769])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#1769])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111614]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3777]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3777])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3777]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615]) +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#110723]) +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3886]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111615] / [i915#3689]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3689] / [i915#3886]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3886]) +17 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109278] / [i915#3886]) +12 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl7/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk2/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109300] / [fdo#111066])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#1063]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3116]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3116] / [i915#3299]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109279] / [i915#3359]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278]) +49 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3359]) +9 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3319]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         NOTRUN -> [FAIL][88] ([i915#2346])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#426])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#426])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][91] -> [INCOMPLETE][92] ([i915#180] / [i915#636])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][93] -> [FAIL][94] ([i915#79])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109274]) +7 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][97] ([i915#79])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][98] -> [DMESG-WARN][99] ([i915#180]) +9 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][100] -> [DMESG-WARN][101] ([i915#180])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [PASS][102] -> [FAIL][103] ([i915#4911])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#2587])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2587])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][106] ([fdo#109271]) +195 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109280] / [fdo#111825]) +52 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109280]) +49 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#1187])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#1187])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#4278])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@kms_invalid_mode@clock-too-high.html
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#4278])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#533]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#533])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#533]) +5 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][116] ([fdo#108145] / [i915#265]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][117] ([fdo#108145] / [i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][118] ([fdo#108145] / [i915#265]) +4 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#3536]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#3536]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#111615] / [fdo#112054])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#2920]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk6/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#111068] / [i915#658]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#658]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglb:         NOTRUN -> [SKIP][126] ([i915#1911])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#658]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl7/igt@kms_psr2_su@page_flip-xrgb8888.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/index.html

--===============8962248254377266767==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Add test for extended mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100323/">https://patchwork.freedesktop.org/series/100323/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11263_full -&gt; IGTPW_6661_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11263_full and IGTPW_6661_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-ab:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-bc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6661_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([fdo#109271]) +101 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl2/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +266 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl2/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl8/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl7/igt@kms_chamelium@dp-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb6/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk2/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@kms_content_protection@content_type_change.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html">SKIP</a> ([fdo#109278]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +9 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">FAIL</a> ([i915#4911])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +195 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb3/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb2/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-glk6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6661/shard-kbl7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8962248254377266767==--
