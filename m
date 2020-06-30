Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Jun 2020 17:09:41 -0000
Message-ID: <159353698139.22703.11192071528882400588@emeril.freedesktop.org>
References: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L3Rl?=
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
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8677_full -> IGTPW_4718_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4718_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4718_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4718_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-c-ts-continuation-idle-hang:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_4718_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close@basic:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +37 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl4/igt@gem_close@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@gem_close@basic.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@gem_ctx_persistence@processes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl2/igt@gem_ctx_persistence@processes.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb5/igt@gem_mmap_gtt@basic-read-write.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1602] / [i915#1887] / [i915#456])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb6/igt@i915_suspend@forcewake.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#95]) +26 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb5/igt@kms_flip_tiling@flip-changes-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb3/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#1635] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_flip_tiling@flip-yf-tiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl7/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-snb:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_vgem@basic-gtt:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#402]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-tglb7/igt@prime_vgem@basic-gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-tglb1/igt@prime_vgem@basic-gtt.html

  * igt@syncobj_wait@multi-wait-for-submit-unsubmitted:
    - shard-hsw:          [PASS][39] -> [TIMEOUT][40] ([i915#1958]) +1 similar issue
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

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [i915#1635]) -> [SKIP][96] ([fdo#109271]) +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl8/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180]) -> [DMESG-WARN][98] ([i915#180] / [i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl3/igt@gem_workarounds@suspend-resume.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [SKIP][100] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl7/igt@kms_chamelium@vga-frame-dump.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl7/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][102] ([fdo#109271] / [fdo#111827])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-max.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [DMESG-WARN][104] ([i915#93] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-apl:          [SKIP][105] ([fdo#109271]) -> [SKIP][106] ([fdo#109271] / [i915#1635]) +14 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][107] ([i915#1958]) -> [SKIP][108] ([fdo#109271]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][111] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][112] ([fdo#108145] / [i915#265])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][113] ([fdo#108145] / [i915#95]) -> [FAIL][114] ([fdo#108145] / [i915#265])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][115] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][116] ([fdo#108145] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][118] ([fdo#108145] / [i915#1635] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [TIMEOUT][120] ([i915#1958])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-snb6/igt@kms_psr@primary_mmap_gtt.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-snb5/igt@kms_psr@primary_mmap_gtt.html
    - shard-hsw:          [SKIP][121] ([fdo#109271]) -> [TIMEOUT][122] ([i915#1958])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8677/shard-hsw8/igt@kms_psr@primary_mmap_gtt.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/shard-hsw6/igt@kms_psr@primary_mmap_gtt.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4718
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8677: 47bc281ce35e7872ee04238b2f5e81aeeeb2337b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4718: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4718/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
