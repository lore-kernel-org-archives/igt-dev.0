Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Aug 2020 04:40:44 -0000
Message-ID: <159781204452.23595.1445148610207037907@emeril.freedesktop.org>
References: <20200417211025.109574-1-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0157312350=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0157312350==
Content-Type: multipart/alternative;
 boundary="===============7330506477106643942=="

--===============7330506477106643942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add nouveau-crc tests (rev4)
URL   : https://patchwork.freedesktop.org/series/74811/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8901_full -> IGTPW_4890_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4890_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4890_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4890_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@all-pipes-single-move:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk9/igt@kms_cursor_legacy@all-pipes-single-move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk6/igt@kms_cursor_legacy@all-pipes-single-move.html

  * {igt@nouveau_crc@pipe-b-source-rg} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +13 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html

  * {igt@nouveau_crc@pipe-d-ctx-flip-detection} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +19 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8901_full and IGTPW_4890_full:

### New IGT tests (21) ###

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-rg:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-rg:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-rg:
    - Statuses :
    - Exec time: [None] s

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-rg:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4890_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk5/igt@gem_exec_whisper@basic-fds-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [PASS][9] -> [WARN][10] ([i915#1515])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-hsw:          [PASS][11] -> [WARN][12] ([i915#1519])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@i915_pm_rc6_residency@rc6-fence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_query@query-topology-unsupported:
    - shard-snb:          [PASS][13] -> [TIMEOUT][14] ([i915#1958]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb2/igt@i915_query@query-topology-unsupported.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@i915_query@query-topology-unsupported.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-snb:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - shard-hsw:          [PASS][19] -> [TIMEOUT][20] ([i915#1958]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +10 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#83])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1185] / [i915#250])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#173])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb5/igt@kms_psr@no_drrs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb5/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1635] / [i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl1/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl1/igt@kms_setmode@basic.html

  * igt@prime_busy@before@vecs0:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1635] / [i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl1/igt@prime_busy@before@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl4/igt@prime_busy@before@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][37] ([i915#1930]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-snb:          [TIMEOUT][39] ([i915#1958]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_exec_suspend@basic-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          [DMESG-WARN][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_mmap_gtt@fault-concurrent.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb5/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][43] ([i915#1635] / [i915#2278]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl6/igt@i915_selftest@mock@contexts.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl8/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-tglb:         [FAIL][49] ([i915#79]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl1/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-wait-idle-hang:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl8/igt@kms_vblank@pipe-c-wait-idle-hang.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl2/igt@kms_vblank@pipe-c-wait-idle-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][63] ([i915#1542]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb5/igt@perf@blocking-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb3/igt@perf@blocking-parameterized.html

  * igt@perf@oa-exponents:
    - shard-hsw:          [INCOMPLETE][65] ([i915#1958]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@perf@oa-exponents.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw2/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][67] ([i915#2258]) -> [PASS][68] +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-snb:          [TIMEOUT][69] ([i915#1958]) -> [SKIP][70] ([fdo#109271]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html

  * igt@kms_ccs@pipe-c-bad-pixel-format:
    - shard-hsw:          [SKIP][71] ([fdo#109271]) -> [TIMEOUT][72] ([i915#1958]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@kms_ccs@pipe-c-bad-pixel-format.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw1/igt@kms_ccs@pipe-c-bad-pixel-format.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][73] ([i915#1319]) -> [TIMEOUT][74] ([i915#1319] / [i915#1958])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl1/igt@kms_content_protection@lic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1226]) -> [SKIP][76] ([fdo#109349])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [DMESG-WARN][78] ([i915#180])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][81], [FAIL][82]) ([i915#1958] / [i915#2283]) -> [FAIL][83] ([i915#2283])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4890
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8901: 39e63f96cd9438015d6204a3ca33819447e4c066 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4890: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html

--===============7330506477106643942==
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
<tr><td><b>Series:</b></td><td>Add nouveau-crc tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/74811/">https://patchwork.freedesktop.org/series/74811/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8901_full -&gt; IGTPW_4890_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4890_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4890_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4890_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@all-pipes-single-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk9/igt@kms_cursor_legacy@all-pipes-single-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk6/igt@kms_cursor_legacy@all-pipes-single-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@nouveau_crc@pipe-b-source-rg} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>{igt@nouveau_crc@pipe-d-ctx-flip-detection} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8901_full and IGTPW_4890_full:</p>
<h3>New IGT tests (21)</h3>
<ul>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4890_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk5/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk6/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb2/igt@i915_query@query-topology-unsupported.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@i915_query@query-topology-unsupported.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/250">i915#250</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb5/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb5/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl1/igt@prime_busy@before@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl4/igt@prime_busy@before@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb4/igt@gem_exec_suspend@basic-s3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb5/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl6/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl8/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-glk8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-apl8/igt@kms_vblank@pipe-c-wait-idle-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-apl2/igt@kms_vblank@pipe-c-wait-idle-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb5/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb3/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@perf@oa-exponents.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw2/igt@perf@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@kms_ccs@pipe-c-bad-pixel-format.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw1/igt@kms_ccs@pipe-c-bad-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl1/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8901/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/shard-hsw8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
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
<li>IGT: IGT_5769 -&gt; IGTPW_4890</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8901: 39e63f96cd9438015d6204a3ca33819447e4c066 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4890: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4890/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7330506477106643942==--

--===============0157312350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0157312350==--
