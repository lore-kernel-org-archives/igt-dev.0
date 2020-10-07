Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Oct 2020 09:36:01 -0000
Message-ID: <160206336185.15195.9060202027318987654@emeril.freedesktop.org>
References: <20201007060949.3858-1-karthik.b.s@intel.com>
In-Reply-To: <20201007060949.3858-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Add_test_to_validate_big_joiner_=28rev4?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0579937571=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0579937571==
Content-Type: multipart/alternative;
 boundary="===============2424490688512410835=="

--===============2424490688512410835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_joiner: Add test to validate big joiner (rev4)
URL   : https://patchwork.freedesktop.org/series/78769/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9106_full -> IGTPW_5041_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5041_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5041_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5041_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_blits@basic:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@gem_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@gem_blits@basic.html
    - shard-tglb:         [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb7/igt@gem_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_blits@basic.html
    - shard-kbl:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@gem_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl1/igt@gem_blits@basic.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-iclb:         [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html
    - shard-glk:          [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk6/igt@gem_ctx_engines@invalid-engines.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglb:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_param@root-set-no-zeromap-enabled:
    - shard-snb:          [PASS][12] -> [FAIL][13] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html

  * {igt@kms_big_joiner@basic} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][15] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_big_joiner@basic.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [PASS][16] -> [INCOMPLETE][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9106_full and IGTPW_5041_full:

### New IGT tests (2) ###

  * igt@kms_big_joiner@basic:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@invalid-modeset:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5041_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#1635]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl4/igt@gem_ctx_engines@invalid-engines.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl4/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][24] -> [SKIP][25] ([i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#1635] / [i915#54]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-snb:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][34] -> [FAIL][35] ([i915#2370])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#79])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][38] -> [DMESG-WARN][39] ([i915#1982])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#1635] / [i915#1982])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-tglb:         [PASS][42] -> [DMESG-WARN][43] ([i915#1982]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#1911])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][50] -> [DMESG-WARN][51] ([i915#1982])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][52] ([i915#1635]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][54] ([i915#118] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][56] ([i915#1519]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-apl:          [FAIL][58] ([i915#1635] / [i915#2521]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-tglb:         [FAIL][60] ([i915#2521]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][62] ([i915#1635] / [i915#1982]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-glk:          [FAIL][64] ([i915#54]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-apl:          [FAIL][66] ([i915#1635] / [i915#54]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [FAIL][68] ([i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][70] ([i915#96]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][72] ([i915#1982]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][76] ([i915#2055]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][78] ([i915#1982]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
    - shard-kbl:          [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         [DMESG-WARN][82] ([i915#1982]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][84] ([i915#433]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [FAIL][88] ([i915#331]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [FAIL][90] ([i915#331]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [FAIL][92] ([i915#1635] / [i915#331]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - shard-kbl:          [INCOMPLETE][94] ([i915#1731]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-tglb:         [FAIL][96] -> [FAIL][97] ([i915#2389]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@gem_exec_reloc@basic-many-active@vcs1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [DMESG-WARN][98] ([i915#2411]) -> [SKIP][99] ([i915#1904])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [INCOMPLETE][100] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][101] ([i915#2411])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb6/igt@i915_suspend@forcewake.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_suspend@forcewake.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][102] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][103] ([i915#1319] / [i915#1635])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@atomic-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][104] ([i915#1319] / [i915#1635]) -> [FAIL][105] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][106] ([fdo#109349]) -> [DMESG-WARN][107] ([i915#1226])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5802 -> IGTPW_5041
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9106: 7d08cf1b378a1481fcbe16ac801d5408651a25c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5041: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html
  IGT_5802: 0e4fbc60ca5ad6585e642d2ddf8313f3c738426e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html

--===============2424490688512410835==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_joiner: Add test to validate big joiner (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/78769/">https://patchwork.freedesktop.org/series/78769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9106_full -&gt; IGTPW_5041_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5041_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5041_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5041_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_blits@basic:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@gem_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@gem_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb7/igt@gem_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@gem_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl1/igt@gem_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk6/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@gem_ctx_engines@invalid-engines.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@root-set-no-zeromap-enabled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb6/igt@gem_ctx_param@root-set-no-zeromap-enabled.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@basic} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_big_joiner@basic.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_big_joiner@basic.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_async_flips@alternate-sync-async-flip}:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9106_full and IGTPW_5041_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5041_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl4/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-snb2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk9/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb5/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-random:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb1/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb2/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-tglb6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-tglb5/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-apl6/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-apl6/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9106/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
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
<li>IGT: IGT_5802 -&gt; IGTPW_5041</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9106: 7d08cf1b378a1481fcbe16ac801d5408651a25c0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5041: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5041/index.html<br />
  IGT_5802: 0e4fbc60ca5ad6585e642d2ddf8313f3c738426e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2424490688512410835==--

--===============0579937571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0579937571==--
