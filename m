Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Jun 2020 10:37:18 -0000
Message-ID: <159316783811.22985.5048109441756796840@emeril.freedesktop.org>
References: <cover.1592991729.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1592991729.git.melissa.srw@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbWlub3Ig?=
 =?utf-8?q?improvements_to_the_kms=5Fcursor=5Fcrc_doc_and_some_comments_cl?=
 =?utf-8?q?eanup?=
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: minor improvements to the kms_cursor_crc doc and some comments cleanup
URL   : https://patchwork.freedesktop.org/series/78814/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8665_full -> IGTPW_4705_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4705_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4705_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4705_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw4/igt@gem_exec_whisper@basic-contexts-forked-all.html

  
Known issues
------------

  Here are the changes found in IGTPW_4705_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_read@fault-buffer:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-tglb1/igt@drm_read@fault-buffer.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-tglb1/igt@drm_read@fault-buffer.html

  * igt@i915_query@engine-info:
    - shard-iclb:         [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-iclb2/igt@i915_query@engine-info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-iclb5/igt@i915_query@engine-info.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][7] -> [DMESG-FAIL][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#54] / [i915#95]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +43 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#96])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-apl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1635] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([CI#80] / [i915#155])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#93] / [i915#95]) +46 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([IGT#2])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl4/igt@kms_sysfs_edid_timing.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl4/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([IGT#2])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl4/igt@kms_sysfs_edid_timing.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl8/igt@kms_vblank@pipe-b-query-forked-busy.html

  * igt@syncobj_wait@multi-wait-all-for-submit-signaled:
    - shard-hsw:          [PASS][47] -> [TIMEOUT][48] ([i915#1958])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw2/igt@syncobj_wait@multi-wait-all-for-submit-signaled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw7/igt@syncobj_wait@multi-wait-all-for-submit-signaled.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-glk3/igt@gem_exec_whisper@basic-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-glk1/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw2/igt@gem_shrink@reclaim.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw4/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw7/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][57] ([i915#1904]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][59] ([i915#151] / [i915#155]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][61] ([i915#93] / [i915#95]) -> [PASS][62] +41 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl2/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [DMESG-FAIL][67] ([i915#1635] / [i915#95]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][69] ([i915#1958]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-snb5/igt@kms_invalid_dotclock.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-snb6/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl7/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-tglb:         [FAIL][79] ([i915#1542]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-tglb1/igt@perf@blocking-parameterized.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-tglb7/igt@perf@blocking-parameterized.html

  * igt@syncobj_wait@multi-wait-all-signaled:
    - shard-apl:          [DMESG-WARN][81] ([i915#1635] / [i915#95]) -> [PASS][82] +34 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl7/igt@syncobj_wait@multi-wait-all-signaled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@syncobj_wait@multi-wait-all-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][83] ([i915#1958]) -> [FAIL][84] ([i915#1930])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-kbl:          [INCOMPLETE][85] ([i915#1958]) -> [INCOMPLETE][86] ([i915#1958] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl6/igt@gem_exec_reloc@basic-concurrent16.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl7/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [INCOMPLETE][87] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][88] ([i915#1635] / [i915#1958] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-apl:          [SKIP][91] ([fdo#109271]) -> [SKIP][92] ([fdo#109271] / [i915#1635]) +9 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl1/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][93] ([i915#1958]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827]) -> [SKIP][98] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl7/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][99] ([i915#357]) -> [DMESG-FAIL][100] ([i915#357] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl6/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][101] ([i915#357]) -> [DMESG-FAIL][102] ([i915#1635] / [i915#357] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl4/igt@kms_content_protection@uevent.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][105] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][106] ([fdo#108145] / [i915#1635] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][107] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][108] ([fdo#108145] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr@primary_blt:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-hsw4/igt@kms_psr@primary_blt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-hsw7/igt@kms_psr@primary_blt.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][111] ([fdo#109271] / [i915#1635]) -> [SKIP][112] ([fdo#109271]) +14 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-apl3/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][113] ([i915#1820]) -> [FAIL][114] ([i915#1820] / [i915#93] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8665/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4705
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8665: 2cb786fa6506e20b5cb2a10decda11454111e026 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4705: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4705/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
