Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8574776915198499899=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Fri, 10 Jun 2022 00:26:02 -0000
Message-ID: <165482076250.16748.13561589863783481412@emeril.freedesktop.org>
References: <20220609064330.1460290-1-riana.tauro@intel.com>
In-Reply-To: <20220609064330.1460290-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRXh0ZW5k?=
 =?utf-8?q?_rc6-idle_=28rev2=29?=
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

--===============8574776915198499899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend rc6-idle (rev2)
URL   : https://patchwork.freedesktop.org/series/104872/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11743_full -> IGTPW_7266_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7266_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_rc6_residency@rc6-idle@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [WARN][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
    - shard-iclb:         NOTRUN -> [WARN][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11743_full and IGTPW_7266_full:

### New IGT tests (9) ###

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - Statuses : 5 pass(s) 2 warn(s)
    - Exec time: [12.20, 12.25] s

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - Statuses : 5 pass(s) 2 warn(s)
    - Exec time: [12.21, 12.29] s

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - Statuses : 5 pass(s) 2 warn(s)
    - Exec time: [12.20, 12.25] s

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - Statuses : 1 fail(s) 4 pass(s) 1 warn(s)
    - Exec time: [12.21, 12.36] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.17] s

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  

Known issues
------------

  Here are the changes found in IGTPW_7266_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-snb7/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][8] -> [TIMEOUT][9] ([i915#3070])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl6/igt@gem_lmem_swapping@verify.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4613])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4270])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@gem_pxp@create-valid-protected-context.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4270])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#3297]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#3297]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2527] / [i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4281])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109302])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@i915_query@query-topology-unsupported.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109302])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][30] ([i915#1759])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#404])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#404])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#1769])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111615])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110723])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615] / [i915#3689]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278]) +12 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +130 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#6095])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3689] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl1/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb4/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@kms_chamelium@dp-crc-multiple.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-snb7/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_color_chamelium@pipe-c-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl3/igt@kms_color_chamelium@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3359])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109279] / [i915#3359]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271]) +48 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [PASS][59] -> [FAIL][60] ([i915#5072])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#2346])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#4103]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
    - shard-glk:          [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-glk3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#5287])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#5287])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#111825]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#79])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#5439])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#5438])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +9 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109280] / [fdo#111825]) +18 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][76] -> [FAIL][77] ([i915#1188])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271]) +89 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-snb4/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#5176]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271]) +135 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2920])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#111068] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([fdo#109441]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][90] ([i915#132] / [i915#3467])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3555])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#3555])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][93] -> [DMESG-WARN][94] ([i915#180]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2530]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2530]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109289])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@perf@gen12-mi-rpc.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sysfs_clients@recycle-many:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk8/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2994])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl2/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2994]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@sysfs_clients@sema-25.html
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl4/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-immediate:
    - {shard-tglu}:       [TIMEOUT][105] ([i915#3063]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglu-3/igt@gem_eio@in-flight-contexts-immediate.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglu-4/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][107] ([i915#5784]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][109] ([i915#4525]) -> [PASS][110] +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][111] ([i915#2842]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][115] ([i915#2842]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][117] ([i915#2849]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][119] ([i915#2190]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-tglu}:       [FAIL][121] ([i915#3825]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglu-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglu-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@i2c:
    - {shard-rkl}:        [SKIP][123] ([fdo#109308]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@i915_pm_rpm@i2c.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - {shard-dg1}:        [SKIP][125] ([i915#1397]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rps@basic-api:
    - {shard-dg1}:        [FAIL][127] ([i915#4032]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-dg1-19/igt@i915_pm_rps@basic-api.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-13/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][129] ([i915#4016]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@i915_pm_rps@waitboost.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-2/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-tglb:         [INCOMPLETE][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-tglb1/igt@i915_selftest@live@gt_mocs.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][133] ([i915#180]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][135] ([i915#180]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl7/igt@i915_suspend@forcewake.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - {shard-dg1}:        [SKIP][137] ([i915#1836]) -> [PASS][138] +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-dg1-18/igt@kms_color@pipe-a-legacy-gamma.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-17/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_color@pipe-b-degamma:
    - {shard-rkl}:        [SKIP][139] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][140] +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@kms_color@pipe-b-degamma.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - {shard-rkl}:        [SKIP][141] ([fdo#112022] / [i915#4070]) -> [PASS][142] +4 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - {shard-rkl}:        [SKIP][143] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][144] +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - {shard-rkl}:        [SKIP][145] ([fdo#111825] / [i915#4070]) -> [PASS][146] +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][147] ([i915#2346] / [i915#533]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - {shard-rkl}:        [SKIP][149] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][150] +7 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][151] ([i915#4767]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-rkl}:        [SKIP][153] ([fdo#110189] / [i915#3955]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [INCOMPLETE][155] ([i915#3614]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - {shard-rkl}:        [SKIP][157] ([i915#3701]) -> [PASS][158] +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][159] ([i915#3701]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - {shard-dg1}:        [SKIP][161] ([i915#5721]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - {shard-rkl}:        [SKIP][163] ([i915#1849] / [i915#4098]) -> [PASS][164] +20 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [FAIL][165] ([i915#1188]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - {shard-rkl}:        [SKIP][167] ([i915#4278]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_invalid_mode@zero-hdisplay.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_lease@page_flip_implicit_plane:
    - {shard-dg1}:        [FAIL][169] -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-dg1-18/igt@kms_lease@page_flip_implicit_plane.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-17/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
    - {shard-rkl}:        [SKIP][171] ([i915#3558] / [i915#4070]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][173] ([fdo#109441]) -> [PASS][174] +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@sprite_blt:
    - {shard-rkl}:        [SKIP][175] ([i915#1072]) -> [PASS][176] +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_psr@sprite_blt.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_psr@sprite_blt.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - {shard-rkl}:        [SKIP][177] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - {shard-rkl}:        [SKIP][179] ([i915#1845] / [i915#4098]) -> [PASS][180] +13 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-rkl-2/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][181] ([i915#6117]) -> [SKIP][182] ([i915#4525])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][183] ([i915#658]) -> [SKIP][184] ([i915#588])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-glk:          [SKIP][185] ([fdo#109271] / [i915#1888]) -> [SKIP][186] ([fdo#109271])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-glk4/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk1/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][187] ([i915#658]) -> [SKIP][188] ([i915#2920]) +1 similar issue
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][189] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][190] ([i915#5939]) +1 similar issue
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl1/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl3/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl7/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl2/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl3/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl1/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl3/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl6/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl8/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl4/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
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
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6515 -> IGTPW_7266
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11743: 2d47fcd64571aa5e6b9ff875ddf061f372ed19a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/index.html
  IGT_6515: 547f7c12716fe8e39573f32585d0377bdc8e7ff8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/index.html

--===============8574776915198499899==
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
<tr><td><b>Series:</b></td><td>Extend rc6-idle (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104872/">https://patchwork.freedesktop.org/series/104872/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11743_full -&gt; IGTPW_7266_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7266=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@rcs0} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0=
.html">WARN</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0=
.html">WARN</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@vec=
s0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11743_full and IGTPW_7266_=
full:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 2 warn(s)</li>
<li>Exec time: [12.20, 12.25] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 2 warn(s)</li>
<li>Exec time: [12.21, 12.29] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 2 warn(s)</li>
<li>Exec time: [12.20, 12.25] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 warn(s)</li>
<li>Exec time: [12.21, 12.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7266_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_726=
6/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-snb7/igt@gem_ctx_persistence@idempotent.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb2/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb5/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/sh=
ard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-=
iclb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-apl6/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb5/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb2/igt@gem_pxp@create-valid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb4/igt@gem_pxp@create-valid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb5/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb8/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/404">i915#404</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/404">i915#404</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-kbl6/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-kbl1/igt@kms_ccs@pipe-b-bad-pixel-format-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +130 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-apl1/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb4/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb6/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb6/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-snb7/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-kbl3/igt@kms_color_chamelium@pipe-c-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-apl4/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-s=
ize-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x51=
2-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-512x512=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +48 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
266/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i915#5072=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7266/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-glk3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe=
-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7266/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-r=
ender-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-r=
ender-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111825">fdo#111825</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7266/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5439">i915#5439</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5438">i915#5438</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +18 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-256:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-snb4/igt@kms_plane_cursor@pipe-c-viewport-si=
ze-256.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +89 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb5/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-apl2/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-75@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +135 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-i=
clb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb7/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb7/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7266/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@nouveau_crc@pipe-b-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb2/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7266/shard-tglb6/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-glk8/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-iclb3/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-apl2/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-tglb2/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7266/shard-kbl4/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglu-3/igt@gem_eio@in-flight-contexts-immediate.html">T=
IMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063=
">i915#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7266/shard-tglu-4/igt@gem_eio@in-flight-contexts-immediate.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-t=
glb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7266/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
266/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
266/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-tg=
lb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglu-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3825">=
i915#3825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7266/shard-tglu-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#109308</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/=
igt@i915_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-dg1-19/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4032">i915#4032</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-d=
g1-13/igt@i915_pm_rps@basic-api.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rk=
l-2/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-tglb1/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/sha=
rd-tglb6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7266/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-apl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shar=
d-apl4/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-legacy-gamma:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-dg1-18/igt@kms_color@pipe-a-legacy-gamma.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#183=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266=
/shard-dg1-17/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@kms_color@pipe-b-degamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#184=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i9=
15#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
98">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7266/shard-rkl-6/igt@kms_color@pipe-b-degamma.html">PASS</a> +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-on=
screen.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x=
256-top-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-si=
ze.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-fli=
pa-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-glk8/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xt=
iled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_draw_crc@draw-method-=
xrgb8888-mmap-gtt-xtiled.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard=
-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110189">fdo#110189</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#=
3955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
266/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i91=
5#3614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7266/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a> +2 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7266/shard-iclb3/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri=
-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5721">i915#5721</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7266/shard-dg1-18/igt@kms_frontbuffer_tracking=
@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#427=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266=
/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-dg1-18/igt@kms_lease@page_flip_implicit_plane.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-dg1-17/igt@kms_lease@page_flip_implicit_plane.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-y:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/355=
8">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7266/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
66/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6=
/igt@kms_psr@sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-functional:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-fu=
nctional.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7266/shard-rkl-6/igt@kms_universal_plane@uni=
versal-plane-pipe-b-functional.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-forked-busy-hang:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-rkl-2/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845"=
>i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7266/shard-rkl-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.htm=
l">PASS</a> +13 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7266/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-glk4/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_=
ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7266/shard-glk1/igt@kms_ccs@pipe-d-random-ccs-data-4_=
tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7266/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11743/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7266/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11743/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11743/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11743/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/s=
hard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7266/shard-apl3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-ap=
l6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7266/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/shard-apl4/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7266/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#=
3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312"=
>i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6515 -&gt; IGTPW_7266</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11743: 2d47fcd64571aa5e6b9ff875ddf061f372ed19a3 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7266/index.htm=
l<br />
  IGT_6515: 547f7c12716fe8e39573f32585d0377bdc8e7ff8 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8574776915198499899==--
