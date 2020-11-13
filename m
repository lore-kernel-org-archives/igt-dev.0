Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Nov 2020 20:50:08 -0000
Message-ID: <160530060894.20636.8417620975419431236@emeril.freedesktop.org>
References: <20201113144718.1292349-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201113144718.1292349-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBE?=
 =?utf-8?q?o_not_apply_filtering_to_DRIVER=5FVGEM?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0569462453=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0569462453==
Content-Type: multipart/alternative;
 boundary="===============0173575191442036285=="

--===============0173575191442036285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Do not apply filtering to DRIVER_VGEM
URL   : https://patchwork.freedesktop.org/series/83813/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9326_full -> IGTPW_5165_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5165_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5165_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5165_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_caching@read-writes:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb5/igt@gem_caching@read-writes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-snb4/igt@gem_caching@read-writes.html

  * igt@gem_eio@wait-wedge-1us:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@gem_eio@wait-wedge-1us.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@gem_eio@wait-wedge-1us.html

  * igt@gem_exec_parallel@basic@bcs0:
    - shard-hsw:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw7/igt@gem_exec_parallel@basic@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@gem_exec_parallel@basic@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5165_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#1888]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw6/igt@gem_exec_flush@basic-wb-pro-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#2650])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-snb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#1888] / [i915#2552])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][13] -> [INCOMPLETE][14] ([i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][17] -> [WARN][18] ([i915#1519])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2598])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb6/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-wait-idle:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl6/igt@kms_vblank@pipe-b-wait-idle.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@perf@blocking.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@perf@blocking.html
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1354]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk6/igt@perf@blocking.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk1/igt@perf@blocking.html
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([i915#1354]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@perf@blocking.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb7/igt@perf@blocking.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1354] / [i915#1635]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl8/igt@perf@blocking.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl7/igt@perf@blocking.html

  * igt@perf@invalid-oa-exponent:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1354]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@perf@invalid-oa-exponent.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb5/igt@perf@invalid-oa-exponent.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-kbl:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@perf@whitelisted-registers-userspace-config.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl1/igt@perf@whitelisted-registers-userspace-config.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1373]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb2/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][49] ([i915#1635] / [i915#2635]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl4/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][51] ([i915#2199] / [i915#2635]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk9/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][53] ([i915#2637]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw8/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@i915_module_load@reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb3/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@i2c:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk4/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][61] ([i915#96]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#1982]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-snb:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [INCOMPLETE][71] ([i915#2055] / [i915#2637]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [INCOMPLETE][73] ([i915#155]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [INCOMPLETE][75] ([i915#2635]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [INCOMPLETE][77] ([i915#1185]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [FAIL][81] ([i915#1542]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1436]) -> [DMESG-WARN][84] ([i915#2411])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb2/igt@gem_softpin@noreloc-s3.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][85] ([i915#1226]) -> [SKIP][86] ([fdo#109349])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [INCOMPLETE][87] ([i915#1436] / [i915#456]) -> [DMESG-WARN][88] ([i915#2411])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][89] ([i915#1611] / [i915#2295] / [i915#2439]) -> [FAIL][90] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl7/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][91], [FAIL][92], [FAIL][93]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][94] ([i915#2295] / [i915#2439] / [i915#483])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][95], [FAIL][96], [FAIL][97]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439]) -> [FAIL][98] ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][99], [FAIL][100], [FAIL][101]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> [FAIL][102] ([i915#1611] / [i915#2295] / [i915#2439] / [k.org#202321])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][103], [FAIL][104], [FAIL][105]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#456]) -> [FAIL][106] ([i915#2295] / [i915#2439])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb3/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2552]: https://gitlab.freedesktop.org/drm/intel/issues/2552
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2650]: https://gitlab.freedesktop.org/drm/intel/issues/2650
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5850 -> IGTPW_5165
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9326: 3048c2a1dcf02422e89930148ffad9e91d690499 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/index.html
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/index.html

--===============0173575191442036285==
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
<tr><td><b>Series:</b></td><td>lib: Do not apply filtering to DRIVER_VGEM</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83813/">https://patchwork.freedesktop.org/series/83813/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5165/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5165/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9326_full -&gt; IGTPW_5165_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5165_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5165_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5165=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-snb5/igt@gem_caching@read-writes.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-snb4/igt=
@gem_caching@read-writes.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-wedge-1us:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw8/igt@gem_eio@wait-wedge-1us.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@=
gem_eio@wait-wedge-1us.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@bcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw7/igt@gem_exec_parallel@basic@bcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw=
2/igt@gem_exec_parallel@basic@bcs0.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5165_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw6/igt@gem_exec_flush@basic-wb-pro-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sh=
ard-hsw2/igt@gem_exec_flush@basic-wb-pro-default.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) +3 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-snb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard=
-snb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2650">i915#2650</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-=
busy-gup@wb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5165/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-=
overlap-busy-gup@wb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2552">i915#2552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shar=
d-apl3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb3/igt@i=
915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-=
hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk7/igt@kms_cursor_legacy@basic-flip-after-cursor-varyi=
ng-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5165/shard-glk2/igt@kms_cursor_legacy@basic-flip-after-cursor-v=
arying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
5/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-badstride.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
5/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5165/shard-tglb7/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-64:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
5/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1=
635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb=
6/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl6=
/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw8/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-hsw2/igt@perf@block=
ing.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk6/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-glk1/igt@perf@block=
ing.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-tglb8/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb7/igt@perf@blo=
cking.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl8/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-apl7/igt@perf@block=
ing.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb5/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-iclb5/=
igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl6/igt@perf@whitelisted-registers-userspace-config.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5165/shard-kbl1/igt@perf@whitelisted-registers-userspace-config.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
54">i915#1354</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5165/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sha=
rd-iclb2/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
5/shard-apl4/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
5/shard-glk9/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shar=
d-hsw8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-kbl2=
/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@i915_module_load@reload.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/s=
hard-iclb3/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-gl=
k4/igt@i915_pm_rpm@i2c.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5165/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-lega=
cy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5165/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-=
cursor-legacy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-yt=
iled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5165/shard-apl3/igt@kms_draw_crc@draw-method-xrg=
b2101010-mmap-wc-ytiled.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
4">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5165/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pr=
i-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-tglb2/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2055">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5165/shard-hsw5/igt@kms_pipe_crc_basic@suspend-read-crc-pi=
pe-a.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5165/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5165/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5165/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a=
.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sh=
ard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard=
-hsw8/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb5/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sh=
ard-tglb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5165/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5165/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-p=
ipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/shard-=
kbl6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9326/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sh=
ard-iclb8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9326/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439=
">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5165/shard-apl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439<=
/a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9326/shard-glk8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86=
</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.o=
rg#202321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5165/shard-glk2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9326/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/sh=
ard-tglb2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5850 -&gt; IGTPW_5165</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9326: 3048c2a1dcf02422e89930148ffad9e91d690499 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5165/index.htm=
l<br />
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0173575191442036285==--

--===============0569462453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0569462453==--
