Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Mar 2020 06:54:42 -0000
Message-ID: <158313208233.30646.9550759777984307728@emeril.freedesktop.org>
References: <20200229171928.1698582-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200229171928.1698582-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_global_sseu_parameter_tests?=
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

Series: tests/perf: add global sseu parameter tests
URL   : https://patchwork.freedesktop.org/series/74111/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8036_full -> IGTPW_4242_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4242_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@global-sseu-config} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb6/igt@perf@global-sseu-config.html
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl6/igt@perf@global-sseu-config.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb3/igt@perf@global-sseu-config.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-glk4/igt@perf@global-sseu-config.html
    - shard-hsw:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-hsw1/igt@perf@global-sseu-config.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl2/igt@perf@global-sseu-config.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8036_full and IGTPW_4242_full:

### New IGT tests (2) ###

  * igt@perf@global-sseu-config:
    - Statuses : 6 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@perf@global-sseu-config-invalid:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4242_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +13 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103665])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl2/igt@i915_suspend@forcewake.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#668]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#31])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl6/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw7/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-hsw7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#84])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk3/igt@perf@oa-exponents.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-glk8/igt@perf@oa-exponents.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear:
    - shard-hsw:          [TIMEOUT][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw5/igt@gem_create@create-clear.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-hsw6/igt@gem_create@create-clear.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [i915#677]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][47] ([i915#1316]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [SKIP][49] ([i915#1316]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb4/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_selftest@live@hangcheck:
    - shard-iclb:         [INCOMPLETE][51] ([fdo#108569]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@i915_selftest@live@hangcheck.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-apl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [DMESG-WARN][59] ([i915#42]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-snb4/igt@kms_flip@flip-vs-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-snb2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [SKIP][61] ([i915#668]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][63] ([fdo#109642] / [fdo#111068]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb3/igt@kms_psr@psr2_sprite_render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [FAIL][67] ([i915#331]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-glk9/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [FAIL][69] ([i915#331]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [FAIL][71] ([i915#331]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][73] ([i915#1085]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * {igt@perf@stress-open-close}:
    - shard-kbl:          [INCOMPLETE][75] ([fdo#103665]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl6/igt@perf@stress-open-close.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-kbl2/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +11 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +16 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][81] ([i915#454]) -> [SKIP][82] ([i915#468]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5480 -> IGTPW_4242
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8036: 0f36a1b338da9019bde23189927497551256a90c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4242: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/index.html
  IGT_5480: 13dbe276f21d75a42795567973b9303112bd7c5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4242/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
