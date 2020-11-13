Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Nov 2020 23:52:36 -0000
Message-ID: <160531155670.20636.11245923600966756207@emeril.freedesktop.org>
References: <20201113164340.1430848-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201113164340.1430848-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNTog?=
 =?utf-8?q?Increase_engine=5B=5D_to_fit_the_entire_RING=5FMASK?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0970645815=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0970645815==
Content-Type: multipart/alternative;
 boundary="===============7999702539943009490=="

--===============7999702539943009490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: Increase engine[] to fit the entire RING_MASK
URL   : https://patchwork.freedesktop.org/series/83821/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9326_full -> IGTPW_5169_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5169_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5169_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5169_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@parallel@bcs0:
    - shard-hsw:          NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@gem_exec_fence@parallel@bcs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-snb:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb5/igt@gem_exec_whisper@basic-forked.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-snb6/igt@gem_exec_whisper@basic-forked.html
    - shard-glk:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk6/igt@gem_exec_whisper@basic-forked.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk4/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:
    - shard-hsw:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][12] ([i915#1515]) -> [WARN][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  
Known issues
------------

  Here are the changes found in IGTPW_5169_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2389])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#2389])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk5/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [PASS][20] -> [FAIL][21] ([i915#1888]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1635] / [i915#1982]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl3/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [PASS][30] -> [INCOMPLETE][31] ([i915#2055])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#49])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1635] / [i915#2635])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-iclb:         [PASS][40] -> [INCOMPLETE][41] ([fdo#111764] / [i915#1185])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-glk:          [PASS][42] -> [INCOMPLETE][43] ([i915#2635])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-hsw:          [PASS][44] -> [INCOMPLETE][45] ([i915#2055] / [i915#2637])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [PASS][46] -> [INCOMPLETE][47] ([i915#155])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [PASS][48] -> [DMESG-WARN][49] ([i915#2635])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [PASS][50] -> [INCOMPLETE][51] ([i915#1635] / [i915#2635])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [PASS][52] -> [INCOMPLETE][53] ([i915#2637])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-iclb:         [PASS][54] -> [INCOMPLETE][55] ([fdo#111764] / [i915#1078] / [i915#1185])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][56] -> [SKIP][57] ([fdo#109271] / [i915#1354] / [i915#1635]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl1/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([i915#1354]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@perf@invalid-remove-userspace-config.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb1/igt@perf@invalid-remove-userspace-config.html
    - shard-hsw:          [PASS][60] -> [SKIP][61] ([fdo#109271]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw7/igt@perf@invalid-remove-userspace-config.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw8/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling:
    - shard-glk:          [PASS][62] -> [SKIP][63] ([fdo#109271] / [i915#1354]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk6/igt@perf@polling.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk1/igt@perf@polling.html
    - shard-tglb:         [PASS][64] -> [SKIP][65] ([i915#1354]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@perf@polling.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@perf@polling.html
    - shard-kbl:          [PASS][66] -> [SKIP][67] ([fdo#109271] / [i915#1354]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl3/igt@perf@polling.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl1/igt@perf@polling.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][68] -> [FAIL][69] ([i915#1542])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@perf@polling-parameterized.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk3/igt@perf@polling-parameterized.html

  * igt@perf@rc6-disable:
    - shard-tglb:         [PASS][70] -> [SKIP][71] ([fdo#111719] / [i915#1354])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@perf@rc6-disable.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@perf@rc6-disable.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][72] -> [DMESG-WARN][73] ([i915#1982]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@perf_pmu@module-unload.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb3/igt@perf_pmu@module-unload.html
    - shard-iclb:         [PASS][74] -> [DMESG-WARN][75] ([i915#1982])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb3/igt@perf_pmu@module-unload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb6/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][76] ([i915#658]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@feature_discovery@psr2.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][78] ([i915#118] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][80] ([i915#1373]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb3/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][82] ([i915#1635] / [i915#2635]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl1/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][84] ([i915#2199] / [i915#2635]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk3/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][86] ([i915#2637]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [DMESG-WARN][90] ([i915#1982]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@i915_module_load@reload.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb2/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@i2c:
    - shard-glk:          [DMESG-WARN][92] ([i915#1982]) -> [PASS][93] +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk7/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][94] ([i915#96]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-kbl:          [DMESG-WARN][96] ([i915#1982]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-apl:          [DMESG-WARN][98] ([i915#1635] / [i915#1982]) -> [PASS][99] +6 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-snb:          [FAIL][100] ([i915#54]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [FAIL][102] ([i915#2122]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][104] ([i915#1982]) -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [INCOMPLETE][106] ([i915#2055] / [i915#2637]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [INCOMPLETE][108] ([i915#155]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [INCOMPLETE][110] ([i915#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [INCOMPLETE][112] ([i915#1185]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][114] ([fdo#109642] / [fdo#111068]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [FAIL][116] ([i915#1542]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][118] ([i915#1436]) -> [DMESG-WARN][119] ([i915#2411])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@gem_softpin@noreloc-s3.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb5/igt@gem_softpin@noreloc-s3.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][120] ([i915#1226]) -> [SKIP][121] ([fdo#109349])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [INCOMPLETE][122] ([i915#1436] / [i915#456]) -> [DMESG-WARN][123] ([i915#2411])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [DMESG-WARN][124] ([i915#2411]) -> [INCOMPLETE][125] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][126] ([fdo#109289]) -> [SKIP][127] ([i915#1354])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb3/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][128], [FAIL][129]) ([fdo#109271] / [i915#2295] / [i915#2439]) -> ([FAIL][130], [FAIL][131]) ([i915#2295])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw4/igt@runner@aborted.html
    - shard-kbl:          [FAIL][132] ([i915#1611] / [i915#2295] / [i915#2439]) -> ([FAIL][133], [FAIL][134]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#483] / [i915#602])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][135], [FAIL][136], [FAIL][137]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439]) -> ([FAIL][138], [FAIL][139], [FAIL][140]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-apl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> ([FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][147], [FAIL][148], [FAIL][149]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#456]) -> ([FAIL][150], [FAIL][151], [FAIL][152]) ([i915#1602] / [i915#2295] / [i915#2439])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb3/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-tglb5/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb1/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/index.html

--===============7999702539943009490==
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
<tr><td><b>Series:</b></td><td>i915: Increase engine[] to fit the entire RI=
NG_MASK</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83821/">https://patchwork.freedesktop.org/series/83821/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5169/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5169/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9326_full -&gt; IGTPW_5169_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5169_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5169_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5169=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@parallel@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5169/shard-hsw6/igt@gem_exec_fence@parallel@bcs0.html">=
FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-snb5/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-snb=
6/igt@gem_exec_whisper@basic-forked.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk6/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk=
4/igt@gem_exec_whisper@basic-forked.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5169/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-=
glk3/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
169/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WA=
RN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-fence:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#151=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169=
/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> +1 similar =
issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5169_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/s=
hard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/s=
hard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/=
shard-glk5/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5169/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
88">i915#1888</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/sh=
ard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl3/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5169/shard-apl8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytile=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5169/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga=
1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5169/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@=
ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw5/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/sha=
rd-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-k=
bl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-sh=
rfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5169/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndsc=
rn-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb6/igt@km=
s_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
169/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111764">=
fdo#111764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i91=
5#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i91=
5#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
7">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915=
#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i91=
5#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i91=
5#2637</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
169/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111764">=
fdo#111764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1078">i915#1078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1185">i915#1185</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-apl1/igt@perf@gen8-unprivileged-single-ctx-counters.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5169/shard-apl8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354=
">i915#1354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1635">i915#1635</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb2/igt@perf@invalid-remove-userspace-config.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/s=
hard-iclb1/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +3=
 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw7/igt@perf@invalid-remove-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/sh=
ard-hsw8/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk6/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk1/igt@perf@pollin=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-tglb8/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@perf@poll=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl3/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl1/igt@perf@pollin=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk8/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk3/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb5/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@per=
f@rc6-disable.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111719">fdo#111719</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1354">i915#1354</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-tglb5/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb3/igt=
@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb3/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb6/igt=
@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5169/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html">PA=
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/sha=
rd-iclb3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-apl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
9/shard-apl1/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_516=
9/shard-glk3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-hsw5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shar=
d-hsw6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-kbl2=
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
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/s=
hard-iclb2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk9/igt@i915_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-gl=
k7/igt@i915_pm_rpm@i2c.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5169/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
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
tree/drm-tip/IGTPW_5169/shard-kbl3/igt@kms_cursor_legacy@basic-flip-before-=
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
.01.org/tree/drm-tip/IGTPW_5169/shard-apl2/igt@kms_draw_crc@draw-method-xrg=
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
GTPW_5169/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/212=
2">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5169/shard-tglb1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html=
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
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a> +2 similar i=
ssues</li>
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
ee/drm-tip/IGTPW_5169/shard-hsw1/igt@kms_pipe_crc_basic@suspend-read-crc-pi=
pe-a.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5169/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5169/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5169/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a=
.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-iclb4/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw6/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard=
-hsw2/igt@perf@polling-parameterized.html">PASS</a></li>
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
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/sh=
ard-tglb5/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https=
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
W_5169/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
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
ee/drm-tip/IGTPW_5169/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-p=
ipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5169/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/456">i915#456</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-tglb3/igt@perf@gen8-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5169/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
54">i915#1354</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-hsw5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-hsw2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5169/shard-hsw4/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-h=
sw4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9326/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard=
-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5169/shard-kbl3/igt@runner@aborted.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i91=
5#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/229=
5">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/602">i915#602</a>)</p>
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
">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5169/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-apl8/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5169/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439=
</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9326/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9326/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9326/shard-glk1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86=
</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.o=
rg#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5169/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-glk8/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
69/shard-glk5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
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
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/s=
hard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5169/shard-tglb8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5169/shard-=
tglb1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
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

</body>
</html>

--===============7999702539943009490==--

--===============0970645815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0970645815==--
