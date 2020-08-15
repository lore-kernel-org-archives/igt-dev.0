Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 15 Aug 2020 13:51:59 -0000
Message-ID: <159749951947.21106.17896166953446178977@emeril.freedesktop.org>
References: <20200815051637.2719528-1-kunal1.joshi@intel.com>
In-Reply-To: <20200815051637.2719528-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCB0?=
 =?utf-8?q?iled_display_with_aid_of_chamelium=2E_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2101115726=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2101115726==
Content-Type: multipart/alternative;
 boundary="===============5557377240938523255=="

--===============5557377240938523255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test tiled display with aid of chamelium. (rev3)
URL   : https://patchwork.freedesktop.org/series/71393/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8883_full -> IGTPW_4880_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4880_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4880_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4880_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk6/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-snb:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-hsw:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-kbl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-hsw:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw6/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw2/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  
#### Warnings ####

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         [SKIP][8] ([i915#426]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         [SKIP][10] ([i915#426]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8883_full and IGTPW_4880_full:

### New IGT tests (1) ###

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - Statuses : 6 fail(s)
    - Exec time: [0.03, 0.09] s

  

Known issues
------------

  Here are the changes found in IGTPW_4880_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([i915#155])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#118] / [i915#95]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [PASS][16] -> [WARN][17] ([i915#1515])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-hsw:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw7/igt@i915_pm_rpm@system-suspend-devices.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +7 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#79])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][24] -> [DMESG-WARN][25] ([i915#1982])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1982])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb4/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#31])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#43])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk2/igt@kms_vblank@pipe-a-accuracy-idle.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][34] -> [INCOMPLETE][35] ([i915#1602] / [i915#1887])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [DMESG-WARN][36] ([i915#118] / [i915#95]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk5/igt@gem_ctx_shared@q-smoketest-all.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [FAIL][38] ([i915#2079]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@gem_exec_balancer@bonded-early.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl4/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-snb:          [TIMEOUT][40] ([i915#1958]) -> [PASS][41] +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@gem_exec_suspend@basic-s3.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][42] ([i915#118] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][44] ([i915#180]) -> [PASS][45] +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [DMESG-FAIL][46] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][48] ([i915#2122]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][50] ([i915#1982]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][52] ([i915#155]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][54] ([i915#1982]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [DMESG-WARN][56] ([i915#1982]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][58] ([fdo#109642] / [fdo#111068]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-apl:          [DMESG-WARN][62] ([i915#1635] / [i915#1982]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-apl8/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-apl2/igt@kms_vblank@pipe-c-wait-forked-hang.html

  * igt@perf@oa-exponents:
    - shard-hsw:          [INCOMPLETE][64] ([i915#1958]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw8/igt@perf@oa-exponents.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw8/igt@perf@oa-exponents.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [FAIL][66] ([i915#2258]) -> [PASS][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw7/igt@prime_busy@after-wait@vcs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw1/igt@prime_busy@after-wait@vcs0.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-snb:          [TIMEOUT][68] ([i915#1958]) -> [SKIP][69] ([fdo#109271]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][70] ([i915#165] / [i915#180]) -> [DMESG-WARN][71] ([i915#180])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_vblank@pipe-d-query-forked-busy-hang:
    - shard-snb:          [SKIP][72] ([fdo#109271]) -> [TIMEOUT][73] ([i915#1958]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy-hang.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy-hang.html
    - shard-hsw:          [SKIP][74] ([fdo#109271]) -> [TIMEOUT][75] ([i915#1958]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw4/igt@kms_vblank@pipe-d-query-forked-busy-hang.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@kms_vblank@pipe-d-query-forked-busy-hang.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][76], [FAIL][77]) ([i915#1958] / [i915#2283]) -> [FAIL][78] ([i915#2283])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw2/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw8/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4880
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8883: 05754d34c9d009e22abf3c4d0324372f2448ac12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4880: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html

--===============5557377240938523255==
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
<tr><td><b>Series:</b></td><td>Test tiled display with aid of chamelium. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/71393/">https://patchwork.freedesktop.org/series/71393/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8883_full -&gt; IGTPW_4880_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4880_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4880_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4880_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk6/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw6/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw2/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/426">i915#426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/426">i915#426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8883_full and IGTPW_4880_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.03, 0.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4880_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw7/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb4/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk2/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk5/igt@gem_ctx_shared@q-smoketest-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-early:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@gem_exec_balancer@bonded-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2079">i915#2079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl4/igt@gem_exec_balancer@bonded-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb4/igt@gem_exec_suspend@basic-s3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/70">i915#70</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-glk1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-128:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-128.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-apl8/igt@kms_vblank@pipe-c-wait-forked-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-apl2/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw8/igt@perf@oa-exponents.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw8/igt@perf@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw7/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw1/igt@prime_busy@after-wait@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb5/igt@gem_exec_schedule@preemptive-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-busy-hang:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw4/igt@kms_vblank@pipe-d-query-forked-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw4/igt@kms_vblank@pipe-d-query-forked-busy-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8883/shard-hsw8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
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
<li>IGT: IGT_5769 -&gt; IGTPW_4880</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8883: 05754d34c9d009e22abf3c4d0324372f2448ac12 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4880: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4880/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5557377240938523255==--

--===============2101115726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2101115726==--
