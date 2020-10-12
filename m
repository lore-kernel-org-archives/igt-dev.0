Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 12 Oct 2020 15:10:04 -0000
Message-ID: <160251540428.31908.6039293313511578362@emeril.freedesktop.org>
References: <20201012070537.11773-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201012070537.11773-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Restore_i915_debugfs_health_check_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1671551452=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1671551452==
Content-Type: multipart/alternative;
 boundary="===============3710091275383280939=="

--===============3710091275383280939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Restore i915 debugfs health check (rev2)
URL   : https://patchwork.freedesktop.org/series/82519/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9127_full -> IGTPW_5056_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5056_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw6/igt@core_hotunplug@hotrebind.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@core_hotunplug@hotrebind.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb5/igt@core_hotunplug@hotrebind.html
    - shard-snb:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb5/igt@core_hotunplug@hotrebind.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk7/igt@core_hotunplug@hotrebind.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@core_hotunplug@hotrebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind-lateclose}:
    - shard-snb:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-iclb:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb1/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-tglb:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb5/igt@core_hotunplug@hotrebind-lateclose.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb8/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk8/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-hsw:          [WARN][14] ([i915#2283]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@core_hotunplug@hotrebind-lateclose.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@core_hotunplug@hotrebind-lateclose.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9127_full and IGTPW_5056_full:

### New IGT tests (1) ###

  * igt@core_hotunplug@hotrebind:
    - Statuses : 7 fail(s)
    - Exec time: [0.41, 2.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_5056_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#1982]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2122])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb1/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][32] ([i915#2389]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][34] ([i915#1888] / [i915#2261]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_partial_pwrite_pread@reads.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][36] ([i915#2261]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-snb:          [INCOMPLETE][38] ([i915#82]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_render_copy@y-tiled:
    - shard-apl:          [FAIL][40] ([i915#1635] / [i915#2541]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl1/igt@gem_render_copy@y-tiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl2/igt@gem_render_copy@y-tiled.html
    - shard-kbl:          [FAIL][42] ([i915#2541]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@gem_render_copy@y-tiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl4/igt@gem_render_copy@y-tiled.html
    - shard-hsw:          [FAIL][44] ([i915#2541]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_render_copy@y-tiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw5/igt@gem_render_copy@y-tiled.html
    - shard-iclb:         [FAIL][46] ([i915#2541]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@gem_render_copy@y-tiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb2/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-tglb:         [FAIL][48] ([i915#2541]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][50] ([i915#155]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][52] ([i915#2521]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-tglb:         [FAIL][54] ([i915#2521]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-glk:          [DMESG-WARN][56] ([i915#1982]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][60] ([i915#2055]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][62] ([i915#1982]) -> [PASS][63] +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][64] ([i915#433]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         [DMESG-WARN][66] ([i915#1226]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][68] ([i915#1635] / [i915#31]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl6/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-query-busy:
    - shard-apl:          [DMESG-WARN][70] ([i915#1635] / [i915#1982]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl2/igt@kms_vblank@pipe-b-query-busy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl7/igt@kms_vblank@pipe-b-query-busy.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][72] ([i915#1982]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [SKIP][74] ([fdo#109271]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@perf@invalid-oa-exponent.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw8/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [SKIP][76] ([i915#405]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb3/igt@perf@invalid-oa-exponent.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb1/igt@perf@invalid-oa-exponent.html
    - shard-glk:          [SKIP][78] ([fdo#109271]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk5/igt@perf@invalid-oa-exponent.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk9/igt@perf@invalid-oa-exponent.html
    - shard-tglb:         [SKIP][80] ([i915#405]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@perf@invalid-oa-exponent.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb5/igt@perf@invalid-oa-exponent.html
    - shard-apl:          [SKIP][82] ([fdo#109271] / [i915#1635]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl4/igt@perf@invalid-oa-exponent.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl3/igt@perf@invalid-oa-exponent.html
    - shard-kbl:          [SKIP][84] ([fdo#109271]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@perf@invalid-oa-exponent.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl1/igt@perf@invalid-oa-exponent.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][86] ([i915#1542]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@perf@polling-parameterized.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb5/igt@perf@polling-parameterized.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [FAIL][88] ([i915#1722]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@perf@polling-small-buf.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb6/igt@perf@polling-small-buf.html

  * igt@perf_pmu@enable-race@vecs0:
    - shard-iclb:         [DMESG-WARN][90] ([i915#1982]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@perf_pmu@enable-race@vecs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb7/igt@perf_pmu@enable-race@vecs0.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-hsw:          [FAIL][92] ([i915#2541]) -> [SKIP][93] ([fdo#109271])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-kbl:          [FAIL][94] ([i915#2541]) -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-snb:          [FAIL][96] ([i915#2541]) -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-apl:          [FAIL][98] ([i915#1635] / [i915#2541]) -> [SKIP][99] ([fdo#109271] / [i915#1635])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-iclb:         [FAIL][100] ([i915#2541]) -> [SKIP][101] ([i915#768])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][102] ([i915#1611] / [i915#1814] / [k.org#202321]) -> [FAIL][103] ([i915#2439] / [k.org#202321])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#2553]: https://gitlab.freedesktop.org/drm/intel/issues/2553
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5810 -> IGTPW_5056
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9127: 7c595e4346b0b870bd8dff37fff8eaee914be1bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5056: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html
  IGT_5810: f78ce760920efb5015725c749f411c5724114bda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html

--===============3710091275383280939==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Restore i915 debugfs health check (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82519/">https://patchwork.freedesktop.org/series/82519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9127_full -&gt; IGTPW_5056_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5056_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind} (NEW):</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw6/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb5/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb5/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk7/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose}:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb5/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb8/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk8/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9127_full and IGTPW_5056_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@core_hotunplug@hotrebind:<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.41, 2.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5056_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb1/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_partial_pwrite_pread@reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@gem_partial_pwrite_pread@writes-after-reads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl1/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl2/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl4/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw5/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb2/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl7/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb7/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl2/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl2/igt@kms_vblank@pipe-b-query-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl7/igt@kms_vblank@pipe-b-query-busy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw8/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb3/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb1/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk5/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk9/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb5/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl4/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl3/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl1/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl1/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-tglb6/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-tglb5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb2/igt@perf_pmu@enable-race@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb7/igt@perf_pmu@enable-race@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-hsw8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-snb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9127/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/shard-glk6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5810 -&gt; IGTPW_5056</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9127: 7c595e4346b0b870bd8dff37fff8eaee914be1bb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5056: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5056/index.html<br />
  IGT_5810: f78ce760920efb5015725c749f411c5724114bda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3710091275383280939==--

--===============1671551452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1671551452==--
