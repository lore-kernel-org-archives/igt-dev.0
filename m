Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Jun 2020 17:57:22 -0000
Message-ID: <159293504241.4209.950331667605840331@emeril.freedesktop.org>
References: <20200623130056.20071-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200623130056.20071-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev2=29?=
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

Series: Add api_intel_bb test (rev2)
URL   : https://patchwork.freedesktop.org/series/78719/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5717_full -> IGTPW_4693_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4693_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4693_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4693_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@sysfs-reader:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@i915_suspend@sysfs-reader.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-iclb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-iclb8/igt@kms_prime@basic-crc@second-to-first.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb1/igt@kms_prime@basic-crc@second-to-first.html

  
New tests
---------

  New tests have been introduced between IGT_5717_full and IGTPW_4693_full:

### New IGT tests (7) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 7 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4693_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1889])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb1/igt@gem_ctx_shared@q-smoketest-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_await@wide-all:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@gem_exec_await@wide-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw4/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#1930])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk7/igt@gem_exec_whisper@basic-contexts-priority.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_userptr_blits@stress-mm-invalidate-close:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#95]) +34 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl7/igt@gem_userptr_blits@stress-mm-invalidate-close.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl7/igt@gem_userptr_blits@stress-mm-invalidate-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1436] / [i915#716] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb6/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb1/igt@i915_module_load@reload.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#2055])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#1635] / [i915#95]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw1/igt@kms_prime@basic-crc@second-to-first.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-snb5/igt@kms_prime@basic-crc@second-to-first.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-snb1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk8/igt@kms_prime@basic-crc@second-to-first.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk8/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl6/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([IGT#2])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl6/igt@kms_sysfs_edid_timing.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl3/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([IGT#2])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl4/igt@kms_sysfs_edid_timing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#93] / [i915#95]) +37 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#1542]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-iclb3/igt@perf@blocking-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-iclb8/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][57] ([i915#118] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk5/igt@gem_exec_create@madvise.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk8/igt@gem_exec_create@madvise.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         [DMESG-WARN][59] ([i915#402]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb5/igt@gem_userptr_blits@access-control.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][63] ([i915#1904]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][65] ([i915#151] / [i915#155]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][69] ([i915#93] / [i915#95]) -> [PASS][70] +34 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][79] ([i915#1958]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-snb6/igt@kms_invalid_dotclock.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-snb1/igt@kms_invalid_dotclock.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][83] ([fdo#108145] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][85] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [SKIP][87] ([i915#1836]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-iclb3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-snb5/igt@kms_prime@basic-crc@first-to-second.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-snb1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [SKIP][91] ([fdo#109271]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw1/igt@kms_prime@basic-crc@first-to-second.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [SKIP][95] ([i915#1836]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-glk8/igt@kms_prime@basic-crc@first-to-second.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-glk8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-tglb3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-apl:          [DMESG-WARN][101] ([i915#1635] / [i915#95]) -> [PASS][102] +35 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl1/igt@perf@low-oa-exponent-permissions.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl6/igt@perf@low-oa-exponent-permissions.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][103] ([i915#1958]) -> [FAIL][104] ([i915#1930])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][105] ([i915#93] / [i915#95]) -> [DMESG-WARN][106] ([i915#180])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][107] ([i915#1958]) -> [SKIP][108] ([fdo#109271]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [fdo#111827]) -> [SKIP][110] ([fdo#109271] / [fdo#111827] / [i915#1635]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl6/igt@kms_chamelium@vga-hpd.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl7/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][111] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][112] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-FAIL][115] ([i915#1635] / [i915#95]) -> [FAIL][116] ([i915#1525])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [DMESG-FAIL][117] ([i915#95]) -> [FAIL][118] ([i915#64])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          [SKIP][119] ([fdo#109271]) -> [SKIP][120] ([fdo#109271] / [i915#1635]) +17 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][121] ([fdo#109271] / [i915#1635]) -> [SKIP][122] ([fdo#109271]) +9 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          [FAIL][125] ([i915#265]) -> [DMESG-FAIL][126] ([i915#1635] / [i915#95])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          [FAIL][127] ([i915#265]) -> [DMESG-FAIL][128] ([i915#95])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5717/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1889]: https://gitlab.freedesktop.org/drm/intel/issues/1889
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4693

  CI-20190529: 20190529
  CI_DRM_8656: 44e3c43b37ee6ceb67ff23aae6cf7551367f5dce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4693: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4693/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
