Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 May 2020 20:54:03 -0000
Message-ID: <158871204347.25911.18225606693945130100@emeril.freedesktop.org>
References: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exploit_resource_contention_to_verify_execbu?=
 =?utf-8?q?f_independence_=28rev3=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence (rev3)
URL   : https://patchwork.freedesktop.org/series/76896/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8427_full -> IGTPW_4531_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8427_full and IGTPW_4531_full:

### New IGT tests (1) ###

  * igt@gem_ctx_exec@basic-pi-active:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 98.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_4531_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#52] / [i915#54] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl6/igt@kms_draw_crc@fill-fb.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109441]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][11] ([fdo#109276]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][13] ([i915#1436] / [i915#716]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][15] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-apl:          [FAIL][17] ([i915#54]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-kbl:          [FAIL][19] ([i915#54]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1}:
    - shard-apl:          [FAIL][21] ([i915#79]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][23] ([i915#180]) -> [PASS][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][25] ([i915#180]) -> [PASS][26] +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][27] ([i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][31] ([i915#433]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [INCOMPLETE][33] ([i915#155]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][35] ([i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl3/igt@kms_mmap_write_crc@main.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][37] ([i915#173]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-iclb1/igt@kms_psr@no_drrs.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][39] ([fdo#109441]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][41] ([i915#1542]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-tglb7/igt@perf@polling-parameterized.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-tglb8/igt@perf@polling-parameterized.html

  * igt@testdisplay:
    - shard-apl:          [TIMEOUT][43] ([i915#1692]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl4/igt@testdisplay.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl1/igt@testdisplay.html
    - shard-kbl:          [TIMEOUT][45] ([i915#1692]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl7/igt@testdisplay.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl1/igt@testdisplay.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][47] ([i915#588]) -> [SKIP][48] ([i915#658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][49] ([i915#468]) -> [FAIL][50] ([i915#454])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [FAIL][52] ([i915#1525])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][53] ([i915#93] / [i915#95]) -> [FAIL][54] ([i915#64] / [i915#93] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5632 -> IGTPW_4531
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8427: d7afe86abe766f68e758be1c9db6618e55bdf38d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4531: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html
  IGT_5632: e630cb8cd2ec01d6d5358eb2a3f6ea70498b8183 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
