Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 10 Mar 2021 14:17:22 -0000
Message-ID: <161538584244.2306.15354968897520112244@emeril.freedesktop.org>
References: <20210310201247.31535-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210310201247.31535-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Restrict_the_hang_tests_execution_to_two_pipes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0526273874=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0526273874==
Content-Type: multipart/alternative;
 boundary="===============5713262677646061779=="

--===============5713262677646061779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Restrict the hang tests execution to two pipes
URL   : https://patchwork.freedesktop.org/series/87828/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6028_full -> IGTPW_5588_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5588_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5588_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5588_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_plane_scaling@scaler-with-clipping-clamping.html

  * igt@kms_plane_scaling@scaler-with-rotation:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl2/igt@kms_plane_scaling@scaler-with-rotation.html

  
Known issues
------------

  Here are the changes found in IGTPW_5588_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][5] -> [TIMEOUT][6] ([i915#2918])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][9] -> [TIMEOUT][10] ([i915#2369] / [i915#2481] / [i915#3070])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1895])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_balancer@hang.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#2849])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2389])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#2389]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2389])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][24] -> [DMESG-WARN][25] ([i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#284])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl2/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109312])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109312])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb1/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][31] ([i915#3002]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#1699]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1699]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@wb.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1699]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#1699]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap@wc.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#1699]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][37] ([i915#2502] / [i915#2667])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109289]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109289]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#112306])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@gen9_exec_parse@batch-zero-length.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#112306])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111644] / [i915#1397] / [i915#2411])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +203 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#2597])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#404])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#404])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#2705])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_chamelium@vga-edid-read.html
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][52] ([i915#1149] / [i915#315]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@kms_color@pipe-b-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [FAIL][53] ([i915#1149] / [i915#315])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [i915#1149])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-negative:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3116])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#3116])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][61] ([i915#1319]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109279])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [fdo#109279])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278]) +11 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][67] ([i915#2598])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271]) +352 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2642])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2672])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +60 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111825]) +27 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109280]) +13 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271]) +61 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][79] -> [SKIP][80] ([i915#433])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][82] -> [INCOMPLETE][83] ([i915#1436] / [i915#1982] / [i915#456])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][85] ([i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][88] ([i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#111615]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@page_flip:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][92] -> [SKIP][93] ([fdo#109441]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109441])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2437])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2530]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#2530]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@prime_nv_pcopy@test2:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109295])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109295])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@busy@vcs0:
    - shard-kbl:          [PASS][102] -> [FAIL][103] ([i915#3009]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl3/igt@sysfs_clients@busy@vcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@sysfs_clients@busy@vcs0.html

  * igt@sysfs_clients@recycle:
    - shard-snb:          [PASS][104] -> [FAIL][105] ([i915#3028])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-snb6/igt@sysfs_clients@recycle.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb6/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#3026])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][107] ([i915#2842]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][109] ([i915#2389]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - shard-tglb:         [DMESG-WARN][111] ([i915#2803]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb5/igt@gem_exec_schedule@u-fairslice@bcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [DMESG-WARN][113] ([i915#2803]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][115] ([i915#307]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][117] ([i915#1804] / [i915#2684]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-glk:          [FAIL][119] ([i915#54]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][121] ([i915#180]) -> [PASS][122] +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:
    - shard-kbl:          [FAIL][123] ([i915#2122]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][125] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@rc6-disable:
    - shard-tglb:         [SKIP][129] ([fdo#111719]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@perf@rc6-disable.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@perf@rc6-disable.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          [FAIL][131] ([i915#3028]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@sysfs_clients@recycle.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@sysfs_clients@recycle.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][133] ([i915#2681] / [i915#2684]) -> [WARN][134] ([i915#2684])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [WARN][135] ([i915#2681] / [i915#2684]) -> [FAIL][136] ([i915#2692])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic:
    - shard-iclb:         [SKIP][137] ([fdo#109300] / [fdo#111066]) -> [FAIL][138] ([i915#3137])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@kms_content_protection@atomic.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         [FAIL][139] ([i915#3144]) -> [SKIP][140] ([i915#3116])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-iclb:         [FAIL][141] ([i915#3144]) -> [SKIP][142] ([fdo#109300] / [fdo#111066])
   [141]: https://intel-gfx-ci.01

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/index.html

--===============5713262677646061779==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Restrict the hang tests execution to two pipes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87828/">https://patchwork.freedesktop.org/series/87828/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6028_full -&gt; IGTPW_5588_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5588_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5588_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5588_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_plane_scaling@scaler-with-clipping-clamping.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl2/igt@kms_plane_scaling@scaler-with-rotation.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5588_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([i915#2918])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_balancer@hang.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl7/igt@gem_userptr_blits@process-exit-mmap@gtt.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk6/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +203 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-negative:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271]) +352 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html">SKIP</a> ([fdo#111825]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +61 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> ([i915#1436] / [i915#1982] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb8/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl3/igt@sysfs_clients@busy@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl6/igt@sysfs_clients@busy@vcs0.html">FAIL</a> ([i915#3009]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-snb6/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-snb6/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl6/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb5/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb8/igt@gem_exec_schedule@u-fairslice@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb3/igt@perf@rc6-disable.html">SKIP</a> ([fdo#111719]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb2/igt@perf@rc6-disable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-kbl2/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-kbl3/igt@sysfs_clients@recycle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#2692])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb5/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb1/igt@kms_content_protection@atomic.html">FAIL</a> ([i915#3137])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6028/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> ([i915#3144]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5588/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01">FAIL</a> ([i915#3144]) -&gt; [SKIP][142] ([fdo#109300] / [fdo#111066])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5713262677646061779==--

--===============0526273874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0526273874==--
