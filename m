Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 01 Jul 2021 07:49:41 -0000
Message-ID: <162512578112.15054.2383240802118577501@emeril.freedesktop.org>
References: <20210630152841.10527-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210630152841.10527-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_Skip_90/270_rotation_for_xelpd_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1998928476=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1998928476==
Content-Type: multipart/alternative;
 boundary="===============0898327245778882840=="

--===============0898327245778882840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: Skip 90/270 rotation for xelpd (rev3)
URL   : https://patchwork.freedesktop.org/series/92081/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6125_full -> IGTPW_5973_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5973_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5973_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5973_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_5973_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#2842]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][8] ([i915#2842]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109313])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#3633])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][23] ([i915#2658])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][25] ([i915#3002])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][26] -> [FAIL][27] ([i915#2822])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-tglb6/igt@gem_vm_create@destroy-race.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb2/igt@gem_vm_create@destroy-race.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb1/igt@gen3_render_tiledy_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@bb-large:
    - shard-glk:          NOTRUN -> [FAIL][30] ([i915#3296])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk9/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#112306])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb3/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#112306])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb1/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][33] ([i915#454])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][34] -> [DMESG-WARN][35] ([i915#3698])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][36] -> [TIMEOUT][37] ([i915#3530])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][38] -> [TIMEOUT][39] ([i915#3530])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109303])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111614]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +406 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-snb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk9/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][51] ([i915#1319]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][52] ([i915#1319]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3359])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +14 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279] / [i915#3359])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][60] -> [INCOMPLETE][61] ([i915#155] / [i915#180] / [i915#636])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111825]) +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2672])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#2672])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [FAIL][68] ([i915#2546] / [i915#49])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +9 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#2546] / [i915#49])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +61 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +220 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          NOTRUN -> [DMESG-WARN][74] ([i915#180])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3536])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3536]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2920])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk8/igt@kms_psr2_su@frontbuffer.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#1911])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109642] / [fdo#111068] / [i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109441]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb2/igt@kms_psr@psr2_basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         NOTRUN -> [FAIL][88] ([i915#132] / [i915#3467])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_psr@psr2_suspend.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271]) +250 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2530])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2530])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb2/igt@nouveau_crc@pipe-d-source-rg.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278] / [i915#2530])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109291])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@sysfs_clients@pidname:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk1/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@sema-10:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl1/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2994]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@sysfs_clients@sema-25.html
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2994]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl3/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2994]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][101] ([i915#2846]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][103] ([i915#2846]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][105] ([i915#2842]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][111] ([i915#307]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][115] ([i915#118] / [i915#95]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][117] ([i915#1185]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180] / [i915#1982]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][121] ([fdo#109441]) -> [PASS][122] +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][123] ([i915#180] / [i915#295]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][125] ([i915#2842]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([i915#1436] / [i915#180] / [i915#3002] / [i915#3363] / [i915#92])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][143], [FAIL][144]) ([i915#3002]) -> ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1814] / [i915#3002])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][148], [FAIL][149], [FAIL][150]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][151], [FAIL][152]) ([i915#1814] / [i915#3002] / [i915#3363])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-apl1/igt@runner@aborted.html
   [149]: ht

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/index.html

--===============0898327245778882840==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: Skip 90/270 rotation=
 for xelpd (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/92081/">https://patchwork.freedesktop.org/series/92081/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5973/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6125_full -&gt; IGTPW_5973_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5973_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5973_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5973=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-=
async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5973/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-r=
otate-180-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5973_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/sh=
ard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([=
i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +6 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb=
2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb=
2/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl1=
/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-g=
lk4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@gem_exec_flush@basic-batch-kernel-=
default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard=
-glk9/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#1=
18] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl2/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-apl1/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-tglb6/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-tglb2/i=
gt@gem_vm_create@destroy-race.html">FAIL</a> ([i915#2822])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb1/igt@gen3_render_tiledy_blits.html">SKIP=
</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb3/igt@gen3_render_tiledy_blits.html">SKIP=
</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk9/igt@gen9_exec_parse@bb-large.html">FAIL=
</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SKI=
P</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb1/igt@gen9_exec_parse@bb-secure.html">SKI=
P</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb7/igt@i91=
5_pm_dc@dc6-psr.html">DMESG-WARN</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6125/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-=
kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a> ([i915#3530]=
)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6125/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-=
apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a> ([i915#3530]=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-27=
0.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_big_fb@yf-tiled-16bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-snb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_t=
iled_ccs.html">SKIP</a> ([fdo#109271]) +406 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-glk9/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-max=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_color_chamelium@pipe-c-ctm-0-25=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl1/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-offscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-rapid-movement.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-bo.h=
tml">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_cursor_legacy@pipe-d-single-bo.h=
tml">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@=
kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [=
i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@kms_flip@2x-dpms-vs-vblank-race.ht=
ml">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb6/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank-interruptible.html">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#2546] / [i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +9 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msf=
lip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5973/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-sh=
rfb-msflip-blt.html">FAIL</a> ([i915#2546] / [i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-sus=
pend.html">SKIP</a> ([fdo#109271]) +61 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +220 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl6/igt@kms_plane@plane-panning-bottom-righ=
t-suspend@pipe-a-planes.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-y.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-x.h=
tml">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-2.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-2.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
0.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-glk8/igt@kms_psr2_su@frontbuffer.html">SKIP</=
a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb5/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> ([i915#1911])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb3/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@kms=
_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-tglb7/igt@kms_psr@psr2_suspend.html">FAIL</a=
> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([fdo#109271]) +250 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb4/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb2/igt@nouveau_crc@pipe-d-source-rg.html">=
SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb3/igt@nouveau_crc@pipe-d-source-rg.html">=
SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-iclb3/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk1/igt@sysfs_clients@pidname.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-apl1/igt@sysfs_clients@sema-10.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb2/igt@sysfs_clients@sema-25.html">SKIP</a=
> ([i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-kbl3/igt@sysfs_clients@sema-25.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-tglb7/igt@sysfs_clients@sema-25.html">SKIP</a=
> ([i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl3/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i=
915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
973/shard-kbl2/igt@gem_eio@in-flight-suspend.html">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6125/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#=
2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973=
/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6125/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#=
2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973=
/shard-glk8/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i91=
5#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
73/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
973/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
973/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> (=
[i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5973/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-apl2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915=
#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973=
/shard-apl2/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WAR=
N</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5973/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMP=
LETE</a> ([i915#1185]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5973/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">D=
MESG-WARN</a> ([i915#180] / [i915#1982]) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@kms_pipe_crc_basic@suspen=
d-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([f=
do#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5973/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DM=
ESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@kms_vblank@pipe-a-ts-contin=
uation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i91=
5#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
73/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">SKIP</a> ([fdo#109271=
])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.=
html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5973/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6125/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6125/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-kbl3/igt@runner@aborted.ht=
ml">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915=
#3363] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5973/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5973/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_597=
3/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#180] /=
 [i915#3002] / [i915#3363] / [i915#92])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6125/shard-iclb7/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5973/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5973/shard-iclb1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5973/shard-iclb7/igt@runner@aborted.html">FAIL</a>) ([i915#18=
14] / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6125/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht">FAIL=
</a>, [FAIL][150]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -=
&gt; ([FAIL][151], [FAIL][152]) ([i915#1814] / [i915#3002] / [i915#3363])</=
p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0898327245778882840==--

--===============1998928476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1998928476==--
