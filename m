Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jul 2020 20:17:52 -0000
Message-ID: <159467147292.16738.2125425040489413589@emeril.freedesktop.org>
References: <20200708161809.31585-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20200708161809.31585-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_Test_device_sysfs_reset_=28rev6=29?=
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
To: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/device_reset: Test device sysfs reset (rev6)
URL   : https://patchwork.freedesktop.org/series/78849/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8738_full -> IGTPW_4759_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4759_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4759_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4759_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb1/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@perf@polling-small-buf:
    - shard-tglb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb8/igt@perf@polling-small-buf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb1/igt@perf@polling-small-buf.html
    - shard-iclb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb5/igt@perf@polling-small-buf.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb4/igt@perf@polling-small-buf.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8738_full and IGTPW_4759_full:

### New IGT tests (1) ###

  * igt@device_reset@unbind-reset-rebind:
    - Statuses : 7 pass(s)
    - Exec time: [0.35, 1.97] s

  

Known issues
------------

  Here are the changes found in IGTPW_4759_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#926])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb1/igt@gem_exec_balancer@bonded-early.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb4/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk1/igt@gem_exec_fence@parallel@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk1/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-hsw1/igt@i915_pm_rpm@gem-pread.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-hsw5/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#151] / [i915#155])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1635] / [i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1635] / [i915#95]) +37 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#402]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb8/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - shard-hsw:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-hsw4/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-hsw5/igt@kms_cursor_legacy@all-pipes-forked-move.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#2122])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk1/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#433])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-glk:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk7/igt@kms_hdr@bpc-switch-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][47] -> [DMESG-FAIL][48] ([i915#95]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl3/igt@kms_mmap_write_crc@main.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][49] -> [DMESG-FAIL][50] ([fdo#108145] / [i915#1635] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][51] -> [DMESG-FAIL][52] ([i915#1635] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#93] / [i915#95]) +45 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl7/igt@kms_rmfb@rmfb-ioctl.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl6/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#31])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl6/igt@kms_setmode@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@polling-small-buf:
    - shard-glk:          [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk1/igt@perf@polling-small-buf.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk1/igt@perf@polling-small-buf.html
    - shard-apl:          [PASS][61] -> [SKIP][62] ([fdo#109271] / [i915#1635])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@perf@polling-small-buf.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl7/igt@perf@polling-small-buf.html
    - shard-kbl:          [PASS][63] -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl6/igt@perf@polling-small-buf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl1/igt@perf@polling-small-buf.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][65] -> [DMESG-WARN][66] ([i915#1982])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb3/igt@perf_pmu@module-unload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb2/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#95]) -> [PASS][68] +36 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@gem_exec_fence@syncobj-unused-fence.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl8/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][69] ([i915#118] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_softpin@noreloc-interruptible:
    - shard-snb:          [INCOMPLETE][71] ([i915#82]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-snb4/igt@gem_softpin@noreloc-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-snb5/igt@gem_softpin@noreloc-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][73] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@mock@requests:
    - shard-apl:          [INCOMPLETE][75] ([i915#1635] / [i915#2110]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@i915_selftest@mock@requests.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl8/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][77] ([i915#118] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][79] ([i915#93] / [i915#95]) -> [PASS][80] +46 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][81] ([i915#54] / [i915#95]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [FAIL][83] ([i915#79]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][91] ([i915#95]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [FAIL][93] ([i915#247]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [FAIL][95] ([i915#1635] / [i915#247]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][97] ([i915#1635] / [i915#95]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@blocking-parameterized:
    - shard-kbl:          [FAIL][101] ([i915#1542]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl3/igt@perf@blocking-parameterized.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl1/igt@perf@blocking-parameterized.html

  * igt@testdisplay:
    - shard-kbl:          [TIMEOUT][103] ([i915#1692] / [i915#1958] / [i915#2119]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl1/igt@testdisplay.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl1/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][105] ([i915#1958] / [i915#2119]) -> [FAIL][106] ([i915#1930])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-hsw:          [INCOMPLETE][107] -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-hsw7/igt@gen9_exec_parse@bb-start-far.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-hsw5/igt@gen9_exec_parse@bb-start-far.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-hsw7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-hsw5/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          [DMESG-FAIL][111] ([fdo#108145] / [i915#95]) -> [FAIL][112] ([fdo#108145] / [i915#265])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-hsw6/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
    - shard-snb:          [TIMEOUT][115] ([i915#1958] / [i915#2119]) -> [SKIP][116] ([fdo#109271]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-snb4/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-snb5/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][117] ([i915#2110] / [k.org#202321]) -> [FAIL][118] ([k.org#202321])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8738/shard-glk7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/shard-glk8/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5735 -> IGTPW_4759
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8738: c2499b5f03ff450173498f92e73f5472f6ec59bc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4759: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/index.html
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4759/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
