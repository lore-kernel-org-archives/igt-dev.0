Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jul 2020 04:02:54 -0000
Message-ID: <159495857459.14916.15986145191296075586@emeril.freedesktop.org>
References: <20200717015419.37439-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200717015419.37439-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Sanity_check_reports_in_mapped_OA_buffer_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2129055104=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2129055104==
Content-Type: multipart/alternative;
 boundary="===============8757083273648621164=="

--===============8757083273648621164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf: Sanity check reports in mapped OA buffer (rev2)
URL   : https://patchwork.freedesktop.org/series/79459/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8759_full -> IGTPW_4773_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4773_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@mapped-oa-buffer} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb2/igt@perf@mapped-oa-buffer.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb4/igt@perf@mapped-oa-buffer.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8759_full and IGTPW_4773_full:

### New IGT tests (1) ###

  * igt@perf@mapped-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4773_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1436] / [i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb7/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb7/igt@i915_module_load@reload.html

  * igt@i915_selftest@mock@requests:
    - shard-apl:          [PASS][7] -> [INCOMPLETE][8] ([i915#1635] / [i915#2110])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl3/igt@i915_selftest@mock@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl2/igt@i915_selftest@mock@requests.html
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] ([i915#2110])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@i915_selftest@mock@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw6/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:
    - shard-snb:          [PASS][13] -> [TIMEOUT][14] ([i915#1958] / [i915#2119]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1911])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#1911])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][29] -> [TIMEOUT][30] ([i915#1635] / [i915#1958] / [i915#2119])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-glk:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [PASS][33] -> [TIMEOUT][34] ([i915#1958] / [i915#2119])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [PASS][35] -> [TIMEOUT][36] ([i915#1958] / [i915#2119])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][37] -> [TIMEOUT][38] ([i915#2119])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb2/igt@perf@rc6-disable.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb1/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][39] -> [TIMEOUT][40] ([i915#2119])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw1/igt@perf@rc6-disable.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw1/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][41] -> [TIMEOUT][42] ([i915#2119])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl2/igt@perf@rc6-disable.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][43] -> [TIMEOUT][44] ([i915#1635] / [i915#2119])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl4/igt@perf@rc6-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl3/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][45] -> [TIMEOUT][46] ([i915#2119])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb8/igt@perf@rc6-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb1/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][47] -> [TIMEOUT][48] ([i915#2119])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk4/igt@perf@rc6-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk5/igt@perf@rc6-disable.html

  * igt@syncobj_wait@invalid-reset-one-illegal-handle:
    - shard-hsw:          [PASS][49] -> [TIMEOUT][50] ([i915#1958] / [i915#2119]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw1/igt@syncobj_wait@invalid-reset-one-illegal-handle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw6/igt@syncobj_wait@invalid-reset-one-illegal-handle.html

  
#### Possible fixes ####

  * igt@dumb_buffer@map-invalid-size:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@dumb_buffer@map-invalid-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw2/igt@dumb_buffer@map-invalid-size.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [FAIL][53] ([i915#2079]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl2/igt@gem_exec_balancer@bonded-early.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_params@sol-reset-not-gen7:
    - shard-tglb:         [DMESG-WARN][55] ([i915#402]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb1/igt@gem_exec_params@sol-reset-not-gen7.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb2/igt@gem_exec_params@sol-reset-not-gen7.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#118] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk7/igt@gem_exec_whisper@basic-queues-all.html

  * {igt@gem_huc_copy@huc-copy}:
    - shard-tglb:         [SKIP][59] ([i915#2190]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][61] ([i915#118] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][63] ([i915#1635] / [i915#1982]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-snb:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-tglb2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw7/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw1/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][79] ([i915#1542]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb4/igt@perf@blocking-parameterized.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb6/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@busy-idle@rcs0:
    - shard-snb:          [FAIL][81] ([i915#1958]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb2/igt@perf_pmu@busy-idle@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb2/igt@perf_pmu@busy-idle@rcs0.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-hsw:          [FAIL][83] ([i915#1958]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@perf_pmu@busy-idle@vcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw2/igt@perf_pmu@busy-idle@vcs0.html
    - shard-snb:          [INCOMPLETE][85] ([i915#2119] / [i915#82]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb2/igt@perf_pmu@busy-idle@vcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb2/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@busy-idle@vecs0:
    - shard-hsw:          [DMESG-FAIL][87] ([i915#2119]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@perf_pmu@busy-idle@vecs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw2/igt@perf_pmu@busy-idle@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][89] ([i915#2021]) -> [WARN][90] ([i915#2036])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958] / [i915#2119]) -> [SKIP][92] ([fdo#109271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
    - shard-snb:          [TIMEOUT][93] ([i915#1958] / [i915#2119]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][95] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][96] ([i915#1319] / [i915#2119])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl4/igt@kms_content_protection@srm.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][99] ([fdo#109349]) -> [DMESG-WARN][100] ([i915#1226])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][101] ([i915#1982]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958] / [i915#2119]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-snb6/igt@kms_plane_lowres@pipe-d-tiling-y.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-snb5/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110]) ([i915#1436] / [i915#1784] / [i915#2110]) -> ([FAIL][111], [FAIL][112]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl7/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl3/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][113], [FAIL][114]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][115] ([i915#1635] / [i915#2110])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5738 -> IGTPW_4773
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8759: 9136d875406863759c4c7939f4b32edf7d76b007 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4773: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/index.html
  IGT_5738: bc8b56fe177af34fbde7b96f1f66614a0014c6ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/index.html

--===============8757083273648621164==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/perf: Sanity check reports in mapped OA=
 buffer (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79459/">https://patchwork.freedesktop.org/series/79459/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4773/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4773/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8759_full -&gt; IGTPW_4773_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4773=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@perf@mapped-oa-buffer} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4773/shard-tglb2/igt@perf@mapped-oa-buffer.html">SKIP</a=
></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4773/shard-iclb4/igt@perf@mapped-oa-buffer.html">SKIP</a=
></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8759_full and IGTPW_4773_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@perf@mapped-oa-buffer:<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4773_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl6=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-tglb7/igt@i915_module_load@reload.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb7/i=
gt@i915_module_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@requests:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-apl3/igt@i915_selftest@mock@requests.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl2/=
igt@i915_selftest@mock@requests.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-hsw2/igt@i915_selftest@mock@requests.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw6/=
igt@i915_selftest@mock@requests.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shar=
d-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-moveme=
nt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4773/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movemen=
t.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4773/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
773/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4773/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-tglb3/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb6/ig=
t@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb2/ig=
t@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb=
4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
773/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i91=
5#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-apl8/igt@perf@gen8-unprivileged-single-ctx-counters.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
773/shard-apl2/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915=
#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958=
">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
773/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915=
#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119=
">i915#2119</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4773/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEO=
UT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i9=
15#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/21=
19">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
773/shard-kbl1/igt@perf@gen8-unprivileged-single-ctx-counters.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915=
#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119=
">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-iclb2/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-iclb1/igt@per=
f@rc6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-hsw1/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw1/igt@perf@rc=
6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-kbl2/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@perf@rc=
6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-apl4/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-apl3/igt@perf@rc=
6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-tglb8/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb1/igt@per=
f@rc6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-glk4/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-glk5/igt@perf@rc=
6-disable.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-reset-one-illegal-handle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-hsw1/igt@syncobj_wait@invalid-reset-one-illegal-handle.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4773/shard-hsw6/igt@syncobj_wait@invalid-reset-one-illegal-handle.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/195=
8">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dumb_buffer@map-invalid-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-hsw2/igt@dumb_buffer@map-invalid-size.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i91=
5#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4773/shard-hsw2/igt@dumb_buffer@map-invalid-size.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-early:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl2/igt@gem_exec_balancer@bonded-early.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2079">i915#2079<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/s=
hard-kbl7/igt@gem_exec_balancer@bonded-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@sol-reset-not-gen7:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-tglb1/igt@gem_exec_params@sol-reset-not-gen7.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">=
i915#402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4773/shard-tglb2/igt@gem_exec_params@sol-reset-not-gen7.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95"=
>i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4773/shard-glk7/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> +1 =
similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_huc_copy@huc-copy}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tg=
lb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4773/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_4773/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS<=
/a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4773/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4773/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a>=
 +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transit=
ions.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4773/shard-snb4/igt@kms_cursor_legacy@flip-vs-curso=
r-atomic-transitions.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-tglb2/igt@kms_cursor_legacy@short-flip-after-cursor-atom=
ic-transitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_4773/shard-tglb8/igt@kms_cursor_legacy@short=
-flip-after-cursor-atomic-transitions.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4773/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-hsw7/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hsw1/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-iclb4/igt@perf@blocking-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/sha=
rd-iclb6/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@rcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-snb2/igt@perf_pmu@busy-idle@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-sn=
b2/igt@perf_pmu@busy-idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-hsw2/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-hs=
w2/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-snb2/igt@perf_pmu@busy-idle@vcs0.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/s=
hard-snb2/igt@perf_pmu@busy-idle@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vecs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-hsw2/igt@perf_pmu@busy-idle@vecs0.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/s=
hard-hsw2/igt@perf_pmu@busy-idle@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2021">i91=
5#2021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4773/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-hsw2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1=
958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">=
i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4773/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a>)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8759/shard-snb2/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1=
958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">=
i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4773/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl4/igt@kms_content_protection@srm.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#=
1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119"=
>i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4773/shard-kbl2/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#211=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4773/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscr=
een.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
73/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4773/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-snb6/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
73/shard-snb5/igt@kms_plane_lowres@pipe-d-tiling-y.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8759/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_87=
59/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-kbl2/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">=
i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1784">i915#1784</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2110">i915#2110</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4773/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/shard-kbl7/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1784">i915#1784</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8759/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8759/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2110">i915#2110</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_4773/shard-apl2/igt@runner@aborted.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#163=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i9=
15#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5738 -&gt; IGTPW_4773</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8759: 9136d875406863759c4c7939f4b32edf7d76b007 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4773: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4773/index.htm=
l<br />
  IGT_5738: bc8b56fe177af34fbde7b96f1f66614a0014c6ef @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8757083273648621164==--

--===============2129055104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2129055104==--
