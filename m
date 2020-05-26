Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 17:38:47 -0000
Message-ID: <159051472795.28044.7151983545281029631@emeril.freedesktop.org>
References: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Fdevice=5Fscan=3A_Add?=
 =?utf-8?q?_missing_Check_for_return_value_in_scan=5Fdrm=5Fdevices?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/igt_device_scan: Add missing Check for return value in scan_drm_devices
URL   : https://patchwork.freedesktop.org/series/77660/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8539_full -> IGTPW_4612_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4612_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4612_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4612_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-hsw2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-hsw2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk5/igt@gen9_exec_parse@cmd-crossing-page.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][5], [FAIL][6])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-hsw7/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-hsw2/igt@runner@aborted.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180:
    - shard-glk:          [SKIP][7] ([fdo#109271]) -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk9/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk5/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-glk:          NOTRUN -> [TIMEOUT][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk5/igt@gem_exec_reloc@basic-concurrent16.html

  
Known issues
------------

  Here are the changes found in IGTPW_4612_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1436] / [i915#716])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl3/igt@gen9_exec_parse@allowed-all.html
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#1436] / [i915#716])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-apl:          [PASS][14] -> [TIMEOUT][15] ([i915#1635]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@gen9_exec_parse@cmd-crossing-page.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-apl:          [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@i915_pm_rpm@pm-tiling.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl6/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk6/igt@i915_pm_rpm@pm-tiling.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk5/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][22] -> [INCOMPLETE][23] ([i915#155])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl3/igt@i915_suspend@forcewake.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#1119] / [i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][32] -> [FAIL][33] ([i915#57])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#699] / [i915#93] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#53] / [i915#95]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * {igt@gem_exec_endless@dispatch@vcs0}:
    - shard-apl:          [SKIP][44] ([fdo#109271]) -> [PASS][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@gem_exec_endless@dispatch@vcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl2/igt@gem_exec_endless@dispatch@vcs0.html

  * {igt@gem_exec_endless@dispatch@vcs1}:
    - shard-tglb:         [SKIP][46] ([i915#1929]) -> [PASS][47] +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@gem_exec_endless@dispatch@vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-kbl:          [SKIP][48] ([fdo#109271]) -> [PASS][49] +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [i915#1929]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@gem_exec_endless@dispatch@vcs1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-iclb4/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0}:
    - shard-iclb:         [SKIP][52] ([i915#1929]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@gem_exec_endless@dispatch@vecs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-iclb4/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][54] ([i915#1904]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][56] ([i915#1119] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][58] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][60] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][62] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [INCOMPLETE][64] ([i915#61]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1}:
    - shard-apl:          [FAIL][68] ([i915#407]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl3/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][70] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][74] ([fdo#109441]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][76] ([i915#31]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_setmode@basic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl1/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][78] ([i915#588]) -> [SKIP][79] ([i915#658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][80] ([i915#468]) -> [FAIL][81] ([i915#454])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][82] ([i915#454]) -> [SKIP][83] ([i915#468])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_busy@basic-modeset-pipe-d:
    - shard-apl:          [TIMEOUT][84] ([i915#1635]) -> [SKIP][85] ([fdo#109271])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_busy@basic-modeset-pipe-d.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl1/igt@kms_busy@basic-modeset-pipe-d.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180:
    - shard-apl:          [SKIP][86] ([fdo#109271]) -> [TIMEOUT][87] ([i915#1635]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl6/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][88] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][89] ([i915#1319] / [i915#1635])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_content_protection@legacy.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][90] ([i915#1319]) -> [FAIL][91] ([fdo#110321] / [i915#93] / [i915#95])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_content_protection@lic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][92] ([i915#1925]) -> [DMESG-WARN][93] ([i915#1926])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1929]: https://gitlab.freedesktop.org/drm/intel/issues/1929
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5678 -> IGTPW_4612
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8539: 6590da76d8c6a2952b3cde70859bad41c59ed444 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4612: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/index.html
  IGT_5678: c1f30ee09ac2e7eb3e8e90245239731a169a6050 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4612/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
