Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Jul 2021 15:35:08 -0000
Message-ID: <162705450860.3042.11242792726813466729@emeril.freedesktop.org>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgTGltaXQg?=
 =?utf-8?q?the_HANG_tests_to_two_pipes_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1203293339=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1203293339==
Content-Type: multipart/alternative;
 boundary="===============3766811881854038955=="

--===============3766811881854038955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit the HANG tests to two pipes (rev2)
URL   : https://patchwork.freedesktop.org/series/92187/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10376_full -> IGTPW_6046_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html

New tests
---------

  New tests have been introduced between CI_DRM_10376_full and IGTPW_6046_full:

### New IGT tests (42) ###

  * igt@kms_busy@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic-hang@flip-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.34, 0.87] s

  * igt@kms_busy@basic-hang@flip-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_busy@basic-hang@flip-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_busy@basic-hang@flip-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_busy@basic-hang@modeset-pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [0.46, 3.57] s

  * igt@kms_busy@basic-hang@modeset-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_busy@basic-hang@modeset-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 0.89] s

  * igt@kms_busy@basic-hang@modeset-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_busy@extended-modeset-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [11.90, 26.16] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [11.96] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [19.95, 22.00] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [27.13] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [19.05, 26.30] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [19.96, 21.99] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [28.14] s

  * igt@kms_busy@extended-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [7.22, 16.32] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [6.94, 8.88] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [17.01] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [6.07, 17.02] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [5.96] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [6.96, 9.03] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [16.93] s

  * igt@kms_busy@extended-pageflip-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [5.71, 15.75] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [7.0, 11.26] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [15.98] s

  * igt@kms_busy@extended-pageflip-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.17, 0.61] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.24, 1.20] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [5.74, 15.51] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [5.96] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [12.98, 14.0] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [16.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_6046_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][2] -> [TIMEOUT][3] ([i915#2369] / [i915#3063] / [i915#3648])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][4] -> [FAIL][5] ([i915#2842]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1895] / [i915#2405])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#284])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb7/igt@gem_media_vme.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][16] ([i915#2658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb7/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][17] ([i915#2658])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][18] ([i915#3002])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#3297])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][21] ([i915#2724])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271]) +257 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][23] ([i915#545])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#1937])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         [PASS][27] -> [DMESG-WARN][28] ([i915#3621])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3777]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3777]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#3689]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271]) +22 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk9/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk5/igt@kms_chamelium@vga-hpd-enable-disable-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          NOTRUN -> [FAIL][37] ([fdo#108145] / [i915#71])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          NOTRUN -> [FAIL][38] ([fdo#108145] / [i915#71])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111828]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][43] ([i915#1319]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_content_protection@atomic-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109300] / [fdo#111066])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][45] ([i915#1319])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][46] ([i915#2105])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109279] / [i915#3359])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271]) +185 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3359]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271]) +434 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [INCOMPLETE][52] ([i915#180] / [i915#1982])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111825]) +11 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][57] ([i915#180]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          NOTRUN -> [DMESG-WARN][60] ([i915#180]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265]) +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][63] ([i915#265])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][64] ([fdo#108145] / [i915#265]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][65] ([fdo#108145] / [i915#265]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#658]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#658]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][68] -> [SKIP][69] ([fdo#109642] / [fdo#111068] / [i915#658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb4/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][70] -> [SKIP][71] ([fdo#109441]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278]) +8 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3841])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2530])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109291])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111656]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109292]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#2994]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2994]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@drm_import_export@prime:
    - shard-kbl:          [INCOMPLETE][80] ([i915#2944]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl3/igt@drm_import_export@prime.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@drm_import_export@prime.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [FAIL][84] ([i915#2410]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb6/igt@gem_ctx_persistence@many-contexts.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][86] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@gem_eio@unwedge-stress.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][88] ([i915#2842]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [FAIL][92] ([i915#2842]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_schedule@u-independent@vcs1:
    - shard-tglb:         [FAIL][94] ([i915#3795]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb7/igt@gem_exec_schedule@u-independent@vcs1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@gem_exec_schedule@u-independent@vcs1.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][96] ([i915#118] / [i915#95]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][98] ([i915#454]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][100] ([i915#155] / [i915#180] / [i915#636]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][102] ([i915#180]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
    - shard-iclb:         [SKIP][104] ([fdo#109278]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb6/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][106] ([fdo#109441]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@kms_psr@psr2_dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][108] ([i915#1542]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk9/igt@perf@polling-parameterized.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][110] ([fdo#109271]) -> [FAIL][111] ([i915#3343])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][112] ([i915#1804] / [i915#2684]) -> [WARN][113] ([i915#2684])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][114] ([i915#2684]) -> [WARN][115] ([i915#1804] / [i915#2684])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][116] ([i915#2920]) -> [SKIP][117] ([i915#658]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][118] ([i915#658]) -> [SKIP][119] ([i915#2920]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [F

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html

--===============3766811881854038955==
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
<tr><td><b>Series:</b></td><td>Limit the HANG tests to two pipes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92187/">https://patchwork.freedesktop.org/series/92187/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10376_full -&gt; IGTPW_6046_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10376_full and IGTPW_6046_full:</p>
<h3>New IGT tests (42)</h3>
<ul>
<li>
<p>igt@kms_busy@basic-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.34, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.46, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.90, 26.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [19.95, 22.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [27.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [19.05, 26.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [19.96, 21.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [7.22, 16.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.94, 8.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [6.07, 17.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.96, 9.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.71, 15.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [7.0, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.17, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.24, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.74, 15.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [12.98, 14.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6046_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked.html">INCOMPLETE</a> ([i915#1895] / [i915#2405])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +257 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#545])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> ([i915#3621])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk9/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk5/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-legacy-gamma:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">SKIP</a> ([fdo#109271]) +185 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +434 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#111825]) +11 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html">SKIP</a> ([fdo#109278]) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html">SKIP</a> ([i915#3841])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb1/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb6/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109292]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl3/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl3/igt@sysfs_clients@split-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_import_export@prime:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl3/igt@drm_import_export@prime.html">INCOMPLETE</a> ([i915#2944]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@drm_import_export@prime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb6/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-tglb7/igt@gem_exec_schedule@u-independent@vcs1.html">FAIL</a> ([i915#3795]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-tglb2/igt@gem_exec_schedule@u-independent@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb6/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-glk9/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-glk4/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-apl8/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          ([FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [F</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3766811881854038955==--

--===============1203293339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1203293339==--
