Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Nov 2020 21:37:47 -0000
Message-ID: <160530346708.20637.6997872984377004811@emeril.freedesktop.org>
References: <20201113145357.2400122-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20201113145357.2400122-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_intel=5Fgpu=5Ftop=3A_User_frie?=
 =?utf-8?q?ndly_device_listing?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0615535839=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0615535839==
Content-Type: multipart/alternative;
 boundary="===============3460311388584269904=="

--===============3460311388584269904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] intel_gpu_top: User friendly device listing
URL   : https://patchwork.freedesktop.org/series/83814/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9326_full -> IGTPW_5166_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5166_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5166_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5166_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb6/igt@gem_exec_endless@dispatch@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb1/igt@gem_exec_endless@dispatch@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][3] ([i915#1515]) -> [WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  
Known issues
------------

  Here are the changes found in IGTPW_5166_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2389])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk3/igt@gem_exec_whisper@basic-contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk9/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#2190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl1/igt@i915_pm_rpm@system-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl1/igt@i915_pm_rpm@system-suspend.html
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#579])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@i915_pm_rpm@system-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb1/igt@i915_pm_rpm@system-suspend.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk6/igt@i915_pm_rpm@system-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk6/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_color@pipe-a-degamma:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#1635] / [i915#71])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl6/igt@kms_color@pipe-a-degamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl3/igt@kms_color@pipe-a-degamma.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#71])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl4/igt@kms_color@pipe-a-degamma.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1635] / [i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#2598])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][35] -> [FAIL][36] ([i915#2546])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#2635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([i915#1635] / [i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([i915#155] / [i915#648])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1185] / [i915#250])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-hsw:          [PASS][49] -> [INCOMPLETE][50] ([i915#2637])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#1779])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb1/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@global-sseu-config-invalid:
    - shard-hsw:          [PASS][55] -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@perf@global-sseu-config-invalid.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw6/igt@perf@global-sseu-config-invalid.html
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([i915#1354])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb1/igt@perf@global-sseu-config-invalid.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb6/igt@perf@global-sseu-config-invalid.html
    - shard-glk:          [PASS][59] -> [SKIP][60] ([fdo#109271] / [i915#1354])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk7/igt@perf@global-sseu-config-invalid.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk3/igt@perf@global-sseu-config-invalid.html
    - shard-apl:          [PASS][61] -> [SKIP][62] ([fdo#109271] / [i915#1354] / [i915#1635])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl3/igt@perf@global-sseu-config-invalid.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@perf@global-sseu-config-invalid.html
    - shard-kbl:          [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1354])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@perf@global-sseu-config-invalid.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl6/igt@perf@global-sseu-config-invalid.html
    - shard-tglb:         [PASS][65] -> [SKIP][66] ([i915#1354])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@perf@global-sseu-config-invalid.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb5/igt@perf@global-sseu-config-invalid.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#1542])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@perf@polling-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk1/igt@perf@polling-parameterized.html

  * igt@prime_vgem@sync@rcs0:
    - shard-tglb:         [PASS][69] -> [INCOMPLETE][70] ([i915#409])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@prime_vgem@sync@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb2/igt@prime_vgem@sync@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][71] ([i915#118] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk9/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][73] ([i915#1373]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb7/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][75] ([i915#1635] / [i915#2635]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl3/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][77] ([i915#2199] / [i915#2635]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk8/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][79] ([i915#2637]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw1/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@i915_module_load@reload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb6/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@i2c:
    - shard-glk:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk3/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][89] ([i915#2346]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#1982]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-snb:          [FAIL][93] ([i915#54]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][97] ([i915#155]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [INCOMPLETE][99] ([i915#2635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [INCOMPLETE][101] ([i915#1185]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][105] ([i915#31]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@kms_setmode@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw8/igt@kms_setmode@basic.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [FAIL][107] ([i915#1542]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][109] ([i915#1436]) -> [DMESG-WARN][110] ([i915#2411])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@gem_softpin@noreloc-s3.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [DMESG-WARN][111] ([i915#2411]) -> [SKIP][112] ([i915#579])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@i915_pm_rpm@system-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt@i915_pm_rpm@system-suspend.html
    - shard-apl:          [DMESG-WARN][113] ([i915#1635] / [i915#1982]) -> [SKIP][114] ([fdo#109271] / [i915#1635])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@i915_pm_rpm@system-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][115] ([i915#1226]) -> [SKIP][116] ([fdo#109349])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [INCOMPLETE][117] ([i915#1436] / [i915#456]) -> [DMESG-WARN][118] ([i915#2411])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-tglb:         [DMESG-WARN][119] ([i915#2411]) -> [INCOMPLETE][120] ([i915#1436])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#1982])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][123], [FAIL][124]) ([fdo#109271] / [i915#2295] / [i915#2439]) -> [FAIL][125] ([i915#2295])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw8/igt@runner@aborted.html
    - shard-kbl:          [FAIL][126] ([i915#1611] / [i915#2295] / [i915#2439]) -> [FAIL][127] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439]) -> ([FAIL][131], [FAIL][132]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#62])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl7/igt@runner@aborted.html
    - shard-glk:          ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> ([FAIL][136], [FAIL][137]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][138], [FAIL][139], [FAIL][140]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#456]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2439] / [i915#409])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1779]: https://gitlab.freedesktop.org/drm/intel/issues/1779
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5850 -> IGTPW_5166
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9326: 3048c2a1dcf02422e89930148ffad9e91d690499 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5166: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/index.html
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/index.html

--===============3460311388584269904==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] intel_gpu_t=
op: User friendly device listing</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83814/">https://patchwork.freedesktop.org/series/83814/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5166/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5166/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9326_full -&gt; IGTPW_5166_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5166_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5166_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5166=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_endless@dispatch@bcs0:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb6/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
iclb1/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-fence:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#151=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166=
/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> +1 similar =
issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5166_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/s=
hard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/s=
hard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk3/igt@gem_exec_whisper@basic-contexts.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
glk9/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl1/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl1/i=
gt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb5/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb1=
/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk6/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk6/i=
gt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl6/igt@kms_color@pipe-a-degamma.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl3/igt=
@kms_color@pipe-a-degamma.html">FAIL</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl4/igt@kms_color@pipe-a-degamma.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl3/igt=
@kms_color@pipe-a-degamma.html">FAIL</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
166/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#16=
35</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
166/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5166/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5166/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5166/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
166/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-in=
dfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5166/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5166/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-spr-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5166/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5166/shard-glk6/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5166/shard-apl8/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5166/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/155">i915#155</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/648">i915#648</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5166/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/250">i915#250</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5166/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-y:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb1/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5166/shard-iclb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1779">i915#1=
779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-iclb=
4/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw8/igt@perf@global-sseu-config-invalid.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-h=
sw6/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar i=
ssue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb1/igt@perf@global-sseu-config-invalid.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
iclb6/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk7/igt@perf@global-sseu-config-invalid.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-g=
lk3/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl3/igt@perf@global-sseu-config-invalid.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-a=
pl8/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)<=
/p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@perf@global-sseu-config-invalid.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-k=
bl6/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-tglb8/igt@perf@global-sseu-config-invalid.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
tglb5/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk8/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk1/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb6/igt@prime_vgem@sync@rcs0.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb2/igt@=
prime_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5166/shard-glk9/igt@gem_exec_whisper@basic-queues-priority.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/sha=
rd-iclb7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
6/shard-apl3/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
6/shard-glk8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shar=
d-hsw1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-kbl2=
/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@i915_module_load@reload.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/s=
hard-iclb6/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-gl=
k3/igt@i915_pm_rpm@i2c.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-lega=
cy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5166/shard-kbl7/igt@kms_cursor_legacy@basic-flip-before-=
cursor-legacy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5166/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-yt=
iled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5166/shard-apl8/igt@kms_draw_crc@draw-method-xrg=
b2101010-mmap-wc-ytiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
4">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5166/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pr=
i-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb2/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a> +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5166/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5166/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5166/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a=
.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw2/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-hsw8/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard=
-hsw7/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb5/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/sh=
ard-tglb8/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-tglb6/igt@i915_pm_rpm@system-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166=
/shard-tglb6/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl2/igt@i915_pm_rpm@system-suspend.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i91=
5#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5166/shard-apl8/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5166/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5166/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-p=
ipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb6/igt@kms_plane@plane-panning-b=
ottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5166/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.=
html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5166/shard-hsw8/igt@runner@aborted.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2=
295</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
kbl6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9326/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439=
">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5166/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-apl7/igt@runner@aborted=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9326/shard-glk8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86=
</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.o=
rg#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5166/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-glk8/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://bugzilla.kernel.=
org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9326/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/s=
hard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5166/shard-tglb8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/shard-=
tglb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5850 -&gt; IGTPW_5166</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9326: 3048c2a1dcf02422e89930148ffad9e91d690499 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5166: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5166/index.htm=
l<br />
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3460311388584269904==--

--===============0615535839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0615535839==--
