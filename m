Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 01:49:10 -0000
Message-ID: <158872975099.11898.16894844632654284959@emeril.freedesktop.org>
References: <20200505132032.827-1-anshuman.gupta@intel.com>
In-Reply-To: <20200505132032.827-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev9=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev9)
URL   : https://patchwork.freedesktop.org/series/74647/
State : success

== Summary ==

CI Bug Log - changes from IGT_5633_full -> IGTPW_4534_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4534_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4534_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4534_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         [SKIP][1] ([fdo#109301]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb2/igt@i915_pm_lpsp@screens-disabled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-tglb6/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         [SKIP][3] ([fdo#109301]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb4/igt@i915_pm_lpsp@screens-disabled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-iclb8/igt@i915_pm_lpsp@screens-disabled.html

  
New tests
---------

  New tests have been introduced between IGT_5633_full and IGTPW_4534_full:

### New IGT tests (5) ###

  * igt@i915_pm_lpsp@kms-lpsp:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-vga:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4534_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#61]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-hsw1/igt@gem_busy@close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-hsw7/igt@gem_busy@close-race.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-hsw5/igt@i915_pm_lpsp@screens-disabled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-hsw7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1531])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb3/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#699] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#265] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@kms_vblank@pipe-b-query-idle-hang.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl4/igt@kms_vblank@pipe-b-query-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][33] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][35] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * {igt@kms_flip@flip-vs-suspend@b-vga1}:
    - shard-snb:          [DMESG-WARN][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [FAIL][39] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][41] ([i915#433]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
    - shard-iclb:         [SKIP][43] ([i915#433]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-iclb4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][45] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][47] ([i915#1559] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][49] ([i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][51] ([i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][57] ([i915#1542]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-hsw6/igt@perf@polling-parameterized.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-hsw1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][59] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [FAIL][60] ([fdo#110321] / [fdo#110336])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][61] ([IGT#2]) -> [FAIL][62] ([IGT#2] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_sysfs_edid_timing.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/shard-apl8/igt@kms_sysfs_edid_timing.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109301]: https://bugs.freedesktop.org/show_bug.cgi?id=109301
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5633 -> IGTPW_4534

  CI-20190529: 20190529
  CI_DRM_8430: 2daa6f8cad645f49a898158190a20a893b4aabe3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4534: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/index.html
  IGT_5633: c8c2e5ed5cd8e4b7a69a903f3f1653612086abcc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4534/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
