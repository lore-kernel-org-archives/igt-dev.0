Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0441123901474946710=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Mon, 18 Jul 2022 15:05:01 -0000
Message-ID: <165815670112.9321.1506516187211153706@emeril.freedesktop.org>
References: <20220715192200.1782193-1-markyacoub@chromium.org>
In-Reply-To: <20220715192200.1782193-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fchamelium=3A_Extend_check_of_valid_ports_to_port=3D0?=
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

--===============0441123901474946710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_chamelium: Extend check of valid ports to port=0
URL   : https://patchwork.freedesktop.org/series/106397/
State : success

== Summary ==

CI Bug Log - changes from IGT_6586_full -> IGTPW_7526_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7526_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x10}:
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x10.html

  * igt@prime_self_import@reimport-vs-gem_close-race:
    - {shard-tglu}:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglu-4/igt@prime_self_import@reimport-vs-gem_close-race.html

  
New tests
---------

  New tests have been introduced between IGT_6586_full and IGTPW_7526_full:

### New IGT tests (44) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 8 pass(s)
    - Exec time: [0.53, 4.73] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 9 pass(s)
    - Exec time: [0.52, 4.25] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 8 pass(s)
    - Exec time: [1.57, 4.34] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 9 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ctx_param@invalid-get-engines:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_ctx_param@invalid-get-no-zeromap:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_ctx_param@invalid-get-ringsize:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_ctx_param@invalid-set-no-zeromap:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_ctx_param@invalid-set-ringsize:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_pread@bench:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.29] s

  * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.13] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.22] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.22] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [29.67] s

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [30.0] s

  * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [3.03] s

  * igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [3.00] s

  * igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_7526_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache (NEW):
    - {shard-rkl}:        [PASS][3] -> [SKIP][4] ([i915#3281])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html
    - {shard-dg1}:        NOTRUN -> [SKIP][5] ([i915#3281])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][6] ([i915#3281])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#4613])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#4270])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4270])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#768])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][28] ([i915#4171])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_softpin@evict-single-offset.html
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#4171])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_softpin@evict-single-offset.html
    - shard-kbl:          NOTRUN -> [FAIL][30] ([i915#4171])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][31] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109302])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@i915_query@query-topology-unsupported.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109302])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271]) +107 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#5286]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#5286]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#6095]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [i915#3886])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#6095])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615] / [i915#3689])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][57] ([i915#1319])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl4/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#1063])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_content_protection@legacy.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109300] / [fdo#111066])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_content_protection@legacy.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_content_protection@legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#5287]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#5287]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [PASS][65] -> [DMESG-WARN][66] ([i915#180])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2672]) +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2672])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#3555]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2672] / [i915#3555])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-tglb:         NOTRUN -> [FAIL][72] ([i915#160]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271]) +43 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1:
    - shard-iclb:         [PASS][75] -> [DMESG-WARN][76] ([i915#6316])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([i915#5176]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271]) +75 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#5176]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#5176]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#109441]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109441])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
    - shard-tglb:         NOTRUN -> [FAIL][87] ([i915#132] / [i915#3467])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#5519])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#5519])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#111615] / [i915#5289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-iclb:         [PASS][91] -> [INCOMPLETE][92] ([fdo#111764])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [PASS][93] -> [INCOMPLETE][94] ([i915#3614] / [i915#4939])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2437])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2437])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2437])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk1/igt@kms_writeback@writeback-check-output.html
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#2437])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2437])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_writeback@writeback-check-output.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109289])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@perf@gen12-mi-rpc.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271]) +120 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109291])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#2994])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@sysfs_clients@split-10.html
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2994])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@sysfs_clients@split-10.html
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl8/igt@sysfs_clients@split-10.html
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#2994])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@sysfs_clients@split-10.html
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2994])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@sysfs_clients@split-10.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109307])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@tools_test@sysfs_l3_parity.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109307])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-nonblock:
    - {shard-rkl}:        [SKIP][111] ([i915#4098]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@nullptr:
    - {shard-rkl}:        [SKIP][113] ([i915#2582]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@fbdev@nullptr.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][115] ([i915#6268]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hostile:
    - {shard-tglu}:       [FAIL][117] ([i915#2410]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglu-6/igt@gem_ctx_persistence@hostile.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglu-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [TIMEOUT][119] ([i915#3063]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb8/igt@gem_eio@in-flight-immediate.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb6/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][121] ([i915#5784]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb2/igt@gem_eio@kms.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - {shard-rkl}:        [TIMEOUT][123] ([i915#3063]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@gem_eio@unwedge-stress.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][125] ([i915#4525]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][127] ([i915#2842]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][129] ([i915#2842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-glk:          [DMESG-WARN][131] ([i915#118]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk2/igt@gem_exec_nop@basic-sequential.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk1/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - {shard-rkl}:        [SKIP][133] ([i915#3281]) -> [PASS][134] +8 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_pread@uncached:
    - {shard-rkl}:        [SKIP][135] ([i915#3282]) -> [PASS][136] +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@gem_pread@uncached.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_pread@uncached.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][137] ([i915#180]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@unaligned-access:
    - {shard-rkl}:        [SKIP][139] ([i915#2527]) -> [PASS][140] +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-dg1}:        [SKIP][141] ([i915#1397]) -> [PASS][142] +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-glk:          [DMESG-FAIL][143] ([i915#118] / [i915#1888]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
    - {shard-rkl}:        [SKIP][145] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][146] +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][147] ([i915#4767]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][149] ([i915#180]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][151] ([i915#1849] / [i915#4098]) -> [PASS][152] +10 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][153] ([i915#1188]) -> [PASS][154] +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_lease@page_flip_implicit_plane:
    - {shard-rkl}:        [SKIP][155] ([i915#1845] / [i915#4098]) -> [PASS][156] +18 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_lease@page_flip_implicit_plane.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - {shard-rkl}:        [SKIP][157] ([i915#3558] / [i915#4070]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][159] ([i915#5235]) -> [PASS][160] +5 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@primary_blt:
    - {shard-rkl}:        [SKIP][161] ([i915#1072]) -> [PASS][162] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_psr@primary_blt.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][163] ([fdo#109441]) -> [PASS][164] +2 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb6/igt@kms_psr@psr2_primary_blt.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          [FAIL][165] ([i915#1888]) -> [PASS][166] +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][167] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  * igt@perf@mi-rpc:
    - {shard-rkl}:        [SKIP][169] ([i915#2434]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@perf@mi-rpc.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@perf@mi-rpc.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][171] ([i915#5639]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb1/igt@perf@polling-parameterized.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][173] ([i915#6117]) -> [SKIP][174] ([i915#4525])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][175] ([i915#658]) -> [SKIP][176] ([i915#588])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-glk:          [SKIP][177] ([fdo#109271]) -> [SKIP][178] ([fdo#109271] / [i915#1888])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@i915_pm_rpm@modeset-lpsp.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][179] ([i915#2920]) -> [SKIP][180] ([i915#658]) +1 similar issue
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][181] ([i915#2920]) -> [SKIP][182] ([fdo#111068] / [i915#658])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][183] ([i915#658]) -> [SKIP][184] ([i915#2920]) +1 similar issue
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#160]: https://gitlab.freedesktop.org/drm/intel/issues/160
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6316]: https://gitlab.freedesktop.org/drm/intel/issues/6316
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6586 -> IGTPW_7526

  CI-20190529: 20190529
  CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html
  IGT_6586: 0e5931f66eb283ba404b07394840b8e0b0c5e621 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html

--===============0441123901474946710==
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
<tr><td><b>Series:</b></td><td>lib/igt_chamelium: Extend check of valid por=
ts to port=3D0</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106397/">https://patchwork.freedesktop.org/series/106397/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7526/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6586_full -&gt; IGTPW_7526_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7526=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x10}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen@p=
ipe-b-hdmi-a-4-32x10.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglu-4/igt@prime_self_import@reimport-vs-gem=
_close-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6586_full and IGTPW_7526_full=
:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>Statuses : 7 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@full-batch:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-none:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.53, 4.73] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.52, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.57, 4.34] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@simple-bb:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@simple-bb-ctx:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-engines:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-no-zeromap:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-ringsize:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-no-zeromap:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-ringsize:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [29.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [30.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7526_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6586/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-=
rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3281">i915#3281</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-snb7/igt@gem_ctx_persistence@engines-mixed.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/=
igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-icl=
b5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb8/igt@gem_pxp@fail-invalid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb2/igt@gem_pxp@fail-invalid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-cont=
ext.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-k=
bl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl6/igt@i915=
_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb2/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb3/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +107 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl4/igt@kms_content_protection@legacy.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_content_protection@legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_content_protection@legacy.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_content_protection@legacy.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
526/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/160">i915#160</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7526/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
316">i915#6316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@kms_plane_scaling@=
plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5=
176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-snb2/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +75 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
d-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb=
4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
>fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i=
915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/34=
67">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr_stress_test@invalidate-prim=
ary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5519">i915#5519</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_psr_stress_test@invalidate-prim=
ary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5519">i915#5519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6586/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526=
/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111764">fdo=
#111764</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6586/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/=
shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i915#3=
614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">=
i915#4939</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk1/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +120 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mma=
p_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@prime_nv_test@nv_write_i915_cpu_mma=
p_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@sysfs_clients@split-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl8/igt@sysfs_clients@split-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@sysfs_clients@split-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb1/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb6/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/sha=
rd-rkl-6/igt@drm_read@short-buffer-nonblock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@fbd=
ev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/sha=
rd-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglu-6/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard=
-tglu-6/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb8/igt@gem_eio@in-flight-immediate.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/sha=
rd-tglb6/igt@gem_eio@in-flight-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@gem_ei=
o@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rk=
l-5/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7526/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_752=
6/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shar=
d-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk2/igt@gem_exec_nop@basic-sequential.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/s=
hard-glk1/igt@gem_exec_nop@basic-sequential.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i91=
5#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7526/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html">PASS</a=
> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt=
@gem_pread@uncached.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kb=
l1/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/s=
hard-rkl-5/igt@gen9_exec_parse@unaligned-access.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#=
1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
526/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i91=
5#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888=
">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7526/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-yti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-mmap-gtt-ytiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-ap=
l6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/=
shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_frontbuffer_trackin=
g@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +10 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#118=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526=
/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_lease@page_flip_implicit_plane.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#184=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i9=
15#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7526/shard-rkl-6/igt@kms_lease@page_flip_implicit_plane.html">PASS</a> +1=
8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558">i=
915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7526/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@planes-downscale=
-factor-0-5@pipe-a-edp-1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_psr@primary_blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/ig=
t@kms_psr@primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb6/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-=
iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7526/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping=
-top.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_universal_plane@disable-pr=
imary-vs-flip-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@perf@m=
i-rpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb1/igt@perf@polling-parameterized.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-i=
clb6/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#61=
17</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_752=
6/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shar=
d-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-=
glk7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7526/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#292=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526=
/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-=
fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7526/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-are=
a-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6586/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6586/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner=
@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526=
/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-=
kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#=
4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257"=
>i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6586 -&gt; IGTPW_7526</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.htm=
l<br />
  IGT_6586: 0e5931f66eb283ba404b07394840b8e0b0c5e621 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0441123901474946710==--
