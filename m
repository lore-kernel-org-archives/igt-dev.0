Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 18:31:54 -0000
Message-ID: <162490511471.2574.14592936265423178724@emeril.freedesktop.org>
References: <20210624173525.1526215-1-markyacoub@chromium.org>
In-Reply-To: <20210624173525.1526215-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Nyk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1024391095=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1024391095==
Content-Type: multipart/alternative;
 boundary="===============2875805460895230161=="

--===============2875805460895230161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev7)
URL   : https://patchwork.freedesktop.org/series/90382/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6121_full -> IGTPW_5959_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5959_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5959_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5959_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@invalid:
    - shard-kbl:          [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@kms_vblank@invalid.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@kms_vblank@invalid.html
    - shard-apl:          NOTRUN -> [CRASH][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl2/igt@kms_vblank@invalid.html
    - shard-iclb:         [PASS][4] -> [CRASH][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb7/igt@kms_vblank@invalid.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_vblank@invalid.html
    - shard-glk:          [PASS][6] -> [CRASH][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk4/igt@kms_vblank@invalid.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk9/igt@kms_vblank@invalid.html
    - shard-tglb:         [PASS][8] -> [CRASH][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb6/igt@kms_vblank@invalid.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@kms_vblank@invalid.html

  
Known issues
------------

  Here are the changes found in IGTPW_5959_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-snb5/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][11] -> [TIMEOUT][12] ([i915#2369] / [i915#3063])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2846])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][19] ([i915#2842]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#112283])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][23] ([i915#3633]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][24] ([i915#3633]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][25] ([i915#3633])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk2/igt@gem_exec_whisper@basic-normal-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][31] ([i915#3002])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][32] ([i915#3318])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl8/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#112306]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#112306])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3288])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][36] ([i915#3343])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110892])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271]) +40 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#1769])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#1769])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110723])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk2/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][53] ([i915#1319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][54] ([i915#2105])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3359]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#109278])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][61] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#2672])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2587])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-glk:          [PASS][66] -> [FAIL][67] ([i915#2546] / [i915#49])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +163 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111825]) +14 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +14 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][71] ([i915#180]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-apl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109289])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][77] ([i915#265]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk9/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109441]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@kms_psr@psr2_basic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][84] ([IGT#2])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl8/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][85] ([IGT#2])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271]) +364 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-snb6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109278]) +12 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2530]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2530]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271]) +185 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#2994])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk3/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2994])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@sysfs_clients@sema-50.html
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2994]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl6/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][98] ([i915#2842]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][100] ([i915#2842]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][102] ([i915#2842]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][104] ([i915#307]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [TIMEOUT][106] ([i915#2795]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb1/igt@gem_vm_create@destroy-race.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [INCOMPLETE][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][110] ([i915#118] / [i915#95]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [DMESG-WARN][112] ([i915#180]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][114] ([fdo#109441]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][116] ([i915#180] / [i915#295]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@rc6-suspend:
    - shard-kbl:          [DMESG-WARN][118] ([i915#180]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@perf_pmu@rc6-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@sync@bcs0:
    - shard-tglb:         [INCOMPLETE][120] ([i915#409]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb1/igt@prime_vgem@sync@bcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [INCOMPLETE][122] ([i915#1982] / [i915#3698]) -> [FAIL][123] ([i915#454])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][124] ([i915#2684]) -> [WARN][125] ([i915#1804] / [i915#2684]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][126] ([i915#2920]) -> [SKIP][127] ([i915#658]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][128] ([i915#658]) -> [SKIP][129] ([i915#2920]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl3/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154]) ([i915#1814] / [i915#3002]) -> ([FAIL][155], [FAIL][156]) ([i915#3002])
   [151]: https://intel-gfx-ci.01.org/tree/drm-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html

--===============2875805460895230161==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware before te=
sting invalid vblank. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90382/">https://patchwork.freedesktop.org/series/90382/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5959/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6121_full -&gt; IGTPW_5959_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5959_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5959_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5959=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@invalid:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-kbl6/igt@kms_vblank@invalid.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@kms_vbla=
nk@invalid.html">CRASH</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-apl2/igt@kms_vblank@invalid.html">CRASH</a></=
p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-iclb7/igt@kms_vblank@invalid.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_vb=
lank@invalid.html">CRASH</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-glk4/igt@kms_vblank@invalid.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk9/igt@kms_vbla=
nk@invalid.html">CRASH</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-tglb6/igt@kms_vblank@invalid.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@kms_vb=
lank@invalid.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5959_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-snb5/igt@gem_ctx_persistence@idempotent.html=
">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@g=
em_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shar=
d-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-g=
lk4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html"=
>FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb=
6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb5/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@gem_exec_reloc@basic-wide-active@rc=
s0.html">FAIL</a> ([i915#3633]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk2/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-g=
lk3/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> ([i915#118] =
/ [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl8/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@gen9_exec_parse@cmd-crossing-page.=
html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-tglb6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> =
([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> ([fdo#109271]) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/ig=
t@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-iclb3/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-tglb1/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@kms_chamelium@dp-crc-multiple.html=
">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-glk2/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl7/igt@kms_content_protection@lic.html">TI=
MEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_content_protection@uevent.html"=
>FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-max-s=
ize-onscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate=
-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl2/igt@kms_flip@flip-vs-suspend-interrupti=
ble@c-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5959/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb=
-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5959/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-=
indfb-move.html">FAIL</a> ([i915#2546] / [i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +163 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +14 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +14 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DME=
SG-WARN</a> ([i915#180]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@=
kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb8/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-glk9/igt@kms_psr2_su@page_flip.html">SKIP</a=
> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb6/igt@kms=
_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-apl8/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-kbl4/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-snb6/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +364 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@kms_vblank@pipe-d-ts-continuation-=
idle-hang.html">SKIP</a> ([fdo#109278]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@perf@gen8-unprivileged-single-ctx-=
counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-iclb3/igt@prime_nv_api@i915_nv_import_vs_clo=
se.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-apl1/igt@prime_nv_api@i915_nv_reimport_twice=
_check_flink_name.html">SKIP</a> ([fdo#109271]) +185 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-iclb7/igt@sysfs_clients@recycle-many.html">SK=
IP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-glk3/igt@sysfs_clients@recycle-many.html">SKI=
P</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-tglb6/igt@sysfs_clients@recycle-many.html">SK=
IP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-kbl3/igt@sysfs_clients@sema-50.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5959/shard-apl6/igt@sysfs_clients@sema-50.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
959/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i91=
5#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
59/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5959/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> (=
[i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5959/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb3/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i9=
15#2795]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
959/shard-tglb1/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb1/ig=
t@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WAR=
N</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5959/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.=
html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
b-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl1/igt@kms_plane@plane-panning=
-bottom-right-suspend@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo=
#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
959/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DM=
ESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@kms_vblank@pipe-a-ts-contin=
uation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl6/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> ([i915#1=
80]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/s=
hard-kbl1/igt@perf_pmu@rc6-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb1/igt@prime_vgem@sync@bcs0.html">INCOMPLETE</a> ([i915#=
409]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/=
shard-tglb5/igt@prime_vgem@sync@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">INCOMPLETE</a> ([i915#19=
82] / [i915#3698]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5959/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([=
i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5959/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915=
#1804] / [i915#2684]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</=
a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5959/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP<=
/a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5959/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/s=
hard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6121/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html">FAIL</a=
>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i=
915#3002] / [i915#3363] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kb=
l1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl3/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5959/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5959/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl7/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5959/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl6/igt@runner@aborted.html">=
FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#300=
2] / [i915#3363])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-">F=
AIL</a>, [FAIL][152], [FAIL][153], [FAIL][154]) ([i915#1814] / [i915#3002])=
 -&gt; ([FAIL][155], [FAIL][156]) ([i915#3002])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2875805460895230161==--

--===============1024391095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1024391095==--
