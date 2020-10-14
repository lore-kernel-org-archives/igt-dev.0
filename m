Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Oct 2020 18:12:10 -0000
Message-ID: <160269913070.21209.1117609206314164151@emeril.freedesktop.org>
References: <20201013110234.17680-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201013110234.17680-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Restore_i915_debugfs_health_check_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1056140007=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1056140007==
Content-Type: multipart/alternative;
 boundary="===============0875724375083236597=="

--===============0875724375083236597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Restore i915 debugfs health check (rev3)
URL   : https://patchwork.freedesktop.org/series/82519/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9135_full -> IGTPW_5062_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5062_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5062_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5062_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind} (NEW):
    - shard-hsw:          NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@core_hotunplug@hotrebind.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-tglb:         [DMESG-FAIL][2] ([i915#1982]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9135_full and IGTPW_5062_full:

### New IGT tests (1) ###

  * igt@core_hotunplug@hotrebind:
    - Statuses : 6 pass(s) 1 warn(s)
    - Exec time: [0.39, 2.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_5062_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#658])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@feature_discovery@psr2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][6] -> [FAIL][7] ([i915#1635] / [i915#2389])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2389]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk4/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#118] / [i915#95]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk4/igt@gem_exec_whisper@basic-fds-priority.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-snb:          [PASS][12] -> [INCOMPLETE][13] ([i915#82])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb2/igt@gem_userptr_blits@coherency-unsync.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][14] -> [WARN][15] ([i915#1519])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2346])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#79])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][20] -> [INCOMPLETE][21] ([i915#2055])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1982])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][26] -> [FAIL][27] ([i915#2416]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([i915#1836])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][38] -> [SKIP][39] ([fdo#109271] / [i915#1635])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][40] -> [SKIP][41] ([i915#1836])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb5/igt@kms_psr@psr2_suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#1354])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
#### Possible fixes ####

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][48] ([i915#2521]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-iclb:         [FAIL][50] ([i915#2521]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-tglb:         [FAIL][52] ([i915#2521]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-tglb:         [DMESG-WARN][54] ([i915#1982]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [DMESG-WARN][56] ([i915#128]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          [DMESG-FAIL][58] ([i915#118] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][60] ([i915#1982]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          [FAIL][62] ([i915#1635] / [i915#79]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [FAIL][64] -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][66] ([i915#1982]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [FAIL][68] ([i915#1635] / [i915#247]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [FAIL][70] ([i915#247]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][72] ([fdo#109271] / [i915#1635]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][74] ([fdo#109271]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][78] ([i915#1836]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][80] ([fdo#109271]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][82] ([i915#1836]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][84] ([fdo#109271]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@second-to-first.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][88] ([i915#31]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_setmode@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_setmode@basic.html

  * igt@sysfs_heartbeat_interval@mixed@vcs1:
    - shard-kbl:          [INCOMPLETE][90] ([i915#1731]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@sysfs_heartbeat_interval@mixed@vcs1.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][92] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][93] ([i915#1319] / [i915#1635])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][94] -> [DMESG-FAIL][95] ([i915#1982])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][96] ([fdo#109271] / [i915#1635]) -> [SKIP][97] ([fdo#109271] / [i915#1354] / [i915#1635])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl4/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][98] ([fdo#109271]) -> [SKIP][99] ([fdo#109271] / [i915#1354])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][100] ([fdo#109289]) -> [SKIP][101] ([i915#1354])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][102] ([fdo#109271]) -> [SKIP][103] ([fdo#109271] / [i915#1354])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl7/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2416]: https://gitlab.freedesktop.org/drm/intel/issues/2416
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2542]: https://gitlab.freedesktop.org/drm/intel/issues/2542
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5813 -> IGTPW_5062
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9135: eb70ad33fcc91d3464b07679391fb477927ad4c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5062: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html

--===============0875724375083236597==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Restore i915 debugfs health check (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82519/">https://patchwork.freedesktop.org/series/82519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9135_full -&gt; IGTPW_5062_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5062_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5062_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5062_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@core_hotunplug@hotrebind} (NEW):<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@core_hotunplug@hotrebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9135_full and IGTPW_5062_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@core_hotunplug@hotrebind:<ul>
<li>Statuses : 6 pass(s) 1 warn(s)</li>
<li>Exec time: [0.39, 2.22] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5062_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk4/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk4/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb2/igt@gem_userptr_blits@coherency-unsync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb7/igt@gem_userptr_blits@coherency-unsync.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2416">i915#2416</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb5/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb7/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-torture-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/128">i915#128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_cursor_legacy@pipe-b-torture-move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl2/igt@sysfs_heartbeat_interval@mixed@vcs1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-apl4/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-glk3/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/shard-kbl7/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5813 -&gt; IGTPW_5062</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9135: eb70ad33fcc91d3464b07679391fb477927ad4c7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5062: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html<br />
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0875724375083236597==--

--===============1056140007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1056140007==--
