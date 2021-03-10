Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 10 Mar 2021 14:57:40 -0000
Message-ID: <161538826001.2306.13626523396813260154@emeril.freedesktop.org>
References: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210310203640.6149-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbusy=3A_Limit_the_execution_to_two_pipes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0457082585=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0457082585==
Content-Type: multipart/alternative;
 boundary="===============7269436548862333206=="

--===============7269436548862333206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_busy: Limit the execution to two pipes
URL   : https://patchwork.freedesktop.org/series/87829/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6028_full -> IGTPW_5589_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5589_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5589_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5589_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl6/igt@kms_plane_scaling@scaler-with-clipping-clamping.html

  * igt@kms_plane_scaling@scaler-with-pixel-format:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_plane_scaling@scaler-with-pixel-format.html

  * igt@kms_plane_scaling@scaler-with-rotation:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_plane_scaling@scaler-with-rotation.html

  
New tests
---------

  New tests have been introduced between IGT_6028_full and IGTPW_5589_full:

### New IGT tests (11) ###

  * igt@kms_busy@basic@flip-pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.99] s

  * igt@kms_busy@basic@flip-pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [0.30, 1.42] s

  * igt@kms_busy@basic@modeset-pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.46, 3.73] s

  * igt@kms_busy@basic@modeset-pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 3.71] s

  * igt@kms_busy@extended-modeset-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5589_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb3/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][6] ([i915#3002])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb6/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1895])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_balancer@hang.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][18] ([i915#2389]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#284])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][20] ([i915#2658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109312])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109312])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb2/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][24] ([i915#3002])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1699]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#1699]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk6/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#1699]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gem_userptr_blits@process-exit-mmap@wc.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#1699]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109289]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109289]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#112306])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@gen9_exec_parse@batch-zero-length.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112306]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1937])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111644] / [i915#1397] / [i915#2411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271]) +223 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [PASS][36] -> [DMESG-FAIL][37] ([i915#3047])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk9/igt@i915_selftest@live@client.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@i915_selftest@live@client.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#404])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#404])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#2705])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb6/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_chamelium@vga-edid-read.html
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk5/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][45] ([i915#1149] / [i915#315]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb3/igt@kms_color@pipe-b-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [FAIL][46] ([i915#1149] / [i915#315])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb7/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#1149])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-negative:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3116])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3116])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][53] ([i915#1319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278]) +11 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][58] -> [INCOMPLETE][59] ([i915#155] / [i915#180] / [i915#636])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1:
    - shard-kbl:          [PASS][63] -> [DMESG-WARN][64] ([i915#62])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl1/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][65] ([i915#2641])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2672])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +57 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +29 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +12 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271]) +65 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180] / [i915#533])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][75] ([i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][77] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#111615]) +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_su@page_flip:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([fdo#109441]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-d-query-forked-hang:
    - shard-snb:          NOTRUN -> [SKIP][84] ([fdo#109271]) +375 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb5/igt@kms_vblank@pipe-d-query-forked-hang.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2437])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#2530]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#2530]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109278] / [i915#2530])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_pcopy@test2:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109291]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@prime_nv_pcopy@test3_2.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         [PASS][91] -> [FAIL][92] ([i915#3028])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@sysfs_clients@recycle-many.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         [PASS][93] -> [FAIL][94] ([i915#3028])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb2/igt@sysfs_clients@recycle-many.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb5/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][95] ([i915#2842]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][97] ([i915#2842]) -> [PASS][98] +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][99] ([i915#2842]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - shard-tglb:         [DMESG-WARN][101] ([i915#2803]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb5/igt@gem_exec_schedule@u-fairslice@bcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [DMESG-WARN][103] ([i915#2803]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [FAIL][105] ([i915#307]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-glk:          [FAIL][107] ([i915#54]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180]) -> [PASS][110] +4 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:
    - shard-kbl:          [FAIL][111] ([i915#2122]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][115] ([fdo#109441]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][117] ([i915#180] / [i915#295]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@rc6-disable:
    - shard-tglb:         [SKIP][119] ([fdo#111719]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@perf@rc6-disable.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@perf@rc6-disable.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          [FAIL][121] ([i915#3028]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@sysfs_clients@recycle.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl4/igt@sysfs_clients@recycle.html
    - shard-apl:          [FAIL][123] ([i915#3028]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@sysfs_clients@recycle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@sysfs_clients@recycle.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][125] ([i915#588]) -> [SKIP][126] ([i915#658])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][127] ([i915#2681] / [i915#2684]) -> [WARN][128] ([i915#2684])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][129] ([i915#1804] / [i915#2684]) -> [FAIL][130] ([i915#2680])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-iclb:         [SKIP][131] ([fdo#109300] / [fdo#111066]) -> [FAIL][132] ([i915#3144])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@kms_content_protection@atomic-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         [FAIL][133] ([i915#3144]) -> [SKIP][134] ([i915#3116])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-iclb:         [FAIL][135] ([i915#3144]) -> [FAIL][136] ([i915#3137])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@srm.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-iclb:         [SKIP][137] ([fdo#109300] / [fdo#111066

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html

--===============7269436548862333206==
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
<tr><td><b>Series:</b></td><td>tests/kms_busy: Limit the execution to two pipes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87829/">https://patchwork.freedesktop.org/series/87829/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6028_full -&gt; IGTPW_5589_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5589_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5589_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5589_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl6/igt@kms_plane_scaling@scaler-with-clipping-clamping.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_plane_scaling@scaler-with-pixel-format.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_plane_scaling@scaler-with-rotation.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6028_full and IGTPW_5589_full:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_busy@basic@flip-pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.37, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip-pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.30, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.46, 3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 3.71] s</li>
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
<p>igt@kms_busy@extended-pageflip-hang-newfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5589_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb3/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb6/igt@gem_ctx_persistence@idempotent.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@gem_exec_balancer@hang.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk6/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +223 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk9/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb6/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk5/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb3/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb7/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-negative:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl1/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp1.html">DMESG-WARN</a> ([i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html">SKIP</a> ([fdo#111825]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#180] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-snb5/igt@kms_vblank@pipe-d-query-forked-hang.html">SKIP</a> ([fdo#109271]) +375 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb4/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb7/igt@prime_nv_pcopy@test3_2.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb5/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb2/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb5/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb5/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb8/igt@gem_exec_schedule@u-fairslice@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@perf@rc6-disable.html">SKIP</a> ([fdo#111719]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-tglb1/igt@perf@rc6-disable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-kbl4/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-apl8/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#2680])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([fdo#109300] / [fdo#111066]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_content_protection@atomic-dpms.html">FAIL</a> ([i915#3144])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> ([i915#3144]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@srm.html">FAIL</a> ([i915#3144]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5589/shard-iclb1/igt@kms_content_protection@srm.html">FAIL</a> ([i915#3137])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-iclb:         [SKIP][137] ([fdo#109300] / [fdo#111066</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7269436548862333206==--

--===============0457082585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0457082585==--
