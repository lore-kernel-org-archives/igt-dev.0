Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Apr 2020 10:52:21 -0000
Message-ID: <158582474181.24294.9076524281254857512@emeril.freedesktop.org>
References: <20200401104850.139397-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200401104850.139397-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_fixup_convert?=
 =?utf-8?q?er_script?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/perf: fixup converter script
URL   : https://patchwork.freedesktop.org/series/75361/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8232_full -> IGTPW_4390_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4390_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4390_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4390_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-tglb6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8232_full and IGTPW_4390_full:

### New IGT tests (3) ###

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_store@dword:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@busy:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4390_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276] / [i915#677])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276]) +10 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112146]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#716])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#456] / [i915#460])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-hsw:          [PASS][14] -> [INCOMPLETE][15] ([i915#61])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-hsw2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109349])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#52] / [i915#54]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#46])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][26] -> [INCOMPLETE][27] ([i915#155] / [i915#600])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([fdo#108145] / [i915#265] / [i915#95]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#1031] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl4/igt@kms_prime@basic-crc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl7/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#1031] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl2/igt@kms_prime@basic-crc.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#112080]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][42] ([i915#677]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][44] ([fdo#112146]) -> [PASS][45] +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][46] ([fdo#112080]) -> [PASS][47] +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb4/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][48] ([i915#454]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-apl:          [FAIL][50] ([i915#1595]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          [FAIL][52] ([i915#1527]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk8/igt@i915_pm_rc6_residency@rc6-idle.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-kbl:          [FAIL][54] ([i915#1593]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][56] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][58] ([i915#72]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][60] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][62] ([i915#52] / [i915#54]) -> [PASS][63] +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][64] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][66] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][68] ([i915#34]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [FAIL][70] ([i915#49] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-glk:          [FAIL][72] ([i915#49]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][74] ([i915#49]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][78] ([i915#93] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb7/igt@kms_psr@psr2_primary_blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][84] ([i915#31]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl1/igt@kms_setmode@basic.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl3/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][86] ([i915#1542]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-hsw8/igt@perf@blocking-parameterized.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-hsw7/igt@perf@blocking-parameterized.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][88] ([fdo#109276]) -> [PASS][89] +11 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][90] ([i915#588]) -> [SKIP][91] ([i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][92] ([i915#1066]) -> [TIMEOUT][93] ([i915#1526])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-snb:          [SKIP][94] ([fdo#109271]) -> [INCOMPLETE][95] ([i915#82])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-snb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-snb1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][96] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][97] ([i915#357])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-kbl6/igt@kms_content_protection@uevent.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][98] ([i915#357] / [i915#95]) -> [FAIL][99] ([i915#357])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl6/igt@kms_content_protection@uevent.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][100] ([i915#1423]) -> ([FAIL][101], [FAIL][102]) ([i915#1423] / [i915#716])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8232/shard-apl4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl8/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1526]: https://gitlab.freedesktop.org/drm/intel/issues/1526
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1593]: https://gitlab.freedesktop.org/drm/intel/issues/1593
  [i915#1595]: https://gitlab.freedesktop.org/drm/intel/issues/1595
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5553 -> IGTPW_4390
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8232: cade363a69762c57ffb58f91b47670df7ca520bf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html
  IGT_5553: 60475d9b41c58b7d256e83c7d53eaf7c2f1f8ecc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4390/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
