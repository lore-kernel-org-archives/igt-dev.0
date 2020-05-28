Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 11:23:31 -0000
Message-ID: <159066501143.684.7822912102207775322@emeril.freedesktop.org>
References: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffence=3A_Reduce_non-preemptible_workload?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_fence: Reduce non-preemptible workload
URL   : https://patchwork.freedesktop.org/series/77735/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8545_full -> IGTPW_4618_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4618_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4618_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4618_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-hsw7/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_hangman@error-state-capture@rcs0}:
    - shard-kbl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl4/igt@i915_hangman@error-state-capture@rcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl3/igt@i915_hangman@error-state-capture@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4618_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - shard-glk:          [PASS][4] -> [INCOMPLETE][5] ([i915#1927] / [i915#58] / [k.org#198133])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk4/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk7/igt@gem_close_race@basic-threads.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#1528])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl3/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#70] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][16] -> [DMESG-FAIL][17] ([i915#1925])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#1566] / [i915#93] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21] ([i915#128])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-tglb6/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-tglb6/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled:
    - shard-apl:          [PASS][22] -> [FAIL][23] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#1602] / [i915#456])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@invalid:
    - shard-apl:          [PASS][30] -> [TIMEOUT][31] ([i915#1635]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl6/igt@kms_vblank@invalid.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl2/igt@kms_vblank@invalid.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#61]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][34] -> [INCOMPLETE][35] ([i915#155])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][36] ([i915#180]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl3/igt@i915_suspend@forcewake.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-glk:          [INCOMPLETE][38] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-glk:          [TIMEOUT][40] -> [PASS][41] +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-apl:          [TIMEOUT][42] ([i915#1635]) -> [PASS][43] +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][44] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-kbl:          [FAIL][46] ([i915#54]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
    - shard-apl:          [FAIL][48] ([i915#54]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
    - shard-glk:          [FAIL][50] ([i915#54]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-hsw:          [INCOMPLETE][52] ([i915#61]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][54] ([i915#1925]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-hsw:          [SKIP][56] ([fdo#109271]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-hsw8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][58] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][62] ([i915#155]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][64] ([fdo#109441]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][66] ([i915#31]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl7/igt@kms_setmode@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl6/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][68] ([i915#1542]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-tglb2/igt@perf@blocking-parameterized.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-tglb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-glk:          [TIMEOUT][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-glk9/igt@gem_ctx_sseu@invalid-sseu.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-glk7/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-apl:          [TIMEOUT][72] ([i915#1635]) -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl6/igt@gem_ctx_sseu@invalid-sseu.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@kms_content_protection@content_type_change:
    - shard-hsw:          [SKIP][74] ([fdo#109271]) -> [SKIP][75] ([fdo#109271] / [i915#1927])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-hsw7/igt@kms_content_protection@content_type_change.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-hsw7/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][76] ([i915#1319] / [i915#1635]) -> [TIMEOUT][77] ([i915#1319])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl1/igt@kms_content_protection@legacy.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][78] ([fdo#110321]) -> [TIMEOUT][79] ([i915#1319] / [i915#1635])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/shard-apl4/igt@kms_content_protection@srm.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/shard-apl1/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1823]: https://gitlab.freedesktop.org/drm/intel/issues/1823
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5681 -> IGTPW_4618
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8545: 76540f7be4ff04851e47d0865c2bb07a15106bcb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4618: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html
  IGT_5681: 2991a5d60b1bbf2b2b6004669cd0f9471bd687a2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
