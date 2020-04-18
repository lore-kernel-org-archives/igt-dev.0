Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 18 Apr 2020 15:03:17 -0000
Message-ID: <158722219725.420.17043981644321865397@emeril.freedesktop.org>
References: <20200417105839.12084-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200417105839.12084-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fbalancer=3AResolving_unpredictable_tasklet_de?=
 =?utf-8?q?lays?=
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
To: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays
URL   : https://patchwork.freedesktop.org/series/76082/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5599_full -> IGTPW_4482_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4482_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4482_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4482_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-tglb8/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-tglb5/igt@gem_exec_suspend@basic-s3.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][3] ([i915#1602]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-tglb7/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-tglb5/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4482_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#155])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1566] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][31] ([i915#456]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [TIMEOUT][33] ([i915#1288]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [TIMEOUT][35] ([i915#1288]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][39] ([i915#54] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][49] ([i915#57]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][51] ([i915#52] / [i915#54]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][53] ([i915#155]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
    - shard-apl:          [FAIL][55] ([i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl1/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl7/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-hsw1/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-hsw1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][65] ([fdo#109278]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * {igt@sysfs_timeslice_duration@timeout@vecs0}:
    - shard-iclb:         [FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb6/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb5/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][69] ([i915#658]) -> [SKIP][70] ([i915#588])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-iclb:         [SKIP][71] ([i915#1316] / [i915#579]) -> [SKIP][72] ([fdo#109293] / [fdo#109506])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][73] ([i915#1319]) -> [FAIL][74] ([fdo#110321])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl3/igt@kms_content_protection@lic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][75] ([i915#93] / [i915#95]) -> [FAIL][76] ([i915#64])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][77] ([i915#95]) -> [FAIL][78] ([i915#1525])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [FAIL][79] ([fdo#108145] / [i915#265]) -> [FAIL][80] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#265]) -> [FAIL][82] ([fdo#108145] / [i915#265] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5599/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5599 -> IGTPW_4482

  CI-20190529: 20190529
  CI_DRM_8314: e8a432aa7e81e2bf5b6d4b23e3598f9fea947b83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4482: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/index.html
  IGT_5599: cdb07101dda33e2fcb0f4c2aa199c47159d88f35 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4482/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
