Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 May 2020 19:13:35 -0000
Message-ID: <158861961551.5817.622664855676121319@emeril.freedesktop.org>
References: <20200504095252.1885585-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200504095252.1885585-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exploit_resource_contention_to_verify_execbu?=
 =?utf-8?q?f_independence?=
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

Series: i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence
URL   : https://patchwork.freedesktop.org/series/76896/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8416_full -> IGTPW_4528_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4528_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4528_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4528_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][1] ([i915#1319]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl7/igt@kms_content_protection@atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl6/igt@kms_content_protection@atomic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8416_full and IGTPW_4528_full:

### New IGT tests (1) ###

  * igt@gem_ctx_exec@basic-pi-active:
    - Statuses : 7 pass(s)
    - Exec time: [26.89, 65.64] s

  

Known issues
------------

  Here are the changes found in IGTPW_4528_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([fdo#108145] / [i915#71])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl2/igt@kms_color@pipe-a-legacy-gamma.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl7/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([fdo#108145] / [i915#71])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#72])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1559] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][21] ([i915#716]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][23] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][25] ([i915#180]) -> [PASS][26] +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-glk:          [FAIL][27] ([i915#52] / [i915#54]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][29] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-apl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][33] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][35] ([i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][37] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][39] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][41] ([fdo#109441]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][43] ([i915#31]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl6/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl4/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][45] ([i915#1542]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl1/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl3/igt@perf@blocking-parameterized.html
    - shard-iclb:         [FAIL][47] ([i915#1542]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-iclb7/igt@perf@blocking-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-iclb2/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][49] ([i915#1542]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-hsw6/igt@perf@polling-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-hsw1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][51] ([i915#658]) -> [SKIP][52] ([i915#588])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][53] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][54] ([i915#357])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl4/igt@kms_content_protection@uevent.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl2/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][55] ([i915#180] / [i915#95]) -> [FAIL][56] ([i915#93] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][57] ([fdo#108145] / [i915#265]) -> [FAIL][58] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8416/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5628 -> IGTPW_4528
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8416: 4aa25ab0331c40f5d475c651f5f4e3801b07f28d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4528: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/index.html
  IGT_5628: 652a3fd8966345fa5498904ce80a2027a6782783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4528/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
