Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 17:31:47 -0000
Message-ID: <158593510704.13350.12519857789925238245@emeril.freedesktop.org>
References: <20200403091704.32232-1-karthik.b.s@intel.com>
In-Reply-To: <20200403091704.32232-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=3A_Add_test_to_validate_asynchronous_flips?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_async: Add test to validate asynchronous flips
URL   : https://patchwork.freedesktop.org/series/75453/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8243_full -> IGTPW_4400_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4400_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4400_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4400_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk7/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk8/igt@gem_tiled_swapping@non-threaded.html

  * {igt@kms_async@async-flip-with-page-flip-events} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-snb2/igt@kms_async@async-flip-with-page-flip-events.html
    - shard-iclb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb5/igt@kms_async@async-flip-with-page-flip-events.html
    - shard-hsw:          NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-hsw4/igt@kms_async@async-flip-with-page-flip-events.html

  * {igt@kms_async@async-flip-without-page-flip-events} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk4/igt@kms_async@async-flip-without-page-flip-events.html
    - shard-apl:          NOTRUN -> [FAIL][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl6/igt@kms_async@async-flip-without-page-flip-events.html
    - shard-tglb:         NOTRUN -> [FAIL][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-tglb6/igt@kms_async@async-flip-without-page-flip-events.html
    - shard-kbl:          NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl4/igt@kms_async@async-flip-without-page-flip-events.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [FAIL][12] ([i915#93] / [i915#95]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl3/igt@gem_tiled_swapping@non-threaded.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8243_full and IGTPW_4400_full:

### New IGT tests (3) ###

  * igt@kms_async@async-flip-with-page-flip-events:
    - Statuses : 7 fail(s)
    - Exec time: [0.10, 1.29] s

  * igt@kms_async@async-flip-without-page-flip-events:
    - Statuses : 7 fail(s)
    - Exec time: [0.12, 1.27] s

  * igt@perf_pmu@faulting-read:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4400_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [PASS][14] -> [SKIP][15] ([i915#1316] / [i915#579])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-tglb5/igt@i915_pm_rpm@pm-caching.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-tglb8/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk1/igt@i915_pm_rpm@pm-caching.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk7/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#1316] / [i915#579])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb6/igt@i915_pm_rpm@pm-caching.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb8/igt@i915_pm_rpm@pm-caching.html
    - shard-hsw:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-hsw6/igt@i915_pm_rpm@pm-caching.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-hsw2/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][22] -> [INCOMPLETE][23] ([i915#656])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl2/igt@i915_selftest@live@execlists.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl7/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#54]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#54]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#52] / [i915#54]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#1525] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#64] / [i915#93] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][40] -> [DMESG-WARN][41] ([i915#42])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-snb4/igt@kms_flip@flip-vs-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-snb2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#1031] / [i915#95])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl8/igt@kms_prime@basic-crc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl2/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#1031] / [i915#93] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl4/igt@kms_prime@basic-crc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl1/igt@kms_prime@basic-crc.html

  * igt@kms_psr@cursor_plane_move:
    - shard-tglb:         [PASS][48] -> [SKIP][49] ([i915#668]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-tglb8/igt@kms_psr@cursor_plane_move.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-tglb6/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html

  * igt@prime_vgem@wait-bsd2:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109276]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb2/igt@prime_vgem@wait-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb5/igt@prime_vgem@wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-apl:          [FAIL][54] ([i915#1528]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][56] ([fdo#109276]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglb:         [FAIL][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-tglb2/igt@gem_tiled_swapping@non-threaded.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-tglb8/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][60] ([i915#454]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][62] ([i915#1066]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][64] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][66] ([i915#54] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][68] ([i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][70] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][72] ([i915#52] / [i915#54]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][74] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][76] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][78] ([i915#61]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-hsw6/igt@kms_flip@flip-vs-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][86] ([i915#1559] / [i915#95]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][88] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][92] ([i915#1542]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-hsw6/igt@perf@blocking-parameterized.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-tilingchange:
    - shard-tglb:         [FAIL][94] ([i915#1524]) -> [SKIP][95] ([i915#668])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-tilingchange.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-tilingchange.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][96] ([i915#1423]) -> ([FAIL][97], [FAIL][98]) ([i915#1423] / [i915#529])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8243/shard-apl6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1524]: https://gitlab.freedesktop.org/drm/intel/issues/1524
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5560 -> IGTPW_4400
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8243: 45ccb1b8606b6ba1a5d4f8a8b4dda27bd8dbb04c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4400: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html
  IGT_5560: 213062c7dcf0cbc8069cbb5f91acbc494def33fd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4400/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
