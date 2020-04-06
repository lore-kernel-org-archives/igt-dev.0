Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 23:43:24 -0000
Message-ID: <158621660447.4191.14974568053050473882@emeril.freedesktop.org>
References: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_include=3A_bump_i915_head?=
 =?utf-8?q?er_for_new_feature?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] include: bump i915 header for new feature
URL   : https://patchwork.freedesktop.org/series/75551/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8261_full -> IGTPW_4415_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4415_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4415_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4415_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk6/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk5/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  * {igt@perf@gen8-unprivileged-multi-ctx-counters} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb6/igt@perf@gen8-unprivileged-multi-ctx-counters.html

  * {igt@perf@unprivileged-multi-ctx-counters} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-tglb7/igt@perf@unprivileged-multi-ctx-counters.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@pi-shared-iova@bcs0}:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl2/igt@gem_exec_schedule@pi-shared-iova@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@gem_exec_schedule@pi-shared-iova@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8261_full and IGTPW_4415_full:

### New IGT tests (3) ###

  * igt@perf@gen8-unprivileged-multi-ctx-counters:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@invalid-multi-ctx-params:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@unprivileged-multi-ctx-counters:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4415_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#1316] / [i915#579]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb3/igt@i915_pm_rpm@gem-execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@i915_pm_rpm@gem-execbuf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#155])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#64] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#699] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl8/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#49]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#668]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb6/igt@kms_psr@psr2_basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-tglb6/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@enable-disable:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([i915#405])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb5/igt@perf@enable-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb7/igt@perf@enable-disable.html
    - shard-kbl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl2/igt@perf@enable-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@perf@enable-disable.html
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl6/igt@perf@enable-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl3/igt@perf@enable-disable.html
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#405])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb1/igt@perf@enable-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-tglb1/igt@perf@enable-disable.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][51] ([i915#180] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl3/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [DMESG-WARN][53] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][55] ([i915#1316] / [i915#579]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-tglb8/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-hsw1/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@i915_pm_rpm@cursor.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk7/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][61] ([i915#1316] / [i915#579]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_busy@basic@flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-hsw8/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][65] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][67] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][69] ([fdo#109349]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [FAIL][71] ([i915#52] / [i915#54]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][73] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][75] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][77] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][81] ([i915#79]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl8/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl4/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][95] ([i915#1542]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw1/igt@perf@blocking-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-hsw7/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][97] ([i915#1515]) -> [WARN][98] ([i915#1515])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-snb:          [SKIP][99] ([fdo#109271]) -> [INCOMPLETE][100] ([i915#82])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-snb5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-snb2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][101] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][102] ([i915#357])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_content_protection@uevent.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][103] ([i915#357] / [i915#95]) -> [FAIL][104] ([i915#357])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_content_protection@uevent.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][105] ([i915#180] / [i915#95]) -> [FAIL][106] ([i915#1525])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][107] ([fdo#108145] / [i915#265]) -> [FAIL][108] ([fdo#108145] / [i915#265] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][109] ([fdo#108145] / [i915#265]) -> [FAIL][110] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][111] ([fdo#109642] / [fdo#111068]) -> [FAIL][112] ([i915#608])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4415
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8261: 80b64adc6f5ffeb1c69996737dbdc5ad275d8e6c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4415: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4415/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
