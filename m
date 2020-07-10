Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jul 2020 14:11:33 -0000
Message-ID: <159439029345.20499.10733254848463404236@emeril.freedesktop.org>
References: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_Clear_pipes_properly_in_kms=5Fatomic=5Ftransition_=28rev?=
 =?utf-8?q?2=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: Clear pipes properly in kms_atomic_transition (rev2)
URL   : https://patchwork.freedesktop.org/series/78741/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8677_full -> IGTPW_4718_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/index.html

Known issues
------------

  Here are the changes found in IGTPW_4718_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close@basic:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#93] / [i915#95]) +37 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl4/igt@gem_close@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@gem_close@basic.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1528] / [i915#1635])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl2/igt@gem_ctx_persistence@processes.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb5/igt@gem_mmap_gtt@basic-read-write.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1602] / [i915#1887] / [i915#456])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb6/igt@i915_suspend@forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +26 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb5/igt@kms_flip_tiling@flip-changes-tiling.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb3/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_flip_tiling@flip-yf-tiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl7/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-snb:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle-hang:
    - shard-hsw:          [PASS][35] -> [INCOMPLETE][36] ([CI#80])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html

  * igt@prime_vgem@basic-gtt:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#402]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb7/igt@prime_vgem@basic-gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb1/igt@prime_vgem@basic-gtt.html

  * igt@syncobj_wait@multi-wait-for-submit-unsubmitted:
    - shard-hsw:          [PASS][39] -> [TIMEOUT][40] ([i915#1958] / [i915#2119]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@syncobj_wait@multi-wait-for-submit-unsubmitted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@syncobj_wait@multi-wait-for-submit-unsubmitted.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][41] ([i915#1930]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][45] ([i915#1958]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][47] ([i915#1436] / [i915#716]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +40 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@i915_getparams_basic@basic-eu-total.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl7/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_selftest@mock@requests:
    - shard-apl:          [INCOMPLETE][51] ([i915#1635] / [i915#2110]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@i915_selftest@mock@requests.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@i915_selftest@mock@requests.html
    - shard-iclb:         [INCOMPLETE][53] ([i915#2110]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb6/igt@i915_selftest@mock@requests.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-iclb5/igt@i915_selftest@mock@requests.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-hsw:          [INCOMPLETE][55] ([i915#2055]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw7/igt@kms_atomic_interruptible@legacy-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw4/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#54] / [i915#95]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][65] ([i915#96]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][69] ([i915#1928]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl6/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_lease@lessee_list.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw4/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][83] ([i915#1635] / [i915#95]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         [DMESG-WARN][89] ([i915#402]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb1/igt@kms_psr@psr2_sprite_plane_onoff.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb8/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#95]) -> [PASS][94] +37 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@perf@invalid-oa-metric-set-id.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][95] ([i915#1930]) -> [FAIL][96] ([i915#1635] / [i915#1930])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@gem_exec_reloc@basic-concurrent0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][97] ([i915#1958]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-hsw:          [TIMEOUT][99] ([i915#1958]) -> [TIMEOUT][100] ([i915#1958] / [i915#2119])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@gem_exec_reloc@basic-concurrent16.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1699]) -> [SKIP][102] ([fdo#109271] / [i915#1635] / [i915#1699]) +7 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@gem_userptr_blits@process-exit-mmap@wb.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [DMESG-WARN][104] ([i915#180] / [i915#93] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#658]) -> [SKIP][106] ([fdo#109271] / [i915#1635] / [i915#658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [i915#1937]) -> [SKIP][108] ([fdo#109271] / [i915#1635] / [i915#1937])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [fdo#111827]) -> [SKIP][110] ([fdo#109271] / [fdo#111827] / [i915#1635]) +86 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][111] ([i915#1319] / [i915#1958]) -> [TIMEOUT][112] ([i915#1319] / [i915#1958] / [i915#2119]) +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@kms_content_protection@atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][113] ([fdo#110321] / [fdo#110336]) -> [FAIL][114] ([fdo#110321] / [fdo#110336] / [i915#1635]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][115] ([fdo#110321]) -> [FAIL][116] ([fdo#110321] / [i915#1635]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_content_protection@lic.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          [FAIL][117] ([i915#2105]) -> [FAIL][118] ([i915#1635] / [i915#2105])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_content_protection@uevent.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180]) -> [DMESG-WARN][120] ([i915#93] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][121] ([i915#1958]) -> [SKIP][122] ([fdo#109271]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][123] ([i915#1958]) -> [SKIP][124] ([fdo#109271])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][125] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][126] ([fdo#108145] / [i915#1635] / [i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][127] ([fdo#108145] / [i915#95]) -> [FAIL][128] ([fdo#108145] / [i915#265])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          [FAIL][129] ([i915#265]) -> [FAIL][130] ([i915#1635] / [i915#265]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][131] ([fdo#108145] / [i915#265]) -> [FAIL][132] ([fdo#108145] / [i915#1635] / [i915#265]) +8 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][133] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][134] ([fdo#108145] / [i915#95])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][135] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][136] ([fdo#108145] / [i915#1635] / [i915#95])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-snb:          [SKIP][137] ([fdo#109271]) -> [TIMEOUT][138] ([i915#1958] / [i915#2119])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb6/igt@kms_psr@primary_mmap_gtt.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@kms_psr@primary_mmap_gtt.html
    - shard-hsw:          [SKIP][139] ([fdo#109271]) -> [TIMEOUT][140] ([i915#1958] / [i915#2119])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw8/igt@kms_psr@primary_mmap_gtt.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][141] ([i915#31]) -> [FAIL][142] ([i915#1635] / [i915#31])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_setmode@basic.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][143] ([IGT#2]) -> [FAIL][144] ([IGT#2] / [i915#1635])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_sysfs_edid_timing.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          [SKIP][145] ([fdo#109271]) -> [SKIP][146] ([fdo#109271] / [i915#1635]) +836 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-idle.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@perf@blocking-parameterized:
    - shard-apl:          [FAIL][147] ([i915#1542]) -> [FAIL][148] ([i915#1542] / [i915#1635]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@perf@blocking-parameterized.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl7/igt@perf@blocking-parameterized.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][149] ([i915#1436] / [i915#1784]) -> [FAIL][150] ([i915#1436] / [i915#1784] / [i915#2110])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl1/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1958]: https://gitlab.freedesktop.or

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
