Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Apr 2020 08:19:04 -0000
Message-ID: <158728434485.15014.2342125164468604139@emeril.freedesktop.org>
References: <20200417194931.39774-1-lyude@redhat.com>
In-Reply-To: <20200417194931.39774-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev2=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add nouveau-crc tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8319_full -> IGTPW_4484_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4484_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@nouveau_crc@pipe-a-source-rg} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html

  * {igt@nouveau_crc@pipe-d-ctx-flip-detection} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +20 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8319_full and IGTPW_4484_full:

### New IGT tests (21) ###

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - Statuses : 6 skip(s)
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
    - Statuses : 7 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-rg:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

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
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4484_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([i915#1316] / [i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-tglb1/igt@i915_pm_rpm@fences.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb6/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb1/igt@i915_pm_rpm@fences.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb2/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-hsw1/igt@i915_pm_rpm@fences.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-hsw6/igt@i915_pm_rpm@fences.html
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-glk1/igt@i915_pm_rpm@fences.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-glk1/igt@i915_pm_rpm@fences.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl3/igt@i915_suspend@forcewake.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([i915#128])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-hsw6/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#433])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl2/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][35] ([i915#155]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][37] ([i915#456]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-tglb5/igt@gem_workarounds@suspend-resume-context.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][39] ([i915#716]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][41] ([i915#454]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [FAIL][43] ([i915#1066]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-snb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-snb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [TIMEOUT][45] ([i915#1288]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [TIMEOUT][47] ([i915#1288]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][49] ([i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][51] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
    - shard-apl:          [FAIL][63] ([i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl1/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl6/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-glk1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][71] ([fdo#109278]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][73] ([i915#1085]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][75] ([i915#1542]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb6/igt@perf@polling-parameterized.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][77] ([i915#468]) -> [FAIL][78] ([i915#454])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-iclb:         [SKIP][79] ([i915#1316] / [i915#579]) -> [SKIP][80] ([fdo#109293] / [fdo#109506])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#265]) -> [FAIL][82] ([fdo#108145] / [i915#265] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][86] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5599 -> IGTPW_4484
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8319: 18043327e8a9cba095bca9f80cdc70900a51f92c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4484: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html
  IGT_5599: cdb07101dda33e2fcb0f4c2aa199c47159d88f35 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
