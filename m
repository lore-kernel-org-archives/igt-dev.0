Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 06 Dec 2020 17:33:48 -0000
Message-ID: <160727602854.16270.6300007709475836435@emeril.freedesktop.org>
References: <20201206121045.263779-1-apoorva1.singh@intel.com>
In-Reply-To: <20201206121045.263779-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fgpgpu=5Ffill=3A_Add_test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1184881412=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1184881412==
Content-Type: multipart/alternative;
 boundary="===============0153166978517798977=="

--===============0153166978517798977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_gpgpu_fill: Add test description
URL   : https://patchwork.freedesktop.org/series/84615/
State : success

== Summary ==

CI Bug Log - changes from IGT_5882_full -> IGTPW_5252_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/index.html

Known issues
------------

  Here are the changes found in IGTPW_5252_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#2055])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#2597])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8] ([i915#2295])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#49])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#165] / [i915#180] / [i915#78])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109441])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][15] ([i915#2389]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][17] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2369] / [i915#2411] / [i915#456]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html
    - shard-iclb:         [INCOMPLETE][19] ([i915#1185] / [i915#1602] / [i915#2369]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb8/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - shard-iclb:         [FAIL][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
    - shard-tglb:         [FAIL][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tglb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][25] ([fdo#109271]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1/igt@i915_pm_rpm@gem-execbuf.html
    - shard-kbl:          [SKIP][27] ([fdo#109271]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][29] ([fdo#109271]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][31] ([fdo#109271]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-glk:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-glk:          [DMESG-WARN][35] ([i915#118] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-glk:          [FAIL][37] ([i915#54]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-apl:          [FAIL][39] ([i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-kbl:          [FAIL][41] ([i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:
    - shard-glk:          [FAIL][43] ([i915#70]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][45] ([i915#2598]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][47] ([i915#2055]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][49] ([i915#49]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - shard-glk:          [FAIL][51] ([i915#1036]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [INCOMPLETE][55] ([i915#2635]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-glk:          [INCOMPLETE][57] ([i915#2635]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-hsw:          [INCOMPLETE][59] ([i915#2055] / [i915#2637]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [INCOMPLETE][61] ([i915#155]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][63] ([i915#2684]) -> [WARN][64] ([i915#1804] / [i915#2684])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][65], [FAIL][66]) ([i915#2283] / [i915#2295]) -> ([FAIL][67], [FAIL][68]) ([i915#2283] / [i915#2295] / [i915#2505] / [i915#483])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw6/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][69], [FAIL][70], [FAIL][71]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -> ([FAIL][72], [FAIL][73], [FAIL][74]) ([i915#1436] / [i915#2283] / [i915#2295] / [i915#2722] / [i915#483])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl6/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl4/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][75], [FAIL][76], [FAIL][77]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][78], [FAIL][79]) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#483])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb5/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb8/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][80], [FAIL][81], [FAIL][82]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722]) -> ([FAIL][83], [FAIL][84]) ([i915#2283] / [i915#2295] / [i915#2722])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl2/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][85], [FAIL][86], [FAIL][87]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][88], [FAIL][89], [FAIL][90]) ([i915#2283] / [i915#2295] / [i915#2722] / [k.org#202321])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk4/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk1/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk9/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2245]: https://gitlab.freedesktop.org/drm/intel/issues/2245
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5882 -> IGTPW_5252

  CI-20190529: 20190529
  CI_DRM_9450: 83b8d6ab0631ef13a095c7818d3c2c40f52f42ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5252: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/index.html
  IGT_5882: 47f770e8e544831ae5a984b2083df73f71067762 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/index.html

--===============0153166978517798977==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_gpgpu_fill: Add test description</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84615/">https://patchwork.freedesktop.org/series/84615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5252/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5252/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5882_full -&gt; IGTPW_5252_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5252_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/s=
hard-kbl6/igt@gem_ctx_isolation@preservation-s3@vecs0.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/sh=
ard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tg=
lb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5252/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb=
-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5252/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-pri-shrfb-draw-mmap-gtt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-yf.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-k=
bl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb6/igt@=
kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2=
389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
52/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i9=
15#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2369">i915#2369</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5252/shard-tglb7/igt@i915_pm_backlight@fade_w=
ith_suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i9=
15#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
02">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2369">i915#2369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5252/shard-iclb8/igt@i915_pm_backlight@fade_with_suspend.html=
">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-=
iclb8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-tglb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-=
tglb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl3=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl3=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk3=
/igt@i915_pm_rpm@gem-execbuf.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_atomic_transition@1x-modeset-transitions-nonbl=
ocking.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5252/shard-glk7/igt@kms_atomic_transition@1x-modeset-transitions=
-nonblocking.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5252/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscre=
en.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
252/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</=
a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
252/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</=
a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
252/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</=
a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/70"=
>i915#70</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5252/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-e=
dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5252/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i91=
5#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5252/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-gtt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5252/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
036">i915#1036</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5252/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe=
-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-iclb2=
/igt@kms_psr@psr2_no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5252/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5252/shard-glk7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/205=
5">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5252/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-suspend.=
html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5882/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155=
">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5252/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/sha=
rd-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-hsw2/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
83">i915#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5252/shard-hsw1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-hsw1/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2505">i915#2505</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-kbl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/602">i915#602</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/sha=
rd-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5252/shard-kbl4/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-iclb8/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882=
/shard-iclb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/sha=
rd-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5252/shard-iclb7/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#=
2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295"=
>i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-apl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5252/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i91=
5#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5882/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/shard-glk4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5882/s=
hard-glk1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/sh=
ard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5252/shard-glk5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/shard-glk=
8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://=
bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5882 -&gt; IGTPW_5252</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9450: 83b8d6ab0631ef13a095c7818d3c2c40f52f42ce @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5252: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5252/index.htm=
l<br />
  IGT_5882: 47f770e8e544831ae5a984b2083df73f71067762 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============0153166978517798977==--

--===============1184881412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1184881412==--
