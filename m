Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 Jan 2021 16:13:28 -0000
Message-ID: <161115920863.8788.13141374664868527893@emeril.freedesktop.org>
References: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Reduce_debug_noise_on_stdout?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1450077969=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1450077969==
Content-Type: multipart/alternative;
 boundary="===============4506960289767951327=="

--===============4506960289767951327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Reduce debug noise on stdout
URL   : https://patchwork.freedesktop.org/series/86032/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9640_full -> IGTPW_5402_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html

Known issues
------------

  Here are the changes found in IGTPW_5402_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][2] -> [FAIL][3] ([i915#2846])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][4] -> [FAIL][5] ([i915#2842])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2389]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#2389])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-hsw:          NOTRUN -> [FAIL][13] ([i915#2389]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#118] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_pread@exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][16] ([i915#2658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#768])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271]) +31 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#110426] / [i915#1704])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110426] / [i915#1704])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb4/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1436] / [i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][24] -> [INCOMPLETE][25] ([i915#2880])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111644] / [i915#1397] / [i915#2411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-kbl:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl7/igt@i915_pm_rpm@pm-tiling.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@i915_pm_rpm@pm-tiling.html
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#579])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk2/igt@i915_pm_rpm@pm-tiling.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#579])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@live@active:
    - shard-iclb:         [PASS][37] -> [DMESG-FAIL][38] ([i915#2291])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb8/igt@i915_selftest@live@active.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@i915_selftest@live@active.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@kms_ccs@pipe-d-missing-ccs-buffer.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_chamelium@dp-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@kms_chamelium@dp-frame-dump.html
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_chamelium@dp-frame-dump.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_chamelium@dp-frame-dump.html
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#2964]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#2964]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#2964])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk8/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk1/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-hsw:          [PASS][52] -> [FAIL][53] ([i915#2964])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111828])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111825]) +12 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#109278])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][59] -> [INCOMPLETE][60] ([i915#1185])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglb:         [PASS][61] -> [INCOMPLETE][62] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb6/igt@kms_fbcon_fbt@psr-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][63] -> [INCOMPLETE][64] ([i915#2055] / [i915#2295])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][65] -> [INCOMPLETE][66] ([i915#155])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [PASS][67] -> [DMESG-WARN][68] ([i915#2635])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          NOTRUN -> [SKIP][69] ([fdo#109271]) +213 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][72] -> [INCOMPLETE][73] ([i915#155] / [i915#2828])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
    - shard-apl:          [PASS][74] -> [DMESG-FAIL][75] ([i915#1188])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-glk:          [PASS][76] -> [DMESG-WARN][77] ([i915#2635]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk4/igt@kms_hdr@bpc-switch-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html
    - shard-iclb:         [PASS][78] -> [DMESG-WARN][79] ([i915#1602])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-hsw:          [PASS][80] -> [DMESG-WARN][81] ([i915#2637])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw7/igt@kms_hdr@bpc-switch-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-tglb:         [PASS][82] -> [DMESG-WARN][83] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@kms_hdr@bpc-switch-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109289])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#533])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][88] ([i915#2637])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2920])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109441]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2530])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109291]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb3/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][95], [FAIL][96]) ([fdo#109271] / [i915#2295] / [i915#2505])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [TIMEOUT][97] ([i915#2918]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@waits:
    - shard-tglb:         [INCOMPLETE][99] ([i915#2931]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb6/igt@gem_exec_balancer@waits.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@gem_exec_balancer@waits.html

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-iclb:         [INCOMPLETE][101] -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb4/igt@gem_exec_endless@dispatch@vcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb1/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][103] -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [FAIL][105] ([i915#2842]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][107] ([i915#2842]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][109] ([i915#454]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][111] ([i915#2598]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [PASS][116] +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-hsw:          [INCOMPLETE][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@tools_test@sysfs_l3_parity.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw4/igt@tools_test@sysfs_l3_parity.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][121] ([i915#2842]) -> [FAIL][122] ([i915#2852])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][123] ([i915#1804] / [i915#2684]) -> [WARN][124] ([i915#2681] / [i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][125] ([i915#2920]) -> [SKIP][126] ([i915#658])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][127] ([i915#658]) -> [SKIP][128] ([i915#2920]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][129] ([i915#2295] / [i915#2724]) -> ([FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2724])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          [FAIL][133] ([i915#2295]) -> ([FAIL][134], [FAIL][135], [FAIL][136]) ([fdo#109271] / [i915#1814] / [i915#2295])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl3/igt@runner@aborted.html
    - shard-glk:          [FAIL][137] ([i915#2295] / [k.org#202321]) -> ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         [FAIL][142] ([i915#2295] / [i915#2667]) -> ([FAIL][143], [FAIL][144], [FAIL][145]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2667])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110426]: https://bugs.freedesktop.org/show_bug.cgi?id=110426
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2828]: https://gitlab.freedesktop.org/drm/intel/issues/2828
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2880]: https://gitlab.freedesktop.org/drm/intel/issues/2880
  [i915#2918]: https://gitlab.freedesktop.org/drm/intel/issues/2918
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2931]: https://gitlab.freedesktop.org/drm/intel/issues/2931
  [i915#2964]: https://gitlab.freedesktop.org/drm/i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html

--===============4506960289767951327==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Reduce debug noise on stdout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86032/">https://patchwork.freedesktop.org/series/86032/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9640_full -&gt; IGTPW_5402_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5402_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +4 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110426">fdo#110426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb4/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110426">fdo#110426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2880">i915#2880</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl7/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb8/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@kms_ccs@pipe-d-missing-ccs-buffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i">i915#2964</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i">i915#2964</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk8/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk1/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i">i915#2964</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i">i915#2964</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111828">fdo#111828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +213 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2828">i915#2828</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb3/igt@prime_nv_test@i915_blt_fill_nv_read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2918">i915#2918</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@waits:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb6/igt@gem_exec_balancer@waits.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2931">i915#2931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@gem_exec_balancer@waits.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb4/igt@gem_exec_endless@dispatch@vcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb1/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-hsw4/igt@tools_test@sysfs_l3_parity.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw4/igt@tools_test@sysfs_l3_parity.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-iclb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-apl2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-glk7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>)</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4506960289767951327==--

--===============1450077969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1450077969==--
