Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 10:38:34 -0000
Message-ID: <158711991408.10465.5444697671060387723@emeril.freedesktop.org>
References: <20200416032114.22318-1-kunal1.joshi@intel.com>
In-Reply-To: <20200416032114.22318-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium_Capture_on_type-c?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium Capture on type-c
URL   : https://patchwork.freedesktop.org/series/76023/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8309_full -> IGTPW_4476_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4476_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a2}:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk2/igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-glk8/igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a2.html

  
Known issues
------------

  Here are the changes found in IGTPW_4476_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4] ([i915#61])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-hsw6/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-hsw7/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#155] / [i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl2/igt@i915_suspend@forcewake.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl6/igt@i915_suspend@forcewake.html
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#456])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb8/igt@i915_suspend@forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb3/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1119] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109349])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#699] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#1559] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#173])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb7/igt@kms_psr@no_drrs.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb4/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#1085])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb8/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][39] ([fdo#109271]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-glk6/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][41] ([i915#1316] / [i915#579]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb5/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-hsw4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-hsw7/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][45] ([i915#1316] / [i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb6/igt@i915_pm_rpm@basic-pci-d3-state.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb3/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][47] ([i915#1531] / [i915#1658]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb1/igt@i915_selftest@live@requests.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][55] ([i915#1185]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-kbl:          [DMESG-WARN][57] ([i915#128]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl1/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][65] ([i915#180] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc:
    - shard-kbl:          [FAIL][73] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_prime@basic-crc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][77] ([i915#456] / [i915#460]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [FAIL][80] ([fdo#103375])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][81] ([i915#468]) -> [FAIL][82] ([i915#454])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][83] ([i915#31] / [i915#95]) -> [FAIL][84] ([i915#31])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl1/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl7/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][85] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][86] ([i915#31])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl3/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][87] ([i915#180] / [i915#95]) -> [DMESG-WARN][88] ([i915#180])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5593 -> IGTPW_4476
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8309: 7532b3183c849056c824828bafb4ab0b525e586e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4476: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/index.html
  IGT_5593: 1c658f5e46598ae93345177d4981ef54704daec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4476/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
