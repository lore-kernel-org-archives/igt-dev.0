Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8533687773652610657=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Sat, 18 Mar 2023 04:32:53 -0000
Message-ID: <167911397338.6191.11832953861710593768@emeril.freedesktop.org>
References: <20230317165044.2616573-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230317165044.2616573-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2tt?=
 =?utf-8?q?s=3A_Get_pipe_enum_from_debugfs_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============8533687773652610657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Get pipe enum from debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/115323/
State : success

== Summary ==

CI Bug Log - changes from IGT_7205_full -> IGTPW_8636_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_8636_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [PASS][1] -> [ABORT][2] ([i915#4528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-snb4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-snb5/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          [PASS][3] -> [ABORT][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][5] -> [ABORT][6] ([i915#5566])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2122])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - {shard-tglu}:       [SKIP][12] ([i915#2582]) -> [PASS][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@fbdev@nullptr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-4/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - {shard-rkl}:        [SKIP][14] ([i915#2582]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-1/igt@fbdev@write.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@fbdev@write.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][16] ([fdo#103375]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@suspend:
    - {shard-rkl}:        [FAIL][18] ([i915#5115] / [i915#7052]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_eio@suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-2/igt@gem_eio@suspend.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][20] ([i915#2842]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-apl:          [SKIP][22] ([fdo#109271]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][24] ([i915#2842]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - {shard-rkl}:        [SKIP][26] ([i915#3281]) -> [PASS][27] +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][28] ([i915#4936]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][30] ([i915#3282]) -> [PASS][31] +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@bb-start-out:
    - {shard-rkl}:        [SKIP][32] ([i915#2527]) -> [PASS][33] +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][34] ([i915#6258]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-rkl}:        [SKIP][36] ([i915#3361]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][38] ([i915#3591]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-rkl}:        [SKIP][40] ([i915#1397]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-tglu}:       [SKIP][42] ([i915#1397]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - {shard-dg1}:        [SKIP][44] ([i915#1397]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][46] ([i915#4387]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@i915_pm_sseu@full-enable.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - {shard-rkl}:        [SKIP][48] ([i915#1845] / [i915#4098]) -> [PASS][49] +24 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][50] ([i915#2346]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - {shard-tglu}:       [SKIP][52] ([i915#1849]) -> [PASS][53] +15 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - {shard-rkl}:        [SKIP][54] ([i915#1849] / [i915#4098]) -> [PASS][55] +13 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - {shard-rkl}:        [SKIP][56] ([i915#433]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
    - {shard-tglu}:       [SKIP][58] ([i915#433]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - {shard-rkl}:        [SKIP][60] ([i915#1849]) -> [PASS][61] +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][62] ([i915#1072]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_psr@primary_render.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
    - {shard-tglu}:       [SKIP][64] ([fdo#109274]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-4/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html

  * igt@kms_vblank@pipe-c-wait-forked:
    - {shard-tglu}:       [SKIP][66] ([i915#1845]) -> [PASS][67] +42 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@kms_vblank@pipe-c-wait-forked.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-6/igt@kms_vblank@pipe-c-wait-forked.html

  * igt@kms_vblank@pipe-d-wait-forked-busy:
    - {shard-tglu}:       [SKIP][68] ([i915#1845] / [i915#7651]) -> [PASS][69] +26 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@kms_vblank@pipe-d-wait-forked-busy.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@kms_vblank@pipe-d-wait-forked-busy.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][70] ([i915#1722]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@perf@polling-small-buf.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-4/igt@perf@polling-small-buf.html

  * igt@perf@stress-open-close:
    - shard-glk:          [ABORT][72] ([i915#5213]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk9/igt@perf@stress-open-close.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk1/igt@perf@stress-open-close.html

  * igt@sysfs_timeslice_duration@timeout@vcs0:
    - {shard-dg1}:        [FAIL][74] ([i915#1755]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@vcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8282]: https://gitlab.freedesktop.org/drm/intel/issues/8282


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7205 -> IGTPW_8636

  CI-20190529: 20190529
  CI_DRM_12878: 80a77071b23a1ef75b5446cd397dd9048580ec8d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html
  IGT_7205: 0d4bf61a38c7751cf7c92751c4bb64f95c9ffbe2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html

--===============8533687773652610657==
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
<tr><td><b>Series:</b></td><td>lib/kms: Get pipe enum from debugfs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115323/">https://patchwork.freedesktop.org/series/115323/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7205_full -&gt; IGTPW_8636_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8636_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-snb4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-snb5/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-4/igt@fbdev@nullptr.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_eio@suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5115">i915#5115</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-2/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html">PASS</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-4/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-6/igt@kms_psr@primary_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-sanity:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-4/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-10/igt@kms_vblank@pipe-c-wait-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-6/igt@kms_vblank@pipe-c-wait-forked.html">PASS</a> +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-busy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-tglu-9/igt@kms_vblank@pipe-d-wait-forked-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-tglu-2/igt@kms_vblank@pipe-d-wait-forked-busy.html">PASS</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-rkl-3/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-rkl-4/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-glk9/igt@perf@stress-open-close.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-glk1/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7205/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7205 -&gt; IGTPW_8636</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12878: 80a77071b23a1ef75b5446cd397dd9048580ec8d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8636/index.html<br />
  IGT_7205: 0d4bf61a38c7751cf7c92751c4bb64f95c9ffbe2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8533687773652610657==--
