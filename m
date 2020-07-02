Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 13:49:06 -0000
Message-ID: <159369774687.5657.5741988237130225984@emeril.freedesktop.org>
References: <20200702091407.25393-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200702091407.25393-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test?=
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

Series: Add api_intel_bb test
URL   : https://patchwork.freedesktop.org/series/79038/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8692_full -> IGTPW_4728_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4728_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4728_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4728_full:

### IGT changes ###

#### Warnings ####

  * igt@perf@blocking-parameterized:
    - shard-hsw:          [FAIL][1] ([i915#1542]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw2/igt@perf@blocking-parameterized.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw1/igt@perf@blocking-parameterized.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8692_full and IGTPW_4728_full:

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
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 7 pass(s)
    - Exec time: [2.75, 5.04] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 7 pass(s)
    - Exec time: [2.56, 4.68] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [2.84, 4.61] s

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

  Here are the changes found in IGTPW_4728_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-10ms:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1226])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-iclb7/igt@gem_eio@in-flight-10ms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-iclb2/igt@gem_eio@in-flight-10ms.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +31 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl1/igt@gem_exec_schedule@semaphore-codependency.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl3/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk6/igt@gem_exec_whisper@basic-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk4/igt@gem_exec_whisper@basic-forked.html

  * igt@i915_selftest@mock@requests:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] ([i915#2110])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw6/igt@i915_selftest@mock@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw2/igt@i915_selftest@mock@requests.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#129])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl2/igt@kms_color@pipe-c-ctm-green-to-red.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl4/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +27 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#1928])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb5/igt@kms_getfb@getfb2-handle-zero.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb7/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl6/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([IGT#2])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-iclb1/igt@kms_sysfs_edid_timing.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-iclb2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([i915#155])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_mmap@test_errors:
    - shard-snb:          [PASS][43] -> [TIMEOUT][44] ([i915#1958] / [i915#2119])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-snb6/igt@prime_mmap@test_errors.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-snb2/igt@prime_mmap@test_errors.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][45] ([i915#1930]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#95]) -> [PASS][48] +28 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl6/igt@gem_exec_whisper@basic-queues-priority.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl1/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_vm_create@invalid-create:
    - shard-tglb:         [DMESG-WARN][49] ([i915#402]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb7/igt@gem_vm_create@invalid-create.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb8/igt@gem_vm_create@invalid-create.html

  * igt@i915_hangman@error-state-basic:
    - shard-kbl:          [DMESG-WARN][51] ([i915#93] / [i915#95]) -> [PASS][52] +38 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl4/igt@i915_hangman@error-state-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl6/igt@i915_hangman@error-state-basic.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][55] ([i915#1149]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb2/igt@kms_color@pipe-a-gamma.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb7/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][63] ([i915#433]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][67] ([fdo#108145] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][69] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_vblank@pipe-a-ts-continuation-idle:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-idle.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-idle.html

  * igt@perf_pmu@enable-race@bcs0:
    - shard-glk:          [DMESG-WARN][77] ([i915#118] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-glk6/igt@perf_pmu@enable-race@bcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-glk5/igt@perf_pmu@enable-race@bcs0.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][79] ([i915#1820]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][81] ([i915#1930]) -> [TIMEOUT][82] ([i915#1958] / [i915#2119])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-snb:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-snb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-snb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [TIMEOUT][86] ([i915#1958] / [i915#2119])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          [SKIP][87] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][88] ([fdo#109271] / [fdo#111827])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl4/igt@kms_chamelium@hdmi-hpd-storm.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl3/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          [SKIP][89] ([fdo#109271] / [fdo#111827]) -> [SKIP][90] ([fdo#109271] / [fdo#111827] / [i915#1635]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][91] ([i915#1319] / [i915#2119]) -> [TIMEOUT][92] ([i915#1319] / [i915#1958] / [i915#2119])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][93] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][94] ([i915#1319] / [i915#2119])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl1/igt@kms_content_protection@lic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [i915#1635]) -> [SKIP][96] ([fdo#109271]) +15 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl1/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958] / [i915#2119]) -> [SKIP][98] ([fdo#109271]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#93] / [i915#95]) -> [DMESG-WARN][100] ([i915#180] / [i915#93] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-apl:          [SKIP][101] ([fdo#109271]) -> [SKIP][102] ([fdo#109271] / [i915#1635]) +11 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][103] ([i915#2110]) -> [FAIL][104] ([i915#1436] / [i915#2110])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8692/shard-hsw6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/shard-hsw2/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5720 -> IGTPW_4728
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8692: e30abe29fd5407631a61d48f93bad5fdeba8080d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4728: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/index.html
  IGT_5720: f35053d4b6d7bbcf6505ef67a8bd56acc7fb2eb2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4728/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
