Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 24 Oct 2020 03:14:52 -0000
Message-ID: <160350929271.28672.11079267551278199246@emeril.freedesktop.org>
References: <20201023231151.383909-1-jose.souza@intel.com>
In-Reply-To: <20201023231151.383909-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Skip_frontbuffer_test_in_TGL?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0660253958=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0660253958==
Content-Type: multipart/alternative;
 boundary="===============0515995119178162862=="

--===============0515995119178162862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr2_su: Skip frontbuffer test in TGL
URL   : https://patchwork.freedesktop.org/series/83021/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9192_full -> IGTPW_5095_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5095_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5095_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5095_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb5/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb3/igt@kms_cursor_legacy@all-pipes-forked-move.html

  
#### Warnings ####

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [FAIL][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_psr2_su@frontbuffer.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb8/igt@kms_psr2_su@frontbuffer.html

  
Known issues
------------

  Here are the changes found in IGTPW_5095_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1888])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk6/igt@gem_ctx_shared@q-smoketest@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk5/igt@gem_ctx_shared@q-smoketest@rcs0.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-iclb:         [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb7/igt@gem_fenced_exec_thrash@too-many-fences.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb2/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][11] -> [WARN][12] ([i915#1519])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#1836])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271] / [i915#1635])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#1836])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@kms_prime@basic-crc@first-to-second.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@global-sseu-config-invalid:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#1354])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb7/igt@perf@global-sseu-config-invalid.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@perf@global-sseu-config-invalid.html
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1354])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk2/igt@perf@global-sseu-config-invalid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@perf@global-sseu-config-invalid.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1354] / [i915#1635])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl1/igt@perf@global-sseu-config-invalid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl8/igt@perf@global-sseu-config-invalid.html
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271] / [i915#1354])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl1/igt@perf@global-sseu-config-invalid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@perf@global-sseu-config-invalid.html
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#1354])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb3/igt@perf@global-sseu-config-invalid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#1542])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb7/igt@perf@polling-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@perf@polling-parameterized.html

  * igt@tools_test@tools_test:
    - shard-hsw:          [PASS][47] -> [DMESG-WARN][48] ([i915#1436])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw1/igt@tools_test@tools_test.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [FAIL][49] ([i915#1888]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@gem_ctx_shared@q-smoketest-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html

  * {igt@gem_exec_capture@pi@vecs0}:
    - shard-iclb:         [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb2/igt@gem_exec_capture@pi@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@gem_exec_capture@pi@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][53] ([i915#2389]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [INCOMPLETE][57] ([i915#1895]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_linear_blits@normal:
    - shard-snb:          [FAIL][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb7/igt@gem_linear_blits@normal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb2/igt@gem_linear_blits@normal.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [DMESG-WARN][61] ([i915#2411]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-iclb:         [FAIL][69] ([i915#1119]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][71] ([i915#2055]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [FAIL][75] ([i915#49]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [FAIL][79] ([i915#1635] / [i915#49]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-snb:          [FAIL][81] ([i915#2546]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
    - shard-tglb:         [INCOMPLETE][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb8/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][87] ([fdo#109271] / [i915#1635]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][91] ([i915#1836]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@kms_prime@basic-crc@second-to-first.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][95] ([i915#1836]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@kms_prime@basic-crc@second-to-first.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][101] ([i915#1635] / [i915#31]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl1/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-tglb:         [SKIP][103] ([i915#1354]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@perf@gen12-oa-tlb-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl2/igt@perf@non-system-wide-paranoid.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl4/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][107] ([fdo#109271] / [i915#1354]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@perf@non-system-wide-paranoid.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@perf@non-system-wide-paranoid.html
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw4/igt@perf@non-system-wide-paranoid.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [SKIP][111] ([i915#1354]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb8/igt@perf@non-system-wide-paranoid.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][113] ([fdo#109271] / [i915#1354]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@perf@non-system-wide-paranoid.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@perf@non-system-wide-paranoid.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [DMESG-WARN][115] ([i915#1982]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb1/igt@perf_pmu@module-unload.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [FAIL][117] -> [WARN][118] ([i915#2283])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][119] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][120] ([i915#1319] / [i915#1635])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl8/igt@kms_content_protection@atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#1982])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          [DMESG-FAIL][123] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][124] ([fdo#108145] / [i915#1635] / [i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-kbl:          [SKIP][125] ([fdo#109271] / [i915#1354]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@perf@gen12-oa-tlb-invalidate.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl4/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-glk:          [SKIP][127] ([fdo#109271] / [i915#1354]) -> [SKIP][128] ([fdo#109271])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk4/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-apl:          [SKIP][129] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [SKIP][130] ([fdo#109271] / [i915#1635])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-iclb:         [SKIP][131] ([i915#1354]) -> [SKIP][132] ([fdo#109289])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@perf@gen12-oa-tlb-invalidate.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb6/igt@perf@gen12-oa-tlb-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1895]: https://gitlab.freedesktop.org/drm/intel/issues/1895
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5825 -> IGTPW_5095
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9192: cacc7bf00de8962dbd8b7b0dfd4f9c48bc6260b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5095: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html
  IGT_5825: e3503f6542fef432413e78e38436e13cca76bf8c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html

--===============0515995119178162862==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr2_su: Skip frontbuffer test in TGL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83021/">https://patchwork.freedesktop.org/series/83021/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9192_full -&gt; IGTPW_5095_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5095_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5095_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5095_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb2/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb4/igt@kms_big_fb@linear-32bpp-rotate-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@all-pipes-forked-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb5/igt@kms_cursor_legacy@all-pipes-forked-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb3/igt@kms_cursor_legacy@all-pipes-forked-move.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr2_su@frontbuffer:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5095_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk6/igt@gem_ctx_shared@q-smoketest@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk5/igt@gem_ctx_shared@q-smoketest@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb7/igt@gem_fenced_exec_thrash@too-many-fences.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb2/igt@gem_fenced_exec_thrash@too-many-fences.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb7/igt@perf@global-sseu-config-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk2/igt@perf@global-sseu-config-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl1/igt@perf@global-sseu-config-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl8/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl1/igt@perf@global-sseu-config-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb3/igt@perf@global-sseu-config-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb1/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb7/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@tools_test:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw1/igt@tools_test@tools_test.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@tools_test@tools_test.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@gem_ctx_shared@q-smoketest-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vecs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb2/igt@gem_exec_capture@pi@vecs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@gem_exec_capture@pi@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1895">i915#1895</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb7/igt@gem_linear_blits@normal.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb2/igt@gem_linear_blits@normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb8/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl7/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-tglb2/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-tglb6/igt@perf@gen12-oa-tlb-invalidate.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl2/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk7/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw4/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl6/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb1/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb4/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl8/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-kbl6/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-kbl4/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-glk4/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9192/shard-iclb4/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/shard-iclb6/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
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
<li>IGT: IGT_5825 -&gt; IGTPW_5095</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9192: cacc7bf00de8962dbd8b7b0dfd4f9c48bc6260b8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5095: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5095/index.html<br />
  IGT_5825: e3503f6542fef432413e78e38436e13cca76bf8c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0515995119178162862==--

--===============0660253958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0660253958==--
