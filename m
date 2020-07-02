Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 01:49:58 -0000
Message-ID: <159365459862.5656.6663330129631279533@emeril.freedesktop.org>
References: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev11=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev11)
URL   : https://patchwork.freedesktop.org/series/78719/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8688_full -> IGTPW_4725_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4725_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4725_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4725_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8688_full and IGTPW_4725_full:

### New IGT tests (11) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 7 pass(s)
    - Exec time: [2.70, 5.15] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 7 pass(s)
    - Exec time: [2.54, 4.71] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 7 pass(s)
    - Exec time: [2.56, 4.64] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4725_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1602] / [i915#1887])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb8/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk6/igt@gem_exec_whisper@basic-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk5/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw4/igt@gem_mmap_wc@fault-concurrent.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw8/igt@gem_mmap_wc@fault-concurrent.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb3/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +29 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl7/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1602] / [i915#1887])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb8/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl6/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#93] / [i915#95]) +41 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl3/igt@perf@invalid-create-userspace-config.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl2/igt@perf@invalid-create-userspace-config.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb4/igt@perf_pmu@module-unload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb1/igt@perf_pmu@module-unload.html

  * igt@prime_mmap@test_map_unmap:
    - shard-snb:          [PASS][39] -> [TIMEOUT][40] ([i915#1958] / [i915#2119]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-snb6/igt@prime_mmap@test_map_unmap.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-snb1/igt@prime_mmap@test_map_unmap.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +10 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk8/igt@gem_exec_create@forked.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk2/igt@gem_exec_create@forked.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-hsw:          [TIMEOUT][45] ([i915#1958] / [i915#2119]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw7/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw8/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-tglb:         [DMESG-WARN][47] ([i915#402]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb6/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb3/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][51] ([i915#1519]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@mock@requests:
    - shard-hsw:          [INCOMPLETE][53] ([i915#2110]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw8/igt@i915_selftest@mock@requests.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw6/igt@i915_selftest@mock@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#95]) -> [PASS][56] +33 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [DMESG-WARN][59] ([i915#93] / [i915#95]) -> [PASS][60] +33 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_flip@dpms-vs-vblank-race@a-dp1:
    - shard-kbl:          [FAIL][61] ([i915#407]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl6/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl2/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-glk3/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-glk8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@plane-position-covered-pipe-a-planes:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-snb1/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-snb2/igt@kms_plane@plane-position-covered-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb8/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][77] ([fdo#109642] / [fdo#111068]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset:
    - shard-kbl:          [DMESG-WARN][81] ([i915#62] / [i915#92]) -> [PASS][82] +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-modeset.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-modeset.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-iclb8/igt@perf@blocking-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-iclb5/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-hsw:          [FAIL][85] -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw7/igt@perf_pmu@busy-double-start@vcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw7/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-hsw:          [DMESG-FAIL][87] ([i915#2119]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw7/igt@perf_pmu@busy-double-start@vecs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw7/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][89] ([i915#1820]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [FAIL][91] ([i915#1732]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl7/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][93] ([i915#1930]) -> [TIMEOUT][94] ([i915#1958] / [i915#2119])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [SKIP][96] ([fdo#109271] / [i915#1635]) +13 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827]) -> [SKIP][98] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl8/igt@kms_chamelium@vga-hpd-enable-disable-mode.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl3/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][99] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][100] ([fdo#110321] / [i915#1635] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][101] ([i915#402]) -> [DMESG-WARN][102] ([i915#1982])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958] / [i915#2119])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [TIMEOUT][106] ([i915#1958] / [i915#2119])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [i915#1635]) -> [SKIP][108] ([fdo#109271]) +7 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][109] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][110] ([fdo#108145] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
    - shard-hsw:          [TIMEOUT][111] ([i915#1958] / [i915#2119]) -> [SKIP][112] ([fdo#109271]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw7/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html

  * igt@perf_pmu@semaphore-wait@vcs0:
    - shard-snb:          [SKIP][113] ([fdo#109271]) -> [SKIP][114] ([fdo#109271] / [i915#2119])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-snb2/igt@perf_pmu@semaphore-wait@vcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-snb1/igt@perf_pmu@semaphore-wait@vcs0.html

  * igt@perf_pmu@semaphore-wait@vecs0:
    - shard-hsw:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#2119])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8688/shard-hsw8/igt@perf_pmu@semaphore-wait@vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/shard-hsw8/igt@perf_pmu@semaphore-wait@vecs0.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5719 -> IGTPW_4725
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8688: e732088e2eb2bbb1ca72c1f68d0405f17477d446 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4725: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html
  IGT_5719: 54731f017df8660f29cc8f5db0b570239729e808 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4725/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
