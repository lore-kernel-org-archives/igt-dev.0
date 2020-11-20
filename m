Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Nov 2020 12:09:32 -0000
Message-ID: <160587417295.16282.8875591829190930325@emeril.freedesktop.org>
References: <20201120093646.1340401-1-mika.kahola@intel.com>
In-Reply-To: <20201120093646.1340401-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0901559403=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0901559403==
Content-Type: multipart/alternative;
 boundary="===============1637436838063389544=="

--===============1637436838063389544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test
URL   : https://patchwork.freedesktop.org/series/84095/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9367_full -> IGTPW_5200_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/index.html

Known issues
------------

  Here are the changes found in IGTPW_5200_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk5/igt@gem_exec_whisper@basic-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk8/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1635] / [i915#2635]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([CI#80])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#1982]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#96])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#1185]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2635]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk7/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#2637])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109278])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-apl:          [PASS][31] -> [SKIP][32] ([fdo#109271] / [i915#1635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#1542])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb5/igt@perf@polling-parameterized.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb4/igt@perf@polling-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982] / [i915#262])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb2/igt@perf_pmu@module-unload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb6/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][37] ([i915#2190]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][39] ([i915#1982]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb7/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][41] ([fdo#109271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-kbl:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [SKIP][45] ([fdo#109271] / [i915#1635]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-apl:          [DMESG-WARN][49] ([i915#1635] / [i915#1982]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][51] ([i915#96]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][53] ([i915#2370]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][59] ([i915#2637]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][61] ([i915#155]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [INCOMPLETE][63] ([i915#1185]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-apl:          [INCOMPLETE][65] ([i915#1635] / [i915#2635]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][67] ([i915#2635]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][71] ([i915#1542]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb2/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [DMESG-WARN][73] ([i915#2411]) -> [INCOMPLETE][74] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][75] ([i915#588]) -> [SKIP][76] ([i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][77] ([i915#579]) -> [SKIP][78] ([fdo#111644] / [i915#1397] / [i915#2411])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][79] ([i915#579]) -> [SKIP][80] ([fdo#110892])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][81] ([fdo#109506] / [i915#2411]) -> [SKIP][82] ([i915#579])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][83] ([fdo#109293] / [fdo#109506]) -> [SKIP][84] ([i915#579])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [DMESG-WARN][85] ([i915#2411]) -> [SKIP][86] ([i915#2648]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][87] ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456]) -> [DMESG-WARN][88] ([i915#2411])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][89], [FAIL][90]) ([i915#1814] / [i915#2295] / [i915#483] / [i915#602]) -> ([FAIL][91], [FAIL][92]) ([i915#2295] / [i915#92])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl7/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][93], [FAIL][94]) ([i915#1814] / [i915#2295] / [i915#483]) -> ([FAIL][95], [FAIL][96], [FAIL][97]) ([i915#2295] / [i915#483])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb5/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][98], [FAIL][99]) ([i915#1635] / [i915#1814] / [i915#2295]) -> ([FAIL][100], [FAIL][101], [FAIL][102]) ([fdo#109271] / [i915#1635] / [i915#2295])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl3/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][103], [FAIL][104]) ([i915#1814] / [i915#2295] / [k.org#202321]) -> ([FAIL][105], [FAIL][106], [FAIL][107]) ([i915#2295] / [k.org#202321])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk9/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk6/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk2/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5863 -> IGTPW_5200
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9367: ab86e9c56070fc3d27eabb564159a7a0a4b3265f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5200: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/index.html
  IGT_5863: 849de1780d33c6749e0a26dc3c642eb9b3d6cd42 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/index.html

--===============1637436838063389544==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: CCS Clear Color test</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84095/">https://patchwork.freedesktop.org/series/84095/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5200/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5200/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9367_full -&gt; IGTPW_5200_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5200_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-glk5/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-gl=
k8/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-apl1/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/=
shard-apl2/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i91=
5#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/=
shard-kbl1/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#=
80</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-hsw4/igt=
@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5200/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5200/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5200/shard-glk5/igt@kms_cursor_legacy@cursora-vs-fl=
ipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-iclb5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb8/=
igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) +1 similar issue</=
p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl7/ig=
t@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-glk7/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5200/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2635">i915#2635</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5200/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637=
">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5200/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/sh=
ard-kbl3/igt@kms_prime@basic-crc@second-to-first.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5200/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278=
">fdo#109278</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5200/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5200/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-iclb5/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb=
4/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-iclb2/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb6/ig=
t@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tg=
lb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb7/igt@i915_module_load@reload.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/s=
hard-tglb3/igt@i915_module_load@reload.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-hsw2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5200/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-kbl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5200/shard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5200/shard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5200/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5200/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-256x256=
-top-edge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5200/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i=
915#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5200/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5200/shard-iclb5/igt@kms_plane@plane-panning-b=
ottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5200/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-constant-=
alpha-min.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5200/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5200/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-sus=
pend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5200/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms=
-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5200/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-=
dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5200/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-kbl7/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5200/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +=
6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb2/igt@perf@polling-parameterized.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shar=
d-tglb2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5200/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/456">i915#456</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/s=
hard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#=
579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
00/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411"=
>i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#=
579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
00/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506"=
>fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5200/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
79">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9367/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293"=
>fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109506">fdo#109506</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5200/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5200/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-mode=
set-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2648">i915#2648</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-tglb1/igt@kms=
_vblank@pipe-b-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-kbl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/602">i915#602</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5200/shard-kbl7/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-k=
bl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-iclb7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5200/shard-iclb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-ic=
lb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5200/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#=
483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5200/shard-apl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-apl=
7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5200/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295"=
>i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9367/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9367/shard-glk6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5200/shard-glk1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/shard-=
glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5200/shard-glk2/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.or=
g#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5863 -&gt; IGTPW_5200</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9367: ab86e9c56070fc3d27eabb564159a7a0a4b3265f @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5200: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5200/index.htm=
l<br />
  IGT_5863: 849de1780d33c6749e0a26dc3c642eb9b3d6cd42 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1637436838063389544==--

--===============0901559403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0901559403==--
