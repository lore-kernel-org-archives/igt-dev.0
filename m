Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 21:32:39 -0000
Message-ID: <159130635922.14553.11357879917928265108@emeril.freedesktop.org>
References: <20200604100353.24552-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200604100353.24552-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_from_media=5Fspin_=28rev2=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Remove libdrm from media_spin (rev2)
URL   : https://patchwork.freedesktop.org/series/77993/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8584_full -> IGTPW_4651_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/index.html

Known issues
------------

  Here are the changes found in IGTPW_4651_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-apl:          [PASS][1] -> [TIMEOUT][2] ([i915#1635])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl8/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl2/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#95]) +38 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl8/igt@gem_exec_reloc@basic-wc-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl1/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_media_fill:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#93] / [i915#95]) +45 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl4/igt@gem_media_fill.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl1/igt@gem_media_fill.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb2/igt@gem_mmap_wc@write-read-distinct.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb8/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#433])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_lease@setcrtc_implicit_plane:
    - shard-glk:          [PASS][27] -> [TIMEOUT][28] ([i915#1958]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk9/igt@kms_lease@setcrtc_implicit_plane.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk4/igt@kms_lease@setcrtc_implicit_plane.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#899])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl8/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl4/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#43])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl7/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl7/igt@kms_vblank@pipe-c-wait-busy-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_params@control:
    - shard-tglb:         [DMESG-WARN][43] ([i915#402]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb8/igt@gem_exec_params@control.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb6/igt@gem_exec_params@control.html

  * {igt@gem_exec_reloc@basic-concurrent0}:
    - shard-glk:          [FAIL][45] ([i915#1930]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][47] ([i915#82]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-snb1/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1602] / [i915#456]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb1/igt@gem_workarounds@suspend-resume-fd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][53] ([i915#1904]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][55] ([i915#1899]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-iclb6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl8/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          [INCOMPLETE][59] ([i915#58] / [k.org#198133]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk8/igt@i915_suspend@forcewake.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk7/igt@i915_suspend@forcewake.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1149] / [i915#402]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb2/igt@kms_color@pipe-d-ctm-0-5.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb6/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][67] ([i915#1925] / [i915#1926]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-apl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-apl:          [TIMEOUT][71] ([i915#1635]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][77] ([i915#1928]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][79] ([i915#95]) -> [PASS][80] +33 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl6/igt@kms_flip_tiling@flip-x-tiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl1/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglb:         [INCOMPLETE][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [PASS][86] +44 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * {igt@perf_pmu@module-unload}:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-iclb7/igt@perf_pmu@module-unload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-iclb1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gen3_render_tiledy_blits:
    - shard-hsw:          [DMESG-FAIL][89] ([i915#1927]) -> [SKIP][90] ([fdo#109271])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-hsw7/igt@gen3_render_tiledy_blits.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-hsw1/igt@gen3_render_tiledy_blits.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-apl:          [TIMEOUT][91] ([i915#1366] / [i915#1635]) -> [SKIP][92] ([fdo#109271] / [fdo#111827])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-glk:          [SKIP][93] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][94] ([i915#1366] / [i915#1958])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk1/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk4/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][96] ([i915#1366] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][97] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][98] ([i915#1319] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl2/igt@kms_content_protection@atomic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [DMESG-FAIL][99] ([fdo#110321] / [i915#95]) -> [TIMEOUT][100] ([i915#1319])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl2/igt@kms_content_protection@lic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [DMESG-FAIL][101] ([fdo#110321] / [i915#95]) -> [TIMEOUT][102] ([i915#1319] / [i915#1635])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@kms_content_protection@srm.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][103] ([i915#357]) -> [DMESG-FAIL][104] ([i915#357] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-kbl1/igt@kms_content_protection@uevent.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][105] ([i915#357]) -> [DMESG-FAIL][106] ([i915#357] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl4/igt@kms_content_protection@uevent.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-apl:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl8/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl2/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
    - shard-glk:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-glk8/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-glk4/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-apl:          [TIMEOUT][111] ([i915#1635]) -> [SKIP][112] ([fdo#109271]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8584/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4651
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8584: 2219a8bbaa3c87f07656725f4d2ea6623d1fd09a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4651: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4651/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
