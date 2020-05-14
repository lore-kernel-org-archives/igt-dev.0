Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 May 2020 17:06:40 -0000
Message-ID: <158947600062.2827.10677928816212398514@emeril.freedesktop.org>
References: <20200514112941.1018421-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200514112941.1018421-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Force_timeslicing_of_the_virtual_reques?=
 =?utf-8?q?t?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_balancer: Force timeslicing of the virtual request
URL   : https://patchwork.freedesktop.org/series/77261/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8485_full -> IGTPW_4569_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4569_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4569_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4569_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_balancer@sliced} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl3/igt@gem_exec_balancer@sliced.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-tglb7/igt@gem_exec_balancer@sliced.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-iclb8/igt@i915_pm_dc@dc5-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-tglb8/igt@i915_pm_dc@dc5-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8485_full and IGTPW_4569_full:

### New IGT tests (1) ###

  * igt@gem_exec_balancer@sliced:
    - Statuses : 2 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.27] s

  

Known issues
------------

  Here are the changes found in IGTPW_4569_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-iclb7/igt@gem_ctx_persistence@processes.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-iclb4/igt@gem_ctx_persistence@processes.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#72])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-glk7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-glk1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl7/igt@kms_draw_crc@fill-fb.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl2/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1559] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][25] ([i915#180]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][27] ([i915#1602] / [i915#456]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-tglb8/igt@gem_exec_suspend@basic-s0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][29] ([i915#1436] / [i915#716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][31] ([i915#165]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl3/igt@i915_suspend@forcewake.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][33] ([i915#1119] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][35] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-iclb:         [DMESG-WARN][39] ([i915#128]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-iclb5/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-iclb4/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][41] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][43] ([i915#79]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][45] ([i915#433]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][51] ([i915#454]) -> [FAIL][52] ([i915#454] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-snb:          [SKIP][53] ([fdo#109271]) -> [INCOMPLETE][54] ([i915#82])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-snb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-snb4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][55] ([i915#1319]) -> [FAIL][56] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl2/igt@kms_content_protection@atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][57] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][58] ([i915#357])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl6/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][59] ([i915#357] / [i915#95]) -> [FAIL][60] ([i915#357])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl6/igt@kms_content_protection@uevent.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][61] ([i915#1121] / [i915#95]) -> [FAIL][62] ([i915#1525])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][63] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][64] ([i915#64])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8485/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4569
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8485: 0c6c45b4587580b4b7b2247d201a3b0f7af4b7f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4569: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4569/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
