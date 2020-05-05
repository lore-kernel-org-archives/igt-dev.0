Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 May 2020 09:30:08 -0000
Message-ID: <158867100848.25913.17859027541248066345@emeril.freedesktop.org>
References: <20200504193112.2382452-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200504193112.2382452-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exploit_resource_contention_to_verify_execbu?=
 =?utf-8?q?f_independence_=28rev2=29?=
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

Series: i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence (rev2)
URL   : https://patchwork.freedesktop.org/series/76896/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8422_full -> IGTPW_4530_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4530_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_exec@basic-pi-active} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-tglb1/igt@gem_ctx_exec@basic-pi-active.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-iclb6/igt@gem_ctx_exec@basic-pi-active.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8422_full and IGTPW_4530_full:

### New IGT tests (1) ###

  * igt@gem_ctx_exec@basic-pi-active:
    - Statuses : 7 skip(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4530_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1436] / [i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#53] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1559] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][21] ([i915#180]) -> [PASS][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
    - shard-apl:          [DMESG-WARN][23] ([i915#180]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][25] ([fdo#109276]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][27] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-hsw:          [SKIP][29] ([fdo#109271]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-hsw6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-hsw4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * {igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][31] ([i915#34]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][33] ([i915#61]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][35] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][37] ([i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][39] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][41] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][45] ([i915#1542]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-iclb3/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-iclb3/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][47] ([i915#1542]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-hsw6/igt@perf@polling-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][49] ([i915#468]) -> [FAIL][50] ([i915#454])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][51] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][52] ([i915#357])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@kms_content_protection@uevent.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][53] ([i915#357] / [i915#95]) -> [FAIL][54] ([i915#357])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl3/igt@kms_content_protection@uevent.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][55] ([i915#95]) -> [DMESG-FAIL][56] ([i915#180] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265]) -> [FAIL][58] ([fdo#108145] / [i915#265] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
    - shard-kbl:          [FAIL][59] ([fdo#108145] / [i915#265]) -> [FAIL][60] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][61] ([i915#155] / [i915#794]) -> [DMESG-WARN][62] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8422/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5628 -> IGTPW_4530
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8422: 0ca0fee447b032331962bc5c717786bdb3594bd9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4530: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/index.html
  IGT_5628: 652a3fd8966345fa5498904ce80a2027a6782783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4530/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
