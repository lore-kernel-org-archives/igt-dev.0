Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5352716427857133233=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 20 Dec 2022 03:22:56 -0000
Message-ID: <167150657610.18781.5696736044673082855@emeril.freedesktop.org>
References: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IGlu?=
 =?utf-8?q?valid_usage_of_put=5Foffset=28=29_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============5352716427857133233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix invalid usage of put_offset() (rev2)
URL   : https://patchwork.freedesktop.org/series/112056/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7099_full -> IGTPW_8247_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8247_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8247_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-dg10 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8247_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ccs@block-multicopy-inplace}:
    - {shard-tglu}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-8/igt@gem_ccs@block-multicopy-inplace.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - {shard-rkl}:        [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html

  * {igt@vc4/vc4_perfmon@destroy-invalid-perfmon}:
    - {shard-dg1}:        NOTRUN -> [SKIP][6] +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-19/igt@vc4/vc4_perfmon@destroy-invalid-perfmon.html

  * {igt@vc4/vc4_tiling@get-bad-flags}:
    - {shard-rkl}:        NOTRUN -> [SKIP][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-3/igt@vc4/vc4_tiling@get-bad-flags.html

  
Known issues
------------

  Here are the changes found in IGTPW_8247_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@read-writes:
    - shard-apl:          [PASS][8] -> [INCOMPLETE][9] ([i915#7708])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl1/igt@gem_caching@read-writes.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_caching@read-writes.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +111 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][17] ([i915#4991])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#5566] / [i915#716])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#3886]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#3886]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl7/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_color_chamelium@ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb5/igt@kms_color_chamelium@ctm-red-to-blue.html
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk5/igt@kms_color_chamelium@ctm-red-to-blue.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][25] ([i915#7173])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2346])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#7205])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [FAIL][29] ([i915#4767])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][30] ([fdo#109271]) +90 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#658]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_vrr@negative-basic:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271]) +42 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk8/igt@kms_vrr@negative-basic.html

  * igt@perf@stress-open-close:
    - shard-glk:          [PASS][34] -> [INCOMPLETE][35] ([i915#5213])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk3/igt@perf@stress-open-close.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk7/igt@perf@stress-open-close.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2994]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-10:
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#2994])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk7/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [DMESG-WARN][38] ([i915#4528]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb2/igt@core_hotunplug@unbind-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb7/igt@core_hotunplug@unbind-rebind.html

  * igt@drm_read@short-buffer-block:
    - {shard-rkl}:        [SKIP][40] ([i915#4098]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@drm_read@short-buffer-block.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@drm_read@short-buffer-block.html

  * igt@gem_ctx_isolation@nonpriv-switch@vcs1:
    - {shard-dg1}:        [FAIL][42] ([i915#7673]) -> [PASS][43] +24 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-17/igt@gem_ctx_isolation@nonpriv-switch@vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-16/igt@gem_ctx_isolation@nonpriv-switch@vcs1.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - {shard-rkl}:        [FAIL][44] ([i915#7673]) -> [PASS][45] +12 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - {shard-rkl}:        [SKIP][46] ([i915#6252]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-2/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][48] -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][50] ([i915#5784]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-15/igt@gem_eio@reset-stress.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][52] ([i915#2842]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-apl:          [FAIL][54] ([i915#2842]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - {shard-rkl}:        [SKIP][56] ([i915#3281]) -> [PASS][57] +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-read.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-glk:          [SKIP][58] ([fdo#109271]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk1/igt@gem_mmap_gtt@hang-user.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk1/igt@gem_mmap_gtt@hang-user.html
    - shard-apl:          [SKIP][60] ([fdo#109271]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl6/igt@gem_mmap_gtt@hang-user.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - {shard-rkl}:        [SKIP][62] ([i915#3282]) -> [PASS][63] +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gem_partial_pwrite_pread@reads-uncached.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_softpin@noreloc-s3:
    - {shard-rkl}:        [FAIL][64] ([fdo#103375]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_softpin@noreloc-s3.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@batch-without-end:
    - {shard-rkl}:        [SKIP][66] ([i915#2527]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gen9_exec_parse@batch-without-end.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][68] ([i915#658]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-dg1}:        [FAIL][70] ([i915#3591]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@cursor-dpms:
    - {shard-tglu}:       [SKIP][72] ([i915#1849]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@i915_pm_rpm@cursor-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-rkl}:        [SKIP][74] ([i915#1397]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][76] -> [PASS][77] +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html

  * igt@kms_fbcon_fbt@psr:
    - {shard-rkl}:        [SKIP][78] ([i915#3955]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-3/igt@kms_fbcon_fbt@psr.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-rkl}:        [SKIP][80] ([fdo#110189] / [i915#3955]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][82] ([i915#79]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-rkl}:        [SKIP][84] ([i915#1849] / [i915#4098]) -> [PASS][85] +14 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - shard-snb:          [SKIP][86] ([fdo#109271]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][88] ([i915#1072]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@kms_psr@primary_render.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - {shard-rkl}:        [SKIP][90] ([i915#5461]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - {shard-rkl}:        [SKIP][92] ([i915#1845] / [i915#4098]) -> [PASS][93] +23 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:
    - {shard-rkl}:        [SKIP][94] ([i915#4070] / [i915#4098]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html

  * igt@perf_pmu@busy-idle@vcs0:
    - {shard-dg1}:        [FAIL][96] ([i915#4349]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-17/igt@perf_pmu@busy-idle@vcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - {shard-rkl}:        [SKIP][98] ([fdo#109295] / [i915#3708] / [i915#4098]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
    - shard-apl:          [DMESG-FAIL][100] ([IGT#6]) -> [FAIL][101] ([i915#4573]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][102] ([i915#3002] / [i915#4312]) -> ([FAIL][103], [FAIL][104]) ([fdo#109271] / [i915#3002] / [i915#4312])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7205]: https://gitlab.freedesktop.org/drm/intel/issues/7205
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7672]: https://gitlab.freedesktop.org/drm/intel/issues/7672
  [i915#7673]: https://gitlab.freedesktop.org/drm/intel/issues/7673
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7099 -> IGTPW_8247

  CI-20190529: 20190529
  CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html
  IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html

--===============5352716427857133233==
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
<tr><td><b>Series:</b></td><td>Fix invalid usage of put_offset() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112056/">https://patchwork.freedesktop.org/series/112056/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7099_full -&gt; IGTPW_8247_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8247_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8247_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): shard-dg10 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8247_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_ccs@block-multicopy-inplace}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-8/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@vc4/vc4_perfmon@destroy-invalid-perfmon}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-19/igt@vc4/vc4_perfmon@destroy-invalid-perfmon.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@vc4/vc4_tiling@get-bad-flags}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-3/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8247_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl1/igt@gem_caching@read-writes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_caching@read-writes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +111 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl7/igt@kms_chamelium@dp-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb5/igt@kms_color_chamelium@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk5/igt@kms_color_chamelium@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7205">i915#7205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +90 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk3/igt@perf@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk7/igt@perf@stress-open-close.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@sysfs_clients@fair-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk7/igt@sysfs_clients@split-10.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb7/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@drm_read@short-buffer-block.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@drm_read@short-buffer-block.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch@vcs1:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-17/igt@gem_ctx_isolation@nonpriv-switch@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7673">i915#7673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-16/igt@gem_ctx_isolation@nonpriv-switch@vcs1.html">PASS</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7673">i915#7673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-2/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_eio@in-flight-suspend.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-14/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-user:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk1/igt@gem_mmap_gtt@hang-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk1/igt@gem_mmap_gtt@hang-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl6/igt@gem_mmap_gtt@hang-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl3/igt@gem_mmap_gtt@hang-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_softpin@noreloc-s3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_psr@primary_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html">PASS</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-17/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6">IGT#6</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7099 -&gt; IGTPW_8247</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html<br />
  IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5352716427857133233==--
