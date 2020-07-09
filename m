Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jul 2020 08:20:04 -0000
Message-ID: <159428280421.31094.15959600744367485222@emeril.freedesktop.org>
References: <20200709043155.23839-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200709043155.23839-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fsuspend=3A_Added_test_description_for_test_case?=
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

Series: i915/gem_exec_suspend: Added test description for test case
URL   : https://patchwork.freedesktop.org/series/79276/
State : success

== Summary ==

CI Bug Log - changes from IGT_5729_full -> IGTPW_4752_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4752_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4752_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4752_full:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-tglb:         [FAIL][1] ([i915#1930]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb6/igt@gem_exec_reloc@basic-concurrent0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb6/igt@gem_exec_reloc@basic-concurrent0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4752_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1159])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl6/igt@gem_ctx_shared@q-smoketest-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl6/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk8/igt@gem_exec_create@madvise.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-glk8/igt@gem_exec_create@madvise.html

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1635] / [i915#95]) +33 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl2/igt@gem_exec_fence@syncobj-unused-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958] / [i915#2119]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-hsw6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
    - shard-snb:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb7/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1149] / [i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb3/igt@kms_color@pipe-a-ctm-green-to-red.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb2/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([fdo#108145] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([fdo#108145] / [i915#1635] / [i915#54] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#93] / [i915#95]) +44 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#1635] / [i915#95]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-primary-size-64:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#402]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_plane_cursor@pipe-a-primary-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb3/igt@kms_plane_cursor@pipe-a-primary-size-64.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1602] / [i915#1887])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958] / [i915#2119]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-hsw2/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][53] ([i915#155] / [i915#636]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@i915_suspend@forcewake.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#95]) -> [PASS][56] +35 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][57] ([i915#1635] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [DMESG-FAIL][59] ([i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][61] ([i915#118] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-apl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][69] ([i915#1525]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][71] ([i915#64]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-glk1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-glk7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1602] / [i915#1887]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-tglb:         [INCOMPLETE][79] -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb3/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [DMESG-FAIL][83] ([fdo#108145] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [DMESG-FAIL][85] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-tglb:         [DMESG-WARN][87] ([i915#402]) -> [PASS][88] +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][89] ([fdo#109642] / [fdo#111068]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][93] ([i915#93] / [i915#95]) -> [PASS][94] +41 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][95] ([i915#1930]) -> [DMESG-FAIL][96] ([i915#1635] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl1/igt@gem_exec_reloc@basic-concurrent0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][97] ([i915#2036]) -> [WARN][98] ([i915#2021])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][99] ([i915#588]) -> [SKIP][100] ([i915#658])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635] / [i915#1937]) -> [SKIP][102] ([fdo#109271] / [i915#1937])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958] / [i915#2119]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-hsw6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827]) -> [SKIP][106] ([fdo#109271] / [fdo#111827] / [i915#1635]) +5 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][108] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][109] ([fdo#110321]) -> [DMESG-FAIL][110] ([fdo#110321] / [i915#1635] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl6/igt@kms_content_protection@lic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [DMESG-WARN][112] ([i915#180])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-apl:          [SKIP][113] ([fdo#109271]) -> [SKIP][114] ([fdo#109271] / [i915#1635]) +11 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl1/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl1/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][115] ([fdo#109349]) -> [DMESG-WARN][116] ([i915#1226])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][117] ([i915#1958] / [i915#2119]) -> [SKIP][118] ([fdo#109271])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:
    - shard-apl:          [SKIP][119] ([fdo#109271] / [i915#1635]) -> [SKIP][120] ([fdo#109271]) +9 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl3/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][121] ([i915#180]) -> [DMESG-WARN][122] ([i915#180] / [i915#93] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][125] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][126] ([fdo#108145] / [i915#95])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-d-query-forked-busy:
    - shard-snb:          [SKIP][127] ([fdo#109271]) -> [TIMEOUT][128] ([i915#1958] / [i915#2119]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-snb6/igt@kms_vblank@pipe-d-query-forked-busy.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][129], [FAIL][130], [FAIL][131]) ([i915#2110]) -> ([FAIL][132], [FAIL][133]) ([i915#1602] / [i915#2110])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb8/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5729/shard-tglb7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb8/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1159]: https://gitlab.freedesktop.org/drm/intel/issues/1159
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
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
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#636]: https://gitlab.freedesktop.org/drm/intel/issues/636
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5729 -> IGTPW_4752

  CI-20190529: 20190529
  CI_DRM_8717: 6e5ac4c72af4e86138f04cc2dd089b069bad873f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4752: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/index.html
  IGT_5729: a048d54f58dd70b07dbeb4541b273ec230ddb586 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4752/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
