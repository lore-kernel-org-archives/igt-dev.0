Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 14:23:20 -0000
Message-ID: <158618300002.4193.6735547626452590325@emeril.freedesktop.org>
References: <20200406085309.1585743-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200406085309.1585743-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Add_the_missing_igt=5Fdynamic_to_dynamic_rcs*_test?=
 =?utf-8?q?_selection?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/perf_pmu: Add the missing igt_dynamic to dynamic rcs* test selection
URL   : https://patchwork.freedesktop.org/series/75533/
State : success

== Summary ==

CI Bug Log - changes from IGT_5572_full -> IGTPW_4407_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4407_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf_pmu@event-wait@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb7/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb5/igt@perf_pmu@event-wait@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5572_full and IGTPW_4407_full:

### New IGT tests (1) ###

  * igt@perf_pmu@event-wait@rcs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4407_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw4/igt@i915_pm_rpm@gem-pread.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-hsw7/igt@i915_pm_rpm@gem-pread.html
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb3/igt@i915_pm_rpm@gem-pread.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb8/igt@i915_pm_rpm@gem-pread.html
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb8/igt@i915_pm_rpm@gem-pread.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb3/igt@i915_pm_rpm@gem-pread.html
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk3/igt@i915_pm_rpm@gem-pread.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk4/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1531])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb3/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([fdo#108145] / [i915#265] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1559] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#1031] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_prime@basic-crc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl7/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#1031] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_prime@basic-crc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][49] ([i915#1316] / [i915#579]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb3/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-hsw6/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@i915_pm_rpm@cursor.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk3/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][55] ([i915#1316] / [i915#579]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw1/igt@kms_busy@basic@flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-hsw5/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][61] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][65] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][67] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][69] ([i915#52] / [i915#54]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][71] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][73] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][77] ([i915#79]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [INCOMPLETE][81] ([i915#82]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][89] ([i915#899]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl7/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][95] ([i915#1542]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@perf@blocking-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl3/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][97] ([i915#1542]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw6/igt@perf@blocking-parameterized.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-hsw7/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][99] ([i915#1085]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb1/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][101] ([i915#468]) -> [FAIL][102] ([i915#454])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [INCOMPLETE][104] ([i915#82])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-snb5/igt@i915_pm_rpm@drm-resources-equal.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-snb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][105] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][106] ([i915#357])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_content_protection@uevent.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][107] ([i915#357] / [i915#95]) -> [FAIL][108] ([i915#357])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_content_protection@uevent.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/shard-apl8/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4407

  CI-20190529: 20190529
  CI_DRM_8259: 450fc86b62651336f9b5fde79c068df7b4c95aa4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4407: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4407/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
