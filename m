Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Dec 2019 22:41:41 -0000
Message-ID: <157679530174.26200.8131678687786646608@emeril.freedesktop.org>
References: <20191218171250.15232-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20191218171250.15232-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/3=5D_lib/intel=5Fbufops=3A_Int?=
 =?utf-8?q?roduce_buffer_operations?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v4,1/3] lib/intel_bufops: Introduce buffer operations
URL   : https://patchwork.freedesktop.org/series/71128/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7598_full -> IGTPW_3877_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3877_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs}:
    - shard-tglb:         NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * {igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled}:
    - shard-tglb:         [PASS][2] -> [FAIL][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_3877_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@hibernate:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#456]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb4/igt@gem_eio@hibernate.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb2/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-snb:          [PASS][6] -> [INCOMPLETE][7] ([i915#82])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb5/igt@gem_eio@in-flight-contexts-immediate.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb4/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][8] -> [FAIL][9] ([i915#232]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb6/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#644])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#644])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][14] -> [DMESG-WARN][15] ([fdo#111870])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb7/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([fdo#110789] / [fdo#111870])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#456] / [i915#460]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb4/igt@gem_workarounds@suspend-resume.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb3/igt@gem_workarounds@suspend-resume.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-hsw:          [PASS][22] -> [DMESG-WARN][23] ([IGT#6])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-hsw2/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-iclb:         [PASS][26] -> [INCOMPLETE][27] ([i915#140] / [i915#246])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb3/igt@kms_plane@pixel-format-pipe-a-planes.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-iclb5/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][30] -> [DMESG-WARN][31] ([i915#402])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb2/igt@kms_psr@psr2_suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([fdo#103665])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [FAIL][34] ([i915#679]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_exec_balancer@nop:
    - shard-tglb:         [INCOMPLETE][36] ([fdo#111736]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb5/igt@gem_exec_balancer@nop.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb3/igt@gem_exec_balancer@nop.html

  * igt@gem_persistent_relocs@interruptible:
    - shard-snb:          [DMESG-WARN][38] ([i915#478]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_persistent_relocs@interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb1/igt@gem_persistent_relocs@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][40] ([fdo#111870]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][42] ([i915#54]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
    - shard-kbl:          [FAIL][44] ([i915#54]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [FAIL][48] ([i915#49]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-apl:          [FAIL][50] ([i915#49]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][52] ([i915#49]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-iclb:         [INCOMPLETE][54] ([i915#123] / [i915#140]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [INCOMPLETE][56] ([i915#456] / [i915#460]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb4/igt@kms_frontbuffer_tracking@psr-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][58] ([fdo#103665]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][62] ([i915#82]) -> [DMESG-WARN][63] ([i915#444])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_eio@kms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb5/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][64] ([fdo#111870]) -> [DMESG-WARN][65] ([fdo#110789] / [fdo#111870]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][66] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][67] ([fdo#111870])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#246]: https://gitlab.freedesktop.org/drm/intel/issues/246
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3877
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7598: 7b95c0a4f86507c23d1b4aa7fd352b1d86de5af8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3877: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3877/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
