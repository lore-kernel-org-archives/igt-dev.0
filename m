Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Sep 2020 21:51:31 -0000
Message-ID: <160141629157.28027.14696941364844212451@emeril.freedesktop.org>
References: <20200929104818.14717-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200929104818.14717-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2ht?=
 =?utf-8?q?arks=3A_Remove_libdrm_dependency?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1802294597=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1802294597==
Content-Type: multipart/alternative;
 boundary="===============5896008527947687797=="

--===============5896008527947687797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks: Remove libdrm dependency
URL   : https://patchwork.freedesktop.org/series/82195/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9072_full -> IGTPW_5020_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5020_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5020_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5020_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy_redux@flink:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw6/igt@gem_render_copy_redux@flink.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@gem_render_copy_redux@flink.html
    - shard-kbl:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl1/igt@gem_render_copy_redux@flink.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl7/igt@gem_render_copy_redux@flink.html
    - shard-iclb:         [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@gem_render_copy_redux@flink.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb8/igt@gem_render_copy_redux@flink.html

  * igt@gem_render_copy_redux@flink-interruptible:
    - shard-glk:          [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk9/igt@gem_render_copy_redux@flink-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk7/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb1/igt@gem_render_copy_redux@flink-interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb1/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-snb:          [PASS][11] -> [FAIL][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-snb2/igt@gem_render_copy_redux@flink-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-snb5/igt@gem_render_copy_redux@flink-interruptible.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_5020_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy_redux@flink-interruptible:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1635]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl8/igt@gem_render_copy_redux@flink-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl6/igt@gem_render_copy_redux@flink-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#433])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_prop_blob@invalid-get-prop-any:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw1/igt@kms_prop_blob@invalid-get-prop-any.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw6/igt@kms_prop_blob@invalid-get-prop-any.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-b-wait-idle:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl1/igt@kms_vblank@pipe-b-wait-idle.html
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk2/igt@kms_vblank@pipe-b-wait-idle.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk7/igt@kms_vblank@pipe-b-wait-idle.html
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1635] / [i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl1/igt@kms_vblank@pipe-b-wait-idle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl4/igt@kms_vblank@pipe-b-wait-idle.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][41] ([i915#658]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@feature_discovery@psr2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb2/igt@feature_discovery@psr2.html

  * {igt@gem_ctx_persistence@heartbeat-close}:
    - shard-tglb:         [FAIL][43] ([i915#2519]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@gem_ctx_persistence@heartbeat-close.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb5/igt@gem_ctx_persistence@heartbeat-close.html

  * {igt@gem_ctx_persistence@heartbeat-stop}:
    - shard-iclb:         [FAIL][45] ([i915#2520]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb1/igt@gem_ctx_persistence@heartbeat-stop.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb3/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][49] ([i915#1899]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][51] ([i915#1635] / [i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][55] ([i915#2370]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - shard-iclb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb8/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [FAIL][59] ([i915#79]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-query-busy:
    - shard-hsw:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw6/igt@kms_vblank@pipe-a-query-busy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@kms_vblank@pipe-a-query-busy.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [FAIL][67] ([i915#1899]) -> [DMESG-WARN][68] ([i915#2411])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1226]) -> [SKIP][70] ([fdo#109349])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][72] ([fdo#108145] / [i915#1635] / [i915#1982])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2519]: https://gitlab.freedesktop.org/drm/intel/issues/2519
  [i915#2520]: https://gitlab.freedesktop.org/drm/intel/issues/2520
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5790 -> IGTPW_5020
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9072: cbd61a1eb61b1919ff10dd826525b4352c10da47 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5020: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html

--===============5896008527947687797==
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
<tr><td><b>Series:</b></td><td>benchmarks: Remove libdrm dependency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82195/">https://patchwork.freedesktop.org/series/82195/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9072_full -&gt; IGTPW_5020_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5020_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5020_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5020_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_copy_redux@flink:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw6/igt@gem_render_copy_redux@flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@gem_render_copy_redux@flink.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl1/igt@gem_render_copy_redux@flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl7/igt@gem_render_copy_redux@flink.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@gem_render_copy_redux@flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb8/igt@gem_render_copy_redux@flink.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@flink-interruptible:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk9/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk7/igt@gem_render_copy_redux@flink-interruptible.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb1/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb1/igt@gem_render_copy_redux@flink-interruptible.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-snb2/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-snb5/igt@gem_render_copy_redux@flink-interruptible.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5020_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@flink-interruptible:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl8/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl6/igt@gem_render_copy_redux@flink-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-get-prop-any:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw1/igt@kms_prop_blob@invalid-get-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw6/igt@kms_prop_blob@invalid-get-prop-any.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl1/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk2/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk7/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl1/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl4/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-close}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@gem_ctx_persistence@heartbeat-close.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2519">i915#2519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb5/igt@gem_ctx_persistence@heartbeat-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-stop}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb1/igt@gem_ctx_persistence@heartbeat-stop.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2520">i915#2520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb3/igt@gem_ctx_persistence@heartbeat-stop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb8/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-busy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-hsw6/igt@kms_vblank@pipe-a-query-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-hsw1/igt@kms_vblank@pipe-a-query-busy.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-tglb2/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-tglb6/igt@i915_pm_dc@dc5-psr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9072/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
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
<li>IGT: IGT_5790 -&gt; IGTPW_5020</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9072: cbd61a1eb61b1919ff10dd826525b4352c10da47 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5020: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5020/index.html<br />
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5896008527947687797==--

--===============1802294597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1802294597==--
