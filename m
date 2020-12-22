Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 22 Dec 2020 10:13:23 -0000
Message-ID: <160863200348.27827.14792325570342668840@emeril.freedesktop.org>
References: <20201221202753.2552621-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20201221202753.2552621-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fedge=5Fwalk=3AAdd_subtest_description_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0201860592=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0201860592==
Content-Type: multipart/alternative;
 boundary="===============0708349562502463082=="

--===============0708349562502463082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_edge_walk:Add subtest description (rev2)
URL   : https://patchwork.freedesktop.org/series/84885/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5914_full -> IGTPW_5322_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5322_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5322_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5322_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5322_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@hang:
    - shard-hsw:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@gem_ctx_persistence@hang.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([fdo#112283])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][5] ([fdo#112283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2389]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][7] ([fdo#109271]) +101 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#768])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-kbl:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1699]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1699]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl2/igt@gem_userptr_blits@process-exit-mmap@wb.html
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1699]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk9/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][12] ([fdo#109271]) +60 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw4/igt@gem_userptr_blits@process-exit-mmap@wc.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#1699]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_userptr_blits@process-exit-mmap@wc.html
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#1699]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#112306])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@gen9_exec_parse@secure-batches.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112306])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb8/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1602])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@i915_pm_backlight@fade_with_suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#111644] / [i915#1397] / [i915#2411])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#110892])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#579])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([i915#155] / [i915#636])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl4/igt@i915_suspend@forcewake.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#1769])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +43 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#1119])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#165])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110723])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][48] ([i915#1149] / [i915#315])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_color@pipe-d-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-hsw:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#2105])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#54])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][59] -> [FAIL][60] ([i915#54])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#54])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-kbl:          [PASS][63] -> [DMESG-WARN][64] ([i915#62])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [fdo#109279])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109279])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274] / [fdo#109278])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111825]) +10 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271]) +38 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#1187])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#1187])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#533]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][76] -> [INCOMPLETE][77] ([i915#1185] / [i915#1602] / [i915#250])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-kbl:          [PASS][78] -> [INCOMPLETE][79] ([i915#155])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-hsw:          [PASS][80] -> [DMESG-WARN][81] ([i915#2637]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-glk:          [PASS][82] -> [DMESG-WARN][83] ([i915#1602] / [i915#2635]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-apl:          [PASS][84] -> [DMESG-WARN][85] ([i915#1602] / [i915#2635]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-tglb:         [PASS][86] -> [INCOMPLETE][87] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-apl:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][90] ([i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-kbl:          [PASS][92] -> [DMESG-WARN][93] ([i915#180] / [i915#78])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_plane_cursor@pipe-b-primary-size-256.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-tglb:         [PASS][94] -> [INCOMPLETE][95] ([i915#2473])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#1836])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#1836])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][98] -> [SKIP][99] ([fdo#109441]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109441])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_psr@psr2_dpms.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#533]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2530])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2530]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb8/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109278] / [i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#111719])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#293])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html

  
#### Possible fixes ####

  * {igt@gem_exec_balancer@fairslice}:
    - shard-tglb:         [FAIL][107] ([i915#2802]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb3/igt@gem_exec_balancer@fairslice.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb7/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-iclb:         [INCOMPLETE][109] -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@gem_exec_whisper@basic-fds-forked-all.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb5/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][111] ([i915#118] / [i915#95]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][115] ([i915#1436] / [i915#716]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [DMESG-WARN][117] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-apl:          [DMESG-WARN][119] ([i915#1602] / [i915#2635]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-iclb:         [DMESG-WARN][121] ([i915#1602]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [INCOMPLETE][123] ([i915#155] / [i915#794]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-hsw:          [DMESG-WARN][125] ([i915#2637]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-glk:          [DMESG-WARN][127] ([i915#1602] / [i915#2635]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][129] ([i915#79]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][131] ([i915#2055]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][133] ([i915#2122]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [FAIL][135] ([i915#49]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][137] ([i915#49]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][139] ([fdo#109441]) -> [PASS][140] +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][141] ([i915#1804] / [i915#2684]) -> [WARN][142] ([i915#2684])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][143] ([i915#2684]) -> [WARN][144] ([i915#2681] / [i915#2684])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][145], [FAIL][146], [FAIL][147]) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#483] / [i915#716]) -> ([FAIL][148], [FAIL][149]) ([i915#2295] / [i915#2426] / [i915#483])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl7/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][150], [FAIL][151]) ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][152], [FAIL][153], [FAIL][154]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb3/igt@runner@abort

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/index.html

--===============0708349562502463082==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_edge_walk:Add subtest description (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84885/">https://patchwork.freedesktop.org/series/84885/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5914_full -&gt; IGTPW_5322_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5322_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5322_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5322_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5322_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@gem_ctx_persistence@hang.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl2/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk9/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw4/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([fdo#109271]) +60 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#155] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +43 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> ([i915#1119])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-WARN</a> ([i915#165])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_color@pipe-d-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">DMESG-WARN</a> ([i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html">SKIP</a> ([fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#111825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109278]) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">INCOMPLETE</a> ([i915#1185] / [i915#1602] / [i915#250])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">INCOMPLETE</a> ([i915#155])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#2637]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-256:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@kms_plane_cursor@pipe-b-primary-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@kms_plane_cursor@pipe-b-primary-size-256.html">DMESG-WARN</a> ([i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-y.html">INCOMPLETE</a> ([i915#2473])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb3/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb8/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-complete.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> ([fdo#111719])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> ([i915#293])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb3/igt@gem_exec_balancer@fairslice.html">FAIL</a> ([i915#2802]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb7/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@gem_exec_whisper@basic-fds-forked-all.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb5/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-tglb5/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#155] / [i915#794]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw8/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#483] / [i915#716]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5322/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/shard-iclb3/igt@runner@abort">FAIL</a>) ([i915#2295] / [i915#2724] / [i915#483]) -&gt; ([FAIL][152], [FAIL][153], [FAIL][154]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0708349562502463082==--

--===============0201860592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0201860592==--
