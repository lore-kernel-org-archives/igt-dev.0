Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 12:06:17 -0000
Message-ID: <159300037714.19238.9481631215380526062@emeril.freedesktop.org>
References: <20200624054130.11695-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200624054130.11695-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_to_detect_HDCP_events_=28rev4=29?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add support to detect HDCP events (rev4)
URL   : https://patchwork.freedesktop.org/series/78413/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8660_full -> IGTPW_4698_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4698_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4698_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4698_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-invalid-ctm-matrix-sizes:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw1/igt@kms_color@pipe-invalid-ctm-matrix-sizes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw8/igt@kms_color@pipe-invalid-ctm-matrix-sizes.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][3] ([i915#357]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_content_protection@uevent.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][5] ([i915#357]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl8/igt@kms_content_protection@uevent.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl1/igt@kms_content_protection@uevent.html

  
Known issues
------------

  Here are the changes found in IGTPW_4698_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_blits@basic:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb5/igt@gem_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-tglb3/igt@gem_blits@basic.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +46 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl7/igt@gem_exec_reloc@basic-gtt-read-active.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl7/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk2/igt@gem_exec_whisper@basic-fds-forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-glk6/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#95]) +42 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl4/igt@gem_mmap_wc@write-cpu-read-wc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl6/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw5/igt@gem_shrink@reclaim.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw7/igt@gem_shrink@reclaim.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1436] / [i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#1928])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([fdo#108145] / [i915#1635] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([fdo#108145] / [i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([fdo#108145] / [i915#1635] / [i915#1982] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([IGT#2])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_sysfs_edid_timing.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl4/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([IGT#2])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl3/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][49] -> [INCOMPLETE][50] ([i915#155]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_create@forked:
    - shard-hsw:          [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw7/igt@gem_exec_create@forked.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw8/igt@gem_exec_create@forked.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk8/igt@gem_exec_create@madvise.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-glk2/igt@gem_exec_create@madvise.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][55] ([i915#1904]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][57] ([i915#151] / [i915#155]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][61] ([i915#93] / [i915#95]) -> [PASS][62] +34 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-hsw:          [TIMEOUT][67] ([i915#1958]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw5/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][69] ([i915#57]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][73] ([i915#1635] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][77] ([i915#1958]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@kms_invalid_dotclock.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-snb4/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-tglb2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][85] ([i915#1635] / [i915#95]) -> [PASS][86] +25 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][87] ([i915#1958]) -> [FAIL][88] ([i915#1930])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [INCOMPLETE][89] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][90] ([i915#1635] / [i915#1958] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl7/igt@gem_exec_reloc@basic-concurrent16.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][91] ([i915#468]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][94] ([i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-hsw8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][98] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_color_chamelium@pipe-b-degamma.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl2/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [SKIP][100] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][101] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][102] ([fdo#110321] / [i915#1635] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][105] ([i915#95]) -> [FAIL][106] ([i915#64])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-apl:          [SKIP][107] ([fdo#109271]) -> [SKIP][108] ([fdo#109271] / [i915#1635]) +13 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [i915#1635]) -> [SKIP][110] ([fdo#109271]) +8 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4698
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8660: 46d717372cd0a64380f01c9def59738f5705bd43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4698: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4698/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
