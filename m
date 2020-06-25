Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Jun 2020 10:10:14 -0000
Message-ID: <159307981471.3272.5347065561635706502@emeril.freedesktop.org>
References: <20200625050738.8166-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200625050738.8166-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev6=29?=
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

Series: Add api_intel_bb test (rev6)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8663_full -> IGTPW_4702_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8663_full and IGTPW_4702_full:

### New IGT tests (8) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
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
    - Exec time: [0.06, 0.19] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4702_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@idempotent:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] ([i915#1958]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw5/igt@gem_ctx_engines@idempotent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw6/igt@gem_ctx_engines@idempotent.html
    - shard-apl:          [PASS][3] -> [TIMEOUT][4] ([i915#1635] / [i915#1958]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl7/igt@gem_ctx_engines@idempotent.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl1/igt@gem_ctx_engines@idempotent.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1930])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk6/igt@gem_exec_whisper@basic-fds-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@kms_atomic@plane-primary-legacy:
    - shard-snb:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-snb5/igt@kms_atomic@plane-primary-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-snb1/igt@kms_atomic@plane-primary-legacy.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb1/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#95]) +35 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#1635] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +7 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#93] / [i915#95]) +48 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#402]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#433])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([IGT#2])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl7/igt@kms_sysfs_edid_timing.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([IGT#2])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl1/igt@kms_sysfs_edid_timing.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@global-sseu-config-invalid:
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw6/igt@perf@global-sseu-config-invalid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw4/igt@perf@global-sseu-config-invalid.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1354]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb3/igt@perf@global-sseu-config-invalid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb3/igt@perf@global-sseu-config-invalid.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk1/igt@perf@global-sseu-config-invalid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk8/igt@perf@global-sseu-config-invalid.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl1/igt@perf@global-sseu-config-invalid.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl8/igt@perf@global-sseu-config-invalid.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#1354])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb5/igt@perf@global-sseu-config-invalid.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb5/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl4/igt@perf@mi-rpc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl4/igt@perf@mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-iclb:         [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_balancer@sliced:
    - shard-tglb:         [TIMEOUT][53] ([i915#1936] / [i915#1958]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb8/igt@gem_exec_balancer@sliced.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb6/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][55] ([i915#118] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk7/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw1/igt@gem_shrink@reclaim.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw5/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][61] ([i915#1904]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][63] ([i915#93] / [i915#95]) -> [PASS][64] +40 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-rapid-movement:
    - shard-tglb:         [TIMEOUT][67] -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-64x64-rapid-movement.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-64x64-rapid-movement.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][73] ([i915#2055]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][79] ([i915#1958]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-snb6/igt@kms_invalid_dotclock.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-snb4/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][83] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-glk3/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-glk5/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][89] ([i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl3/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb5/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#95]) -> [PASS][94] +26 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][95] ([i915#1542]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-iclb1/igt@perf@blocking-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][97] ([i915#1820]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_vgem@basic-blt:
    - shard-tglb:         [DMESG-WARN][99] ([i915#402]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb7/igt@prime_vgem@basic-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb3/igt@prime_vgem@basic-blt.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [INCOMPLETE][101] ([i915#1635] / [i915#1958]) -> [TIMEOUT][102] ([i915#1635] / [i915#1958])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl7/igt@gem_exec_reloc@basic-concurrent16.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][103] ([i915#454]) -> [SKIP][104] ([i915#468])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][105] ([i915#1958]) -> [SKIP][106] ([fdo#109271]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][108] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [fdo#111827]) -> [SKIP][110] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-negative.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][111] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][112] ([fdo#110321] / [i915#1635] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl1/igt@kms_content_protection@atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#1635]) +14 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [i915#1635]) -> [SKIP][118] ([fdo#109271]) +8 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-hsw:          [SKIP][119] ([fdo#109271]) -> [TIMEOUT][120] ([i915#1958]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-hsw6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [SKIP][121] ([fdo#109271]) -> [TIMEOUT][122] ([i915#1635] / [i915#1958]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-apl1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-snb:          [SKIP][123] ([fdo#109271]) -> [TIMEOUT][124] ([i915#1958]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@perf@mi-rpc:
    - shard-tglb:         [SKIP][125] ([fdo#109289]) -> [SKIP][126] ([i915#1354])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8663/shard-tglb7/igt@perf@mi-rpc.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/shard-tglb5/igt@perf@mi-rpc.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1936]: https://gitlab.freedesktop.org/drm/intel/issues/1936
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4702
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8663: f07f381b14117703b40bd09855026128715d5b10 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4702: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4702/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
