Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 10:04:28 -0000
Message-ID: <158694506815.21015.8714399659548057240@emeril.freedesktop.org>
References: <20200414101109.28762-1-karthik.b.s@intel.com>
In-Reply-To: <20200414101109.28762-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=3A_Add_test_to_validate_asynchronous_flips_=28rev2?=
 =?utf-8?q?=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_async: Add test to validate asynchronous flips (rev2)
URL   : https://patchwork.freedesktop.org/series/75453/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8295_full -> IGTPW_4457_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4457_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4457_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4457_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_async@async-flip-with-page-flip-events} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb7/igt@kms_async@async-flip-with-page-flip-events.html

  * {igt@kms_async@async-flip-without-page-flip-events} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb2/igt@kms_async@async-flip-without-page-flip-events.html

  * igt@kms_busy@basic-modeset-pipe-c:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl1/igt@kms_busy@basic-modeset-pipe-c.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl1/igt@kms_busy@basic-modeset-pipe-c.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8295_full and IGTPW_4457_full:

### New IGT tests (2) ###

  * igt@kms_async@async-flip-with-page-flip-events:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async@async-flip-without-page-flip-events:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4457_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1531] / [i915#1658])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb8/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb5/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109349])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#34])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#53] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#53] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109642] / [fdo#111068])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#173])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb7/igt@kms_psr@no_drrs.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk8/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109278])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([fdo#112015])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][53] ([i915#716]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#454]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][57] ([i915#1316] / [i915#579]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb8/igt@i915_pm_rpm@dpms-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][59] ([i915#1316] / [i915#579]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk8/igt@i915_pm_rpm@sysfs-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk8/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][65] ([i915#52] / [i915#54]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][73] ([fdo#112015]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][75] ([fdo#109278]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][77] ([fdo#109293] / [fdo#109506]) -> [SKIP][78] ([i915#1316] / [i915#579])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][79] ([fdo#109506]) -> [SKIP][80] ([i915#1316] / [i915#579])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][81] ([i915#93] / [i915#95]) -> [DMESG-FAIL][82] ([i915#180] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265]) -> [FAIL][86] ([fdo#108145] / [i915#265] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][87] ([fdo#108145] / [i915#265]) -> [FAIL][88] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][89] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][90] ([fdo#108145] / [i915#265]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][91], [FAIL][92]) ([i915#1423] / [i915#716]) -> [FAIL][93] ([i915#1423])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4457
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8295: 4cb6dbe0a641129fd07ad1fbfcd6e7b4f03ec5c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4457: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4457/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
