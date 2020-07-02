Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 17:30:10 -0000
Message-ID: <159371101092.5656.3108405128429911414@emeril.freedesktop.org>
References: <20200702123908.227124-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200702123908.227124-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Instantiate_a_local_drm=5Ffd_for_the_unprivileged_helper?=
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

Series: i915/perf: Instantiate a local drm_fd for the unprivileged helper
URL   : https://patchwork.freedesktop.org/series/79045/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8694_full -> IGTPW_4729_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4729_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4729_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4729_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
Known issues
------------

  Here are the changes found in IGTPW_4729_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@context-create:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-hsw2/igt@gem_eio@context-create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-hsw6/igt@gem_eio@context-create.html

  * igt@gem_eio@wait-wedge-immediate:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1226])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb4/igt@gem_eio@wait-wedge-immediate.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb2/igt@gem_eio@wait-wedge-immediate.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2079])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl4/igt@gem_exec_balancer@bonded-early.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl3/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk3/igt@gem_exec_whisper@basic-forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk6/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_wc@bad-size:
    - shard-snb:          [PASS][13] -> [TIMEOUT][14] ([i915#1958] / [i915#2119]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb5/igt@gem_mmap_wc@bad-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb6/igt@gem_mmap_wc@bad-size.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1436] / [i915#716])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +29 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([fdo#108145] / [i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([fdo#108145] / [i915#1635] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#93] / [i915#95]) +34 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#668]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#83])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#83])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#1635] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][41] -> [DMESG-FAIL][42] ([fdo#108145] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][43] -> [DMESG-FAIL][44] ([fdo#108145] / [i915#1635] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-iclb:         [PASS][45] -> [DMESG-WARN][46] ([i915#1982])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][49] -> [DMESG-FAIL][50] ([i915#1635] / [i915#31] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl4/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([IGT#2])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb4/igt@kms_sysfs_edid_timing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb2/igt@kms_sysfs_edid_timing.html

  * igt@perf@blocking-parameterized:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#1542])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb3/igt@perf@blocking-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb8/igt@perf@blocking-parameterized.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-tglb:         [PASS][55] -> [DMESG-WARN][56] ([i915#402]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb6/igt@perf@low-oa-exponent-permissions.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb7/igt@perf@low-oa-exponent-permissions.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][57] ([i915#58] / [k.org#198133]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk5/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_vm_create@invalid-create:
    - shard-tglb:         [DMESG-WARN][61] ([i915#402]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb7/igt@gem_vm_create@invalid-create.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb1/igt@gem_vm_create@invalid-create.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][63] ([i915#1436] / [i915#716]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@error-state-basic:
    - shard-kbl:          [DMESG-WARN][65] ([i915#93] / [i915#95]) -> [PASS][66] +43 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl6/igt@i915_hangman@error-state-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl7/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@mock@requests:
    - shard-snb:          [INCOMPLETE][67] ([i915#2110] / [i915#82]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb6/igt@i915_selftest@mock@requests.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb1/igt@i915_selftest@mock@requests.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][69] ([i915#1149]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb3/igt@kms_color@pipe-a-gamma.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb6/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:
    - shard-glk:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html

  * igt@kms_cursor_legacy@pipe-a-forked-move:
    - shard-apl:          [DMESG-WARN][77] ([i915#1635] / [i915#95]) -> [PASS][78] +31 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl6/igt@kms_cursor_legacy@pipe-a-forked-move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl6/igt@kms_cursor_legacy@pipe-a-forked-move.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][79] ([i915#2055]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-snb:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][85] ([i915#433]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][87] ([fdo#108145] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][89] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][91] ([i915#1635] / [i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [DMESG-FAIL][93] ([i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-glk:          [FAIL][95] ([i915#1559]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-glk2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-glk3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][97] ([i915#173]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb1/igt@kms_psr@no_drrs.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][101] ([i915#155] / [i915#794]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][103] ([i915#1820]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@reset-during-wait-for-submit:
    - shard-hsw:          [TIMEOUT][105] ([i915#1958] / [i915#2119]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-hsw7/igt@syncobj_wait@reset-during-wait-for-submit.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-hsw1/igt@syncobj_wait@reset-during-wait-for-submit.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][107] ([i915#2036]) -> [WARN][108] ([i915#2021])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][109] ([i915#1515]) -> [WARN][110] ([i915#1515])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          [SKIP][111] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][112] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl7/igt@kms_chamelium@vga-edid-read.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl1/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958] / [i915#2119]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-hsw4/igt@kms_color@pipe-d-ctm-green-to-red.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-hsw6/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [fdo#111827]) -> [SKIP][116] ([fdo#109271] / [fdo#111827] / [i915#1635]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-max.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][117] ([i915#1319] / [i915#2119]) -> [TIMEOUT][118] ([i915#1319] / [i915#1958] / [i915#2119])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl3/igt@kms_content_protection@srm.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][119] ([i915#2105]) -> [DMESG-FAIL][120] ([i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl3/igt@kms_content_protection@uevent.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][121] ([i915#2105]) -> [DMESG-FAIL][122] ([i915#1635] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl8/igt@kms_content_protection@uevent.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-apl:          [SKIP][123] ([fdo#109271]) -> [SKIP][124] ([fdo#109271] / [i915#1635]) +17 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-hsw:          [TIMEOUT][125] ([i915#1958] / [i915#2119]) -> [SKIP][126] ([fdo#109271]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][127] ([i915#93] / [i915#95]) -> [INCOMPLETE][128] ([i915#155])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-apl:          [SKIP][129] ([fdo#109271] / [i915#1635]) -> [SKIP][130] ([fdo#109271]) +14 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-snb:          [SKIP][131] ([fdo#109271]) -> [TIMEOUT][132] ([i915#1958] / [i915#2119]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-snb:          [TIMEOUT][133] ([i915#1958] / [i915#2119]) -> [SKIP][134] ([fdo#109271]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-snb6/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-snb5/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][135] ([i915#31]) -> [DMESG-WARN][136] ([i915#93] / [i915#95])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-kbl4/igt@kms_setmode@basic.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-kbl1/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][137] ([i915#1635] / [i915#2110]) -> ([FAIL][138], [FAIL][139]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8694/shard-apl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/shard-apl2/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5720 -> IGTPW_4729
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8694: 47d8d98965c49379c12a751da66372c7cc1881a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4729: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/index.html
  IGT_5720: f35053d4b6d7bbcf6505ef67a8bd56acc7fb2eb2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4729/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
