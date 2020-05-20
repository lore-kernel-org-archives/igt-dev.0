Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 01:30:42 -0000
Message-ID: <158993824274.30691.3959168502529936089@emeril.freedesktop.org>
References: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915=3A_Add_test_to_assert_tha?=
 =?utf-8?q?t_the_PCI-ID_is_known?=
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

Series: series starting with [i-g-t,1/2] i915: Add test to assert that the PCI-ID is known
URL   : https://patchwork.freedesktop.org/series/77421/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8505_full -> IGTPW_4590_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4590_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@sliced}:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb7/igt@gem_exec_balancer@sliced.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-tglb8/igt@gem_exec_balancer@sliced.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8505_full and IGTPW_4590_full:

### New IGT tests (1) ###

  * igt@i915_pciid:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_4590_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#1121])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-glk9/igt@kms_fbcon_fbt@fbc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-glk7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][17] ([i915#180]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][19] ([i915#180] / [i915#95]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl7/igt@gem_workarounds@suspend-resume.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][21] ([i915#1119] / [i915#95]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][23] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][25] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-apl:          [FAIL][27] ([i915#54]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][29] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][31] ([i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][35] ([i915#433]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][37] ([fdo#109441]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][39] ([i915#31]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl3/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][41] ([i915#31]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][43] ([i915#1602]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [DMESG-WARN][46] ([i915#180] / [i915#93] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][48] ([i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl6/igt@gem_workarounds@suspend-resume.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][49] ([i915#588]) -> [SKIP][50] ([i915#658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][51] ([i915#454] / [i915#93] / [i915#95]) -> [FAIL][52] ([i915#454])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][53] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][55] ([fdo#110321]) -> [TIMEOUT][56] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl8/igt@kms_content_protection@lic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [FAIL][57] ([fdo#110321] / [i915#93] / [i915#95]) -> [TIMEOUT][58] ([i915#1319])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl2/igt@kms_content_protection@srm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][59] ([i915#357]) -> [FAIL][60] ([i915#357] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl3/igt@kms_content_protection@uevent.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][61] ([i915#357]) -> [FAIL][62] ([i915#357] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl6/igt@kms_content_protection@uevent.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][63] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][64] ([i915#1121])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-kbl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][65] -> [FAIL][66] ([i915#608])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb2/igt@kms_psr2_su@page_flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/shard-tglb6/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1883]: https://gitlab.freedesktop.org/drm/intel/issues/1883
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5660 -> IGTPW_4590
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8505: dd6f7db19af1ccb376719c8759afe6be9107315c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html
  IGT_5660: bf43e3e45a17c16094fb3a47b363ccf1c95c28b9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4590/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
