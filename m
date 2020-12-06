Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 06 Dec 2020 19:04:09 -0000
Message-ID: <160728144914.16271.16771770486276738390@emeril.freedesktop.org>
References: <20201206131724.264564-1-apoorva1.singh@intel.com>
In-Reply-To: <20201206131724.264564-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fselftest=3A_Add_subtests_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1545852148=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1545852148==
Content-Type: multipart/alternative;
 boundary="===============7151500912881411818=="

--===============7151500912881411818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_selftest: Add subtests description
URL   : https://patchwork.freedesktop.org/series/84616/
State : success

== Summary ==

CI Bug Log - changes from IGT_5882_full -> IGTPW_5253_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5253_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5253_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5253_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-hsw:          [SKIP][1] ([fdo#109271] / [fdo#111827]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@kms_chamelium@hdmi-crc-single.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw1/igt@kms_chamelium@hdmi-crc-single.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_exec@basic-close-race}:
    - shard-apl:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl2/igt@gem_ctx_exec@basic-close-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl7/igt@gem_ctx_exec@basic-close-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_5253_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#454])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb2/igt@i915_pm_rpm@cursor-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb2/igt@i915_pm_rpm@cursor-dpms.html
    - shard-kbl:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl1/igt@i915_pm_rpm@cursor-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl4/igt@i915_pm_rpm@cursor-dpms.html
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@i915_pm_rpm@cursor-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2/igt@i915_pm_rpm@cursor-dpms.html
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#579])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb1/igt@i915_pm_rpm@cursor-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155] / [i915#2295])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-iclb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1185] / [i915#2295])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-apl:          [PASS][19] -> [INCOMPLETE][20] ([i915#2295] / [i915#2635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2295] / [i915#2411] / [i915#456])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#2055] / [i915#2295] / [i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#2055] / [i915#2295] / [i915#2637])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#2055] / [i915#2295])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-128:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#2657])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk1/igt@kms_plane_cursor@pipe-b-overlay-size-128.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk9/igt@kms_plane_cursor@pipe-b-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@perf_pmu@rc6-runtime-pm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl3/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([fdo#111719])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([i915#293])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@perf_pmu@rc6-runtime-pm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb6/igt@perf_pmu@rc6-runtime-pm.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1602]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb5/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [INCOMPLETE][47] ([i915#2283] / [i915#2540]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@core_hotunplug@unbind-rebind.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl8/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [INCOMPLETE][49] ([i915#2283]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk1/igt@core_hotunplug@unbind-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk6/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [INCOMPLETE][51] ([i915#2283]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl1/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [INCOMPLETE][53] ([i915#2283]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@core_hotunplug@unbind-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [FAIL][55] ([i915#2389]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-snb:          [FAIL][57] ([i915#2389]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-snb2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2369] / [i915#2411] / [i915#456]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html
    - shard-iclb:         [INCOMPLETE][61] ([i915#1185] / [i915#1602] / [i915#2369]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb8/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - shard-iclb:         [FAIL][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
    - shard-tglb:         [FAIL][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
    - shard-kbl:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl6/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-glk:          [FAIL][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk4/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-glk:          [DMESG-WARN][77] ([i915#118] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:
    - shard-glk:          [FAIL][79] ([i915#70]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][81] ([i915#96]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][83] ([i915#2346]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][85] ([i915#2598]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][87] ([i915#2055]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - shard-glk:          [FAIL][91] ([i915#1036]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [INCOMPLETE][95] ([i915#2635]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-glk:          [INCOMPLETE][97] ([i915#2635]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-hsw:          [INCOMPLETE][99] ([i915#2055] / [i915#2637]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [INCOMPLETE][101] ([i915#155]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@testdisplay:
    - shard-kbl:          [DMESG-WARN][103] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@testdisplay.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl1/igt@testdisplay.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          [INCOMPLETE][105] ([i915#2283]) -> [WARN][106] ([i915#2283])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@core_hotunplug@unbind-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][107] ([i915#2684]) -> [WARN][108] ([i915#2681] / [i915#2684])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][109], [FAIL][110]) ([i915#2283] / [i915#2295]) -> [FAIL][111] ([i915#2295])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][112], [FAIL][113], [FAIL][114]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -> [FAIL][115] ([i915#2295] / [i915#2722] / [i915#483])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][116], [FAIL][117], [FAIL][118]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][119], [FAIL][120]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][121], [FAIL][122], [FAIL][123]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722]) -> ([FAIL][124], [FAIL][125], [FAIL][126]) ([i915#1814] / [i915#2295] / [i915#2722])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl1/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][130], [FAIL][131]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk1/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2540]: https://gitlab.freedesktop.org/drm/intel/issues/2540
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2657]: https://gitlab.freedesktop.org/drm/intel/issues/2657
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5882 -> IGTPW_5253

  CI-20190529: 20190529
  CI_DRM_9450: 83b8d6ab0631ef13a095c7818d3c2c40f52f42ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5253: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/index.html
  IGT_5882: 47f770e8e544831ae5a984b2083df73f71067762 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/index.html

--===============7151500912881411818==
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
<tr><td><b>Series:</b></td><td>i915/i915_selftest: Add subtests description=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84616/">https://patchwork.freedesktop.org/series/84616/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5253/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5253/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5882_full -&gt; IGTPW_5253_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5253_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5253_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5253=
_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@hdmi-crc-single:<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw1/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#1=
11827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5253/shard-hsw1/igt@kms_chamelium@hdmi-crc-single.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_ctx_exec@basic-close-race}:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-apl2/igt@gem_ctx_exec@basic-close-race.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl7/=
igt@gem_ctx_exec@basic-close-race.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5253_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb4/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb2/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb2/igt@i=
915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl1/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl4/igt@i91=
5_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw2/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2/igt@i91=
5_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb1/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb6/igt@i=
915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard=
-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a=
>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shar=
d-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard=
-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635<=
/a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shar=
d-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i9=
15#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard=
-glk4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915=
#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard=
-hsw6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915=
#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hd=
mi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5253/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5253/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2055">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indf=
b-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5253/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-of=
fscren-pri-indfb-draw-mmap-gtt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-128:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk1/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/=
shard-glk9/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2657">i915#2657</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb5/i=
gt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk2/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl3/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb2/igt@p=
erf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111719">fdo#111719</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb8/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-iclb6/igt@p=
erf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/293">i915#293</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/=
shard-tglb5/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2540">i915=
#2540</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5253/shard-apl8/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/s=
hard-glk6/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/s=
hard-kbl1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb8/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/=
shard-iclb1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#23=
89</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
3/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#23=
89</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
3/shard-snb2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i9=
15#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2369">i915#2369</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5253/shard-tglb8/igt@i915_pm_backlight@fade_w=
ith_suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i9=
15#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2369">i915#2369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5253/shard-iclb8/igt@i915_pm_backlight@fade_with_suspend.html=
">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-=
iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-=
tglb7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-hsw2=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl6=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl8=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-glk5=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_atomic_transition@1x-modeset-transitions-nonbl=
ocking.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5253/shard-glk4/igt@kms_atomic_transition@1x-modeset-transitions=
-nonblocking.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5253/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscre=
en.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/70"=
>i915#70</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5253/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5253/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/234=
6">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5253/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915=
#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5253/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i91=
5#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5253/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-gtt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5253/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
036">i915#1036</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5253/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe=
-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/sha=
rd-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5253/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5253/shard-glk5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/205=
5">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5253/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.=
html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155=
">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5253/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-kbl2/igt@testdisplay.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-kbl1/i=
gt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/=
shard-hsw2/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/sha=
rd-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
83">i915#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5253/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/602">i915#602</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882=
/shard-iclb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/sha=
rd-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5253/shard-iclb8/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#=
1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295"=
>i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5253/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/shard-apl4/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-glk1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/sh=
ard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5253/shard-glk6/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1=
814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?i=
d=3D202321">k.org#202321</a>)</p>
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
<li>IGT: IGT_5882 -&gt; IGTPW_5253</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9450: 83b8d6ab0631ef13a095c7818d3c2c40f52f42ce @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5253: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5253/index.htm=
l<br />
  IGT_5882: 47f770e8e544831ae5a984b2083df73f71067762 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7151500912881411818==--

--===============1545852148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1545852148==--
