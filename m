Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jul 2020 07:14:22 -0000
Message-ID: <159427886289.31092.4203626368017603065@emeril.freedesktop.org>
References: <20200709012326.17928-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200709012326.17928-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fpipe=5Fcontrol=5Fstore=5Floop=3A_added_description_for_tes?=
 =?utf-8?q?t_case_=28rev2=29?=
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
To: ranjeet1.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_pipe_control_store_loop: added description for test case (rev2)
URL   : https://patchwork.freedesktop.org/series/79143/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5729_full -> IGTPW_4751_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4751_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4751_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4751_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@busy@bcs0:
    - shard-snb:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb1/igt@perf_pmu@busy@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb6/igt@perf_pmu@busy@bcs0.html

  * igt@perf_pmu@busy@rcs0:
    - shard-hsw:          [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw6/igt@perf_pmu@busy@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw4/igt@perf_pmu@busy@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4751_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_clone@invalid:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +42 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@gem_ctx_clone@invalid.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl2/igt@gem_ctx_clone@invalid.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_flink_race@flink_close:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#95]) +30 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@gem_flink_race@flink_close.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl4/igt@gem_flink_race@flink_close.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1149])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@kms_color@pipe-a-gamma.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb2/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1635] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_flip@dpms-vs-vblank-race@a-edp1:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb3/igt@kms_flip@dpms-vs-vblank-race@a-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb1/igt@kms_flip@dpms-vs-vblank-race@a-edp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1602] / [i915#1887] / [i915#456])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([fdo#108145] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([fdo#108145] / [i915#1635] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-primary-size-64:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_plane_cursor@pipe-a-primary-size-64.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb1/igt@kms_plane_cursor@pipe-a-primary-size-64.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb6/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1635] / [i915#95]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@busy@vcs0:
    - shard-snb:          [PASS][39] -> [INCOMPLETE][40] ([i915#2119] / [i915#82])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb1/igt@perf_pmu@busy@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb6/igt@perf_pmu@busy@vcs0.html

  * igt@perf_pmu@busy@vecs0:
    - shard-hsw:          [PASS][41] -> [DMESG-FAIL][42] ([i915#2119])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw6/igt@perf_pmu@busy@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw4/igt@perf_pmu@busy@vecs0.html

  * igt@syncobj_basic@bad-pad-handle-to-fd:
    - shard-snb:          [PASS][43] -> [TIMEOUT][44] ([i915#1958] / [i915#2119]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb2/igt@syncobj_basic@bad-pad-handle-to-fd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb6/igt@syncobj_basic@bad-pad-handle-to-fd.html

  * igt@syncobj_wait@invalid-wait-bad-flags:
    - shard-hsw:          [PASS][45] -> [TIMEOUT][46] ([i915#1958] / [i915#2119]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw7/igt@syncobj_wait@invalid-wait-bad-flags.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw4/igt@syncobj_wait@invalid-wait-bad-flags.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958] / [i915#2119]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw2/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][51] ([i915#155] / [i915#636]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@i915_suspend@forcewake.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][53] ([i915#1635] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [DMESG-FAIL][55] ([i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][57] ([i915#118] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-apl:          [DMESG-WARN][59] ([i915#1635] / [i915#95]) -> [PASS][60] +34 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_color@pipe-a-ctm-0-75.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl3/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          [TIMEOUT][61] ([i915#1958] / [i915#2119]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][65] ([i915#1525]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][67] ([i915#64]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-glk7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1602] / [i915#1887]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-tglb:         [INCOMPLETE][75] -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb7/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-tglb:         [DMESG-WARN][83] ([i915#402]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [PASS][90] +45 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][91] ([i915#1542]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb4/igt@perf@blocking-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][93] ([i915#2036]) -> [WARN][94] ([i915#2021])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb4/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][95] ([i915#588]) -> [SKIP][96] ([i915#658])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#1635] / [i915#1937]) -> [SKIP][98] ([fdo#109271] / [i915#1937])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-hsw:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][100] ([i915#1958] / [i915#2119])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
    - shard-snb:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [fdo#111827]) -> [SKIP][104] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][106] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][107] ([fdo#110321]) -> [DMESG-FAIL][108] ([fdo#110321] / [i915#1635] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_content_protection@lic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [DMESG-WARN][112] ([i915#180])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#1635]) +13 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [i915#1635]) -> [SKIP][118] ([fdo#109271]) +9 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl3/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [TIMEOUT][120] ([i915#1958] / [i915#2119]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][125], [FAIL][126], [FAIL][127]) ([i915#2110]) -> ([FAIL][128], [FAIL][129]) ([i915#1602] / [i915#2110] / [i915#456])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb8/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#636]: https://gitlab.freedesktop.org/drm/intel/issues/636
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5729 -> IGTPW_4751

  CI-20190529: 20190529
  CI_DRM_8717: 6e5ac4c72af4e86138f04cc2dd089b069bad873f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4751: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/index.html
  IGT_5729: a048d54f58dd70b07dbeb4541b273ec230ddb586 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4751/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
