Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 08 Oct 2020 17:21:30 -0000
Message-ID: <160217769087.11035.17540114061106156443@emeril.freedesktop.org>
References: <20201008063202.3439128-1-mika.kahola@intel.com>
In-Reply-To: <20201008063202.3439128-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1954107276=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1954107276==
Content-Type: multipart/alternative;
 boundary="===============5442703286530239491=="

--===============5442703286530239491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test (rev7)
URL   : https://patchwork.freedesktop.org/series/76536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9113_full -> IGTPW_5045_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5045_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5045_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5045_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@replace-hostile@rcs0:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_persistence@replace-hostile@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb3/igt@gem_ctx_persistence@replace-hostile@rcs0.html

  * igt@perf@stress-open-close:
    - shard-tglb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@perf@stress-open-close.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@perf@stress-open-close.html
    - shard-iclb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@perf@stress-open-close.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb7/igt@perf@stress-open-close.html

  
Known issues
------------

  Here are the changes found in IGTPW_5045_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@replace-hostile@vcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2410])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@gem_ctx_persistence@replace-hostile@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk6/igt@gem_ctx_persistence@replace-hostile@vcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#96])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#2370])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#31])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271] / [i915#1354])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@invalid-create-userspace-config.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@perf@invalid-create-userspace-config.html
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271] / [i915#1354] / [i915#1635])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl2/igt@perf@invalid-create-userspace-config.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl4/igt@perf@invalid-create-userspace-config.html
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1354])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@perf@invalid-create-userspace-config.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk9/igt@perf@invalid-create-userspace-config.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([i915#1354])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@perf@invalid-create-userspace-config.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@perf@invalid-create-userspace-config.html
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#1354])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@perf@invalid-create-userspace-config.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@perf@invalid-create-userspace-config.html

  * igt@perf@stress-open-close:
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@stress-open-close.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@perf@stress-open-close.html
    - shard-hsw:          [PASS][43] -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw4/igt@perf@stress-open-close.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw1/igt@perf@stress-open-close.html
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@perf@stress-open-close.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk1/igt@perf@stress-open-close.html
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1635])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@perf@stress-open-close.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl4/igt@perf@stress-open-close.html

  
#### Possible fixes ####

  * igt@gem_ctx_bad_destroy@invalid-ctx:
    - shard-iclb:         [FAIL][49] ([i915#2541]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-kbl:          [FAIL][51] ([i915#2541]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-tglb:         [FAIL][53] ([i915#2541]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb5/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-hsw:          [FAIL][55] ([i915#2541]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw6/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-glk:          [FAIL][57] ([i915#2541]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk9/igt@gem_ctx_bad_destroy@invalid-ctx.html
    - shard-apl:          [FAIL][59] ([i915#1635] / [i915#2541]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][61] ([i915#1635] / [i915#2389]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [FAIL][63] ([i915#2389]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-hsw:          [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw8/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [FAIL][67] ([i915#1888]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][69] ([i915#1899]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][71] ([i915#2521]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][73] ([i915#2521]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          [FAIL][75] ([i915#1635] / [i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-kbl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [FAIL][81] ([i915#2370]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb5/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][91] ([fdo#109642] / [fdo#111068]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@prime_vgem@sync@rcs0:
    - shard-iclb:         [INCOMPLETE][93] ([i915#409]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb5/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][96] ([i915#1319] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl6/igt@kms_content_protection@legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5805 -> IGTPW_5045
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5045: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html

--===============5442703286530239491==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: CCS Clear Color test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/76536/">https://patchwork.freedesktop.org/series/76536/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9113_full -&gt; IGTPW_5045_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5045_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5045_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5045_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@replace-hostile@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_persistence@replace-hostile@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb3/igt@gem_ctx_persistence@replace-hostile@rcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@perf@stress-open-close.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb7/igt@perf@stress-open-close.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5045_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@replace-hostile@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@gem_ctx_persistence@replace-hostile@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk6/igt@gem_ctx_persistence@replace-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl2/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl4/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk9/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@perf@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb1/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl6/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@perf@stress-open-close.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw4/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw1/igt@perf@stress-open-close.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk9/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk1/igt@perf@stress-open-close.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl4/igt@perf@stress-open-close.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
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
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb7/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb6/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb5/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw6/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk9/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@gem_ctx_bad_destroy@invalid-ctx.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw8/igt@gem_mmap_gtt@basic-small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-tglb5/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-iclb5/igt@prime_vgem@sync@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@legacy:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-apl4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/shard-apl6/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
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
<li>IGT: IGT_5805 -&gt; IGTPW_5045</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5045: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5045/index.html<br />
  IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5442703286530239491==--

--===============1954107276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1954107276==--
