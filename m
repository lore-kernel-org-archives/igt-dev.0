Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 07:54:47 -0000
Message-ID: <158633248762.19348.7402165862634690811@emeril.freedesktop.org>
References: <20200407215146.5331-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200407215146.5331-1-bob.j.paauwe@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Nv?=
 =?utf-8?q?lor=5Fencoding=3A_Fix_up_support_for_XYUV_format=2E_=28rev3=29?=
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
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/color_encoding: Fix up support for XYUV format. (rev3)
URL   : https://patchwork.freedesktop.org/series/70516/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8269_full -> IGTPW_4428_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4428_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4428_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4428_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb3/igt@gem_softpin@noreloc-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb3/igt@gem_softpin@noreloc-s3.html

  
Known issues
------------

  Here are the changes found in IGTPW_4428_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#1528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb7/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#1566])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([i915#155])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#49] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [SKIP][37] ([i915#1316] / [i915#579]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-tglb5/igt@i915_pm_rpm@fences.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-tglb5/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [SKIP][39] ([i915#1316] / [i915#579]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb4/igt@i915_pm_rpm@fences.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb3/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [SKIP][41] ([fdo#109271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-hsw6/igt@i915_pm_rpm@fences.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-hsw6/igt@i915_pm_rpm@fences.html
    - shard-glk:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk5/igt@i915_pm_rpm@fences.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk4/igt@i915_pm_rpm@fences.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent:
    - shard-snb:          [SKIP][45] ([fdo#109271]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-alpha-transparent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][49] ([i915#52] / [i915#54]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl8/igt@kms_draw_crc@fill-fb.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][55] ([i915#61]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-hsw1/igt@kms_flip@flip-vs-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-hsw4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][57] ([i915#180] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][59] ([i915#173]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb1/igt@kms_psr@no_drrs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][63] ([i915#31]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-hsw4/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-hsw8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-hsw8/igt@perf@blocking-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-hsw8/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][69] ([i915#588]) -> [SKIP][70] ([i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][71] ([i915#1319]) -> [FAIL][72] ([fdo#110321] / [fdo#110336] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][73] ([i915#357]) -> [FAIL][74] ([i915#357] / [i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl6/igt@kms_content_protection@uevent.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][75] ([i915#357]) -> [FAIL][76] ([i915#357] / [i915#95])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-apl2/igt@kms_content_protection@uevent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][77] ([fdo#108145] / [i915#265]) -> [FAIL][78] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8269/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5577 -> IGTPW_4428
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8269: 301d0427e2e3108839bf6c36f58dd0b2b5258c25 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4428: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/index.html
  IGT_5577: 7ee7e86fd79e4dbb6300ef4c23e50cb699216ae2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4428/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
