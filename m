Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jul 2020 20:18:15 -0000
Message-ID: <159596749507.21870.980900293828633542@emeril.freedesktop.org>
References: <20200728131732.27299-1-karthik.b.s@intel.com>
In-Reply-To: <20200728131732.27299-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmultipipe=5Fmodeset=3A_Changes_based_on_lib_updates_and_m?=
 =?utf-8?q?inor_fixes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0944888863=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0944888863==
Content-Type: multipart/alternative;
 boundary="===============7181135783348707805=="

--===============7181135783348707805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_multipipe_modeset: Changes based on lib updates and minor fixes
URL   : https://patchwork.freedesktop.org/series/79979/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8804_full -> IGTPW_4812_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4812_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4812_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4812_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl3/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl7/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb7/igt@gem_exec_balancer@bonded-dual.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb6/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@hog:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-hsw4/igt@gem_exec_balancer@hog.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ac-vga1-hdmi-a1:
    - shard-hsw:          [PASS][6] -> [INCOMPLETE][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ac-vga1-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-hsw4/igt@kms_flip@2x-nonexisting-fb-interruptible@ac-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4812_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#2242])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb5/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb8/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#1635] / [i915#54])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#54])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-glk:          [PASS][18] -> [INCOMPLETE][19] ([i915#2241])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@nonexisting-fb@a-edp1:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#2240])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-iclb1/igt@kms_flip@nonexisting-fb@a-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-iclb6/igt@kms_flip@nonexisting-fb@a-edp1.html

  * igt@kms_flip@nonexisting-fb@b-vga1:
    - shard-snb:          [PASS][24] -> [INCOMPLETE][25] ([i915#82])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-snb4/igt@kms_flip@nonexisting-fb@b-vga1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-snb5/igt@kms_flip@nonexisting-fb@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@idempotent:
    - shard-hsw:          [TIMEOUT][30] ([i915#1958] / [i915#2119]) -> [PASS][31] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-hsw1/igt@gem_ctx_engines@idempotent.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-hsw8/igt@gem_ctx_engines@idempotent.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb8/igt@gem_exec_schedule@smoketest-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb8/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][34] ([i915#118] / [i915#95]) -> [PASS][35] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk6/igt@gem_exec_whisper@basic-forked.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk6/igt@gem_exec_whisper@basic-forked.html

  * igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-a:
    - shard-tglb:         [INCOMPLETE][36] ([i915#2242]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb1/igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-a.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb7/igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-a.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-apl:          [DMESG-WARN][38] ([i915#1635] / [i915#62]) -> [PASS][39] +25 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-apl:          [FAIL][40] ([i915#1635] / [i915#54]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][42] ([i915#54]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-snb:          [TIMEOUT][44] ([i915#1958] / [i915#2119]) -> [PASS][45] +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][46] ([i915#79]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][48] -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-hsw1/igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-hsw6/igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1.html

  * igt@kms_flip@nonexisting-fb-interruptible@b-dp1:
    - shard-kbl:          [INCOMPLETE][50] ([i915#2240]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl2/igt@kms_flip@nonexisting-fb-interruptible@b-dp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl1/igt@kms_flip@nonexisting-fb-interruptible@b-dp1.html

  * igt@kms_flip@nonexisting-fb-interruptible@b-vga1:
    - shard-snb:          [INCOMPLETE][52] ([i915#82]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-snb5/igt@kms_flip@nonexisting-fb-interruptible@b-vga1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-snb4/igt@kms_flip@nonexisting-fb-interruptible@b-vga1.html

  * igt@kms_flip@nonexisting-fb@b-dp1:
    - shard-kbl:          [INCOMPLETE][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl7/igt@kms_flip@nonexisting-fb@b-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl3/igt@kms_flip@nonexisting-fb@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][56] ([i915#1982]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-glk9/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-glk8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][58] ([i915#1982]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][62] ([fdo#109441]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][64] ([i915#31]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-kbl3/igt@kms_setmode@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl1/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-snb:          [TIMEOUT][66] ([i915#1958] / [i915#2119]) -> [SKIP][67] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-hsw:          [SKIP][68] ([fdo#109271]) -> [TIMEOUT][69] ([i915#1958] / [i915#2119]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-hsw8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-hsw4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][70] ([fdo#108145] / [i915#1635] / [i915#62]) -> [FAIL][71] ([fdo#108145] / [i915#1635] / [i915#265])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85]) ([i915#1610] / [i915#1635] / [i915#2110] / [i915#637]) -> [FAIL][86] ([fdo#109271] / [i915#1635] / [i915#716])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl4/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl6/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl4/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl2/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl1/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl8/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl7/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-apl7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2240]: https://gitlab.freedesktop.org/drm/intel/issues/2240
  [i915#2241]: https://gitlab.freedesktop.org/drm/intel/issues/2241
  [i915#2242]: https://gitlab.freedesktop.org/drm/intel/issues/2242
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#637]: https://gitlab.freedesktop.org/drm/intel/issues/637
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5749 -> IGTPW_4812
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8804: 943d034c433e5be93076cf51fd8ea5b4d7644e8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4812: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/index.html
  IGT_5749: 2fef871e791ceab7841b899691c443167550173d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/index.html

--===============7181135783348707805==
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
<tr><td><b>Series:</b></td><td>tests/kms_multipipe_modeset: Changes based o=
n lib updates and minor fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79979/">https://patchwork.freedesktop.org/series/79979/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4812/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4812/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8804_full -&gt; IGTPW_4812_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4812_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4812_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4812=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl3/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl7/igt@gem_eio@kms=
.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb7/igt@gem_exec_balancer@bonded-dual.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-t=
glb6/igt@gem_exec_balancer@bonded-dual.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4812/shard-hsw4/igt@gem_exec_balancer@hog.html">INCOMPL=
ETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible@ac-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ac-vga=
1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4812/shard-hsw4/igt@kms_flip@2x-nonexisting-fb-interruptible@=
ac-vga1-hdmi-a1.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4812_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4812/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb5/igt@kms_atomic_transition@plane-all-transition-fen=
cing@edp-1-pipe-c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4812/shard-tglb8/igt@kms_atomic_transition@plane-all-=
transition-fencing@edp-1-pipe-c.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2242">i915#2242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8804/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4812/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
4">i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8804/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4812/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8804/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4812/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4812/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2241">i915#2241</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4812/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-iclb1/igt@kms_flip@nonexisting-fb@a-edp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-=
iclb6/igt@kms_flip@nonexisting-fb@a-edp1.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2240">i915#2240</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-snb4/igt@kms_flip@nonexisting-fb@b-vga1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-s=
nb5/igt@kms_flip@nonexisting-fb@b-vga1.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4812/shard-tglb7/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-pri-indfb-draw-render.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-i=
clb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar is=
sues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@idempotent:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-hsw1/igt@gem_ctx_engines@idempotent.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#=
2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
812/shard-hsw8/igt@gem_ctx_engines@idempotent.html">PASS</a> +5 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb8/igt@gem_exec_schedule@smoketest-all.html">INCOMPLE=
TE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812=
/shard-tglb8/igt@gem_exec_schedule@smoketest-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-glk6/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#1=
18</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i91=
5#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
812/shard-glk6/igt@gem_exec_whisper@basic-forked.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb1/igt@kms_atomic_transition@plane-all-transition@edp=
-1-pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2242">i915#2242</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_4812/shard-tglb7/igt@kms_atomic_transition@plane-=
all-transition@edp-1-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-random:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4812/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-rando=
m.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8804/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4812/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8804/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4812/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">PAS=
S</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4812/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrit=
e-xtiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_4812/shard-glk7/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-hsw1/igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1.html=
">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4812/shard-hsw6/igt@kms_flip@2x-nonexisting-fb@ac-vga1-hdmi-a1.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl2/igt@kms_flip@nonexisting-fb-interruptible@b-dp1.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2240">i915#2240</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4812/shard-kbl1/igt@kms_flip@nonexisting-fb-interruptible@b-dp=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-snb5/igt@kms_flip@nonexisting-fb-interruptible@b-vga1.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/82">i915#82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4812/shard-snb4/igt@kms_flip@nonexisting-fb-interruptible@b-vga1.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl7/igt@kms_flip@nonexisting-fb@b-dp1.html">INCOMPLETE<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/sh=
ard-kbl3/igt@kms_flip@nonexisting-fb@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-glk9/igt@kms_frontbuffer_tracking@fbc-stridechange.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4812/shard-glk8/igt@kms_frontbuffer_tracking@fbc-stridechange.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-tglb1/igt@kms_frontbuffer_=
tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/s=
hard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +5 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard=
-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-kbl3/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/shard-kbl1/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
58">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4812/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-hsw8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4812/shard-hsw4/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8804/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4812/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-al=
pha-opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_8804/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl1/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_8804/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8=
804/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/s=
hard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_8804/shard-apl3/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-=
apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_8804/shard-apl1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl1/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_8804/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8804/shard-apl7/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_8804/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#=
2110</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/637">=
i915#637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4812/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5749 -&gt; IGTPW_4812</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8804: 943d034c433e5be93076cf51fd8ea5b4d7644e8b @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4812: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4812/index.htm=
l<br />
  IGT_5749: 2fef871e791ceab7841b899691c443167550173d @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7181135783348707805==--

--===============0944888863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0944888863==--
