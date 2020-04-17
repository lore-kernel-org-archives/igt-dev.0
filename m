Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 02:59:10 -0000
Message-ID: <158709235088.10466.11291805285530167418@emeril.freedesktop.org>
References: <20200416061014.16130-1-mika.kahola@intel.com>
In-Reply-To: <20200416061014.16130-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank_=28rev4=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: Wait for an extra vblank (rev4)
URL   : https://patchwork.freedesktop.org/series/75413/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8307_full -> IGTPW_4472_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4472_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4472_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4472_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][3], [FAIL][4]) ([i915#1233] / [i915#1602] / [i915#529]) -> [FAIL][5]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb8/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@pi-shared-iova@bcs0}:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb1/igt@gem_exec_schedule@pi-shared-iova@bcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb1/igt@gem_exec_schedule@pi-shared-iova@bcs0.html

  * {igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8307_full and IGTPW_4472_full:

### New IGT tests (2) ###

  * igt@kms_flip@dpms-off-confusion-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  

Known issues
------------

  Here are the changes found in IGTPW_4472_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk9/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#54]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#54]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#54]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109349])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#52] / [i915#54]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#53] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#53] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#899])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#331])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#331])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#456] / [i915#460])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [INCOMPLETE][52] ([i915#61]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][56] ([i915#454]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][58] ([i915#1119] / [i915#95]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][60] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][62] ([i915#1149]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb5/igt@kms_color@pipe-a-gamma.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb5/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][64] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-apl:          [FAIL][66] ([i915#54] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][70] ([i915#52] / [i915#54]) -> [PASS][71] +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][72] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [FAIL][74] ([i915#64]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][76] ([i915#456] / [i915#460]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb1/igt@kms_fbcon_fbt@psr-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [INCOMPLETE][78] ([i915#155]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1}:
    - shard-apl:          [INCOMPLETE][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl8/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl2/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][86] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][88] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][90] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][94] ([i915#1542]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb7/igt@perf@blocking-parameterized.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][96] ([i915#468]) -> [FAIL][97] ([i915#454])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][98] ([i915#82]) -> [SKIP][99] ([fdo#109271]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-snb6/igt@i915_pm_rpm@fences.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-snb2/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][100] ([fdo#111644] / [i915#1397]) -> [SKIP][101] ([i915#1316] / [i915#579])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][102] ([fdo#110892]) -> [SKIP][103] ([i915#1316] / [i915#579])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [INCOMPLETE][104] ([i915#1725]) -> [DMESG-FAIL][105] ([i915#1725])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb6/igt@i915_selftest@live@gt_pm.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1725]: https://gitlab.freedesktop.org/drm/intel/issues/1725
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4472
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8307: 547ca85e9cbca6fcfcadc6bf5e0e7b9a34a089d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4472: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
