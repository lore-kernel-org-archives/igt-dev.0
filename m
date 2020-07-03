Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jul 2020 11:17:18 -0000
Message-ID: <159377503865.25591.2287064539908289128@emeril.freedesktop.org>
References: <20200703085542.9226-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20200703085542.9226-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_Test_device_sysfs_reset_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/device_reset: Test device sysfs reset (rev3)
URL   : https://patchwork.freedesktop.org/series/78849/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8704_full -> IGTPW_4731_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4731_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4731_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4731_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@device_reset@reset-bound} (NEW):
    - shard-snb:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb1/igt@device_reset@reset-bound.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl3/igt@device_reset@reset-bound.html

  * {igt@device_reset@unbind-reset-rebind} (NEW):
    - shard-hsw:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw2/igt@device_reset@unbind-reset-rebind.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][4] ([i915#1436] / [i915#2110]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw5/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][6] ([i915#2110]) -> ([FAIL][7], [FAIL][8], [FAIL][9]) ([i915#1602] / [i915#2110])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-tglb5/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb7/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb1/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8704_full and IGTPW_4731_full:

### New IGT tests (2) ###

  * igt@device_reset@reset-bound:
    - Statuses : 6 dmesg-warn(s) 1 timeout(s)
    - Exec time: [0.10, 184.76] s

  * igt@device_reset@unbind-reset-rebind:
    - Statuses : 2 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.94] s

  

Known issues
------------

  Here are the changes found in IGTPW_4731_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#1436] / [i915#716])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#93] / [i915#95]) +44 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl4/igt@i915_getparams_basic@basic-eu-total.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl7/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#1515])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#1635] / [i915#95]) +34 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl2/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl1/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][24] -> [DMESG-FAIL][25] ([i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][26] -> [DMESG-FAIL][27] ([i915#54] / [i915#95]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#128])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-tglb8/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb3/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#64])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#1525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl8/igt@kms_fbcon_fbt@fbc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][34] -> [INCOMPLETE][35] ([i915#2055])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-tglb:         [PASS][36] -> [DMESG-WARN][37] ([i915#1982]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][38] -> [DMESG-FAIL][39] ([i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][40] -> [DMESG-FAIL][41] ([i915#1635] / [i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-hsw:          [PASS][44] -> [TIMEOUT][45] ([i915#1958] / [i915#2119]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw4/igt@perf_pmu@all-busy-check-all.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw7/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#1820])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_mmap@test_refcounting:
    - shard-snb:          [PASS][48] -> [TIMEOUT][49] ([i915#2119])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-snb2/igt@prime_mmap@test_refcounting.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb1/igt@prime_mmap@test_refcounting.html
    - shard-kbl:          [PASS][50] -> [TIMEOUT][51] ([i915#2119])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl6/igt@prime_mmap@test_refcounting.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl3/igt@prime_mmap@test_refcounting.html
    - shard-hsw:          [PASS][52] -> [TIMEOUT][53] ([i915#2119])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw5/igt@prime_mmap@test_refcounting.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw1/igt@prime_mmap@test_refcounting.html
    - shard-apl:          [PASS][54] -> [TIMEOUT][55] ([i915#2119])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl6/igt@prime_mmap@test_refcounting.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl3/igt@prime_mmap@test_refcounting.html

  * igt@syncobj_basic@bad-flags-handle-to-fd:
    - shard-iclb:         [PASS][56] -> [DMESG-WARN][57] ([i915#1982]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-iclb1/igt@syncobj_basic@bad-flags-handle-to-fd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-iclb6/igt@syncobj_basic@bad-flags-handle-to-fd.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-glk:          [INCOMPLETE][60] ([i915#58] / [k.org#198133]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk5/igt@gem_exec_flush@basic-wb-rw-default.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk3/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][62] ([i915#1930]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-snb:          [INCOMPLETE][64] ([i915#82]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-snb5/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_vm_create@invalid-create:
    - shard-tglb:         [DMESG-WARN][66] ([i915#402]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-tglb5/igt@gem_vm_create@invalid-create.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb1/igt@gem_vm_create@invalid-create.html

  * igt@i915_hangman@error-state-basic:
    - shard-kbl:          [DMESG-WARN][68] ([i915#93] / [i915#95]) -> [PASS][69] +41 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl3/igt@i915_hangman@error-state-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl2/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@mock@requests:
    - shard-hsw:          [INCOMPLETE][70] ([i915#2110]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw5/igt@i915_selftest@mock@requests.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw6/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][72] ([i915#118] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [DMESG-WARN][74] ([i915#1635] / [i915#95]) -> [PASS][75] +28 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:
    - shard-glk:          [DMESG-WARN][76] ([i915#1982]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][78] ([i915#2055]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-tglb:         [DMESG-WARN][82] ([i915#1982]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-tglb3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-tglb8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-snb:          [TIMEOUT][84] ([i915#1958] / [i915#2119]) -> [PASS][85] +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][86] ([fdo#108145] / [i915#95]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][88] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][89] +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][90] ([i915#1635] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [DMESG-FAIL][92] ([i915#95]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_vblank@pipe-a-ts-continuation-idle:
    - shard-hsw:          [TIMEOUT][94] ([i915#1958] / [i915#2119]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-idle.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-idle.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][96] ([i915#1958] / [i915#2119]) -> [FAIL][97] ([i915#1930])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][98] ([i915#180]) -> [DMESG-WARN][99] ([i915#93] / [i915#95])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][100] ([i915#1982]) -> [DMESG-WARN][101] ([i915#1635] / [i915#95])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl6/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl4/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          [SKIP][102] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][103] ([fdo#109271] / [fdo#111827])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl6/igt@kms_chamelium@vga-edid-read.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl8/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][104] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][105] ([i915#1319] / [i915#2119])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl4/igt@kms_content_protection@atomic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl6/igt@kms_content_protection@atomic.html
    - shard-apl:          [FAIL][106] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][107] ([fdo#110321] / [i915#1635] / [i915#95])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl4/igt@kms_content_protection@atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][108] ([i915#1319] / [i915#2119]) -> [TIMEOUT][109] ([i915#1319] / [i915#1958] / [i915#2119])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-kbl1/igt@kms_content_protection@srm.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-kbl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement:
    - shard-apl:          [SKIP][110] ([fdo#109271]) -> [SKIP][111] ([fdo#109271] / [i915#1635]) +13 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl4/igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-hsw:          [TIMEOUT][112] ([i915#1958] / [i915#2119]) -> [SKIP][113] ([fdo#109271]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-hsw:          [SKIP][114] ([fdo#109271]) -> [TIMEOUT][115] ([i915#1958] / [i915#2119])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-apl:          [SKIP][116] ([fdo#109271] / [i915#1635]) -> [SKIP][117] ([fdo#109271]) +14 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-snb:          [TIMEOUT][118] ([i915#1958] / [i915#2119]) -> [SKIP][119] ([fdo#109271]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-snb2/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-snb6/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][120], [FAIL][121], [FAIL][122]) ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][123], [FAIL][124], [FAIL][125]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl3/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8704/shard-apl2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl7/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5720 -> IGTPW_4731
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8704: 7faedc4873dd257f4ed064ab4e0a28407690ea73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4731: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/index.html
  IGT_5720: f35053d4b6d7bbcf6505ef67a8bd56acc7fb2eb2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4731/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
