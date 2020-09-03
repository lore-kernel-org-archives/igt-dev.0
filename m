Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 03 Sep 2020 19:12:02 -0000
Message-ID: <159916032274.15507.6059883202310630283@emeril.freedesktop.org>
References: <20200902154423.9199-1-srinivasx.k@intel.com>
In-Reply-To: <20200902154423.9199-1-srinivasx.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=2Ec_Stripping_rendercopy_implementation_to_u?=
 =?utf-8?q?se_Cairo?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1084822566=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamati Srinivas <srinivasx.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1084822566==
Content-Type: multipart/alternative;
 boundary="===============4363968147647078459=="

--===============4363968147647078459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc.c Stripping rendercopy implementation to use Cairo
URL   : https://patchwork.freedesktop.org/series/81279/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5777_full -> IGTPW_4947_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4947_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4947_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4947_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk5/igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk3/igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format.html

  
Known issues
------------

  Here are the changes found in IGTPW_4947_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-forked:
    - shard-tglb:         [PASS][3] -> [TIMEOUT][4] ([i915#1958])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb1/igt@gem_exec_whisper@basic-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb8/igt@gem_exec_whisper@basic-forked.html
    - shard-glk:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk7/igt@gem_exec_whisper@basic-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk5/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-apl:          [PASS][7] -> [TIMEOUT][8] ([i915#1635] / [i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl6/igt@gem_exec_whisper@basic-queues-priority.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_selftest@mock@requests:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([i915#1635] / [i915#2278])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@i915_selftest@mock@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl1/igt@i915_selftest@mock@requests.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1635] / [i915#168])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_color@pipe-b-ctm-max.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl8/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#168])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl7/igt@kms_color@pipe-b-ctm-max.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_nop@basic-sequential:
    - shard-kbl:          [TIMEOUT][27] ([i915#1958]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@gem_exec_nop@basic-sequential.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl4/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_parallel@engines@fds:
    - shard-kbl:          [INCOMPLETE][29] ([i915#2398] / [i915#794]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@gem_exec_parallel@engines@fds.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-tglb:         [TIMEOUT][31] ([i915#1958]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb8/igt@gem_exec_reloc@basic-concurrent0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][33] ([i915#2389]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-iclb:         [TIMEOUT][35] ([i915#1958]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb1/igt@gem_exec_whisper@basic-fds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb3/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-apl:          [TIMEOUT][37] ([i915#1635] / [i915#1958]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl2/igt@gem_exec_whisper@basic-normal.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl8/igt@gem_exec_whisper@basic-normal.html
    - shard-glk:          [TIMEOUT][39] ([i915#1958]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk2/igt@gem_exec_whisper@basic-normal.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk9/igt@gem_exec_whisper@basic-normal.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1436] / [i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][47] ([i915#1635] / [i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][51] ([i915#2122]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][53] ([i915#1635] / [i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][57] ([fdo#109642] / [fdo#111068]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb1/igt@kms_psr@psr2_primary_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [TIMEOUT][62] ([i915#1958])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [DMESG-WARN][63] ([i915#2411]) -> [SKIP][64] ([i915#1904])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][65] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][66] ([fdo#108145] / [i915#1635] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5777 -> IGTPW_4947

  CI-20190529: 20190529
  CI_DRM_8956: a0761632b0f443c3c018aad55866fbda1429770d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4947: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html

--===============4363968147647078459==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc.c Stripping rendercopy implementation to use Cairo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81279/">https://patchwork.freedesktop.org/series/81279/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5777_full -&gt; IGTPW_4947_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4947_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4947_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4947_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk5/igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk3/igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4947_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb1/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb8/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk7/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk5/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl6/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl3/igt@gem_exec_whisper@basic-queues-priority.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@requests:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@i915_selftest@mock@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl1/igt@i915_selftest@mock@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-max:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl8/igt@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl7/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@gem_exec_nop@basic-sequential.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl4/igt@gem_exec_nop@basic-sequential.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@gem_exec_parallel@engines@fds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb8/igt@gem_exec_reloc@basic-concurrent0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb3/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb1/igt@gem_exec_whisper@basic-fds.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb3/igt@gem_exec_whisper@basic-fds.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl2/igt@gem_exec_whisper@basic-normal.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl8/igt@gem_exec_whisper@basic-normal.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk2/igt@gem_exec_whisper@basic-normal.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk9/igt@gem_exec_whisper@basic-normal.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-iclb1/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5777 -&gt; IGTPW_4947</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8956: a0761632b0f443c3c018aad55866fbda1429770d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4947: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4947/index.html<br />
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4363968147647078459==--

--===============1084822566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1084822566==--
