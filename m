Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Jun 2020 16:11:45 -0000
Message-ID: <159353350512.22704.8098210728281474249@emeril.freedesktop.org>
References: <20200630124859.29004-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200630124859.29004-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev9=29?=
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

Series: Add api_intel_bb test (rev9)
URL   : https://patchwork.freedesktop.org/series/78719/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8677_full -> IGTPW_4717_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4717_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4717_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4717_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb7/igt@api_intel_bb@intel-bb-blit.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw7/igt@api_intel_bb@intel-bb-blit.html

  * igt@kms_draw_crc@fill-fb:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw8/igt@kms_draw_crc@fill-fb.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw8/igt@kms_draw_crc@fill-fb.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8677_full and IGTPW_4717_full:

### New IGT tests (9) ###

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
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 2 fail(s) 5 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4717_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@smoketest-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk3/igt@gem_exec_schedule@smoketest-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk8/igt@gem_exec_schedule@smoketest-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb7/igt@i915_getparams_basic@basic-eu-total.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb6/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb2/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#95]) +32 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_color@pipe-a-ctm-negative.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl7/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([i915#155])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#1958])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb2/igt@kms_draw_crc@fill-fb.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-snb5/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#1635] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_mmap_coherency@read:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#93] / [i915#95]) +38 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@prime_mmap_coherency@read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl2/igt@prime_mmap_coherency@read.html

  * igt@prime_vgem@basic-fence-read:
    - shard-iclb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb1/igt@prime_vgem@basic-fence-read.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb3/igt@prime_vgem@basic-fence-read.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1755])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][45] ([i915#1930]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][51] ([i915#1436] / [i915#716]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +41 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@i915_getparams_basic@basic-eu-total.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl3/igt@i915_getparams_basic@basic-eu-total.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-hsw:          [INCOMPLETE][55] ([i915#2055]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw7/igt@kms_atomic_interruptible@legacy-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw7/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#54] / [i915#95]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][65] ([i915#96]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][69] ([i915#1928]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][73] ([i915#1958]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_lease@lessee_list.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw6/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][83] ([fdo#109642] / [fdo#111068]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb8/igt@kms_psr@psr2_primary_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         [DMESG-WARN][87] ([i915#402]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb1/igt@kms_psr@psr2_sprite_plane_onoff.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-tglb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +7 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][91] ([i915#1542]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb4/igt@perf@blocking-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb5/igt@perf@blocking-parameterized.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#95]) -> [PASS][94] +40 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@perf@invalid-oa-metric-set-id.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [i915#1635]) -> [SKIP][96] ([fdo#109271]) +12 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl4/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [SKIP][98] ([i915#588])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-kbl:          [DMESG-WARN][99] ([i915#93] / [i915#95]) -> [FAIL][100] ([i915#129])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_color@pipe-a-ctm-green-to-red.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_color@pipe-a-ctm-green-to-red.html
    - shard-apl:          [DMESG-WARN][101] ([i915#1635] / [i915#95]) -> [FAIL][102] ([i915#129])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_color@pipe-a-ctm-green-to-red.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl3/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][104] ([fdo#109271] / [fdo#111827])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-max.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827]) -> [SKIP][106] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl8/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-apl:          [SKIP][107] ([fdo#109271]) -> [SKIP][108] ([fdo#109271] / [i915#1635]) +19 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [FAIL][125] ([i915#265]) -> [DMESG-FAIL][126] ([i915#95])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][127] ([i915#1436] / [i915#1784]) -> ([FAIL][128], [FAIL][129]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#716])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#716]) -> [FAIL][133] ([i915#1635])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl7/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4717
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8677: 47bc281ce35e7872ee04238b2f5e81aeeeb2337b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4717: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4717/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
