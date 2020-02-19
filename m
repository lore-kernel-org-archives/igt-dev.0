Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 17:19:30 -0000
Message-ID: <158213277098.21061.10935233564140937360@emeril.freedesktop.org>
References: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_limit_maximum_used_plane_size?=
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

Series: tests/kms_rotation_crc: limit maximum used plane size
URL   : https://patchwork.freedesktop.org/series/73547/
State : success

== Summary ==

CI Bug Log - changes from IGT_5446_full -> IGTPW_4169_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/index.html

Known issues
------------

  Here are the changes found in IGTPW_4169_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-apl3/igt@gem_ctx_isolation@bcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb6/igt@i915_pm_rps@reset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#1233])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-tglb8/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([fdo#103375] / [i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-kbl1/igt@kms_flip@flip-vs-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-kbl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#899])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw8/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw7/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109276]) +21 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_caching@read-writes:
    - shard-hsw:          [FAIL][31] ([i915#694]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw7/igt@gem_caching@read-writes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw6/igt@gem_caching@read-writes.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +9 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][35] ([i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +19 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * {igt@gem_exec_whisper@basic-queues-forked}:
    - shard-glk:          [INCOMPLETE][41] ([i915#58] / [k.org#198133]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-snb:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-snb7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][51] ([i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw5/igt@kms_flip@flip-vs-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][53] ([i915#49]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [FAIL][57] ([i915#49]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][61] ([i915#831]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][63] ([IGT#28]) -> [SKIP][64] ([fdo#112080])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][65] ([i915#818]) -> [FAIL][66] ([i915#694])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-hsw2/igt@gem_tiled_blits@normal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-snb4/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-snb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [FAIL][70] ([i915#54])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5446/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5446 -> IGTPW_4169

  CI-20190529: 20190529
  CI_DRM_7958: af30970548f72cf8a37886f009e0cfe02b23c8a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4169: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/index.html
  IGT_5446: 7a05faa0be53fa1544ec950290129d20e4101c72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4169/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
