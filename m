Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Nov 2020 20:48:35 -0000
Message-ID: <160443651524.25740.8720801472326202335@emeril.freedesktop.org>
References: <20201103104813.18236-1-tzimmermann@suse.de>
In-Reply-To: <20201103104813.18236-1-tzimmermann@suse.de>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0469489251=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0469489251==
Content-Type: multipart/alternative;
 boundary="===============7974180053416533004=="

--===============7974180053416533004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test cases for fbdev
URL   : https://patchwork.freedesktop.org/series/83424/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9253_full -> IGTPW_5124_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5124_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5124_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5124_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@fbdev@eof} (NEW):
    - shard-tglb:         NOTRUN -> [CRASH][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@fbdev@eof.html

  * {igt@fbdev@read} (NEW):
    - shard-kbl:          NOTRUN -> [CRASH][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@fbdev@read.html
    - shard-hsw:          NOTRUN -> [CRASH][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw4/igt@fbdev@read.html
    - shard-glk:          NOTRUN -> [CRASH][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk9/igt@fbdev@read.html

  * {igt@fbdev@write} (NEW):
    - shard-iclb:         NOTRUN -> [CRASH][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb1/igt@fbdev@write.html
    - shard-snb:          NOTRUN -> [CRASH][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb5/igt@fbdev@write.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-snb:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb2/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-iclb:         [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9253_full and IGTPW_5124_full:

### New IGT tests (3) ###

  * igt@fbdev@eof:
    - Statuses : 7 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@fbdev@read:
    - Statuses : 7 crash(s)
    - Exec time: [0.03, 0.21] s

  * igt@fbdev@write:
    - Statuses : 7 crash(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_5124_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@softpin:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk6/igt@gem_softpin@softpin.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk4/igt@gem_softpin@softpin.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb4/igt@i915_pm_rpm@pm-caching.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_color@pipe-c-ctm-blue-to-red:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#129])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl7/igt@kms_color@pipe-c-ctm-blue-to-red.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#129] / [i915#1635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl7/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl6/igt@kms_color@pipe-c-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1635] / [i915#54]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1:
    - shard-snb:          [PASS][35] -> [INCOMPLETE][36] ([i915#82])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +7 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-apl:          [PASS][41] -> [INCOMPLETE][42] ([i915#1635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-iclb:         [PASS][43] -> [INCOMPLETE][44] ([i915#1078] / [i915#1185])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([i915#155])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#1542])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb8/igt@perf@polling-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@perf@polling-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][49] -> [DMESG-WARN][50] ([i915#1982]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb7/igt@perf_pmu@module-unload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [PASS][51] -> [SKIP][52] ([fdo#109271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk4/igt@perf_pmu@rc6-runtime-pm.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html
    - shard-apl:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1635]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl1/igt@perf_pmu@rc6-runtime-pm.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@perf_pmu@rc6-runtime-pm.html
    - shard-kbl:          [PASS][55] -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@perf_pmu@rc6-runtime-pm.html
    - shard-hsw:          [PASS][57] -> [SKIP][58] ([fdo#109271]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw1/igt@perf_pmu@rc6-runtime-pm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw7/igt@perf_pmu@rc6-runtime-pm.html

  * igt@syncobj_wait@single-wait-all-for-submit-signaled:
    - shard-hsw:          [PASS][59] -> [DMESG-WARN][60] ([i915#1982]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw6/igt@syncobj_wait@single-wait-all-for-submit-signaled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw6/igt@syncobj_wait@single-wait-all-for-submit-signaled.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@core_hotunplug@hotrebind-lateclose.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][63] ([i915#2261]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [SKIP][67] ([fdo#109271]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl7/igt@i915_pm_rpm@pm-tiling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl2/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [SKIP][69] ([fdo#109271] / [i915#1635]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl6/igt@i915_pm_rpm@pm-tiling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk1/igt@i915_pm_rpm@pm-tiling.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk5/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][73] ([i915#579]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb4/igt@i915_pm_rpm@pm-tiling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][75] ([i915#2521]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][77] ([i915#2521]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][79] ([i915#2521]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [FAIL][81] ([i915#2346]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-glk:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk9/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][85] ([i915#1635] / [i915#1982]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl6/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][87] ([i915#2055]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw5/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [INCOMPLETE][93] ([i915#1185]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@kms_psr@suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb3/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@kms_vblank@pipe-d-accuracy-idle.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb5/igt@kms_vblank@pipe-d-accuracy-idle.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@perf@non-system-wide-paranoid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl4/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][99] ([fdo#109271] / [i915#1354]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk2/igt@perf@non-system-wide-paranoid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk8/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [SKIP][101] ([i915#1354]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@perf@non-system-wide-paranoid.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb7/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][103] ([fdo#109271] / [i915#1354]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl7/igt@perf@non-system-wide-paranoid.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [SKIP][105] ([i915#1354]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@perf@non-system-wide-paranoid.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@perf@non-system-wide-paranoid.html

  
#### Warnings ####

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][107] ([i915#1436] / [i915#456]) -> [DMESG-WARN][108] ([i915#2411])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         [SKIP][109] ([i915#579]) -> [SKIP][110] ([fdo#110892])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [DMESG-WARN][111] ([i915#2411]) -> [SKIP][112] ([i915#579])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb6/igt@i915_pm_rpm@pm-caching.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [SKIP][113] ([i915#579]) -> [DMESG-WARN][114] ([i915#2411])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglb:         [INCOMPLETE][115] ([i915#2411] / [i915#456] / [i915#750]) -> [DMESG-WARN][116] ([i915#2411])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][118] ([fdo#108145] / [i915#1635] / [i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][119] ([fdo#109441]) -> [DMESG-WARN][120] ([i915#1226])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][121] ([i915#2411]) -> [DMESG-WARN][122] ([i915#1436])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-tglb:         [DMESG-WARN][123] ([i915#2411]) -> [SKIP][124] ([fdo#111719])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@perf_pmu@rc6-runtime-pm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][125] ([i915#1814] / [i915#483]) -> [FAIL][126] ([i915#1814])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][127] ([i915#2439]) -> [FAIL][128] ([i915#1602])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@runner@aborted.html
    - shard-snb:          [FAIL][129] ([i915#2426] / [i915#2439]) -> [FAIL][130] ([i915#2426] / [i915#698])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5830 -> IGTPW_5124
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9253: a8c030d641dc0961d180b866ab6e5e9032dcbdf4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5124: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html

--===============7974180053416533004==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Test cases for fbdev</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83424/">https://patchwork.freedesktop.org/series/83424/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9253_full -&gt; IGTPW_5124_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5124_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5124_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5124_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@fbdev@eof} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@fbdev@eof.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@fbdev@read} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@fbdev@read.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw4/igt@fbdev@read.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk9/igt@fbdev@read.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@fbdev@write} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb1/igt@fbdev@write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb5/igt@fbdev@write.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb2/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9253_full and IGTPW_5124_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>Statuses : 7 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>Statuses : 7 crash(s)</li>
<li>Exec time: [0.03, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>Statuses : 7 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5124_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@softpin:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk6/igt@gem_softpin@softpin.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk4/igt@gem_softpin@softpin.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb4/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_color@pipe-c-ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl7/igt@kms_color@pipe-c-ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl7/igt@kms_color@pipe-c-ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl6/igt@kms_color@pipe-c-ctm-blue-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-size-change:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1078">i915#1078</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb8/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk4/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw7/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@single-wait-all-for-submit-signaled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw6/igt@syncobj_wait@single-wait-all-for-submit-signaled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw6/igt@syncobj_wait@single-wait-all-for-submit-signaled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl3/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk1/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk5/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb4/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk9/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl6/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-hsw5/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@kms_psr@suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb3/igt@kms_psr@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@kms_vblank@pipe-d-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb5/igt@kms_vblank@pipe-d-accuracy-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl4/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-glk2/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-glk8/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb7/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-kbl7/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-kbl4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb3/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb6/igt@i915_pm_rpm@pm-caching.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb8/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb3/igt@perf_pmu@rc6-runtime-pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111719">fdo#111719</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-iclb2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9253/shard-snb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/shard-snb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/698">i915#698</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5830 -&gt; IGTPW_5124</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9253: a8c030d641dc0961d180b866ab6e5e9032dcbdf4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5124: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5124/index.html<br />
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7974180053416533004==--

--===============0469489251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0469489251==--
