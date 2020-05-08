Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 May 2020 10:05:03 -0000
Message-ID: <158893230372.22723.2439234364376482535@emeril.freedesktop.org>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVXNlIGRl?=
 =?utf-8?q?vice_dependant_module_parameters_=28rev9=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Use device dependant module parameters (rev9)
URL   : https://patchwork.freedesktop.org/series/76163/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8449_full -> IGTPW_4546_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html

Known issues
------------

  Here are the changes found in IGTPW_4546_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109349])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#52] / [i915#54] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#433])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#53] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#331])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#331])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-iclb:         [DMESG-WARN][41] ([i915#128]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb8/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb4/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][43] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][45] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][47] ([i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [FAIL][49] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][51] ([i915#49]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-apl:          [FAIL][53] ([i915#49] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-kbl:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][61] ([i915#588]) -> [SKIP][62] ([i915#658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][63] ([i915#468]) -> [FAIL][64] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-snb:          [INCOMPLETE][65] ([i915#82]) -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-snb2/igt@i915_pm_rpm@system-suspend-devices.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-snb6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][67] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [TIMEOUT][68] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][69] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][70] ([i915#1319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl8/igt@kms_content_protection@legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][71] ([fdo#110321]) -> [TIMEOUT][72] ([i915#1319]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl8/igt@kms_content_protection@lic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][73] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][74] ([i915#357])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl6/igt@kms_content_protection@uevent.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][75] ([i915#357] / [i915#95]) -> [FAIL][76] ([i915#357])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl2/igt@kms_content_protection@uevent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][78] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][79] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][80] ([fdo#108145] / [i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@perf@oa-exponents:
    - shard-apl:          [INCOMPLETE][81] ([i915#1635]) -> [INCOMPLETE][82] ([i915#1635] / [i915#1847])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8449/shard-apl7/igt@perf@oa-exponents.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/shard-apl3/igt@perf@oa-exponents.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1847]: https://gitlab.freedesktop.org/drm/intel/issues/1847
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5640 -> IGTPW_4546
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8449: 4af0ec12ca5e0180d2497d3db24e66bd0f28e24f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4546: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html
  IGT_5640: 5efb4a1c9cc944eff129cae7794951ae617bca17 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4546/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
