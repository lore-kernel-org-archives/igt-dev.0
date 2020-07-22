Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jul 2020 15:40:37 -0000
Message-ID: <159543243776.2269.332212322030317330@emeril.freedesktop.org>
References: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Use_igt=5Fassert_on_bufmgr_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1842299935=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1842299935==
Content-Type: multipart/alternative;
 boundary="===============3797266572683476086=="

--===============3797266572683476086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Use igt_assert on bufmgr (rev2)
URL   : https://patchwork.freedesktop.org/series/79518/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8776_full -> IGTPW_4789_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4789_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4789_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4789_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-kbl:          [SKIP][1] ([fdo#109271]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_4789_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][3] -> [WARN][4] ([i915#1519])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][5] -> [DMESG-FAIL][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] ([i915#2055])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958] / [i915#2119]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_setmode@basic-clone-single-crtc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1820])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][23] ([i915#1930]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-snb:          [TIMEOUT][25] ([i915#1958] / [i915#2119]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@gem_exec_whisper@basic-contexts-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb5/igt@gem_exec_whisper@basic-contexts-forked.html
    - shard-hsw:          [TIMEOUT][27] ([i915#1958] / [i915#2119]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@gem_exec_whisper@basic-contexts-forked.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@gem_exec_whisper@basic-contexts-forked.html
    - shard-glk:          [TIMEOUT][29] ([i915#1958] / [i915#2119]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [DMESG-WARN][31] ([i915#118] / [i915#95]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk3/igt@gem_exec_whisper@basic-queues.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk6/igt@gem_exec_whisper@basic-queues.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][33] ([i915#454]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-tglb:         [DMESG-WARN][35] ([i915#402]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb6/igt@kms_addfb_basic@bad-pitch-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][37] ([i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][45] ([fdo#109642] / [fdo#111068]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][49] ([i915#31]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw4/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw8/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [FAIL][52] ([i915#1930])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-glk:          [TIMEOUT][53] ([i915#1958] / [i915#2119]) -> [INCOMPLETE][54] ([i915#1958])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@gem_exec_reloc@basic-concurrent16.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_schedule@preempt-hang:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [SKIP][56] ([fdo#109271]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@gem_exec_schedule@preempt-hang.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@gem_exec_schedule@preempt-hang.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-hsw:          [TIMEOUT][57] ([i915#1958] / [i915#2119]) -> [SKIP][58] ([fdo#109271] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_color_chamelium@pipe-a-ctm-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-glk:          [TIMEOUT][59] ([i915#1366] / [i915#1958] / [i915#2119]) -> [SKIP][60] ([fdo#109271] / [fdo#111827])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-max.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-snb:          [TIMEOUT][61] ([i915#1958] / [i915#2119]) -> [SKIP][62] ([fdo#109271] / [fdo#111827])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-max.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-snb:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [SKIP][64] ([fdo#109271]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [TIMEOUT][66] ([i915#1958] / [i915#2119]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5744 -> IGTPW_4789
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8776: 74b7f6c16ef8b25eeced90397c82376071d3a12a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4789: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html
  IGT_5744: 89ef04d90cf2b96c72820c1927034cf716ea37f7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html

--===============3797266572683476086==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_fb: Use igt_assert on bufmgr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79518/">https://patchwork.freedesktop.org/series/79518/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8776_full -&gt; IGTPW_4789_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_4789_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4789_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4789_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4789_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@kms_setmode@basic-clone-single-crtc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@gem_exec_whisper@basic-contexts-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb5/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@gem_exec_whisper@basic-contexts-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk3/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk6/igt@gem_exec_whisper@basic-queues.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb6/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb8/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw8/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk1/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@gem_exec_schedule@preempt-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@gem_exec_schedule@preempt-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_color_chamelium@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw6/igt@kms_color_chamelium@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1366">i915#1366</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8776/shard-hsw2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/shard-hsw4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5744 -&gt; IGTPW_4789</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8776: 74b7f6c16ef8b25eeced90397c82376071d3a12a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4789: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4789/index.html<br />
  IGT_5744: 89ef04d90cf2b96c72820c1927034cf716ea37f7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3797266572683476086==--

--===============1842299935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1842299935==--
