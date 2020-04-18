Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 18 Apr 2020 06:36:11 -0000
Message-ID: <158719177176.421.11829441268118106365@emeril.freedesktop.org>
References: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Allow_modeset_to_surivive_change_of_cdclk?=
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

Series: tests/kms_big_fb: Allow modeset to surivive change of cdclk
URL   : https://patchwork.freedesktop.org/series/76077/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8314_full -> IGTPW_4479_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html

Known issues
------------

  Here are the changes found in IGTPW_4479_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#72])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#52] / [i915#54]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#49])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109441]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-hsw6/igt@perf@blocking.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-hsw6/igt@perf@blocking.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271] / [i915#1354])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk8/igt@perf@blocking.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk8/igt@perf@blocking.html
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1354])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-tglb6/igt@perf@blocking.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-tglb1/igt@perf@blocking.html
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1354])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-apl2/igt@perf@blocking.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-apl1/igt@perf@blocking.html
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#1354])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb8/igt@perf@blocking.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb1/igt@perf@blocking.html
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271] / [i915#1354])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl7/igt@perf@blocking.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl4/igt@perf@blocking.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues:
    - shard-iclb:         [FAIL][27] -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb7/igt@gem_exec_whisper@basic-queues.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb2/igt@gem_exec_whisper@basic-queues.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][29] ([i915#1423]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl4/igt@i915_module_load@reload-with-fault-injection.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-glk:          [FAIL][33] ([i915#54]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][35] ([fdo#109349]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][37] ([i915#52] / [i915#54]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][39] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
    - shard-kbl:          [INCOMPLETE][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][45] ([i915#61]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [FAIL][47] ([i915#53] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [FAIL][49] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][51] ([i915#1559] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][53] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [SKIP][59] ([fdo#112015]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][63] ([fdo#109278]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][65] ([i915#1542]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-tglb2/igt@perf@blocking-parameterized.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-tglb6/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][67] ([i915#1085]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][69] ([i915#468]) -> [FAIL][70] ([i915#454]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5598 -> IGTPW_4479
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8314: e8a432aa7e81e2bf5b6d4b23e3598f9fea947b83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4479: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html
  IGT_5598: 276b8a3f24837e009ff38512f7eeb07029e52616 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
