Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 May 2021 16:38:26 -0000
Message-ID: <162040550686.10706.15192472216599733781@emeril.freedesktop.org>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_Add_subtest_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1876996782=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1876996782==
Content-Type: multipart/alternative;
 boundary="===============1385283473920787059=="

--===============1385283473920787059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_lease: Add subtest description
URL   : https://patchwork.freedesktop.org/series/89869/
State : success

== Summary ==

CI Bug Log - changes from IGT_6081_full -> IGTPW_5792_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/index.html

Known issues
------------

  Here are the changes found in IGTPW_5792_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl1/igt@gem_eio@in-flight-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         NOTRUN -> [TIMEOUT][4] ([i915#2369] / [i915#2481] / [i915#3070])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][5] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][6] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#307])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#3323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#3323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#3323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#3323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#3323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl2/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#3002])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#3297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-apl:          NOTRUN -> [FAIL][26] ([i915#3324])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl6/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][27] ([i915#2724])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2527])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@gen9_exec_parse@bb-large.html
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#3296])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk9/igt@gen9_exec_parse@bb-large.html
    - shard-kbl:          NOTRUN -> [FAIL][30] ([i915#3296])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@gen9_exec_parse@bb-large.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2527])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb5/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271]) +49 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk6/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][33] ([i915#454])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#454])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#1937])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#1937])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109506] / [i915#2411])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109293] / [fdo#109506])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110723])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#2705])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3116])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3116])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][54] ([i915#1319])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +9 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3319]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3359]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109279] / [i915#3359])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109279])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][62] -> [INCOMPLETE][63] ([i915#155] / [i915#180] / [i915#636])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2672]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271]) +433 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +10 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111825]) +14 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb1/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#1187])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb1/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#1839])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#1839])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#533]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2920])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +8 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk6/igt@kms_psr2_su@frontbuffer.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#1911])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109642] / [fdo#111068] / [i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109441]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
    - shard-tglb:         NOTRUN -> [FAIL][84] ([i915#132]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][87] ([i915#31])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][88] ([IGT#2])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][89] -> [INCOMPLETE][90] ([i915#155])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +242 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2437])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2530]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2530]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109278] / [i915#2530])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][97] -> [FAIL][98] ([i915#1542])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-glk4/igt@perf@polling-parameterized.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk7/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@nv_self_import:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@prime_nv_api@nv_self_import.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109291]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271]) +181 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl6/igt@prime_nv_pcopy@test2.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl7/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2994])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@sysfs_clients@recycle.html
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl7/igt@sysfs_clients@recycle.html
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2994])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk8/igt@sysfs_clients@recycle.html
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb2/igt@sysfs_clients@recycle.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][107] ([i915#2842]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][111] ([i915#2842]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_userptr_blits@huge-split:
    - shard-tglb:         [FAIL][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-tglb1/igt@gem_userptr_blits@huge-split.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb5/igt@gem_userptr_blits@huge-split.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][117] ([fdo#109271]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_flip@blocking-wf_vblank@d-edp1:
    - shard-tglb:         [INCOMPLETE][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-tglb7/igt@kms_flip@blocking-wf_vblank@d-edp1.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_flip@blocking-wf_vblank@d-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][121] ([i915#180]) -> [PASS][122] +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][123] ([i915#433]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][125] ([i915#180]) -> [PASS][126] +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][129] ([i915#2842]) -> [FAIL][130] ([i915#2851])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][131] ([i915#2920]) -> [SKIP][132] ([i915#658]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][133] ([i915#658]) -> [SKIP][134] ([i915#2920]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#92])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl7/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/index.html

--===============1385283473920787059==
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
<tr><td><b>Series:</b></td><td>tests/kms_lease: Add subtest description</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/89869/">https://patchwork.freedesktop.org/series/89869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5792/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6081_full -&gt; IGTPW_5792_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5792_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-snb5/igt@gem_ctx_persistence@clone.html">SKI=
P</a> ([fdo#109271] / [i915#1099]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-kbl1/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@=
gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@gem_eio@unwedge-stress.html">TIMEO=
UT</a> ([i915#2369] / [i915#2481] / [i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-apl7/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-=
glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard=
-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb=
7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shar=
d-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL</a> ([i915#307])=
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y=
-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb4/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb3/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-apl2/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-kbl1/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb8/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl6/igt@gem_userptr_blits@set-cache-level.h=
tml">FAIL</a> ([i915#3324])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-snb6/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb8/igt@gen9_exec_parse@bb-large.html">SKIP=
</a> ([i915#2527])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-glk9/igt@gen9_exec_parse@bb-large.html">FAIL<=
/a> ([i915#3296])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-kbl2/igt@gen9_exec_parse@bb-large.html">FAIL<=
/a> ([i915#3296])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb5/igt@gen9_exec_parse@bb-large.html">SKIP=
</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-glk6/igt@i915_pm_backlight@bad-brightness.ht=
ml">SKIP</a> ([fdo#109271]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb6/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.=
html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.=
html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-1=
80.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb.html">SK=
IP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_big_joiner@basic.html">SKIP</a>=
 ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-limit=
ed-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-max=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-neg=
ative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb4/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-onscreen.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-sliding.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-max-s=
ize-offscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@=
kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [=
i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html=
">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271]) +433 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280]) +10 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +14 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb1/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb1/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +5 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb8/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +8 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-glk6/igt@kms_psr2_su@frontbuffer.html">SKIP</=
a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb3/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> ([i915#1911])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb3/igt@kms_psr@psr2_no_drrs.html">SKIP</a>=
 ([fdo#109441]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb6/igt@kms_psr@psr2_no_drrs.html">FAIL</a>=
 ([i915#132]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-iclb=
5/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> ([=
i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl3/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5792/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">I=
NCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.=
html">SKIP</a> ([fdo#109271]) +242 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-apl2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl4/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb8/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-glk4/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-glk7/igt=
@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-iclb4/igt@prime_nv_api@nv_self_import.html">=
SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html">S=
KIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl6/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109271]) +181 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5792/shard-kbl7/igt@sysfs_clients@create.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-iclb2/igt@sysfs_clients@recycle.html">SKIP</a=
> ([i915#2994])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-apl7/igt@sysfs_clients@recycle.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-glk8/igt@sysfs_clients@recycle.html">SKIP</a>=
 ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5792/shard-tglb2/igt@sysfs_clients@recycle.html">SKIP</a=
> ([i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5792/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
792/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5792/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5792/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-tglb1/igt@gem_userptr_blits@huge-split.html">FAIL</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-tglb5=
/igt@gem_userptr_blits@huge-split.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792/shard-=
apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-tglb7/igt@kms_flip@blocking-wf_vblank@d-edp1.html">INCOMPLE=
TE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5792=
/shard-tglb6/igt@kms_flip@blocking-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
>DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5792/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptibl=
e@c-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i91=
5#433]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_579=
2/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">D=
MESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5792/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pip=
e-a.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([f=
do#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5792/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 simi=
lar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5792/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([=
i915#2851])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.=
html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5792/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6081/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5792/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6081/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6081/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6081/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl2/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/=
shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6081/shard-kbl1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6081/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6081/shard-kbl3/igt@runner=
@aborted.html">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#25=
05] / [i915#3002] / [i915#3363] / [i915#602]) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_57">FAIL</a>, [FAIL][150], [FAIL][151],=
 [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][15=
7], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161]) ([i915#1436] / [i91=
5#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#92])=
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1385283473920787059==--

--===============1876996782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1876996782==--
