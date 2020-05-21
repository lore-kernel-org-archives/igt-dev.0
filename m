Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 May 2020 08:30:00 -0000
Message-ID: <159004980021.4443.2583234449158420813@emeril.freedesktop.org>
References: <20200520155410.2544056-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200520155410.2544056-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frc6=5Fresidency=3A_Check_we_conserve_power_while_wai?=
 =?utf-8?q?ting?=
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

Series: i915/i915_pm_rc6_residency: Check we conserve power while waiting
URL   : https://patchwork.freedesktop.org/series/77484/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8512_full -> IGTPW_4601_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4601_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4601_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4601_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-await@vecs0:
    - shard-apl:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl1/igt@gem_exec_fence@basic-await@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl4/igt@gem_exec_fence@basic-await@vecs0.html

  * {igt@i915_pm_rc6_residency@rc6-fence} (NEW):
    - shard-iclb:         NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1}:
    - shard-tglb:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8512_full and IGTPW_4601_full:

### New IGT tests (1) ###

  * igt@i915_pm_rc6_residency@rc6-fence:
    - Statuses : 5 pass(s) 1 warn(s)
    - Exec time: [12.19, 18.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_4601_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#1602] / [i915#456])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb5/igt@gem_eio@in-flight-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#1472] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl1/igt@gem_exec_fence@basic-await@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl4/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#1472]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl1/igt@gem_exec_fence@basic-await@vcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([i915#155])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [PASS][16] -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-snb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#433])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#53] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#53] / [i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#1559] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#173])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb3/igt@kms_psr@no_drrs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#31])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl7/igt@kms_setmode@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hostile@vecs0:
    - shard-iclb:         [FAIL][34] ([i915#1622]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb2/igt@gem_ctx_persistence@engines-hostile@vecs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb6/igt@gem_ctx_persistence@engines-hostile@vecs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][36] ([i915#1899]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][38] ([i915#1899]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb1/igt@i915_pm_dc@dc5-psr.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb5/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][40] ([i915#1119] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][42] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][44] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][48] ([i915#72]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-tglb:         [DMESG-WARN][50] ([i915#128]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb2/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb7/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [FAIL][52] ([i915#1121]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-glk:          [FAIL][56] ([i915#1559]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-glk2/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-glk1/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][62] ([i915#1185]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][64] ([i915#1542]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-iclb3/igt@perf@polling-parameterized.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-iclb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [DMESG-WARN][67] ([i915#180] / [i915#95])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [SKIP][68] ([fdo#109271]) -> [INCOMPLETE][69] ([i915#82])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-snb4/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-snb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][70] ([i915#1319]) -> [FAIL][71] ([fdo#110321] / [fdo#110336] / [i915#95])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl3/igt@kms_content_protection@atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][72] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][73] ([i915#1319])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl4/igt@kms_content_protection@legacy.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][74] ([i915#1525]) -> [FAIL][75] ([i915#1121] / [i915#95])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][76] ([i915#64]) -> [FAIL][77] ([i915#1121] / [i915#93] / [i915#95])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][78] ([i915#608]) -> [SKIP][79] ([i915#1911])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8512/shard-tglb3/igt@kms_psr2_su@page_flip.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/shard-tglb7/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1472]: https://gitlab.freedesktop.org/drm/intel/issues/1472
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5664 -> IGTPW_4601
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8512: 9381fe34c4e7e97e12a246cdd4b774c26a9cf260 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4601: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/index.html
  IGT_5664: 404e2fa06b9c5986dec3fa210234fe8b034b157e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4601/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
