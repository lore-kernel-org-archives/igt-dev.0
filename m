Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 11:27:20 -0000
Message-ID: <158695004050.21014.60668885296184383@emeril.freedesktop.org>
References: <20200414164016.13205-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200414164016.13205-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev7=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev7)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8297_full -> IGTPW_4460_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/index.html

Known issues
------------

  Here are the changes found in IGTPW_4460_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([fdo#108145] / [i915#71])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@kms_color@pipe-a-legacy-gamma.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl4/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([fdo#108145] / [i915#71])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#34])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl7/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#43])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk8/igt@kms_vblank@pipe-c-accuracy-idle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk2/igt@kms_vblank@pipe-c-accuracy-idle.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][33] ([i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][35] ([i915#1316] / [i915#579]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-iclb5/igt@i915_pm_rpm@dpms-lpsp.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][37] ([i915#1316] / [i915#579]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-tglb8/igt@i915_pm_rpm@dpms-lpsp.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-tglb6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][39] ([fdo#109271]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk2/igt@i915_pm_rpm@sysfs-read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk2/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][45] ([i915#52] / [i915#54]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][47] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][49] ([i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl7/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][51] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][57] ([fdo#112015]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][59] ([fdo#109278]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [INCOMPLETE][61] ([i915#82]) -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-snb1/igt@i915_pm_rpm@cursor-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-snb6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265]) -> [FAIL][64] ([fdo#108145] / [i915#265] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][65] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][66] ([fdo#108145] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][68] ([fdo#108145] / [i915#265]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][69] ([i915#1423] / [i915#92]) -> ([FAIL][70], [FAIL][71]) ([i915#1423] / [i915#716] / [i915#92])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-kbl6/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl1/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][72], [FAIL][73]) ([i915#1423] / [i915#716]) -> [FAIL][74] ([i915#1423])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl2/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8297/shard-apl4/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4460
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8297: 4b5836951af00ec433a94fbf7f7148733e4acd28 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4460: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4460/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
