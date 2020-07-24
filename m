Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jul 2020 09:18:17 -0000
Message-ID: <159558229786.15335.11214819471137546413@emeril.freedesktop.org>
References: <20200724001521.35201-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200724001521.35201-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_i915/perf=3A_add_tests_for_triggered_O?=
 =?utf-8?q?A_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1009494629=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1009494629==
Content-Type: multipart/alternative;
 boundary="===============0119301791674654910=="

--===============0119301791674654910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] i915/perf: add tests for triggered OA reports
URL   : https://patchwork.freedesktop.org/series/79829/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8783_full -> IGTPW_4796_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4796_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@non-privileged-access-vaddr} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb6/igt@perf@non-privileged-access-vaddr.html

  * {igt@perf@non-privileged-map-oa-buffer} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@perf@non-privileged-map-oa-buffer.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8783_full and IGTPW_4796_full:

### New IGT tests (6) ###

  * igt@perf@closed-fd-and-unmapped-access:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@invalid-map-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@map-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-privileged-access-vaddr:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-privileged-map-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@triggered-oa-reports:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4796_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_sync@basic-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk3/igt@gem_sync@basic-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk3/igt@gem_sync@basic-all.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [PASS][5] -> [WARN][6] ([i915#1515])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][7] -> [DMESG-FAIL][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#402]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#1958] / [i915#2119]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-hsw:          [PASS][25] -> [TIMEOUT][26] ([i915#1958] / [i915#2119]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#1911])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb7/igt@kms_psr2_su@frontbuffer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][31] -> [TIMEOUT][32] ([i915#1635] / [i915#1958] / [i915#2119])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-glk:          [PASS][33] -> [TIMEOUT][34] ([i915#1958] / [i915#2119])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [PASS][35] -> [TIMEOUT][36] ([i915#1958] / [i915#2119])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [PASS][37] -> [TIMEOUT][38] ([i915#1958] / [i915#2119])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][39] -> [TIMEOUT][40] ([i915#2119])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb8/igt@perf@rc6-disable.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb7/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][41] -> [TIMEOUT][42] ([i915#2119])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@perf@rc6-disable.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw1/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][43] -> [TIMEOUT][44] ([i915#2119])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@perf@rc6-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][45] -> [TIMEOUT][46] ([i915#1635] / [i915#2119])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@perf@rc6-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][47] -> [TIMEOUT][48] ([i915#2119])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb1/igt@perf@rc6-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb6/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][49] -> [TIMEOUT][50] ([i915#2119])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk4/igt@perf@rc6-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk5/igt@perf@rc6-disable.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#1820])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk3/igt@gem_exec_whisper@basic-queues.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk2/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw4/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-snb:          [TIMEOUT][57] ([i915#1958] / [i915#2119]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][59] ([i915#1899]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][61] ([i915#1899]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][63] ([i915#118] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#62]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-apl:          [FAIL][71] ([i915#1635] / [i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_fence_pin_leak:
    - shard-tglb:         [DMESG-WARN][75] ([i915#402]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb2/igt@kms_fence_pin_leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][83] ([i915#433]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb1/igt@kms_psr@psr2_primary_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-apl:          [FAIL][91] ([i915#1635]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@engines-hang:
    - shard-hsw:          [TIMEOUT][93] ([i915#1958] / [i915#2119]) -> [SKIP][94] ([fdo#109271] / [i915#1099])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_ctx_persistence@engines-hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw8/igt@gem_ctx_persistence@engines-hang.html
    - shard-snb:          [TIMEOUT][95] ([i915#1958] / [i915#2119]) -> [SKIP][96] ([fdo#109271] / [i915#1099])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@gem_ctx_persistence@engines-hang.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb4/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][97] ([i915#2036]) -> [WARN][98] ([i915#2021])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [TIMEOUT][100] ([i915#1958] / [i915#2119])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw2/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-hsw:          [TIMEOUT][101] ([i915#1958] / [i915#2119]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-snb:          [TIMEOUT][103] ([i915#1958] / [i915#2119]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [TIMEOUT][106] ([i915#1958] / [i915#2119]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@perf_pmu@rc6-runtime-pm-long.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@perf_pmu@rc6-runtime-pm-long.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5746 -> IGTPW_4796
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8783: 9780545cd4109baff8c6eb1cb1060a29b7ab919f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4796: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html
  IGT_5746: d818f0c54e5e781ba3fb372aab8f270cf153776c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html

--===============0119301791674654910==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] i915/perf: add tests for triggered OA reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79829/">https://patchwork.freedesktop.org/series/79829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8783_full -&gt; IGTPW_4796_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4796_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@perf@non-privileged-access-vaddr} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb6/igt@perf@non-privileged-access-vaddr.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@non-privileged-map-oa-buffer} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@perf@non-privileged-map-oa-buffer.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8783_full and IGTPW_4796_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@perf@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@map-oa-buffer:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@triggered-oa-reports:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4796_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk3/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk3/igt@gem_sync@basic-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb7/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl6/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl7/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb8/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb7/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw1/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb1/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb6/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk4/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk5/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk3/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk2/igt@gem_exec_whisper@basic-queues.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_fenced_exec_thrash@2-spare-fences.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw4/igt@gem_fenced_exec_thrash@2-spare-fences.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@gem_fenced_exec_thrash@2-spare-fences.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@gem_fenced_exec_thrash@2-spare-fences.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb1/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb2/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb2/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb1/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-dpms:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb2/igt@kms_fence_pin_leak.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb7/igt@kms_fence_pin_leak.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-iclb1/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-apl7/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_ctx_persistence@engines-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw8/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@gem_ctx_persistence@engines-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb4/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw2/igt@gem_render_copy@yf-tiled-to-vebox-linear.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm-long:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/shard-snb4/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/shard-snb5/igt@perf_pmu@rc6-runtime-pm-long.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
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
<li>IGT: IGT_5746 -&gt; IGTPW_4796</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8783: 9780545cd4109baff8c6eb1cb1060a29b7ab919f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4796: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4796/index.html<br />
  IGT_5746: d818f0c54e5e781ba3fb372aab8f270cf153776c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0119301791674654910==--

--===============1009494629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1009494629==--
