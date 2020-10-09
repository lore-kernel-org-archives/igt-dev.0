Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Oct 2020 02:19:21 -0000
Message-ID: <160220996116.1825.5522544954377794547@emeril.freedesktop.org>
References: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcHJpbWVf?=
 =?utf-8?q?vgem=3A_Check_that_we_wrap_the_vgem_mmap_with_userptr_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0842041744=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0842041744==
Content-Type: multipart/alternative;
 boundary="===============1249899738256156320=="

--===============1249899738256156320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: prime_vgem: Check that we wrap the vgem mmap with userptr (rev2)
URL   : https://patchwork.freedesktop.org/series/82485/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9113_full -> IGTPW_5047_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5047_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5047_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5047_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@parallel@rcs0:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@gem_exec_fence@parallel@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_exec_fence@parallel@rcs0.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
    - shard-tglb:         [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
    - shard-kbl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         [SKIP][11] ([i915#768]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-kbl:          [SKIP][13] ([fdo#109271]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-glk:          [SKIP][15] ([fdo#109271]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-hsw:          [SKIP][17] ([fdo#109271]) -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_capture@pi@vcs0}:
    - shard-glk:          NOTRUN -> [INCOMPLETE][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@gem_exec_capture@pi@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9113_full and IGTPW_5047_full:

### New IGT tests (1) ###

  * igt@prime_vgem@basic-userptr:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_5047_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#1635])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1436] / [i915#1635] / [i915#716])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][26] -> [WARN][27] ([i915#1519])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][28] -> [INCOMPLETE][29] ([i915#155])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-iclb:         [PASS][30] -> [INCOMPLETE][31] ([i915#1185])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@i915_suspend@sysfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][34] -> [FAIL][35] ([i915#96])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#1635] / [i915#1982])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-glk:          [PASS][38] -> [DMESG-WARN][39] ([i915#1982])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#79])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#1982]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][44] -> [DMESG-WARN][45] ([i915#1982]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#83])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][48] -> [FAIL][49] ([i915#83])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#2472])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl1/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
    - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#1635] / [i915#2472])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#31])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_bad_destroy@invalid-ctx:
    - shard-iclb:         [FAIL][58] ([i915#2541]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-kbl:          [FAIL][60] ([i915#2541]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-tglb:         [FAIL][62] ([i915#2541]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-hsw:          [FAIL][64] ([i915#2541]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-glk:          [FAIL][66] ([i915#2541]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-apl:          [FAIL][68] ([i915#1635] / [i915#2541]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_ctx_bad_destroy@invalid-ctx.html

  * {igt@gem_exec_capture@pi@rcs0}:
    - shard-glk:          [INCOMPLETE][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_exec_capture@pi@rcs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][72] ([i915#1635] / [i915#2389]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][74] ([i915#2389]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-hsw:          [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [FAIL][78] ([i915#1888]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][80] ([i915#2521]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][82] ([i915#2521]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          [FAIL][84] ([i915#1635] / [i915#54]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-kbl:          [FAIL][86] ([i915#54]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][88] ([i915#1982]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [FAIL][90] ([i915#2370]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][92] ([i915#1982]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw8/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][94] ([i915#1982]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][96] ([i915#2055]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][98] ([i915#49]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][100] ([fdo#109441]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@prime_vgem@sync@rcs0:
    - shard-iclb:         [INCOMPLETE][102] ([i915#409]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb5/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-apl:          [SKIP][104] ([fdo#109271] / [i915#1635]) -> [FAIL][105] ([i915#1635])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][106] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][107] ([i915#1319] / [i915#1635])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl1/igt@kms_content_protection@legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5805 -> IGTPW_5047
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5047: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html

--===============1249899738256156320==
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
<tr><td><b>Series:</b></td><td>prime_vgem: Check that we wrap the vgem mmap with userptr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82485/">https://patchwork.freedesktop.org/series/82485/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9113_full -&gt; IGTPW_5047_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5047_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5047_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5047_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@parallel@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@gem_exec_fence@parallel@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_exec_fence@parallel@rcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_exec_capture@pi@vcs0}:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9113_full and IGTPW_5047_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@prime_vgem@basic-userptr:<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5047_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl1/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#2472</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#2472</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_bad_destroy@invalid-ctx:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk6/igt@gem_exec_capture@pi@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw8/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-tglb6/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-iclb5/igt@prime_vgem@sync@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/shard-apl1/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5805 -&gt; IGTPW_5047</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5047: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5047/index.html<br />
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1249899738256156320==--

--===============0842041744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0842041744==--
