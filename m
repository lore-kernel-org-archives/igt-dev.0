Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Sep 2020 01:00:15 -0000
Message-ID: <160021801566.19375.5239192004245254120@emeril.freedesktop.org>
References: <20200915195614.7618-1-abhinavk@codeaurora.org>
In-Reply-To: <20200915195614.7618-1-abhinavk@codeaurora.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_video_pattern_DP_CTS_for_MSM_chipsets_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1668096037=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1668096037==
Content-Type: multipart/alternative;
 boundary="===============3087902376450865099=="

--===============3087902376450865099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for video pattern DP CTS for MSM chipsets (rev2)
URL   : https://patchwork.freedesktop.org/series/81311/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9014_full -> IGTPW_4984_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4984_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4984_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4984_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-many-active@bcs0:
    - shard-tglb:         [FAIL][5] ([i915#2389]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb1/igt@gem_exec_reloc@basic-many-active@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb6/igt@gem_exec_reloc@basic-many-active@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4984_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2389]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk9/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1226]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#1836])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_prime@basic-crc@first-to-second.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271] / [i915#1635])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#1836])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb7/igt@kms_prime@basic-crc@first-to-second.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk4/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#1911])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb1/igt@kms_psr2_su@frontbuffer.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([i915#1635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][45] ([i915#155]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][47] ([i915#1635] / [i915#2389]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-snb:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb1/igt@gem_workarounds@suspend-resume-fd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-glk:          [FAIL][51] ([i915#1119]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][59] ([i915#2122]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][61] ([i915#2055]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][69] ([i915#83]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][71] ([fdo#109271] / [i915#1635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_prime@basic-crc@second-to-first.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][77] ([i915#1836]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][81] ([i915#1836]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb7/igt@kms_prime@basic-crc@second-to-first.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [FAIL][87] ([i915#331]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#331]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [FAIL][91] ([i915#1542] / [i915#1635]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl3/igt@perf@polling-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl2/igt@perf@polling-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [INCOMPLETE][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb7/igt@perf_pmu@module-unload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@perf_pmu@module-unload.html

  * igt@sw_sync@sync_expired_merge:
    - shard-iclb:         [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb2/igt@sw_sync@sync_expired_merge.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb7/igt@sw_sync@sync_expired_merge.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#454]) -> [FAIL][98] ([i915#1899])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][99] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][100] ([i915#1319] / [i915#1635] / [i915#1958])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][102] ([fdo#108145] / [i915#1635] / [i915#1982])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5785 -> IGTPW_4984
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9014: 42da7af05a75a7791c33e12c80f4bd00aa71c29f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html
  IGT_5785: ee01acab0b6cee7be5cc4278e5d7527ec3e358ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html

--===============3087902376450865099==
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
<tr><td><b>Series:</b></td><td>Add support for video pattern DP CTS for MSM chipsets (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81311/">https://patchwork.freedesktop.org/series/81311/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9014_full -&gt; IGTPW_4984_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4984_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4984_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4984_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_reloc@basic-many-active@bcs0:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb1/igt@gem_exec_reloc@basic-many-active@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb6/igt@gem_exec_reloc@basic-many-active@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4984_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk9/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb1/igt@gem_workarounds@suspend-resume-fd.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb5/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-hsw1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-hsw6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb5/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl3/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb7/igt@perf_pmu@module-unload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb6/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_expired_merge:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-iclb2/igt@sw_sync@sync_expired_merge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-iclb7/igt@sw_sync@sync_expired_merge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9014/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5785 -&gt; IGTPW_4984</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9014: 42da7af05a75a7791c33e12c80f4bd00aa71c29f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4984/index.html<br />
  IGT_5785: ee01acab0b6cee7be5cc4278e5d7527ec3e358ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3087902376450865099==--

--===============1668096037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1668096037==--
