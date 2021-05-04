Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 May 2021 09:06:19 -0000
Message-ID: <162011917974.3298.14292565855407825576@emeril.freedesktop.org>
References: <20210504070415.5057-1-kunal1.joshi@intel.com>
In-Reply-To: <20210504070415.5057-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fchamelium=3A_Retry_DP_FSM_on_Failure_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0840878199=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0840878199==
Content-Type: multipart/alternative;
 boundary="===============6720132528437604645=="

--===============6720132528437604645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_chamelium: Retry DP FSM on Failure (rev2)
URL   : https://patchwork.freedesktop.org/series/89770/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10040_full -> IGTPW_5780_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5780_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5780_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5780_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  
Known issues
------------

  Here are the changes found in IGTPW_5780_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([fdo#109314])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#109314])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb6/igt@gem_ctx_persistence@clone.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][5] -> [TIMEOUT][6] ([i915#2369] / [i915#3063])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][7] ([i915#3354])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#2842]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-sync@rcs0:
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@gem_exec_fair@basic-sync@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#2389]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][18] ([i915#2389]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#307])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk5/igt@gem_mmap_gtt@big-copy-xy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#307])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk2/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#3297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#3297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][35] ([i915#3318])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109289])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@gen3_render_tiledx_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109289])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#112306]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gen9_exec_parse@allowed-all.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#112306]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#454])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#1937])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#1937])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#1937])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][44] -> [INCOMPLETE][45] ([i915#155])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][46] ([i915#180])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][47] ([i915#155] / [i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111615]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][51] ([i915#1149])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_color@pipe-a-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][52] ([i915#1149])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb1/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][58] ([i915#1319])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109279])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109279] / [i915#3359])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][61] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3319]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3359])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#109278])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#2065])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2065])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#79])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][71] ([i915#180])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2587])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2672]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271]) +412 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][75] -> [FAIL][76] ([i915#49])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271]) +46 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +12 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111825]) +15 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#1187])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#1187])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][83] -> [DMESG-WARN][84] ([i915#180]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#1911])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109441])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][95] -> [SKIP][96] ([fdo#109441])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][97] ([i915#132]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][98] ([i915#31])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109309])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109309])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2530])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2530]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109278] / [i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271]) +239 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_api@nv_self_import:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109291]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@prime_nv_api@nv_self_import.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109291]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb8/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271]) +72 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@prime_nv_pcopy@test2.html

  * igt@sysfs_clients@create:
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk7/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2994])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@sysfs_clients@create.html
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2994]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@sysfs_clients@create.html
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#2994])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@sysfs_clients@create.html
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl3/igt@sysfs_clients@create.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][114] ([i915#658]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb5/igt@feature_discovery@psr2.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-iclb:         [FAIL][116] ([i915#2410]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][118] ([i915#2846]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [FAIL][120] ([i915#2842]) -> [PASS][121] +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][122] ([i915#2842]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [FAIL][124] ([i915#2842]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][126] ([i915#2849]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][128] ([i915#2190]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [FAIL][130] ([i915#2428]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-tglb:         [FAIL][132] ([i915#3434]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-iclb:         [FAIL][134] ([i915#79]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][136] ([i915#2868]) -> [PASS][137] +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][138] ([i915#180]) -> [PASS][139] +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141] +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb7/igt@kms_psr@psr2_basic.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/index.html

--===============6720132528437604645==
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
<tr><td><b>Series:</b></td><td>lib/igt_chamelium: Retry DP FSM on Failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89770/">https://patchwork.freedesktop.org/series/89770/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10040_full -&gt; IGTPW_5780_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5780_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5780_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5780_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@pipe-a-cursor-128x42-random:<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5780_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb6/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@gem_exec_fair@basic-sync@rcs0.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk5/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl3/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> ([i915#180])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> ([i915#155] / [i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@kms_chamelium@hdmi-audio-edid.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb1/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-dpms.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#2065])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#2065])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271]) +412 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb6/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_psr@psr2_sprite_render.html">FAIL</a> ([i915#132]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@nouveau_crc@pipe-d-source-outp-complete.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl7/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109271]) +239 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb3/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb8/igt@prime_nv_pcopy@test1_macro.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl1/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109271]) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-glk7/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@sysfs_clients@create.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-apl3/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb4/igt@sysfs_clients@create.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl3/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">FAIL</a> ([i915#2428]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#3434]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-iclb8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">DMESG-WARN</a> ([i915#2868]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10040/shard-iclb7/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5780/shard">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6720132528437604645==--

--===============0840878199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0840878199==--
