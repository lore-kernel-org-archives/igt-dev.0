Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Oct 2020 03:09:44 -0000
Message-ID: <160221298453.1825.15713244817738489683@emeril.freedesktop.org>
References: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcHJpbWVf?=
 =?utf-8?q?vgem=3A_Check_that_we_wrap_the_vgem_mmap_with_userptr_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1051799338=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1051799338==
Content-Type: multipart/alternative;
 boundary="===============0336688761747248413=="

--===============0336688761747248413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: prime_vgem: Check that we wrap the vgem mmap with userptr (rev3)
URL   : https://patchwork.freedesktop.org/series/82485/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9113_full -> IGTPW_5048_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5048_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5048_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5048_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_engines@execute-oneforall:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@gem_ctx_engines@execute-oneforall.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@gem_ctx_engines@execute-oneforall.html

  * igt@gem_ctx_param@basic:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@gem_ctx_param@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@gem_ctx_param@basic.html
    - shard-glk:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_ctx_param@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_ctx_param@basic.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-tglb:         [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          [SKIP][9] ([fdo#109271]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         [SKIP][11] ([i915#768]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-kbl:          [SKIP][13] ([fdo#109271]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9113_full and IGTPW_5048_full:

### New IGT tests (1) ###

  * igt@prime_vgem@basic-userptr:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_5048_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@basic:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@gem_ctx_param@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_ctx_param@basic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#96])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl1/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271] / [i915#1635])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([i915#1836])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#1836])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_prime@basic-crc@second-to-first.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk9/igt@kms_setmode@basic.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1354]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@invalid-create-userspace-config.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@perf@invalid-create-userspace-config.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-apl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354] / [i915#1635]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@perf@low-oa-exponent-permissions.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@perf@low-oa-exponent-permissions.html
    - shard-tglb:         [PASS][51] -> [SKIP][52] ([i915#1354]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb5/igt@perf@low-oa-exponent-permissions.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@perf@low-oa-exponent-permissions.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1354]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@perf@polling-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@perf@polling-parameterized.html
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([i915#1354]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@perf@polling-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_ctx_bad_destroy@invalid-ctx:
    - shard-iclb:         [FAIL][57] ([i915#2541]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb1/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-kbl:          [FAIL][59] ([i915#2541]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-tglb:         [FAIL][61] ([i915#2541]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-hsw:          [FAIL][63] ([i915#2541]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw1/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-glk:          [FAIL][65] ([i915#2541]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-apl:          [FAIL][67] ([i915#1635] / [i915#2541]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl2/igt@gem_ctx_bad_destroy@invalid-ctx.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#2389]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-hsw:          [INCOMPLETE][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [FAIL][73] ([i915#1888]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][75] ([i915#1899]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][77] ([i915#2521]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl1/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][79] ([i915#2521]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          [FAIL][81] ([i915#1635] / [i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-kbl:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [FAIL][87] ([i915#2370]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb1/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][95] ([i915#2055]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][97] ([i915#49]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [SKIP][99] ([i915#1836]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_prime@basic-crc@first-to-second.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [SKIP][103] ([fdo#109271] / [i915#1635]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_prime@basic-crc@first-to-second.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [SKIP][105] ([i915#1836]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][109] ([fdo#109441]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_vgem@sync@rcs0:
    - shard-iclb:         [INCOMPLETE][111] ([i915#409]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb3/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-apl:          [SKIP][113] ([fdo#109271] / [i915#1635]) -> [FAIL][114] ([i915#1635])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][115] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][116] ([i915#1319] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_content_protection@legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#2542]: https://gitlab.freedesktop.org/drm/intel/issues/2542
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5805 -> IGTPW_5048
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5048: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html

--===============0336688761747248413==
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
<tr><td><b>Series:</b></td><td>prime_vgem: Check that we wrap the vgem mmap with userptr (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82485/">https://patchwork.freedesktop.org/series/82485/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9113_full -&gt; IGTPW_5048_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5048_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5048_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5048_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@execute-oneforall:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@gem_ctx_engines@execute-oneforall.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@gem_ctx_engines@execute-oneforall.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@basic:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@gem_ctx_param@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@gem_ctx_param@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_ctx_param@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_ctx_param@basic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9113_full and IGTPW_5048_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@prime_vgem@basic-userptr:<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5048_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@gem_ctx_param@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_ctx_param@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_flip@plain-flip-ts-check@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl1/igt@kms_flip@plain-flip-ts-check@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk9/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@low-oa-exponent-permissions:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@perf@low-oa-exponent-permissions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb5/igt@perf@low-oa-exponent-permissions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@perf@polling-parameterized.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@perf@polling-parameterized.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_bad_destroy@invalid-ctx:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb1/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw1/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl2/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb1/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-glk4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-iclb3/igt@prime_vgem@sync@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/shard-apl1/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
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
<li>IGT: IGT_5805 -&gt; IGTPW_5048</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5048: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5048/index.html<br />
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0336688761747248413==--

--===============1051799338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1051799338==--
