Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Jun 2020 12:52:06 -0000
Message-ID: <159248472610.22459.16694670260663143233@emeril.freedesktop.org>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev2=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev2)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8641_full -> IGTPW_4681_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4681_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4681_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4681_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@1x-modeset-transitions:
    - shard-snb:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb5/igt@kms_atomic_transition@1x-modeset-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb1/igt@kms_atomic_transition@1x-modeset-transitions.html

  * igt@kms_atomic_transition@1x-modeset-transitions-fencing:
    - shard-kbl:          [PASS][3] -> [FAIL][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl6/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
    - shard-iclb:         [PASS][5] -> [FAIL][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb3/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb5/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-apl:          [PASS][7] -> [FAIL][8] +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb8/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb3/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing:
    - shard-snb:          NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb2/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-tglb:         NOTRUN -> [FAIL][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-glk:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk2/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-apl:          NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-iclb:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb4/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-kbl:          NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl3/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-hsw:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-hsw7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_atomic_transition@2x-modeset-transitions-fencing:
    - shard-hsw:          [PASS][18] -> [FAIL][19] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw2/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-hsw2/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing:
    - shard-glk:          [PASS][20] -> [FAIL][21] +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk4/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk7/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html

  
#### Warnings ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         [SKIP][22] ([i915#1839]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         [SKIP][24] ([i915#1839]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4681_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write@bcs0:
    - shard-snb:          [PASS][26] -> [INCOMPLETE][27] ([i915#82])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb4/igt@gem_exec_schedule@implicit-read-write@bcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb2/igt@gem_exec_schedule@implicit-read-write@bcs0.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#118] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk8/igt@gem_exec_whisper@basic-contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk7/igt@gem_exec_whisper@basic-contexts.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#95]) +39 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl1/igt@kms_atomic@atomic-invalid-params.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl1/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][32] -> [DMESG-FAIL][33] ([i915#54] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#93] / [i915#95]) +40 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [PASS][36] -> [DMESG-WARN][37] ([i915#1982])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-tglb:         [PASS][38] -> [DMESG-WARN][39] ([i915#402]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][42] -> [SKIP][43] ([i915#1911])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb5/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#31])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl1/igt@kms_setmode@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-glk:          [PASS][48] -> [DMESG-WARN][49] ([i915#1982])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk5/igt@kms_vblank@pipe-a-query-busy-hang.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk9/igt@kms_vblank@pipe-a-query-busy-hang.html

  * igt@kms_vblank@pipe-b-query-busy-hang:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#1982]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl2/igt@kms_vblank@pipe-b-query-busy-hang.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl7/igt@kms_vblank@pipe-b-query-busy-hang.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-hsw:          [PASS][52] -> [TIMEOUT][53] ([i915#1958]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw7/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-hsw8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][54] -> [DMESG-WARN][55] ([i915#1982])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb4/igt@perf_pmu@module-unload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb7/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [INCOMPLETE][56] ([i915#82]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][58] ([i915#118] / [i915#95]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk5/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][60] ([i915#402]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@i915_module_load@reload.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb5/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][62] ([i915#1899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][64] ([i915#1602] / [i915#456]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@i915_suspend@debugfs-reader.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-snb:          [TIMEOUT][66] ([i915#1958]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb1/igt@kms_addfb_basic@bad-pitch-128.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb6/igt@kms_addfb_basic@bad-pitch-128.html
    - shard-hsw:          [TIMEOUT][68] ([i915#1958]) -> [PASS][69] +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw4/igt@kms_addfb_basic@bad-pitch-128.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-hsw2/igt@kms_addfb_basic@bad-pitch-128.html

  * {igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a}:
    - shard-glk:          [INCOMPLETE][70] ([i915#58] / [k.org#198133]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk8/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk6/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-apl:          [FAIL][72] ([i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +11 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp1:
    - shard-kbl:          [DMESG-WARN][76] ([i915#1982]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][78] ([i915#95]) -> [PASS][79] +36 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl6/igt@kms_flip_tiling@flip-x-tiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl8/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [DMESG-FAIL][80] ([i915#49] / [i915#95]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][84] ([i915#1982]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-glk5/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][86] ([i915#1982]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][88] ([i915#1982]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][90] ([fdo#108145] / [i915#95]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][92] ([fdo#108145] / [i915#95]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][94] ([i915#173]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb1/igt@kms_psr@no_drrs.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][98] ([i915#93] / [i915#95]) -> [PASS][99] +41 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][100] ([i915#1958]) -> [FAIL][101] ([i915#1930])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][102] ([i915#468]) -> [FAIL][103] ([i915#454])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-hsw:          [SKIP][104] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][105] ([i915#1958])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][106] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][107] ([fdo#109278] / [fdo#112010])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@pipe-d-forked-bo:
    - shard-iclb:         [SKIP][108] ([fdo#109278] / [fdo#112010]) -> [SKIP][109] ([fdo#109278]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb6/igt@kms_cursor_legacy@pipe-d-forked-bo.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-iclb5/igt@kms_cursor_legacy@pipe-d-forked-bo.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][110] ([i915#95]) -> [FAIL][111] ([i915#265])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][112] ([fdo#112025] / [fdo#112054]) -> [SKIP][113] ([fdo#112054])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][114] ([fdo#111825] / [fdo#112015]) -> [SKIP][115] ([fdo#111825])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][116] ([i915#1820] / [i915#93] / [i915#95]) -> [FAIL][117] ([i915#1820])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5712 -> IGTPW_4681
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8641: aac91f91c7be78f53b352237d968dfa1996b2d4b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4681: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/index.html
  IGT_5712: eba1135ddd35f9d3097ed91032aefe8f9a9f9d02 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4681/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
