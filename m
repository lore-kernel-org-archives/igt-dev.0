Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jul 2020 18:19:55 -0000
Message-ID: <159492359516.25377.3993088909685521162@emeril.freedesktop.org>
References: <20200716141557.15909-1-anshuman.gupta@intel.com>
In-Reply-To: <20200716141557.15909-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Flpsp=3A_Add_igt=5Fwait_to_test_lpsp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0305427021=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0305427021==
Content-Type: multipart/alternative;
 boundary="===============3857920025950308302=="

--===============3857920025950308302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_lpsp: Add igt_wait to test lpsp
URL   : https://patchwork.freedesktop.org/series/79557/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8754_full -> IGTPW_4771_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4771_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4771_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4771_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html

  
#### Warnings ####

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-kbl:          [SKIP][3] ([fdo#109271] / [fdo#111827]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl2/igt@kms_chamelium@dp-hpd-storm-disable.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl6/igt@kms_chamelium@dp-hpd-storm-disable.html

  
Known issues
------------

  Here are the changes found in IGTPW_4771_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-internal-1us:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw7/igt@gem_eio@in-flight-internal-1us.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@gem_eio@in-flight-internal-1us.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk7/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_gpgpu_fill:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb6/igt@gem_gpgpu_fill.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb6/igt@gem_gpgpu_fill.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          [PASS][19] -> [INCOMPLETE][20] ([i915#82])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1635] / [i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * igt@dumb_buffer@map-invalid-size:
    - shard-hsw:          [TIMEOUT][33] ([i915#1958] / [i915#2119]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@dumb_buffer@map-invalid-size.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw2/igt@dumb_buffer@map-invalid-size.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-glk:          [FAIL][35] ([i915#1528]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk5/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_parallel@fds@rcs0:
    - shard-iclb:         [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb6/igt@gem_exec_parallel@fds@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@gem_exec_parallel@fds@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-glk:          [DMESG-FAIL][41] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-snb:          [TIMEOUT][43] ([i915#1958] / [i915#2119]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-WARN][47] ([i915#1982]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][51] ([i915#31]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl3/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-busy:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@kms_vblank@pipe-a-query-forked-busy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb6/igt@kms_vblank@pipe-a-query-forked-busy.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-kbl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl7/igt@kms_vblank@pipe-c-wait-busy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy.html

  * igt@perf_pmu@busy-idle@rcs0:
    - shard-snb:          [FAIL][57] -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@perf_pmu@busy-idle@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb6/igt@perf_pmu@busy-idle@rcs0.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-hsw:          [FAIL][59] -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@perf_pmu@busy-idle@vcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@perf_pmu@busy-idle@vcs0.html
    - shard-snb:          [INCOMPLETE][61] ([i915#2119] / [i915#82]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@perf_pmu@busy-idle@vcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb6/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@busy-idle@vecs0:
    - shard-hsw:          [DMESG-FAIL][63] ([i915#2119]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@perf_pmu@busy-idle@vecs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@perf_pmu@busy-idle@vecs0.html

  
#### Warnings ####

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [INCOMPLETE][66] ([i915#155])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo:
    - shard-hsw:          [TIMEOUT][67] ([i915#1958] / [i915#2119]) -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
    - shard-snb:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [SKIP][70] ([fdo#109271]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-snb:          [SKIP][71] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][72] ([i915#1958] / [i915#2119])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb6/igt@kms_color_chamelium@pipe-d-degamma.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-hsw:          [SKIP][73] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][74] ([i915#1958] / [i915#2119])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw6/igt@kms_color_chamelium@pipe-d-degamma.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][75] ([fdo#109349]) -> [DMESG-WARN][76] ([i915#1226])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-hsw:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1958] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][80] ([fdo#108145] / [i915#1635] / [i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][81], [FAIL][82]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][83] ([i915#1635] / [i915#2110])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl3/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][84], [FAIL][85], [FAIL][86]) ([i915#1764] / [i915#2110]) -> [FAIL][87] ([i915#2110])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb3/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb5/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5738 -> IGTPW_4771
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8754: 5e2a3a9c4ca7fe59db74a1fffe29e6a2012e2225 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4771: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html
  IGT_5738: bc8b56fe177af34fbde7b96f1f66614a0014c6ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html

--===============3857920025950308302==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_lpsp: Add igt_wait to test lpsp</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79557/">https://patchwork.freedesktop.org/series/79557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8754_full -&gt; IGTPW_4771_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4771_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4771_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4771_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@dp-hpd-storm-disable:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl2/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl6/igt@kms_chamelium@dp-hpd-storm-disable.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4771_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-internal-1us:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw7/igt@gem_eio@in-flight-internal-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@gem_eio@in-flight-internal-1us.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk7/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb6/igt@gem_gpgpu_fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb6/igt@gem_gpgpu_fill.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dumb_buffer@map-invalid-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@dumb_buffer@map-invalid-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw2/igt@dumb_buffer@map-invalid-size.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk5/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1528">i915#1528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@fds@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb6/igt@gem_exec_parallel@fds@rcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@gem_exec_parallel@fds@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/70">i915#70</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@kms_vblank@pipe-a-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb6/igt@kms_vblank@pipe-a-query-forked-busy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl7/igt@kms_vblank@pipe-c-wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@rcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@perf_pmu@busy-idle@rcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb6/igt@perf_pmu@busy-idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@perf_pmu@busy-idle@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb6/igt@perf_pmu@busy-idle@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@perf_pmu@busy-idle@vecs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@perf_pmu@busy-idle@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb1/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-snb6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-snb1/igt@kms_color_chamelium@pipe-d-degamma.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@kms_color_chamelium@pipe-d-degamma.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8754/shard-tglb2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5738 -&gt; IGTPW_4771</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8754: 5e2a3a9c4ca7fe59db74a1fffe29e6a2012e2225 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4771: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4771/index.html<br />
  IGT_5738: bc8b56fe177af34fbde7b96f1f66614a0014c6ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3857920025950308302==--

--===============0305427021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0305427021==--
