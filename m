Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 31 Aug 2020 12:16:30 -0000
Message-ID: <159887619020.7423.14793714394069925215@emeril.freedesktop.org>
References: <20200831091238.12563-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200831091238.12563-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_add_flip_to_downscaled_subtests_?=
 =?utf-8?b?KHJldjQp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0207159500=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0207159500==
Content-Type: multipart/alternative;
 boundary="===============0988023854040801942=="

--===============0988023854040801942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip_scaled_crc: add flip to downscaled subtests (rev4)
URL   : https://patchwork.freedesktop.org/series/81109/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8944_full -> IGTPW_4924_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4924_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4924_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4924_full:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@info:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb3/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb1/igt@fbdev@info.html
    - shard-tglb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb7/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb5/igt@fbdev@info.html

  * {igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * {igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * {igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8944_full and IGTPW_4924_full:

### New IGT tests (7) ###

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - Statuses : 1 dmesg-fail(s) 3 fail(s) 3 skip(s)
    - Exec time: [0.0, 1.52] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - Statuses : 1 dmesg-fail(s) 6 skip(s)
    - Exec time: [0.0, 1.37] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - Statuses : 2 dmesg-fail(s) 5 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - Statuses : 1 dmesg-fail(s) 6 skip(s)
    - Exec time: [0.0, 1.65] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - Statuses : 2 dmesg-fail(s) 2 fail(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.49] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - Statuses : 2 dmesg-fail(s) 2 fail(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - Statuses : 1 dmesg-fail(s) 6 skip(s)
    - Exec time: [0.0, 1.41] s

  

Known issues
------------

  Here are the changes found in IGTPW_4924_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-snb:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-snb2/igt@fbdev@info.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-snb4/igt@fbdev@info.html
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-hsw2/igt@fbdev@info.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-hsw1/igt@fbdev@info.html
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@fbdev@info.html
    - shard-apl:          [PASS][15] -> [SKIP][16] ([fdo#109271] / [i915#1635])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl1/igt@fbdev@info.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl7/igt@fbdev@info.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk6/igt@fbdev@info.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk5/igt@fbdev@info.html

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#1622])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb1/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-kbl:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@gem_exec_reloc@basic-concurrent0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk5/igt@gem_exec_whisper@basic-fds.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk1/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-apl:          [PASS][25] -> [TIMEOUT][26] ([i915#1635] / [i915#1958])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl2/igt@gem_exec_whisper@basic-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl8/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-tglb:         [PASS][27] -> [TIMEOUT][28] ([i915#1958])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb7/igt@gem_exec_whisper@basic-normal.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb7/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_sync@basic-store-all:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1635] / [i915#2356])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl8/igt@gem_sync@basic-store-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl1/igt@gem_sync@basic-store-all.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([i915#1635] / [i915#2278])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl8/igt@i915_selftest@mock@contexts.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl7/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][33] -> [DMESG-FAIL][34] ([i915#118] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1635] / [i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#2122])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         [PASS][45] -> [DMESG-WARN][46] ([i915#1982])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][49] -> [DMESG-WARN][50] ([i915#1982])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][53] -> [INCOMPLETE][54] ([i915#1185])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][55] -> [TIMEOUT][56] ([i915#1692] / [i915#1958])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl2/igt@testdisplay.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-apl:          [TIMEOUT][59] ([i915#1635] / [i915#1958]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl1/igt@gem_exec_whisper@basic-forked-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl8/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_sync@basic-store-all:
    - shard-glk:          [FAIL][61] ([i915#2356]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk5/igt@gem_sync@basic-store-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk3/igt@gem_sync@basic-store-all.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][63] ([i915#118] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][67] ([i915#1635] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_flip@dpms-vs-vblank-race@a-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:
    - shard-glk:          [FAIL][79] ([i915#1036]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk1/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk3/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
    - shard-iclb:         [FAIL][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][85] ([i915#31]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][87] ([i915#155]) -> [DMESG-WARN][88] ([i915#180])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2356]: https://gitlab.freedesktop.org/drm/intel/issues/2356
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4924
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8944: d76134d076ffda385d90d22a671075ebc748a7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4924: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html

--===============0988023854040801942==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip_scaled_crc: add flip to downscaled subtests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81109/">https://patchwork.freedesktop.org/series/81109/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8944_full -&gt; IGTPW_4924_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4924_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4924_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4924_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb3/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb1/igt@fbdev@info.html">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb7/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb5/igt@fbdev@info.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8944_full and IGTPW_4924_full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 3 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>Statuses : 2 dmesg-fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>Statuses : 2 dmesg-fail(s) 2 fail(s) 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>Statuses : 2 dmesg-fail(s) 2 fail(s) 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4924_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-snb2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-snb4/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-hsw2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-hsw1/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl7/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk5/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@gem_ctx_persistence@engines-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb1/igt@gem_ctx_persistence@engines-hang@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1622">i915#1622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk5/igt@gem_exec_whisper@basic-fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk1/igt@gem_exec_whisper@basic-fds.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl2/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl8/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb7/igt@gem_exec_whisper@basic-normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb7/igt@gem_exec_whisper@basic-normal.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-store-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl8/igt@gem_sync@basic-store-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl1/igt@gem_sync@basic-store-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2356">i915#2356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl8/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl7/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl2/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl1/igt@gem_exec_whisper@basic-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl8/igt@gem_exec_whisper@basic-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-store-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk5/igt@gem_sync@basic-store-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2356">i915#2356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk3/igt@gem_sync@basic-store-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-glk1/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1036">i915#1036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-glk3/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl4/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@fence-restore-tiled2untiled:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8944/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4924</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8944: d76134d076ffda385d90d22a671075ebc748a7aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4924: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4924/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0988023854040801942==--

--===============0207159500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0207159500==--
