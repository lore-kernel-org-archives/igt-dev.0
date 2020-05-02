Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 02 May 2020 15:37:17 -0000
Message-ID: <158843383767.5001.16608142206293477@emeril.freedesktop.org>
References: <20200502134009.1597325-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200502134009.1597325-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_intel-ci=3A_Only_skip_the_hang?=
 =?utf-8?q?ing_gem=5Fexec=5Ffence_tests?=
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

Series: series starting with [i-g-t,1/3] intel-ci: Only skip the hanging gem_exec_fence tests
URL   : https://patchwork.freedesktop.org/series/76857/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8410_full -> IGTPW_4526_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4526_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@syncobj-future-end@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@gem_exec_fence@syncobj-future-end@vcs0.html

  * {igt@gem_exec_fence@syncobj-future-submit@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-tglb1/igt@gem_exec_fence@syncobj-future-submit@bcs0.html

  * {igt@gem_exec_fence@syncobj-incomplete-wait-submit} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk2/igt@gem_exec_fence@syncobj-incomplete-wait-submit.html
    - shard-tglb:         NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-tglb5/igt@gem_exec_fence@syncobj-incomplete-wait-submit.html
    - shard-apl:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl1/igt@gem_exec_fence@syncobj-incomplete-wait-submit.html
    - shard-iclb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb1/igt@gem_exec_fence@syncobj-incomplete-wait-submit.html

  * {igt@gem_exec_fence@syncobj-invalid-wait} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-snb6/igt@gem_exec_fence@syncobj-invalid-wait.html
    - shard-kbl:          NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl2/igt@gem_exec_fence@syncobj-invalid-wait.html
    - shard-hsw:          NOTRUN -> [FAIL][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-hsw4/igt@gem_exec_fence@syncobj-invalid-wait.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8410_full and IGTPW_4526_full:

### New IGT tests (38) ###

  * igt@gem_exec_fence@expired-history:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 6.16] s

  * igt@gem_exec_fence@flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@invalid-fence-array:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@keep-in-fence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@keep-in-fence@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_fence@keep-in-fence@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_fence@keep-in-fence@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@keep-in-fence@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_fence@keep-in-fence@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@long-history:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 6.00] s

  * igt@gem_exec_fence@parallel:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@parallel@bcs0:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@gem_exec_fence@parallel@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@syncobj-channel:
    - Statuses : 7 pass(s)
    - Exec time: [1.01, 1.05] s

  * igt@gem_exec_fence@syncobj-export:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-future-end:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-end@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-end@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-end@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-end@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-end@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-submit@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-import:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-incomplete-wait-submit:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@syncobj-invalid-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-invalid-wait:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.10] s

  * igt@gem_exec_fence@syncobj-repeat:
    - Statuses : 6 pass(s)
    - Exec time: [0.16, 0.72] s

  * igt@gem_exec_fence@syncobj-signal:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-unused-fence:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-wait:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4526_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#1436] / [i915#716])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#72])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#52] / [i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#177] / [i915#52] / [i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl4/igt@kms_mmap_write_crc@main.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([fdo#108145] / [i915#265] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#1559] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#1559] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][36] -> [FAIL][37] ([i915#31])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-hsw2/igt@kms_setmode@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-hsw6/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][38] ([i915#180]) -> [PASS][39] +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][40] ([fdo#109276]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][42] ([i915#1519]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][44] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][46] ([i915#72]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][48] ([i915#57]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][50] ([fdo#109349]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][52] ([i915#52] / [i915#54]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][56] ([fdo#109271]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [FAIL][58] ([i915#49]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [FAIL][60] ([i915#1031] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl2/igt@kms_prime@basic-crc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl6/igt@kms_prime@basic-crc.html
    - shard-kbl:          [FAIL][62] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl2/igt@kms_prime@basic-crc.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl4/igt@kms_prime@basic-crc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][64] ([fdo#109642] / [fdo#111068]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][68] ([i915#31]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-kbl4/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-kbl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][70] ([i915#658]) -> [SKIP][71] ([i915#588])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][72] ([i915#468]) -> [FAIL][73] ([i915#454])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][74] ([fdo#108145] / [i915#265]) -> [FAIL][75] ([fdo#108145] / [i915#265] / [i915#95])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8410/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5626 -> IGTPW_4526
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8410: 195fa140b9c39046f1e9a447265ee131ae733bde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/index.html
  IGT_5626: f27fdfff026276ac75c69e487c929a843f66f6ca @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4526/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
