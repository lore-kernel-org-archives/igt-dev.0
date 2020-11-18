Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Nov 2020 21:05:18 -0000
Message-ID: <160573351828.24803.10252275191508571026@emeril.freedesktop.org>
References: <20201118130742.2088282-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201118130742.2088282-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Remove_blacklisting_for_perf=5Fpmu/cpu-hotplug?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2043004474=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2043004474==
Content-Type: multipart/alternative;
 boundary="===============5154880318023709901=="

--===============5154880318023709901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Remove blacklisting for perf_pmu/cpu-hotplug
URL   : https://patchwork.freedesktop.org/series/84019/
State : success

== Summary ==

CI Bug Log - changes from IGT_5857_full -> IGTPW_5185_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/index.html

Known issues
------------

  Here are the changes found in IGTPW_5185_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#579])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#1982]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-180.html
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-snb4/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1635] / [i915#2405] / [i915#2635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#1185] / [i915#2405])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#2405] / [i915#2635])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2405] / [i915#2637])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155] / [i915#2405])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb6/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb6/igt@kms_setmode@basic.html

  * igt@prime_vgem@sync@rcs0:
    - shard-iclb:         [PASS][43] -> [INCOMPLETE][44] ([i915#409])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb1/igt@prime_vgem@sync@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb1/igt@prime_vgem@sync@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-hsw:          [INCOMPLETE][45] ([i915#1888]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-apl:          [SKIP][49] ([fdo#109271] / [i915#1635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl6/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-glk:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][53] ([i915#2521]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [FAIL][55] ([i915#2346]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-a-forked-bo:
    - shard-glk:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk3/igt@kms_cursor_legacy@pipe-a-forked-bo.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk7/igt@kms_cursor_legacy@pipe-a-forked-bo.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-dp1:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl8/igt@kms_flip@blocking-absolute-wf_vblank@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl2/igt@kms_flip@blocking-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#165]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-kbl:          [DMESG-WARN][73] ([i915#165] / [i915#78]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-glk:          [FAIL][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk7/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk2/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][79] ([i915#579]) -> [SKIP][80] ([fdo#111644] / [i915#1397] / [i915#2411])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][81] ([i915#579]) -> [SKIP][82] ([fdo#110892])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-tglb:         [DMESG-WARN][83] ([i915#2411]) -> [SKIP][84] ([i915#579])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][85] ([i915#2411]) -> [INCOMPLETE][86] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1226]) -> [SKIP][88] ([fdo#109349])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][89] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][90] ([i915#1611] / [i915#2295] / [i915#2439])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-kbl2/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         [FAIL][91] ([i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][92], [FAIL][93], [FAIL][94]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2439] / [i915#409] / [i915#483])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-iclb6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb8/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb8/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          [FAIL][95] ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439]) -> ([FAIL][96], [FAIL][97]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-apl4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl3/igt@runner@aborted.html
    - shard-glk:          [FAIL][98] ([i915#1611] / [i915#2295] / [i915#2439] / [k.org#202321]) -> ([FAIL][99], [FAIL][100]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-glk5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@runner@aborted.html
    - shard-tglb:         [FAIL][101] ([i915#2295] / [i915#2439]) -> ([FAIL][102], [FAIL][103]) ([i915#1602] / [i915#2295] / [i915#2439])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5857/shard-tglb2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb3/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5857 -> IGTPW_5185

  CI-20190529: 20190529
  CI_DRM_9351: b676373b31de969a7296a8eaecc8ceab600dd655 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/index.html
  IGT_5857: 0e3ec8945fd30fe8e4a38ec3d7acacc0268b225c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/index.html

--===============5154880318023709901==
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
<tr><td><b>Series:</b></td><td>intel-ci: Remove blacklisting for perf_pmu/c=
pu-hotplug</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84019/">https://patchwork.freedesktop.org/series/84019/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5185/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5185/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5857_full -&gt; IGTPW_5185_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5185_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/sha=
rd-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/sh=
ard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/=
igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-apl8/=
igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl1/=
igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-hsw4/=
igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb=
8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-ap=
l3/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +=
5 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-glk7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-gl=
k1/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 simi=
lar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-snb4/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5185/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard=
-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915=
#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shar=
d-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#240=
5</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard=
-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635<=
/a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard=
-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard=
-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5185/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdm=
i-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5185/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1=
-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi=
-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5185/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-h=
dmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5185/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb5=
/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-tglb6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb6/igt@kms_se=
tmode@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-iclb1/igt@prime_vgem@sync@rcs0.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb1/igt@pri=
me_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/409">i915#409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915=
#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5185/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-=
kbl2/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-apl3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/=
shard-apl6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-=
glk8/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5185/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-even=
ts.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i91=
5#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5185/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-a-forked-bo:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk3/igt@kms_cursor_legacy@pipe-a-forked-bo.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i91=
5#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5185/shard-glk7/igt@kms_cursor_legacy@pipe-a-forked-bo.html">PASS</a> +6 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdm=
i-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5185/shard-hsw4/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank@ab-vga1-hdmi-a1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-apl8/igt@kms_flip@blocking-absolute-wf_vblank@a-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5185/shard-apl2/igt@kms_flip@blocking-absolute-wf_vblank@a-d=
p1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/=
shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp=
1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/165">i915#165</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5185/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interru=
ptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb=
-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5185/shard-kbl2/igt@kms_frontbuffer_tracking@f=
bc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-iclb5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5185/shard-iclb6/igt@kms_frontbuffer_tracking@psr-indfb-sca=
ledprimary.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-tglb1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5185/shard-tglb2/igt@kms_frontbuffer_tracking@psr-modesetfrombu=
sy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#1=
65</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i91=
5#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
185/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb2=
/igt@kms_psr@psr2_no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-glk7/igt@sysfs_preempt_timeout@timeout@vecs0.html">FAIL</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard=
-glk2/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb=
3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111644">fdo#111644</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb=
6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2=
411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
85/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5185/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i=
915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5857/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#=
1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
185/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-kbl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shar=
d-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-iclb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-icl=
b8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5185/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-iclb1/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/s=
hard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5185/shard-apl3/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#=
1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
5/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5185/shard-glk4/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i9=
15#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
14">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2439">i915#2439</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5857/shard-tglb2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/shard-tglb3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5185/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i91=
5#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5857 -&gt; IGTPW_5185</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9351: b676373b31de969a7296a8eaecc8ceab600dd655 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5185/index.htm=
l<br />
  IGT_5857: 0e3ec8945fd30fe8e4a38ec3d7acacc0268b225c @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5154880318023709901==--

--===============2043004474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2043004474==--
