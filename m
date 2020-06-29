Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Jun 2020 19:08:28 -0000
Message-ID: <159345770828.746.33414042967450121@emeril.freedesktop.org>
References: <20200629105735.20369-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200629105735.20369-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev7=29?=
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

Series: Add api_intel_bb test (rev7)
URL   : https://patchwork.freedesktop.org/series/78719/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8673_full -> IGTPW_4710_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4710_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4710_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4710_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw2/igt@gem_partial_pwrite_pread@write-snoop.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw7/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8673_full and IGTPW_4710_full:

### New IGT tests (8) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.19] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4710_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2079])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl3/igt@gem_exec_balancer@bonded-early.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl4/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb1/igt@gem_mmap_wc@invalid-flags.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb5/igt@gem_mmap_wc@invalid-flags.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#118] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#71])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@kms_color@pipe-a-legacy-gamma.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl4/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([fdo#108145] / [i915#71])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_color@pipe-a-legacy-gamma.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#95]) +32 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#93] / [i915#95]) +35 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@kms_fbcon_fbt@fbc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw6/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2055])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk9/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-glk8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-snb:          [PASS][37] -> [DMESG-WARN][38] ([i915#42])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#1635] / [i915#95]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#402]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb1/igt@kms_vblank@pipe-c-query-busy-hang.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-tglb6/igt@kms_vblank@pipe-c-query-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([i915#155] / [i915#794])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#1820])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@multi-wait-for-submit-submitted:
    - shard-snb:          [PASS][49] -> [TIMEOUT][50] ([i915#1958]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb2/igt@syncobj_wait@multi-wait-for-submit-submitted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb1/igt@syncobj_wait@multi-wait-for-submit-submitted.html
    - shard-hsw:          [PASS][51] -> [TIMEOUT][52] ([i915#1958])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw2/igt@syncobj_wait@multi-wait-for-submit-submitted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw6/igt@syncobj_wait@multi-wait-for-submit-submitted.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#1732])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][55] ([i915#1930]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][59] ([i915#1436] / [i915#716]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][61] ([i915#93] / [i915#95]) -> [PASS][62] +43 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@i915_getparams_basic@basic-eu-total.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl6/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][63] ([i915#402]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb3/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-tglb8/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#95]) -> [PASS][66] +25 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rps@waitboost:
    - shard-glk:          [FAIL][67] ([i915#39]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk9/igt@i915_pm_rps@waitboost.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-glk6/igt@i915_pm_rps@waitboost.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-hsw:          [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@kms_atomic_interruptible@legacy-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw1/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][75] ([i915#96]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw6/igt@kms_lease@lessee_list.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw7/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][83] ([fdo#108145] / [i915#95]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][85] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][87] ([i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][89] ([i915#1635] / [i915#95]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][93] ([fdo#109642] / [fdo#111068]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf@blocking:
    - shard-glk:          [DMESG-WARN][97] ([i915#118] / [i915#95]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk7/igt@perf@blocking.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-glk4/igt@perf@blocking.html

  * igt@perf_pmu@most-busy-idle-check-all@vecs0:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@perf_pmu@most-busy-idle-check-all@vecs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb2/igt@perf_pmu@most-busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@bonded-pair:
    - shard-hsw:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@gem_exec_balancer@bonded-pair.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][103] ([i915#2036]) -> [WARN][104] ([i915#2021])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb4/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [INCOMPLETE][106] ([i915#155])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [fdo#111827]) -> [SKIP][108] ([fdo#109271] / [fdo#111827] / [i915#1635]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][109] ([fdo#110321]) -> [DMESG-FAIL][110] ([fdo#110321] / [i915#1635] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_content_protection@lic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][111] ([i915#1226]) -> [SKIP][112] ([fdo#109349])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][115] ([i915#1958]) -> [SKIP][116] ([fdo#109271])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-snb:          [SKIP][117] ([fdo#109271]) -> [TIMEOUT][118] ([i915#1958]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb5/igt@kms_flip@2x-flip-vs-dpms.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-snb1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][119] ([i915#93] / [i915#95]) -> [DMESG-WARN][120] ([i915#180] / [i915#93] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [SKIP][121] ([fdo#109271]) -> [SKIP][122] ([fdo#109271] / [i915#1635]) +15 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          [SKIP][123] ([fdo#109271] / [i915#1635]) -> [SKIP][124] ([fdo#109271]) +12 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][125] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][126] ([fdo#108145] / [i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#637] / [i915#716]) -> [FAIL][132] ([i915#1635])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/shard-apl4/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#637]: https://gitlab.freedesktop.org/drm/intel/issues/637
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4710
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8673: ae0a2b45fe022c02a2779c2ae8c83473763c1feb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4710: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4710/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
