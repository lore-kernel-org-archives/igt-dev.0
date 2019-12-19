Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Dec 2019 16:35:51 -0000
Message-ID: <157677335165.26201.13198287274297293601@emeril.freedesktop.org>
References: <1576680837-2836-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1576680837-2836-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_user_space_read_too_slow_error_=28rev?=
 =?utf-8?q?5=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_crc: Fix user space read too slow error (rev5)
URL   : https://patchwork.freedesktop.org/series/70218/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7598_full -> IGTPW_3876_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/index.html

Known issues
------------

  Here are the changes found in IGTPW_3876_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#461])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb7/igt@gem_ctx_shared@q-smoketest-bsd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([fdo#111593])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb5/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb9/igt@gem_exec_balancer@smoke.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#472] / [i915#707])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb5/igt@gem_sync@basic-many-each.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb3/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([fdo#111870]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#435] / [i915#456] / [i915#460])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb9/igt@kms_fbcon_fbt@fbc-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         [PASS][21] -> [INCOMPLETE][22] ([i915#140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103665] / [i915#435] / [i915#648] / [i915#667])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_plane@pixel-format-pipe-c-planes-source-clamping:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#140] / [i915#246])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb8/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-iclb5/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#402])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb2/igt@kms_psr@psr2_suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#456] / [i915#460])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [INCOMPLETE][33] ([fdo#111735]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb3/igt@gem_ctx_shared@q-smoketest-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb3/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_balancer@nop:
    - shard-tglb:         [INCOMPLETE][35] ([fdo#111736]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb5/igt@gem_exec_balancer@nop.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb2/igt@gem_exec_balancer@nop.html

  * igt@gem_persistent_relocs@interruptible:
    - shard-snb:          [DMESG-WARN][37] ([i915#478]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_persistent_relocs@interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-snb4/igt@gem_persistent_relocs@interruptible.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][39] ([i915#644]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][41] ([i915#454]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [INCOMPLETE][43] ([fdo#112057]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb5/igt@i915_selftest@live_requests.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb9/igt@i915_selftest@live_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][49] ([i915#49]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][51] ([i915#49]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-tglb:         [DMESG-WARN][53] ([i915#766]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][55] ([i915#49]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [INCOMPLETE][57] ([i915#474] / [i915#667]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [INCOMPLETE][59] ([i915#667]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-tglb9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-iclb:         [INCOMPLETE][61] ([i915#123] / [i915#140]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][63] ([fdo#103665]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][65] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][66] ([fdo#111870])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7598/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112057]: https://bugs.freedesktop.org/show_bug.cgi?id=112057
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#246]: https://gitlab.freedesktop.org/drm/intel/issues/246
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#766]: https://gitlab.freedesktop.org/drm/intel/issues/766
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3876
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7598: 7b95c0a4f86507c23d1b4aa7fd352b1d86de5af8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3876/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
