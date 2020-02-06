Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 10:27:04 -0000
Message-ID: <158098482405.14484.2755091273284841285@emeril.freedesktop.org>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200130151229.984-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/3=5D_lib/vec=3A_Add_igt=5Fvec_?=
 =?utf-8?b?KHJldjMp?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v2,1/3] lib/vec: Add igt_vec (rev3)
URL   : https://patchwork.freedesktop.org/series/72778/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7863_full -> IGTPW_4082_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/index.html

Known issues
------------

  Here are the changes found in IGTPW_4082_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103665])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_busy@basic-modeset-pipe-a:
    - shard-snb:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-snb5/igt@kms_busy@basic-modeset-pipe-a.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-snb6/igt@kms_busy@basic-modeset-pipe-a.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#668]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#899]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#31])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw4/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw6/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109276]) +20 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][25] ([fdo#110854]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][27] ([fdo#112146]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-blt:
    - shard-glk:          [FAIL][29] ([i915#859]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk5/igt@gem_exec_schedule@pi-distinct-iova-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-glk8/igt@gem_exec_schedule@pi-distinct-iova-blt.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][31] ([fdo#109276]) -> [PASS][32] +17 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [FAIL][33] ([i915#694]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][35] ([i915#644]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-iclb:         [INCOMPLETE][37] ([i915#140]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb5/igt@gem_ringfill@basic-default-hang.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb6/igt@gem_ringfill@basic-default-hang.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][39] ([i915#818]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][41] ([i915#553] / [i915#725]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@i915_selftest@live_blt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][43] ([i915#1140]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [SKIP][49] ([i915#668]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][55] ([i915#173]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@kms_psr@no_drrs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@short-reads:
    - shard-apl:          [TIMEOUT][59] ([fdo#112271] / [i915#51]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl2/igt@perf@short-reads.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-apl2/igt@perf@short-reads.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb8/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-iclb1/igt@perf_pmu@busy-accuracy-98-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw1/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][65] ([i915#831]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4082
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7863: 8ae46cc3902da96a0744a7237dce4b17747438b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4082: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4082/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
