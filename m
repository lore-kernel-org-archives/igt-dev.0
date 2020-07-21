Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jul 2020 03:37:46 -0000
Message-ID: <159530266602.6964.8564105355370406028@emeril.freedesktop.org>
References: <20200721015717.46279-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200721015717.46279-1-umesh.nerlige.ramappa@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1280728521=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1280728521==
Content-Type: multipart/alternative;
 boundary="===============8625539984465672725=="

--===============8625539984465672725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] i915/perf: add tests for triggered OA reports
URL   : https://patchwork.freedesktop.org/series/79695/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8768_full -> IGTPW_4782_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4782_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@close-fd-and-access-oa-buffer} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@perf@close-fd-and-access-oa-buffer.html

  * {igt@perf@triggered-oa-reports} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb3/igt@perf@triggered-oa-reports.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8768_full and IGTPW_4782_full:

### New IGT tests (5) ###

  * igt@perf@close-fd-and-access-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@invalid-map-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@map-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-privileged-map-oa-buffer:
    - Statuses :
    - Exec time: [None] s

  * igt@perf@triggered-oa-reports:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4782_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb8/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb8/igt@i915_module_load@reload.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([fdo#108145] / [i915#1635] / [i915#71])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl7/igt@kms_color@pipe-a-legacy-gamma.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#71])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl6/igt@kms_color@pipe-a-legacy-gamma.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#49])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#1911])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-hsw:          [PASS][19] -> [TIMEOUT][20] ([i915#1958] / [i915#2119])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw4/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_vblank@pipe-c-wait-forked-hang.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][21] -> [TIMEOUT][22] ([i915#1635] / [i915#1958] / [i915#2119])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl7/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([i915#1958] / [i915#2119])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk3/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk7/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [PASS][25] -> [TIMEOUT][26] ([i915#1958] / [i915#2119])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [PASS][27] -> [TIMEOUT][28] ([i915#1958] / [i915#2119])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#1542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb1/igt@perf@polling-parameterized.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb6/igt@perf@polling-parameterized.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][31] -> [TIMEOUT][32] ([i915#2119])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb2/igt@perf@rc6-disable.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb1/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][33] -> [TIMEOUT][34] ([i915#2119])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw6/igt@perf@rc6-disable.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw6/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][35] -> [TIMEOUT][36] ([i915#2119])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl1/igt@perf@rc6-disable.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl4/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][37] -> [TIMEOUT][38] ([i915#1635] / [i915#2119])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl6/igt@perf@rc6-disable.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl6/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][39] -> [TIMEOUT][40] ([i915#2119])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb6/igt@perf@rc6-disable.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb6/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][41] -> [TIMEOUT][42] ([i915#2119])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk9/igt@perf@rc6-disable.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk1/igt@perf@rc6-disable.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#1820])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][45] ([i915#1930]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk9/igt@gem_exec_schedule@smoketest-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk6/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         [INCOMPLETE][49] ([i915#2045]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - shard-tglb:         [DMESG-WARN][51] ([i915#402]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb3/igt@kms_addfb_basic@invalid-set-prop.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb6/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-hsw:          [INCOMPLETE][55] ([CI#80]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [FAIL][57] ([IGT#5]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][61] ([i915#1635] / [i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][65] ([i915#2055]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_lease@multimaster-lease:
    - shard-hsw:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_lease@multimaster-lease.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw2/igt@kms_lease@multimaster-lease.html
    - shard-snb:          [TIMEOUT][71] ([i915#1958] / [i915#2119]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb4/igt@kms_lease@multimaster-lease.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb5/igt@kms_lease@multimaster-lease.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-hsw:          [SKIP][77] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][78] ([i915#1958] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_color_chamelium@pipe-b-gamma.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_color_chamelium@pipe-b-gamma.html
    - shard-snb:          [SKIP][79] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][80] ([i915#1958] / [i915#2119])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb6/igt@kms_color_chamelium@pipe-b-gamma.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][81] ([i915#1319] / [i915#2119]) -> [TIMEOUT][82] ([i915#1319] / [i915#1958] / [i915#2119])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl3/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][83] ([fdo#109349]) -> [DMESG-WARN][84] ([i915#1226])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
    - shard-snb:          [TIMEOUT][87] ([i915#1958] / [i915#2119]) -> [SKIP][88] ([fdo#109271])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [TIMEOUT][90] ([i915#1958] / [i915#2119]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb2/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_vblank@pipe-c-wait-forked-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5741 -> IGTPW_4782
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8768: cc11fe21674f094e902748b09efa4e87c8be434b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4782: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html
  IGT_5741: 96a8c8c1371995b73916989880b29b01f5657ba3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html

--===============8625539984465672725==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79695/">https://patchwork.freedesktop.org/series/79695/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8768_full -&gt; IGTPW_4782_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4782_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@perf@close-fd-and-access-oa-buffer} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@perf@close-fd-and-access-oa-buffer.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@triggered-oa-reports} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb3/igt@perf@triggered-oa-reports.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8768_full and IGTPW_4782_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@perf@close-fd-and-access-oa-buffer:</p>
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
<p>igt@perf@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<p>Here are the changes found in IGTPW_4782_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb8/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb8/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-legacy-gamma:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl7/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl6/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb5/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb7/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw4/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_vblank@pipe-c-wait-forked-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl7/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk3/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk7/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb8/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb1/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb6/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb2/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb1/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw6/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw6/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl1/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl4/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl6/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl6/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb6/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb6/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk9/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk1/igt@perf@rc6-disable.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk9/igt@gem_exec_schedule@smoketest-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk6/igt@gem_exec_schedule@smoketest-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2045">i915#2045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb2/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb3/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb6/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5">IGT#5</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_lease@multimaster-lease.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw2/igt@kms_lease@multimaster-lease.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb4/igt@kms_lease@multimaster-lease.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb5/igt@kms_lease@multimaster-lease.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_color_chamelium@pipe-b-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw1/igt@kms_color_chamelium@pipe-b-gamma.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb6/igt@kms_color_chamelium@pipe-b-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_color_chamelium@pipe-b-gamma.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-kbl3/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8768/shard-snb2/igt@kms_vblank@pipe-c-wait-forked-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/shard-snb1/igt@kms_vblank@pipe-c-wait-forked-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5741 -&gt; IGTPW_4782</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8768: cc11fe21674f094e902748b09efa4e87c8be434b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4782: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4782/index.html<br />
  IGT_5741: 96a8c8c1371995b73916989880b29b01f5657ba3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8625539984465672725==--

--===============1280728521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1280728521==--
