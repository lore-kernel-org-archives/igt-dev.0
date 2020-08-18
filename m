Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Aug 2020 16:27:04 -0000
Message-ID: <159776802403.18758.14807036939358783926@emeril.freedesktop.org>
References: <20200818140529.32116-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200818140529.32116-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev28=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0163639112=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0163639112==
Content-Type: multipart/alternative;
 boundary="===============5921265459277345736=="

--===============5921265459277345736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev28)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8898_full -> IGTPW_4885_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4885_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4885_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4885_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@kms_ccs@pipe-a-crc-primary-basic:
    - shard-tglb:         NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-basic.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-tglb:         [PASS][4] -> [FAIL][5] +19 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][6] ([i915#1759] / [i915#2110]) -> ([FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb1/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb1/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb5/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb3/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8898_full and IGTPW_4885_full:

### New IGT tests (17) ###

  * igt@api_intel_bb@check-canonical:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@lot-of-buffers:
    - Statuses : 5 pass(s)
    - Exec time: [0.86, 4.25] s

  * igt@api_intel_bb@render:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@render-ccs:
    - Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@api_intel_bb@render@render-none-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.31, 0.50] s

  * igt@api_intel_bb@render@render-none-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@api_intel_bb@render@render-none-reloc-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.31, 0.53] s

  * igt@api_intel_bb@render@render-none-reloc-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@api_intel_bb@render@render-x-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.45] s

  * igt@api_intel_bb@render@render-x-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@api_intel_bb@render@render-x-reloc-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.28, 0.41] s

  * igt@api_intel_bb@render@render-x-reloc-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@api_intel_bb@render@render-y-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.45] s

  * igt@api_intel_bb@render@render-y-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@api_intel_bb@render@render-y-reloc-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.28, 0.37] s

  * igt@api_intel_bb@render@render-y-reloc-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@api_intel_bb@reset-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4885_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest@bcs0:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1889])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb3/igt@gem_ctx_shared@q-smoketest@bcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb8/igt@gem_ctx_shared@q-smoketest@bcs0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk7/igt@gem_exec_whisper@basic-fds-forked.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk5/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [PASS][17] -> [WARN][18] ([i915#1515])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_ccs@pipe-d-bad-aux-stride:
    - shard-tglb:         [PASS][19] -> [TIMEOUT][20] ([i915#1958])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride.html

  * igt@kms_color@pipe-b-ctm-negative:
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw7/igt@kms_color@pipe-b-ctm-negative.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw2/igt@kms_color@pipe-b-ctm-negative.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1226])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl6/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [PASS][41] -> [INCOMPLETE][42] ([i915#1078] / [i915#1185])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@perf_pmu@module-unload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb1/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [DMESG-WARN][45] ([i915#2165]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk8/igt@gem_mmap_gtt@fault-concurrent.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk7/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-hsw:          [DMESG-WARN][49] ([i915#1982]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@i915_query@query-topology-coherent-slice-mask.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw8/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][51] ([i915#1635] / [i915#2278]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl4/igt@i915_selftest@mock@contexts.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl7/igt@i915_selftest@mock@contexts.html

  * igt@i915_selftest@perf@request:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1823]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb1/igt@i915_selftest@perf@request.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +11 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][63] ([i915#155]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@oa-exponents:
    - shard-hsw:          [INCOMPLETE][67] ([i915#1958]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw8/igt@perf@oa-exponents.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw7/igt@perf@oa-exponents.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb4/igt@perf_pmu@module-unload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb1/igt@perf_pmu@module-unload.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [FAIL][71] ([i915#2258]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw7/igt@prime_busy@after@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw4/igt@prime_busy@after@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [TIMEOUT][74] ([i915#1958]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][75] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][76] ([fdo#108145] / [i915#1635] / [i915#1982])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][77], [FAIL][78]) ([i915#1958] / [i915#2283]) -> [FAIL][79] ([i915#2283])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw8/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][80], [FAIL][81]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][82] ([fdo#109271] / [i915#1635] / [i915#716])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl3/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1823]: https://gitlab.freedesktop.org/drm/intel/issues/1823
  [i915#1889]: https://gitlab.freedesktop.org/drm/intel/issues/1889
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2165]: https://gitlab.freedesktop.org/drm/intel/issues/2165
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4885
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8898: 7a3c826e246d18af05f662cf6425e750eb00aec5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4885: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html

--===============5921265459277345736==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev28)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8898_full -&gt; IGTPW_4885_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4885_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4885_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4885_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">INCOMPLETE</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-basic.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html">FAIL</a> +19 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb3/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8898_full and IGTPW_4885_full:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@lot-of-buffers:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.86, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.31, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.31, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.28, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.28, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-flags:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4885_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb3/igt@gem_ctx_shared@q-smoketest@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb8/igt@gem_ctx_shared@q-smoketest@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1889">i915#1889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk7/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk5/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw7/igt@kms_color@pipe-b-ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw2/igt@kms_color@pipe-b-ctm-negative.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1078">i915#1078</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb1/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk8/igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2165">i915#2165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk7/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@i915_query@query-topology-coherent-slice-mask.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw8/igt@i915_query@query-topology-coherent-slice-mask.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl7/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb1/igt@i915_selftest@perf@request.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1823">i915#1823</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@i915_selftest@perf@request.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw8/igt@perf@oa-exponents.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw7/igt@perf@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-iclb4/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-iclb1/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw7/igt@prime_busy@after@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw4/igt@prime_busy@after@vecs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw2/igt@i915_pm_dc@dc3co-vpb-simulation.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-hsw8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-hsw1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8898/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
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
<li>IGT: IGT_5769 -&gt; IGTPW_4885</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8898: 7a3c826e246d18af05f662cf6425e750eb00aec5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4885: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4885/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5921265459277345736==--

--===============0163639112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0163639112==--
