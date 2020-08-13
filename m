Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Aug 2020 03:21:58 -0000
Message-ID: <159728891862.14256.17711147684038510856@emeril.freedesktop.org>
References: <20200812213300.905759-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200812213300.905759-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fpersistence=3A_Exercise_cleanup_after_disabling_hear?=
 =?utf-8?q?tbeats_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0086177006=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0086177006==
Content-Type: multipart/alternative;
 boundary="===============0070521321175328813=="

--===============0070521321175328813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_persistence: Exercise cleanup after disabling heartbeats (rev2)
URL   : https://patchwork.freedesktop.org/series/80571/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8879_full -> IGTPW_4878_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4878_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4878_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4878_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_persistence@heartbeat-many} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-iclb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb1/igt@gem_ctx_persistence@heartbeat-many.html

  * {igt@gem_ctx_persistence@heartbeat-stop} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb1/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-kbl:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8879_full and IGTPW_4878_full:

### New IGT tests (5) ###

  * igt@gem_ctx_persistence@heartbeat-close:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@gem_ctx_persistence@heartbeat-hang:
    - Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.22] s

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.19] s

  * igt@gem_ctx_persistence@heartbeat-many:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@gem_ctx_persistence@heartbeat-stop:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.0, 2.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_4878_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-snb:          [PASS][8] -> [TIMEOUT][9] ([i915#1958])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb6/igt@gem_ctx_exec@basic-nohangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][10] -> [DMESG-FAIL][11] ([i915#118] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-hsw:          [PASS][12] -> [TIMEOUT][13] ([i915#1958]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#129])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_color@pipe-c-ctm-green-to-red.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#129] / [i915#1635])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl3/igt@kms_color@pipe-c-ctm-green-to-red.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl6/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#1635] / [i915#54])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2122]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_frontbuffer_tracking@basic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-iclb:         [PASS][30] -> [DMESG-WARN][31] ([i915#1982])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-tglb:         [PASS][32] -> [DMESG-WARN][33] ([i915#1982]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1635] / [i915#1982])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl3/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl7/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#1542])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb7/igt@perf@blocking-parameterized.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb2/igt@perf@blocking-parameterized.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#1755])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk7/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk6/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][44] ([i915#118] / [i915#95]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk9/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_pwrite@basic-random:
    - shard-snb:          [TIMEOUT][46] ([i915#1958]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@gem_pwrite@basic-random.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb5/igt@gem_pwrite@basic-random.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][48] ([i915#1904]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         [INCOMPLETE][50] ([i915#2268]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb3/igt@i915_selftest@live@execlists.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb8/igt@i915_selftest@live@execlists.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-hsw:          [TIMEOUT][52] ([i915#1958]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_color@pipe-a-ctm-max.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [TIMEOUT][54] ([i915#1958]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_color@pipe-a-ctm-max.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk1/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][56] ([i915#1635] / [i915#54]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][58] ([i915#57]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][60] ([i915#1982]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][62] ([i915#2055]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +9 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][66] ([i915#1982]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-iclb:         [DMESG-WARN][68] ([i915#1982]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb3/igt@kms_psr@psr2_basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][72] ([i915#31]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl2/igt@kms_setmode@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl2/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][74] ([i915#2258]) -> [PASS][75] +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-glk:          [TIMEOUT][76] ([i915#1958]) -> [INCOMPLETE][77] ([i915#1958])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@gem_exec_reloc@basic-concurrent16.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-snb:          [TIMEOUT][78] ([i915#1958]) -> [SKIP][79] ([fdo#109271]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@kms_color@pipe-a-ctm-max.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb5/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-glk:          [TIMEOUT][80] ([i915#1366] / [i915#1958]) -> [SKIP][81] ([fdo#109271] / [fdo#111827])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-hsw:          [TIMEOUT][82] ([i915#1958]) -> [SKIP][83] ([fdo#109271] / [fdo#111827])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-snb:          [TIMEOUT][84] ([i915#1958]) -> [SKIP][85] ([fdo#109271] / [fdo#111827])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][86] ([i915#1319]) -> [TIMEOUT][87] ([i915#1319] / [i915#1958])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_content_protection@srm.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-hsw:          [TIMEOUT][88] ([i915#1958]) -> [SKIP][89] ([fdo#109271])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
    - shard-glk:          [TIMEOUT][90] ([i915#1958]) -> [SKIP][91] ([fdo#109271])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-hsw:          [SKIP][92] ([fdo#109271]) -> [TIMEOUT][93] ([i915#1958])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw1/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-snb:          [SKIP][94] ([fdo#109271]) -> [TIMEOUT][95] ([i915#1958]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5768 -> IGTPW_4878
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8879: 383f247a5884778b21e17dc9537e0bdeae503953 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4878: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html
  IGT_5768: 4ce2f30715836214d7b4452ada8c63b23eba73b7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html

--===============0070521321175328813==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_persistence: Exercise cleanup after disabling heartbeats (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80571/">https://patchwork.freedesktop.org/series/80571/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8879_full -&gt; IGTPW_4878_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4878_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4878_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4878_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-many} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@gem_ctx_persistence@heartbeat-many.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb1/igt@gem_ctx_persistence@heartbeat-many.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-stop} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb1/igt@gem_ctx_persistence@heartbeat-stop.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl4/igt@gem_ctx_persistence@heartbeat-stop.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8879_full and IGTPW_4878_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4878_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb4/igt@gem_ctx_exec@basic-nohangcheck.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_color@pipe-c-ctm-green-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl3/igt@kms_color@pipe-c-ctm-green-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl6/igt@kms_color@pipe-c-ctm-green-to-red.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk4/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl3/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl7/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb7/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk7/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk6/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk9/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@gem_pwrite@basic-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb5/igt@gem_pwrite@basic-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb3/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb8/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_color@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_color@pipe-a-ctm-max.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_color@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk1/igt@kms_color@pipe-a-ctm-max.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl2/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk6/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@kms_color@pipe-a-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb5/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1366">i915#1366</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-kbl7/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-kbl1/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-hsw1/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-hsw6/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8879/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5768 -&gt; IGTPW_4878</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8879: 383f247a5884778b21e17dc9537e0bdeae503953 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4878: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4878/index.html<br />
  IGT_5768: 4ce2f30715836214d7b4452ada8c63b23eba73b7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0070521321175328813==--

--===============0086177006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0086177006==--
