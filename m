Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 05:56:11 -0000
Message-ID: <158528857159.17234.10916778197245555607@emeril.freedesktop.org>
References: <20200326050208.29377-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200326050208.29377-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fset=5Ftilling=5Fvs=5Fgtt=3A_Minor_Changes?=
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

Series: i915/gem_set_tilling_vs_gtt: Minor Changes
URL   : https://patchwork.freedesktop.org/series/75110/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8190_full -> IGTPW_4357_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8190_full and IGTPW_4357_full:

### New IGT tests (2) ###

  * igt@gem_exec_big@single:
    - Statuses : 6 pass(s)
    - Exec time: [2.93, 32.79] s

  * igt@gem_exec_schedule@semaphore-power:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.85] s

  

Known issues
------------

  Here are the changes found in IGTPW_4357_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#1277])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb7/igt@gem_exec_balancer@hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +21 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#716] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112080]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@i915_hangman@error-state-capture-vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb5/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103927] / [i915#656])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@i915_selftest@live@execlists.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl7/igt@i915_selftest@live@execlists.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1119] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1119] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#52] / [i915#54]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#52] / [i915#54] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#64])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#46])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1185] / [i915#221])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#699] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#95]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([fdo#107931] / [i915#699] / [i915#93] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [PASS][55] -> [FAIL][56] ([i915#49])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][59] ([fdo#112080]) -> [PASS][60] +10 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +13 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][65] ([fdo#112146]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gem_softpin@noreloc-s3.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][71] ([i915#716]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][73] ([i915#1316]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@i915_pm_rpm@i2c.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-tglb2/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk3/igt@i915_pm_rpm@i2c.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk9/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][77] ([i915#1316]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@i915_pm_rpm@i2c.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb3/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][79] ([i915#54]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][83] ([i915#54]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][87] ([i915#52] / [i915#54]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][89] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][91] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-apl:          [DMESG-WARN][93] ([i915#1297]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_flip@basic-flip-vs-modeset.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1297]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl1/igt@kms_flip@flip-vs-fences.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][97] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [FAIL][99] ([i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][101] ([i915#93] / [i915#95]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][103] ([i915#899]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][105] ([i915#173]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@kms_psr@no_drrs.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][109] ([i915#31]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl1/igt@kms_setmode@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl8/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][111] ([i915#454]) -> [SKIP][112] ([i915#468])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][113] ([fdo#111644] / [i915#1397]) -> [SKIP][114] ([i915#1316])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][115] ([i915#1316]) -> [SKIP][116] ([fdo#109506])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][117] ([i915#1316]) -> [SKIP][118] ([fdo#109293] / [fdo#109506])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][119] ([i915#357]) -> [FAIL][120] ([i915#357] / [i915#93] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_content_protection@uevent.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][121] ([i915#357]) -> [FAIL][122] ([i915#357] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@kms_content_protection@uevent.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb:
    - shard-apl:          [FAIL][123] ([fdo#108145]) -> [FAIL][124] ([fdo#108145] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][125] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][126] ([fdo#108145])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][127] ([i915#608]) -> [SKIP][128] ([fdo#109642] / [fdo#111068])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][129] ([i915#92]) -> ([FAIL][130], [FAIL][131]) ([i915#716] / [i915#92])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][132], [FAIL][133]) ([fdo#103927] / [i915#716]) -> ([FAIL][134], [FAIL][135]) ([fdo#103927] / [i915#529])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/shard-apl7/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107931]: https://bugs.freedesktop.org/show_bug.cgi?id=107931
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5538 -> IGTPW_4357
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8190: 73f711b364bc85c8a7189487c09431eb1f515ed0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4357: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/index.html
  IGT_5538: 47becbc9cd1fc7b1b78692f90fd3dcd5a9066965 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4357/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
