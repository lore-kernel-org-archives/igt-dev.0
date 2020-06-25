Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Jun 2020 11:29:03 -0000
Message-ID: <159308454335.3270.7983642095205328063@emeril.freedesktop.org>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev2=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev2)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8664_full -> IGTPW_4703_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4703_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4703_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4703_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@kms:
    - shard-hsw:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw4/igt@gem_eio@kms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw2/igt@gem_eio@kms.html
    - shard-kbl:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl7/igt@gem_eio@kms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@gem_eio@kms.html
    - shard-apl:          [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl8/igt@gem_eio@kms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl3/igt@gem_eio@kms.html
    - shard-glk:          [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk8/igt@gem_eio@kms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk1/igt@gem_eio@kms.html
    - shard-snb:          [PASS][11] -> [FAIL][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb2/igt@gem_eio@kms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-snb1/igt@gem_eio@kms.html

  * igt@kms_busy@basic-flip-pipe-b:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw2/igt@kms_busy@basic-flip-pipe-b.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw4/igt@kms_busy@basic-flip-pipe-b.html

  * igt@kms_lease@simple_lease:
    - shard-iclb:         [PASS][15] -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb5/igt@kms_lease@simple_lease.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb7/igt@kms_lease@simple_lease.html
    - shard-tglb:         [PASS][17] -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb8/igt@kms_lease@simple_lease.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb2/igt@kms_lease@simple_lease.html

  
#### Warnings ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         [SKIP][19] ([i915#1839]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         [SKIP][21] ([i915#1839]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4703_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2079])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@gem_exec_balancer@bonded-early.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb5/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#118] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk1/igt@gem_exec_whisper@basic-fds-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk7/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#93] / [i915#95]) +43 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl7/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1635] / [i915#95]) +42 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@gen9_exec_parse@batch-without-end.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl7/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb7/igt@i915_module_load@reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb8/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@bad-pitch-256:
    - shard-snb:          [PASS][33] -> [TIMEOUT][34] ([i915#1958]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb5/igt@kms_addfb_basic@bad-pitch-256.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-snb2/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][35] -> [DMESG-FAIL][36] ([i915#118] / [i915#95]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#54] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#49])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#49])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][51] -> [DMESG-WARN][52] ([i915#1982]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][53] -> [DMESG-FAIL][54] ([i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][55] -> [DMESG-FAIL][56] ([i915#1635] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][57] -> [DMESG-WARN][58] ([i915#1982])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-hsw:          [PASS][59] -> [TIMEOUT][60] ([i915#1958]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw5/igt@kms_prop_blob@blob-prop-lifetime.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw5/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][63] ([i915#118] / [i915#95]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][65] ([i915#1958]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw8/igt@gem_userptr_blits@create-destroy-sync.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw2/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][67] ([i915#1904]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][69] ([i915#151] / [i915#155]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][71] ([i915#93] / [i915#95]) -> [PASS][72] +33 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@busy-flip@a-hdmi-a2:
    - shard-glk:          [FAIL][77] ([i915#275]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-glk7/igt@kms_flip@busy-flip@a-hdmi-a2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-glk2/igt@kms_flip@busy-flip@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][87] ([i915#1958]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb6/igt@kms_invalid_dotclock.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-snb1/igt@kms_invalid_dotclock.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_vgem@basic-blt:
    - shard-tglb:         [DMESG-WARN][91] ([i915#402]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb8/igt@prime_vgem@basic-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb6/igt@prime_vgem@basic-blt.html

  * igt@syncobj_wait@multi-wait-all-signaled:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#95]) -> [PASS][94] +26 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@syncobj_wait@multi-wait-all-signaled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl3/igt@syncobj_wait@multi-wait-all-signaled.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827]) -> [SKIP][98] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl7/igt@kms_chamelium@vga-hpd-without-ddc.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl3/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][101] ([fdo#110321]) -> [DMESG-FAIL][102] ([fdo#110321] / [i915#1635] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl1/igt@kms_content_protection@lic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl2/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][103] ([i915#1319] / [i915#1958]) -> [TIMEOUT][104] ([i915#1319])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl1/igt@kms_content_protection@lic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][105] ([i915#54] / [i915#95]) -> [FAIL][106] ([i915#54])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [DMESG-WARN][107] ([i915#1635] / [i915#95]) -> [FAIL][108] ([i915#54])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][109] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][110] ([fdo#109278] / [fdo#112010])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][111] ([fdo#109278] / [fdo#112010]) -> [SKIP][112] ([fdo#109278]) +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-hsw:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [i915#1635]) -> [SKIP][118] ([fdo#109271]) +13 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-apl:          [SKIP][119] ([fdo#109271]) -> [SKIP][120] ([fdo#109271] / [i915#1635]) +14 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][121] ([fdo#109271]) -> [TIMEOUT][122] ([i915#1958]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][123] ([fdo#112025] / [fdo#112054]) -> [SKIP][124] ([fdo#112054])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][125] ([fdo#111825] / [fdo#112015]) -> [SKIP][126] ([fdo#111825])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8664/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#275]: https://gitlab.freedesktop.org/drm/intel/issues/275
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4703
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8664: a15b3619fc33a841f92f3939c6bfaffefba28fbf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4703: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4703/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
